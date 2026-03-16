#!/usr/bin/env ruby
# frozen_string_literal: true

require "base64"
require "cgi"
require "digest/sha1"
require "fileutils"
require "json"
require "net/http"
require "nokogiri"
require "psych"
require "set"
require "time"
require "uri"

class ConfluenceImporter
  ROOT_PAGE_ID = "3663527944"
  BASE_URL = "https://kurly0521.atlassian.net"
  REPO_ROOT = File.expand_path("..", __dir__)
  SESSIONS_DIR = File.join(REPO_ROOT, "_sessions")
  ASSETS_DIR = File.join(REPO_ROOT, "assets", "sessions")
  CATALOG_PATH = File.join(REPO_ROOT, "_data", "session_catalog.yml")
  TRACKS_PATH = File.join(REPO_ROOT, "_data", "tracks.yml")
  DEFAULT_LANG = "swift"
  VIDEO_EXTENSIONS = %w[.mp4 .mov .m4v].freeze
  IMAGE_EXTENSIONS = %w[.png .jpg .jpeg .gif .webp .svg].freeze
  DOWNLOADABLE_EXTENSIONS = (VIDEO_EXTENSIONS + IMAGE_EXTENSIONS + %w[.pdf .zip .heic]).freeze

  def initialize
    @email = ENV.fetch("JIRA_EMAIL")
    @token = ENV.fetch("JIRA_TOKEN")
    @auth = "Basic #{Base64.strict_encode64("#{@email}:#{@token}")}"
    @catalog = Psych.safe_load(File.read(CATALOG_PATH), permitted_classes: [], aliases: false) || []
    @track_index = (@catalog || []).each_with_object({}) do |entry, acc|
      acc[entry.fetch("title")] = entry.fetch("track")
    end
    @slug_overrides = (@catalog || []).each_with_object({}) do |entry, acc|
      next unless entry["url"]

      acc[entry.fetch("title")] = entry["url"].sub(%r{\A/sessions/}, "").sub(%r{/\z}, "")
    end
    @downloads_cache = {}
  end

  def run
    pages = fetch_descendants
    pages.each_with_index do |page, index|
      import_page(page, index + 1)
    end
    rewrite_catalog(pages)
  end

  private

  def fetch_descendants
    response = get_json("/wiki/rest/api/content/#{ROOT_PAGE_ID}/descendant/page?limit=200")
    response.fetch("results")
  end

  def import_page(page, order_index)
    page_id = page.fetch("id")
    title = page.fetch("title")
    detail = get_json("/wiki/rest/api/content/#{page_id}?expand=body.storage")
    slug = slug_for(title)
    attachments = fetch_attachments(page_id)
    body, docs, homework = convert_page(
      title: title,
      slug: slug,
      html: detail.dig("body", "storage", "value").to_s,
      attachments: attachments
    )
    track = @track_index.fetch(title, "basics")
    front_matter = {
      "title" => title,
      "track" => track,
      "order" => order_index * 10,
      "summary" => summary_for(title)
    }
    front_matter["apple_docs"] = docs unless docs.empty?
    front_matter["homework"] = homework unless homework.empty?

    content = +"---\n"
    content << Psych.dump(front_matter).sub(/\A---\n/, "")
    content << "---\n"
    content << body.rstrip
    content << "\n"
    path = File.join(SESSIONS_DIR, "#{slug}.md")
    File.write(path, content)
    puts "Imported #{title} -> _sessions/#{slug}.md"
  end

  def fetch_attachments(page_id)
    response = get_json("/wiki/rest/api/content/#{page_id}/child/attachment?limit=500")
    response.fetch("results").each_with_object({}) do |item, acc|
      next unless item["_links"] && item["_links"]["download"]

      acc[item.fetch("title")] = item["_links"]["download"]
    end
  end

  def convert_page(title:, slug:, html:, attachments:)
    fragment = Nokogiri::HTML::DocumentFragment.parse(preprocess_storage_html(html))
    sections = split_sections(fragment)
    docs = []
    homework = []
    body_parts = []

    sections.each_with_index do |section, index|
      heading = section[:heading]
      next if section[:nodes].empty? && heading.to_s.empty?

      if heading && homework_heading?(heading)
        homework.concat(extract_homework(section[:nodes], slug, attachments))
        next
      end

      section_docs = []
      rendered_blocks = []
      section[:nodes].each do |node|
        if docs_only_node?(node)
          section_docs.concat(extract_doc_links(node))
          next
        end

        block = render_block(node, slug, attachments)
        rendered_blocks << block unless blank_block?(block)
      end
      docs.concat(section_docs)

      next if rendered_blocks.empty? && duplicate_heading?(title, heading)

      if heading && !duplicate_heading?(title, heading)
        body_parts << "### #{heading}"
      elsif heading && index.positive?
        body_parts << "### #{heading}"
      end
      body_parts.concat(rendered_blocks) unless rendered_blocks.empty?
    end

    body = squeeze_blocks(body_parts)
    docs = dedupe_docs(docs)
    homework = homework.map { |item| cleanup_text(item) }.reject(&:empty?).uniq
    [body, docs, homework]
  end

  def split_sections(fragment)
    sections = []
    current = { heading: nil, nodes: [] }

    fragment.children.each do |node|
      next if ignorable_node?(node)

      if heading_node?(node)
        sections << current if current[:heading] || !current[:nodes].empty?
        current = { heading: cleanup_heading(node.text), nodes: [] }
      elsif homework_heading_node?(node)
        sections << current if current[:heading] || !current[:nodes].empty?
        current = { heading: "Homework", nodes: [] }
      else
        current[:nodes] << node
      end
    end

    sections << current if current[:heading] || !current[:nodes].empty?
    sections
  end

  def heading_node?(node)
    node.element? && node.name.match?(/\Ah[1-6]\z/)
  end

  def homework_heading_node?(node)
    return false unless node.element?
    return false unless node.name == "p"

    text = cleanup_heading(node.text)
    text.casecmp("Homework").zero? && node.css("strong").any?
  end

  def homework_heading?(heading)
    heading.to_s.strip.casecmp("Homework").zero?
  end

  def duplicate_heading?(title, heading)
    return false if heading.to_s.empty?

    normalize_key(title) == normalize_key(heading)
  end

  def summary_for(title)
    "A short SwiftUI study on `#{title}`."
  end

  def render_block(node, slug, attachments)
    return "" if ignorable_node?(node)

    case node.name
    when "p"
      render_paragraph(node, slug, attachments)
    when "ul"
      render_list(node, slug, attachments, ordered: false)
    when "ol"
      render_list(node, slug, attachments, ordered: true)
    when "structured-macro"
      render_macro(node, slug, attachments)
    when "image"
      render_attachment_node(node, slug, attachments)
    when "table"
      render_table(node, slug, attachments)
    when /\Ah[1-6]\z/
      "#### #{cleanup_heading(node.text)}"
    when "blockquote"
      render_blockquote(node)
    else
      text = render_inline(node, slug, attachments)
      text.empty? ? "" : text
    end
  end

  def render_paragraph(node, slug, attachments)
    return "" if br_only?(node)

    if node.element_children.any? { |child| %w[structured-macro image table].include?(child.name) } && cleanup_text(node.text).empty?
      blocks = node.element_children.map { |child| render_block(child, slug, attachments) }
      return squeeze_blocks(blocks)
    end

    text = render_inline(node, slug, attachments)
    text.empty? ? "" : text
  end

  def render_list(node, slug, attachments, ordered:)
    lines = []
    node.element_children.select { |child| child.name == "li" }.each_with_index do |li, index|
      blocks = li.element_children.map { |child| render_block(child, slug, attachments) }
      if blocks.empty?
        text = render_inline(li, slug, attachments)
        next if text.empty?

        lines << "#{ordered ? "#{index + 1}." : "-"} #{text}"
        next
      end

      first = blocks.shift
      lines << "#{ordered ? "#{index + 1}." : "-"} #{first}"
      blocks.each do |block|
        next if blank_block?(block)

        lines << indent_block(block, 2)
      end
    end
    squeeze_blocks(lines)
  end

  def render_macro(node, slug, attachments)
    case node["ac:name"]
    when "code"
      render_code_block(node)
    when "expand"
      render_expand(node, slug, attachments)
    when "view-file"
      render_view_file(node, slug, attachments)
    else
      text = render_inline(node, slug, attachments)
      text.empty? ? "" : text
    end
  end

  def render_code_block(node)
    language = macro_parameter(node, "language")
    language = DEFAULT_LANG if language.empty?
    code = plain_text_content(node.at_css("plain-text-body"))
    return "" if code.strip.empty?

    <<~MARKDOWN.rstrip
      ```#{language}
      #{code.rstrip}
      ```
    MARKDOWN
  end

  def render_expand(node, slug, attachments)
    title = macro_parameter(node, "title")
    title = "Details" if title.empty?
    body = node.at_css("rich-text-body")
    inner = body ? squeeze_blocks(body.children.map { |child| render_block(child, slug, attachments) }) : ""
    return "" if inner.empty?

    "<details>\n<summary>#{CGI.escapeHTML(title)}</summary>\n\n#{inner}\n\n</details>"
  end

  def render_view_file(node, slug, attachments)
    attachment = parameter_attachment(node, "name")
    return "" unless attachment

    filename = attachment["ri:filename"]
    render_attachment_link(filename, slug, attachments)
  end

  def render_attachment_node(node, slug, attachments)
    attachment = node.at_css("attachment")
    return "" unless attachment

    filename = attachment["ri:filename"]
    alt = node["ac:alt"].to_s.strip
    alt = File.basename(filename, File.extname(filename)) if alt.empty?
    local_name = download_attachment(filename, slug, attachments)
    return "" unless local_name

    url = liquid_asset_path(slug, local_name)
    ext = File.extname(local_name).downcase
    if video_file?(ext)
      <<~HTML.rstrip
        <video controls preload="metadata">
          <source src="#{url}" type="#{mime_type_for(ext)}">
        </video>
      HTML
    elsif image_file?(ext)
      "![#{escape_markdown_text(alt)}](#{url})"
    else
      "[#{escape_markdown_text(filename)}](#{url})"
    end
  end

  def render_attachment_link(filename, slug, attachments)
    local_name = download_attachment(filename, slug, attachments)
    return "" unless local_name

    "[#{escape_markdown_text(filename)}](#{liquid_asset_path(slug, local_name)})"
  end

  def render_table(node, slug, attachments)
    rows = []
    node.element_children.each do |child|
      if child.name == "tbody"
        rows.concat(child.element_children.select { |grandchild| grandchild.name == "tr" })
      elsif child.name == "tr"
        rows << child
      end
    end
    return "" if rows.empty?

    html = +"<table>\n"
    rows.each do |row|
      html << "  <tr>\n"
      row.element_children.each do |cell|
        tag = cell.name == "th" ? "th" : "td"
        inner = cell.children.map { |child| render_html_node(child, slug, attachments) }.join
        html << "    <#{tag}>#{inner}</#{tag}>\n"
      end
      html << "  </tr>\n"
    end
    html << "</table>"
    html
  end

  def render_html_node(node, slug, attachments)
    return CGI.escapeHTML(node.text) if node.text?
    return "" unless node.element?

    case node.name
    when "p"
      inner = node.children.map { |child| render_html_node(child, slug, attachments) }.join
      inner.strip.empty? ? "" : "<p>#{inner}</p>"
    when "br"
      "<br>"
    when "strong", "b"
      "<strong>#{node.children.map { |child| render_html_node(child, slug, attachments) }.join}</strong>"
    when "em", "i"
      "<em>#{node.children.map { |child| render_html_node(child, slug, attachments) }.join}</em>"
    when "a"
      href = CGI.escapeHTML(node["href"].to_s)
      label = node.children.map { |child| render_html_node(child, slug, attachments) }.join
      label = href if label.empty?
      "<a href=\"#{href}\">#{label}</a>"
    when "structured-macro"
      render_html_macro(node, slug, attachments)
    when "image"
      render_html_attachment(node, slug, attachments)
    when "ul", "ol"
      tag = node.name
      items = node.element_children.select { |child| child.name == "li" }.map do |li|
        "<li>#{li.children.map { |child| render_html_node(child, slug, attachments) }.join}</li>"
      end.join
      "<#{tag}>#{items}</#{tag}>"
    when "table"
      render_table(node, slug, attachments)
    else
      node.children.map { |child| render_html_node(child, slug, attachments) }.join
    end
  end

  def render_html_macro(node, slug, attachments)
    case node["ac:name"]
    when "code"
      language = macro_parameter(node, "language")
      language = DEFAULT_LANG if language.empty?
      code = CGI.escapeHTML(plain_text_content(node.at_css("plain-text-body")).rstrip)
      return "" if code.empty?

      "<pre><code class=\"language-#{CGI.escapeHTML(language)}\">#{code}</code></pre>"
    when "expand"
      title = macro_parameter(node, "title")
      title = "Details" if title.empty?
      body = node.at_css("rich-text-body")
      inner = body ? body.children.map { |child| render_html_node(child, slug, attachments) }.join : ""
      "<details><summary>#{CGI.escapeHTML(title)}</summary>#{inner}</details>"
    when "view-file"
      attachment = parameter_attachment(node, "name")
      return "" unless attachment

      filename = attachment["ri:filename"]
      render_html_file_link(filename, slug, attachments)
    else
      node.children.map { |child| render_html_node(child, slug, attachments) }.join
    end
  end

  def render_html_attachment(node, slug, attachments)
    attachment = node.at_css("attachment")
    return "" unless attachment

    filename = attachment["ri:filename"]
    alt = CGI.escapeHTML(node["ac:alt"].to_s.strip)
    alt = CGI.escapeHTML(File.basename(filename, File.extname(filename))) if alt.empty?
    local_name = download_attachment(filename, slug, attachments)
    return "" unless local_name

    url = liquid_asset_path(slug, local_name)
    ext = File.extname(local_name).downcase
    if video_file?(ext)
      "<video controls preload=\"metadata\"><source src=\"#{url}\" type=\"#{CGI.escapeHTML(mime_type_for(ext))}\"></video>"
    elsif image_file?(ext)
      "<img src=\"#{url}\" alt=\"#{alt}\">"
    else
      "<a href=\"#{url}\">#{CGI.escapeHTML(filename)}</a>"
    end
  end

  def render_html_file_link(filename, slug, attachments)
    local_name = download_attachment(filename, slug, attachments)
    return "" unless local_name

    "<a href=\"#{liquid_asset_path(slug, local_name)}\">#{CGI.escapeHTML(filename)}</a>"
  end

  def render_blockquote(node)
    text = cleanup_text(node.text)
    return "" if text.empty?

    text.split("\n").map { |line| "> #{line}" }.join("\n")
  end

  def render_inline(node, slug, attachments)
    return cleanup_text(node.text) if node.text?
    return "" unless node.element?

    case node.name
    when "strong", "b"
      text = node.children.map { |child| render_inline(child, slug, attachments) }.join
      text.empty? ? "" : "**#{text.strip}**"
    when "em", "i"
      text = node.children.map { |child| render_inline(child, slug, attachments) }.join
      text.empty? ? "" : "*#{text.strip}*"
    when "code"
      text = cleanup_text(node.text)
      text.empty? ? "" : "`#{text}`"
    when "a"
      href = node["href"].to_s.strip
      label = cleanup_text(node.text)
      label = href if label.empty?
      href.empty? ? label : "[#{escape_markdown_text(label)}](#{href})"
    when "br"
      "  \n"
    when "image"
      render_attachment_node(node, slug, attachments)
    when "structured-macro"
      render_macro(node, slug, attachments)
    else
      node.children.map { |child| render_inline(child, slug, attachments) }.join
    end
  end

  def docs_only_node?(node)
    return false unless %w[p ul ol].include?(node.name)
    return false if node.css("structured-macro, image, table").any? { |child| child.name == "image" || child.name == "table" || child["ac:name"] == "code" }

    links = node.css("a[href]").map { |anchor| anchor["href"].to_s.strip }.reject(&:empty?)
    return false if links.empty?

    clone = node.dup
    clone.css("a").remove
    clone.css("br").remove
    cleanup_text(clone.text).empty?
  end

  def extract_doc_links(node)
    node.css("a[href]").map do |anchor|
      href = anchor["href"].to_s.strip
      next if href.empty?
      next unless href.start_with?("http://", "https://")

      {
        "label" => link_label(anchor.text.to_s, href),
        "url" => href
      }
    end.compact
  end

  def extract_homework(nodes, slug, attachments)
    items = []
    nodes.each do |node|
      if %w[ul ol].include?(node.name)
        node.css("> li").each do |li|
          text = cleanup_text(li.text)
          items << text unless text.empty?
        end
      else
        text = cleanup_text(render_block(node, slug, attachments))
        items << text unless text.empty?
      end
    end
    items
  end

  def link_label(text, href)
    cleaned = cleanup_text(text)
    return cleaned unless cleaned.empty? || cleaned == href

    uri = URI.parse(href)
    segment = uri.path.split("/").reject(&:empty?).last.to_s
    segment = uri.host if segment.empty?
    segment = CGI.unescape(segment)
    segment.tr!("-_", " ")
    segment.gsub!(/\s+/, " ")
    segment.strip!
    segment.empty? ? href : segment.split.map(&:capitalize).join(" ")
  rescue URI::InvalidURIError
    href
  end

  def download_attachment(filename, slug, attachments)
    key = [slug, filename]
    return @downloads_cache[key] if @downloads_cache.key?(key)

    if invalid_attachment_name?(filename)
      @downloads_cache[key] = nil
      return nil
    end

    download_path = attachments[filename]
    unless download_path
      @downloads_cache[key] = nil
      return nil
    end

    ext = File.extname(filename).downcase
    unless DOWNLOADABLE_EXTENSIONS.include?(ext) || ext.empty?
      @downloads_cache[key] = nil
      return nil
    end

    local_dir = File.join(ASSETS_DIR, slug)
    FileUtils.mkdir_p(local_dir)
    local_name = unique_attachment_name(local_dir, filename)
    uri = URI.join(BASE_URL, normalized_download_path(download_path))
    response = get_response(uri)
    path = File.join(local_dir, local_name)
    File.binwrite(path, response.body)
    @downloads_cache[key] = local_name
  rescue StandardError => error
    warn "Skipped attachment #{filename} for #{slug}: #{error.message}"
    @downloads_cache[key] = nil
  end

  def unique_attachment_name(dir, filename)
    ext = File.extname(filename).downcase
    base = slugify(File.basename(filename, ".*"))
    base = "attachment" if base.empty?
    digest = Digest::SHA1.hexdigest(filename)[0, 8]
    "#{base}-#{digest}#{ext}"
  end

  def rewrite_catalog(pages)
    order_index = pages.each_with_object({}) { |page, acc| acc[page.fetch("title")] = page }
    lines = []
    pages.each do |page|
      title = page.fetch("title")
      track = @track_index.fetch(title, "basics")
      slug = slug_for(title)
      lines << "- title: \"#{title.gsub('"', "'")}\""
      lines << "  track: #{track}"
      lines << "  url: /sessions/#{slug}/"
    end
    File.write(CATALOG_PATH, "#{lines.join("\n")}\n")
  end

  def slug_for(title)
    @slug_overrides[title] || slugify(title)
  end

  def slugify(value)
    ascii = value.to_s.unicode_normalize(:nfkd).encode("ASCII", invalid: :replace, undef: :replace, replace: "")
    ascii.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-+|-+\z/, "")
  rescue Encoding::UndefinedConversionError, Encoding::InvalidByteSequenceError
    value.to_s.downcase.gsub(/[^a-z0-9]+/, "-").gsub(/\A-+|-+\z/, "")
  end

  def liquid_asset_path(slug, local_name)
    "{{ '/assets/sessions/#{slug}/#{local_name}' | relative_url }}"
  end

  def image_file?(ext)
    IMAGE_EXTENSIONS.include?(ext)
  end

  def video_file?(ext)
    VIDEO_EXTENSIONS.include?(ext)
  end

  def mime_type_for(ext)
    case ext
    when ".mov"
      "video/quicktime"
    when ".m4v"
      "video/x-m4v"
    else
      "video/mp4"
    end
  end

  def get_json(path)
    response = get_response(URI.join(BASE_URL, path))
    JSON.parse(response.body)
  end

  def get_response(uri, limit = 5)
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = @auth
    request["Accept"] = "*/*"
    request["User-Agent"] = "swiftui-study-importer/1.0"

    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      response = http.request(request)
      if response.is_a?(Net::HTTPRedirection)
        raise "Too many redirects for #{uri}" if limit <= 0

        location = response["location"]
        raise "Redirect missing location for #{uri}" if location.to_s.empty?

        next_uri = URI.parse(location)
        return get_response(next_uri, limit - 1)
      end
      unless response.is_a?(Net::HTTPSuccess)
        raise "Request failed: #{uri} -> #{response.code} #{response.message}"
      end

      response
    end
  end

  def dedupe_docs(docs)
    seen = Set.new
    docs.each_with_object([]) do |item, acc|
      next unless item["url"]
      next unless seen.add?(item["url"])

      acc << item
    end
  end

  def escape_markdown_text(text)
    text.to_s.gsub(/([\[\]`*_])/, '\\\\\1')
  end

  def normalize_key(text)
    cleanup_heading(text).downcase.gsub(/[^a-z0-9]+/, "")
  end

  def cleanup_heading(text)
    cleanup_text(text).gsub(/\A#+\s*/, "")
  end

  def cleanup_text(text)
    text.to_s.encode("UTF-8", invalid: :replace, undef: :replace, replace: "").gsub("\u00A0", " ").gsub(/[ \t]+/, " ").gsub(/\s*\n\s*/, "\n").strip
  end

  def squeeze_blocks(blocks)
    text = Array(blocks).flatten.compact.map(&:to_s).map(&:rstrip).reject(&:empty?).join("\n\n")
    text.gsub(/\n{3,}/, "\n\n").strip
  end

  def indent_block(text, spaces)
    prefix = " " * spaces
    text.split("\n").map { |line| line.empty? ? line : "#{prefix}#{line}" }.join("\n")
  end

  def blank_block?(text)
    cleanup_text(text).empty?
  end

  def preprocess_storage_html(html)
    html.to_s.gsub(%r{<ac:plain-text-body><!\[CDATA\[(.*?)\]\]></ac:plain-text-body>}m) do
      encoded = Base64.strict_encode64(Regexp.last_match(1))
      "<ac:plain-text-body data-raw=\"#{encoded}\"></ac:plain-text-body>"
    end
  end

  def plain_text_content(node)
    return "" unless node

    if node["data-raw"]
      Base64.decode64(node["data-raw"]).force_encoding("UTF-8")
    else
      node.text.to_s.sub(/\]\]>\s*\z/, "").force_encoding("UTF-8")
    end
  end

  def normalized_download_path(path)
    return path if path.start_with?("/wiki/")
    return "/wiki#{path}" if path.start_with?("/download/")

    path
  end

  def macro_parameter(node, name)
    parameter = node.element_children.find do |child|
      child.name == "parameter" && child["ac:name"] == name
    end
    parameter&.text.to_s.strip
  end

  def parameter_attachment(node, name)
    parameter = node.element_children.find do |child|
      child.name == "parameter" && child["ac:name"] == name
    end
    parameter&.at_css("attachment")
  end

  def invalid_attachment_name?(filename)
    name = filename.to_s.strip
    return true if name.empty?
    return true if name.start_with?("Invalid file id")

    false
  end

  def ignorable_node?(node)
    return true if node.text? && cleanup_text(node.text).empty?
    return false unless node.element?

    br_only?(node)
  end

  def br_only?(node)
    return false unless node.element?

    clone = node.dup
    clone.css("br").remove
    cleanup_text(clone.text).empty? && clone.element_children.empty?
  end
end

ConfluenceImporter.new.run
