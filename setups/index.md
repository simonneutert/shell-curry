---
layout: page
title: Browse Setups
---

<ul>

{%- if site.data.members.size > 0 -%}
{%- assign sorted_members = site.data.members | sort: "github" -%}
{%- for member in sorted_members -%}
  <li>
    <a href="{{ member.url }}">
      {{ member.name }}
    </a>
    <a href="https://github.com/{{ member.github }}">
      {{ member.name }}@github
    </a>
  </li>
{%- endfor -%}
{%- endif -%}
</ul>
