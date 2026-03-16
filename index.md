---
layout: default
title: Home
description: SwiftUI study archive for short daily sessions.
---
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
      <h3><span class="track-emoji" aria-hidden="true">{{ track.emoji }}</span><span>{{ track.label }}</span></h3>
      <p>{{ track.summary }}</p>
      <div class="meta-inline">{{ track_entries | size }} topics</div>
    </article>
    {% endfor %}
  </div>
</section>
