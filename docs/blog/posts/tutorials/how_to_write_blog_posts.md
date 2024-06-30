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

**Question:** What are the requirements for my blog post to be added here?  
**Answer:** There are almost no requirements, other than managing files properly.

Also read the general [contribution guide](../../../contribute/index.md) for setup instructions. 

<!-- more -->

## Technical Requirements

### Creation Date

Each post must have a creation date used for sorting and ordering. The `date` key can be a simple 
string with the creation date or, an object structure with sub-keys `created` and `updated`.

```yaml
date: 2024-07-01
```

[Reference](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.date)

### At Least One Category

This blog uses category-based URLs instead of default time-based post URLs. The `categories` key is 
a list of strings.

```yaml
categories:
  - Tutorials
```

[Reference](https://squidfunk.github.io/mkdocs-material/plugins/blog/#meta.categories)

## Mandatory Opinionated Requirements

### Use Categories Defined in the mkdocs.yml Config

Some categories can be used for slugs, while others cannot. If you want to add a new one, please ask
first. To see an up-to-date list, check the `categories_allowed` option in the `mkdocs.yml` file. 
For more granularity, use [tags], which offer more flexibility. You can see the index of used tags 
[here][current-tags].

[tags]: https://squidfunk.github.io/mkdocs-material/plugins/tags/
[current-tags]: ../../tags.md

### Keep the Files Organized

Place posts in the `blog/posts` directory under a subdirectory matching the category slug (lowercase
with `_` in place of spaces):

> Filenames should use `_` for spaces and should be lowercase.

```
blog/posts/community_news/welcome.md
blog/posts/tutorials/how_to_write_blog_posts.md
```

For assets specific to the blog section:

> Note the lack of `posts`.

```
assets/blog/images/tutorials/image.png
```

### Assets Like Images Need to Be Placed Under the `overrides` Path

Due to the rest of the site using multiple languages (i18n), assets are kept in the overrides 
directory to reduce duplication of files after the build. The overrides directory is placed on top 
of the built directory so all relative paths are the same as if the files were in the `docs` 
directory. Use a couple of `../` to get to the root of the built site and access the asset:

![](../../../assets/images/gmc_logo.png){: .gmc-default-img style="width: 2rem" }

```
../../../assets/images/gmc_logo.png
```

So in the example before:

```
../../../assets/blog/images/tutorials/image.png
```

## Optional Opinionated Recommendations

### Keep Keys and Values in the Front-Matter in Alphabetical Order

This will make it easier to spot mistakes.

### Maintain a Strict Line Width Limit

It will make it easier to read and spot mistakes in Markdown. `mkdocs-material` uses an 80-character
limit, which is a bit narrow. Currently, the CSS settings for the width of the content are roughly 
~140 characters, which is a bit wide. This Markdown file uses a 100-character limit. Keep things 
reasonable and use the same width throughout the file, and do not break lines prematurely.

### Use Alternative Link Definitions

To avoid issues with long lines, define links before the next heading using this syntax: 
`[text]: url`. Then you can organically use the `[text]` in your paragraph, and it will be converted 
to a URL, or use `[text][defined url]` to wrap the `text` using a defined URL.

### Avoid Name Conflicts

If a name conflict occurs, don't resort to adding a lazy `-2` at the end. Instead, ensure your name 
is distinct for better searchability. For example, instead of `result.png`, use a more specific name
like `blender_modifier_result.png` or the slug of the blog post you're writing.

### Add a H2 Comments Heading at the Bottom

This will add a TOC element for users to easily skip the post and read the comments. The RSS plugin 
also expects this heading to exist.

## Comments

Let us know what you think about these guidelines!