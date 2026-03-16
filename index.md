---
layout: default
title: Home
title_ko: 홈
description: SwiftUI study pages for short daily sessions.
description_ko: SwiftUI 학습 세션 모음입니다.
---
<section id="overview" class="hero-panel home-hero" data-reveal>
  <div class="hero-copy">
    <div
      class="eyebrow"
      data-i18n
      data-en="{{ site.data.i18n.en.home.eyebrow }}"
      data-ko="{{ site.data.i18n.ko.home.eyebrow }}"
    >{{ site.data.i18n.en.home.eyebrow }}</div>
    <h1
      data-i18n
      data-en="{{ site.data.i18n.en.home.title }}"
      data-ko="{{ site.data.i18n.ko.home.title }}"
    >{{ site.data.i18n.en.home.title }}</h1>
    <p
      data-i18n
      data-en="{{ site.data.i18n.en.home.description }}"
      data-ko="{{ site.data.i18n.ko.home.description }}"
    >{{ site.data.i18n.en.home.description }}</p>
    <div class="hero-actions">
      <a
        class="button-link primary"
        href="{{ '/sessions/' | relative_url }}"
        data-i18n
        data-en="{{ site.data.i18n.en.home.cta }}"
        data-ko="{{ site.data.i18n.ko.home.cta }}"
      >{{ site.data.i18n.en.home.cta }}</a>
    </div>
  </div>
</section>

<section id="tracks" class="section-block home-tracks" data-reveal>
  <div class="section-head home-tracks-head">
    <div
      class="eyebrow"
      data-i18n
      data-en="{{ site.data.i18n.en.home.tracks_eyebrow }}"
      data-ko="{{ site.data.i18n.ko.home.tracks_eyebrow }}"
    >{{ site.data.i18n.en.home.tracks_eyebrow }}</div>
    <h2
      data-i18n
      data-en="{{ site.data.i18n.en.home.tracks_title }}"
      data-ko="{{ site.data.i18n.ko.home.tracks_title }}"
    >{{ site.data.i18n.en.home.tracks_title }}</h2>
    <p
      data-i18n
      data-en="{{ site.data.i18n.en.home.tracks_description }}"
      data-ko="{{ site.data.i18n.ko.home.tracks_description }}"
    >{{ site.data.i18n.en.home.tracks_description }}</p>
  </div>
  <div class="track-grid">
    {% for track in site.data.tracks %}
    {% assign track_entries = site.data.session_catalog | where: "track", track.slug %}
    <article class="track-card">
      <h3>
        <span class="track-emoji" aria-hidden="true">{{ track.emoji }}</span>
        <span
          data-i18n
          data-en="{{ track.label }}"
          data-ko="{{ track.label_ko | default: track.label }}"
        >{{ track.label }}</span>
      </h3>
      <p
        data-i18n
        data-en="{{ track.summary }}"
        data-ko="{{ track.summary_ko | default: track.summary }}"
      >{{ track.summary }}</p>
      <div
        class="meta-inline"
        data-i18n
        data-en="{{ track_entries | size }} topics"
        data-ko="{{ track_entries | size }}개 주제"
      >{{ track_entries | size }} topics</div>
    </article>
    {% endfor %}
  </div>
</section>
