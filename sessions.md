---
layout: default
title: Sessions
permalink: /sessions/
description: Browse SwiftUI study sessions by track.
---
{% assign sorted_sessions = site.sessions | sort: "order" %}
<section class="page-head" data-reveal>
  <div class="eyebrow">Session Index</div>
  <h1>Study sessions</h1>
  <p>Filter sessions by track and scan the full archive in a compact list.</p>
</section>

<section class="section-block" data-reveal>
  <div class="filter-row">
    <button class="filter-chip is-active" type="button" data-filter="all">All</button>
    {% for track in site.data.tracks %}
    <button class="filter-chip" type="button" data-filter="{{ track.slug }}">{{ track.emoji }} {{ track.label }}</button>
    {% endfor %}
  </div>
</section>

<section class="section-block" data-reveal>
  <div class="session-list">
    {% for session in sorted_sessions %}
    {% assign track_info = site.data.tracks | where: "slug", session.track | first %}
    <a class="session-row" href="{{ session.url | relative_url }}" data-session-card data-track="{{ session.track }}">
      <div class="session-row-main">
        <h3 class="session-row-title">{{ session.title }}</h3>
        <p class="session-row-summary">{{ session.summary | markdownify | strip_newlines | remove: '<p>' | remove: '</p>' }}</p>
      </div>
      <div class="session-row-meta">
        {% if track_info %}
        <span class="pill">{{ track_info.label }}</span>
        {% endif %}
        <span class="session-row-arrow" aria-hidden="true">›</span>
      </div>
    </a>
    {% endfor %}
  </div>
</section>
