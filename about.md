---
layout: page
title: About
permalink: /about/
description: "Rice desktops and spice up your shell! An opinionated list of cli tools from software developers for software developers."
---

We are the current active maintainers of this website:

<ul class="social-media-list">

    {%- if site.github_usernames.size > 0 -%}
        {%- assign maintainers = site.github_usernames | sort -%}
        {%- for github_username in maintainers | sort -%}
            <li>
                <a href="https://github.com/{{ github_username| cgi_escape | escape }}">
                    <svg class="svg-icon">
                        <use xlink:href="{{ '/assets/minima-social-icons.svg#github' | relative_url }}"></use>
                    </svg>
                    <span class="username">{{ github_username| escape }}</span>
                </a>
            </li>
        {%- endfor -%}
    {%- endif -%}

</ul>

and all of us are very happy to have you here! We hope this website brightens your day 🤓
