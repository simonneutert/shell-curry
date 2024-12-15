---
layout: page
title: Tool Rack
description: "An opinionated list of cli tools from software developers for software developers."
---

{%- if site.data.tools.size > 0 -%}

    {%- assign tools_by_category = site.data.tools | group_by: "category" | sort: "name" -%}
    
    <div style="padding-bottom: 1rem;">
        {%- for tool_by_category in tools_by_category -%}
        
        <span style="padding-right: 1rem; line-height: 2.2rem"><a href="#{{ tool_by_category.name | escape | slugify }}">
            {{ tool_by_category.name | escape }}
        </a></span>&nbsp;
        
        {%- endfor -%}

        <hr/>
    </div>
    
    {%- for tool_by_category in tools_by_category -%}
        <ul class="post-list">
            <h2 id="{{ tool_by_category.name | escape | slugify }}">{{ tool_by_category.name | escape }}</h2>
            {%- for tool in tool_by_category.items -%}
            <li>
                <p>
                <strong><a href="https://github.com/{{ tool.github }}">
                    {{ tool.name | escape }}
                </a></strong>
                <span class="post-meta">{{tool.short | escape}}</span>
                </p>
            </li>
            {%- endfor -%}
        </ul>
    {%- endfor -%}

{%- endif -%}

<hr>
