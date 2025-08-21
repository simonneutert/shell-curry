---
layout: default
title: Blog Posts
description: "Blog for an opinionated list of cli tools from software developers for software developers."
---

{%- if site.posts.size > 0 -%}
  <h2 class="post-list-heading">{{ page.list_title | default: "Tool Rack" }}</h2>
  <ul class="post-list">
    {%- for post in site.posts -%}
    <li>
      {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
      <span class="post-meta">{{ post.date | date: date_format }}</span>
      <h3>
        <a class="post-link" href="{{ post.url | relative_url }}">
          <span class="mark" style="padding: 0.2rem 1.5rem 0.2rem 1rem">
            {{ post.title | escape }}
          </span>
        </a>
      </h3>
      {%- if site.show_excerpts -%}
        {{ post.excerpt }}
      {%- endif -%}
    </li>
    {%- endfor -%}
  </ul>

  <p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | relative_url }}">via RSS</a></p>
{%- endif -%}
