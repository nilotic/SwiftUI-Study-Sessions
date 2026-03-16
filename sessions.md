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
  <p>Filter sessions by track. New pages can continue to fit into the same card structure.</p>
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
  <div class="session-grid">
    {% for session in sorted_sessions %}
    {% assign track_info = site.data.tracks | where: "slug", session.track | first %}
    <a class="session-card" href="{{ session.url | relative_url }}" data-session-card data-track="{{ session.track }}">
      <div class="pill-row">
        {% if track_info %}
        <span class="pill">{{ track_info.label }}</span>
        {% endif %}
      </div>
      <h3>{{ session.title }}</h3>
      <p>{{ session.summary | markdownify | strip_newlines | remove: '<p>' | remove: '</p>' }}</p>
    </a>
    {% endfor %}
  </div>
</section>
