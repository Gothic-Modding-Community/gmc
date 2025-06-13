---
authors:
  - kamilkrzyskow
date: 2024-07-02
categories:
  - Community News
tags:
  - Documentation
  - i18n
  - MkDocs
---
# Introducing Community Posts

> Enabled by the built-in Blog plugin of Material for MkDocs.  
> [![Material for MkDocs][badge]{: .gmc-default-img}][mkdocs-material]

Welcome to the new blog section of the GMC, where users can share tutorials, guides, analytical 
articles, useful snippets, promote their modding tools, and more.

This addition brings greater flexibility to content creation on our website.

<!-- more -->

[badge]: https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white
[mkdocs-material]: https://squidfunk.github.io/mkdocs-material/

## Why a blog?

Throughout the history of the Gothic Modding Community, we've encountered a recurring issue: some 
content doesn't fit neatly into the "docs" format. To address this, we needed a new section. 
Initially, we considered a simple new area, but then the Blog plugin was announced for the Community
version of the Material theme. We decided to wait for its release.

While waiting, we added support for i18n localization to attract new users for translation and 
content creation. However, despite our efforts, we didn't gain many regular contributors. 
Additionally, delays caused by the GitHub/PayPal issues further postponed the Blog plugin's release.

The Blog plugin eventually arrived in the Community version. Unfortunately, we discovered that the 
mkdocs-static-i18n plugin couldn't handle the internally generated blog pages. We hoped for a fix
upstream, but the issue persisted.

## i18n support

!!! failure "Not supported"
    As of July 02, 2024, the i18n plugin doesn't support blog pages.

Given the complexity of this issue, it likely requires overriding the Blog plugin's internal code. 
This could prevent users with localization from updating, creating a problematic situation for 
[@ultrabug], who would need to constantly make fixes. The issue is further complicated by different 
versions of the Blog plugin for the Community and Insiders editions.

This applies to us as well. Despite many fixes and patches added to our docs on top of other 
plugins, we don't plan to add i18n support for the blog ourselves to maintain general flexibility. 
Especially since our community is still primarily composed of English speakers.

[@ultrabug]: https://github.com/ultrabug/

## Who can add posts, what topics are allowed?

We don't plan to restrict posts too much. As long as they are not meme content, they will likely be 
accepted. For up-to-date guidelines, you can read the [how-to guide].

[how-to guide]: ../tutorials/how_to_write_blog_posts.md

## Comments

Let us know what do you think about the new feature!
