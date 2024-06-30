---
authors:
  - kamilkrzyskow
categories:
  - Tutorials
date: 2024-07-01
tags:
  - Best Practices
  - Documentation
  - How-To
  - MkDocs
---
# Guidelines For Community Posts

Question: What are the requirements for my blog post to be added here?  
Answer: There are almost no requirements, other than managing files...

<!-- more -->

## Technical requirements

### Creation date

Each post needs to have a date of creation that is used for sorting and ordering of the posts. The 
`date` key can be a simple string only with the creation date, or a object structure with sub-keys 
`created` and `updated`.

```yaml
date: 2024-07-01
```

[Reference](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.date)

### At least one category

Instead of the default time-based post URLs, this blog uses category-based URLs, and the first
category is included in the URL of the post. The `categories` key is a list of strings.

```yaml
categories:
  - Tutorials
```

[Reference](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.categories)

## Mandatory opinionated requirements

### Use categories defined in the mkdocs.yml config

Some categories can be used for slugs, some don't, if you want to add a new on with your post please
ask first. To read an up-to-date list check the `categories_allowed` option in the `mkdocs.yml` 
file. If you want more granularity, please use [tags], which allow for more leeway. You can check 
currently used tags [here][current-tags].

[tags]: https://squidfunk.github.io/mkdocs-material/plugins/tags/
[current-tags]: ../../tags.md

### Keep the files organized

Put posts under the `blog/posts` directory into a subdirectory matching the category `slug`, so 
lowercase and with `_` in place of spaces:

> The filenames should use `_` for spaces, and should be lowercase.

```
blog/posts/community-news/welcome.md
blog/posts/tutorials/how_to_write_blog_posts.md
```

In case of assets specific to the blog section it would be something like this:

> Notice the lack of `posts`.

```
assets/blog/images/tutorials/image.png
```

### Assets like images need to be put under the `overrides` path

Due to the rest of the site using multiple languages (i18n), assets are kept in the overrides 
directory, which reduces duplication of files after the build. The overrides directory is put on top
of the built directory so all relative paths are the same as if the files would be in the `docs` 
directory. So use a couple of `../` to get to the root of the built site and access the asset:

![](../../../assets/images/gmc_logo.png){: .gmc-default-img style="width: 2rem" }

```
../../../assets/images/gmc_logo.png
```

So in case of the example before:

```
../../../assets/blog/images/tutorials/image.png
```

## Optional opinionated recommendations

### Keep keys and values in the front-matter in alphabetical order

Will make it easier to spot mistakes.

### Keep a strict line width limit

It will make it easier to read and spot mistakes in Markdown. `mkdocs-material` uses a 80-character 
limit, which is a bit narrow. As of the time of writing this post the CSS settings for the width of 
the content is roughly ~140 characters, which is a bit wide. This Markdown file uses a 100-character
limit. Keep things reasonable and use the same width throughout the file. 

### Use alternative link definitions

To add to the previous point, when using the normal Markdown link definitions like `[text](url)` you
will run into problems with too long lines. To mitigate that, define links before the next heading
using this syntax: `[text]: url`. Then you can organically use the `[text]` in your parahraph and it
will be converted to an URL.

### Don't be lazy when a name conflict occurs

If there isn't any better alternative you can add a lazy `-2` at the end of the name, but for better
search-ability your name should be distinct in some way. For example an image with a success message
`result.png` can be quite common, so prepend a slug `blender_modifier_result.png` or the slug of the
blog post you're writing.

### Add a H2 Comments heading at the bottom

This will add an TOC element for users to easily skip the post and read the comments. The RSS plugin
also expects that this heading exists.

## Comments

Let us know what you think about those restrictions!
