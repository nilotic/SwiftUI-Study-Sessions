---
layout: default
title: Sessions
title_ko: 세션
permalink: /sessions/
description: Browse SwiftUI study sessions by track.
description_ko: 트랙별로 SwiftUI 스터디 세션을 둘러보세요.
---
{% assign sorted_sessions = site.sessions | sort: "order" %}
<section class="page-head" data-reveal>
  <div
    class="eyebrow"
    data-i18n
    data-en="{{ site.data.i18n.en.sessions.eyebrow }}"
    data-ko="{{ site.data.i18n.ko.sessions.eyebrow }}"
  >{{ site.data.i18n.en.sessions.eyebrow }}</div>
  <h1
    data-i18n
    data-en="{{ site.data.i18n.en.sessions.title }}"
    data-ko="{{ site.data.i18n.ko.sessions.title }}"
  >{{ site.data.i18n.en.sessions.title }}</h1>
  <p
    data-i18n
    data-en="{{ site.data.i18n.en.sessions.description }}"
    data-ko="{{ site.data.i18n.ko.sessions.description }}"
  >{{ site.data.i18n.en.sessions.description }}</p>
</section>

<section class="section-block sessions-filter-block" data-reveal>
  <div class="filter-row">
    <button
      class="filter-chip is-active"
      type="button"
      data-filter="all"
      data-i18n
      data-en="{{ site.data.i18n.en.sessions.all }}"
      data-ko="{{ site.data.i18n.ko.sessions.all }}"
    >{{ site.data.i18n.en.sessions.all }}</button>
    {% for track in site.data.tracks %}
    <button
      class="filter-chip"
      type="button"
      data-filter="{{ track.slug }}"
      data-i18n
      data-en="{{ track.emoji }} {{ track.label }}"
      data-ko="{{ track.emoji }} {{ track.label_ko | default: track.label }}"
    >{{ track.emoji }} {{ track.label }}</button>
    {% endfor %}
  </div>
</section>

<section class="section-block sessions-list-block" data-reveal>
  <div class="session-list">
    {% for session in sorted_sessions %}
    {% assign track_info = site.data.tracks | where: "slug", session.track | first %}
    <a class="session-row" href="{{ session.url | relative_url }}" data-session-card data-track="{{ session.track }}">
      <div class="session-row-main">
        <h3
          class="session-row-title"
          data-i18n
          data-en="{{ session.title }}"
          data-ko="{{ session.title_ko | default: session.title }}"
        >{{ session.title }}</h3>
        <p class="session-row-summary" data-lang-content="en">
          {{ session.summary | markdownify | strip_newlines | remove: '<p>' | remove: '</p>' }}
        </p>
        <p class="session-row-summary" data-lang-content="ko" hidden>
          {{ session.summary_ko | default: session.summary | markdownify | strip_newlines | remove: '<p>' | remove: '</p>' }}
        </p>
      </div>
      <div class="session-row-meta">
        {% if track_info %}
        <span
          class="pill"
          data-i18n
          data-en="{{ track_info.label }}"
          data-ko="{{ track_info.label_ko | default: track_info.label }}"
        >{{ track_info.label }}</span>
        {% endif %}
        <span class="session-row-arrow" aria-hidden="true">›</span>
      </div>
    </a>
    {% endfor %}
  </div>
</section>
