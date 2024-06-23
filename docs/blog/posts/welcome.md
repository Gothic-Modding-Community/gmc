---
date: 2024-06-09
authors:
  - kamilkrzyskow 
  - kamilkrzyskow
categories:
  - GMC
tags:
  - MkDocs
  - Meta
---
# Introducing Community Posts

> Made possible thanks to the built-in Blog plugin of Material for MkDocs.  
> [![Material for MkDocs][badge]{: .normalImgStyling}](#usage)

This is a blog-like section of GMC, where users can post their tutorials, guides, analytical 
articles, useful snippets, promote their modding tools etc.  

Basically this should allow for more flexibility when it comes to content creation on the website.

<!-- more -->

[badge]: https://img.shields.io/badge/Material_for_MkDocs-526CFE?style=for-the-badge&logo=MaterialForMkDocs&logoColor=white

## Why a blog?

Many times over the span of running Gothic Modding Community one issue has resurfaced over and over
again. The issue concerns the fact that some pages don't fit the "docs" idea. Therefore, a new 
section was required. At first, we wanted to just put everything into a plain new area, but the Blog
plugin was supposed to be released to the Community version of the Material theme, so we pushed back
the idea and waited for that to happen, but while waiting for it, we started supporting i18n 
localization, in hopes of getting new users for both translation and content creation, but after
a year has passed no new members have become regular contributors. Also the GitHub/PayPal fiasco
took place which pushed back the release of the Blog plugin to the public to use.

Finally, the Blog plugin arrived in the Community version, but then it turned out that the 
mkdocs-static-i18n plugin unfortunately can't handle the internally generated blog pages of the Blog
plugin. So we waited a bit longer, in hopes of the situation resolving itself via some nifty fix. 
Unfortunately, nothing did change, and the initial issue kept resurfacing. 

## i18n support

!!! failure "Not supported"
    As of the day of writing this post (2024-06-09) the i18n plugin doesn't support blog pages.

Given the skill of the developer maintaining the i18n plugin ([@ultrabug]()) I don't think this is an
easy issue to solve, as it would get solved already. The solution probably requires overriding 
internal code of the Blog plugin, and as it updates together with the theme, people using it with 
localization could end up blocked from updating and this would create a rather bad situation where 
@ultrabug has to constantly make fixes. Add to it different versions of the Blog plugin for the
Community and Insiders version

## Comments