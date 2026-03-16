---
layout: default
title: Home
description: SwiftUI study archive for short daily sessions.
---
{% assign session_count = site.sessions | size %}
{% assign track_count = site.data.tracks | size %}
<section id="overview" class="hero-panel" data-reveal>
  <div class="hero-copy">
    <div class="eyebrow">Weekly Study</div>
    <h1>SwiftUI Study Session</h1>
    <p>
      A simple place for five minutes of SwiftUI study a day.
      Sessions are organized into a clear learning path, and each page keeps links, code, homework,
      and attachments in one durable format.
    </p>
    <div class="hero-actions">
      <a class="button-link primary" href="{{ '/sessions/' | relative_url }}">Browse Sessions</a>
    </div>
  </div>
</section>

<section id="quick-map" class="section-block" data-reveal>
  <div class="section-head">
    <div class="eyebrow">At A Glance</div>
    <h2>See the whole archive in one scan.</h2>
    <p>One concept, one example, one small homework prompt, and a steady five-minute daily rhythm.</p>
  </div>
  <div class="glance-grid">
    <article class="glance-card">
      <strong>{{ track_count }} tracks</strong>
      <p>The archive is grouped into practical SwiftUI categories instead of one long flat list.</p>
    </article>
    <article class="glance-card">
      <strong>{{ session_count }} live pages</strong>
      <p>The current sessions are already browsable from the hierarchy on the left.</p>
    </article>
    <article class="glance-card">
      <strong>5-minute flow</strong>
      <p>Each session is designed to stay lightweight: one concept, one code sample, and one follow-up task.</p>
    </article>
    <article class="glance-card">
      <strong>Small units</strong>
      <p>Each page is meant to stay short, readable, and easy to revisit during a quick daily study block.</p>
    </article>
  </div>
</section>

<section id="tracks" class="section-block" data-reveal>
  <div class="section-head">
    <div class="eyebrow">Tracks</div>
    <h2>Use a learning flow, not a flat dump.</h2>
    <p>The tracks follow the broad learning flow used in Apple&apos;s SwiftUI Concepts and Pathway, so sessions grow under a clear structure instead of becoming a flat dump.</p>
  </div>
  <div class="track-grid">
    {% for track in site.data.tracks %}
    {% assign track_entries = site.data.session_catalog | where: "track", track.slug %}
    <article class="track-card">
      <div class="eyebrow">{{ forloop.index | prepend: '0' }}</div>
      <h3><span class="track-emoji" aria-hidden="true">{{ track.emoji }}</span><span>{{ track.label }}</span></h3>
      <p>{{ track.summary }}</p>
      <div class="meta-inline">{{ track_entries | size }} topics</div>
    </article>
    {% endfor %}
  </div>
</section>

<section id="seeded-session" class="section-block" data-reveal>
  <div class="section-head">
    <div class="eyebrow">Sessions</div>
    <h2>Current examples</h2>
    <p>A few live pages define the structure for the rest of the archive.</p>
  </div>

  <div class="session-grid">
    {% assign sorted_sessions = site.sessions | sort: "order" %}
    {% for session in sorted_sessions limit: 2 %}
    {% assign track_info = site.data.tracks | where: "slug", session.track | first %}
    <a class="session-card" href="{{ session.url | relative_url }}">
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
