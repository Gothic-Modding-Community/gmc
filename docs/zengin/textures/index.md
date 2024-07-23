# Textures

Textures are pictures that get projected onto 3D models and on a 2D user interface in the game. ZenGin uses its own texture format `.TEX`, that in fact is a container for the texture in one of available formats. This section will discuss how to work with textures in ZenGin.

!!! Note
    Technical documentaion of the `.TEX` texture format can be found in the [ZenKit documentaion](https://zk.gothickit.dev/engine/formats/texture/).

## Basics

All created textures have to be located in the `_WORK\DATA\TEXTURES\` directory. The compiled `.TEX` files are saved in the `_COMPILED\` subdirectory.

Here are some tips for working with Gothic textures:

- Textures must have dimensions that are multiples of 4.
- Square textures (with some exceptions, like faces or some interface elements) are preferred for easier mipmap generation.
- It is recommended not to use textures bigger than 4096x4096.
- Avoid things like `_V0`, `_A1` etc. in the texture name endings, as suffixes like this are used for [multitextures](multitextures.md).

## Formats

When working with textures in ZenGin, it is recommended to use the default texture format if you are unsure about other options. Many of the other formats are either unsupported or buggy in gothic. For transparency, `DXT3` format should be used. For pure RGB colors, `DXT1` format is recommended.

!!! Tip
    Formats like `RGBA8888`, `BGRA8888`, `ARGB8888` and `ABGR8888` are properly supported with the zSurface32 patch. Learn more about it in the [32 Bit texture support](./32bit_texture.md) article.

## Mipmaps

[Mipmaps](https://en.wikipedia.org/wiki/Mipmap) are pre-generated versions of textures at different levels of detail. They are used, to improve rendering performance and reduce aliasing artifacts. When engine converts the texture it automatically generates mipmaps. Other tools may handle it differently, so it's better to check it before conversion.

!!! Example "How it works?"
    If you want to learn more about mipmaps in ZenGin there is a [great article](https://www.gothic-reloaded-mod.org/en/blog/more-than-a-texture-patch-2) by Gothic Reloaded Mod Team.

## Engine compilation

By default, `.tga` files with a proper resolution are converted to `.TEX` files by the engine, when they appear in the game or a game is started with `-convertall` parameter. Also, you can convert textures to `.TEX` manually using one of the [available tools](#tools).

The engine compilation may be affected by keywords in the texture name or directory.

**Color depth**

Textures are compiled by default with a color depth of 16 bits per pixel and needs 4 bits of memory per pixel. To force the engine to convert textures with a different color depth, you need to add an ending to the name of the texture or directory `_16BIT` or `_32BIT`. Using 16/32 bit images makes sense when there are visual problems or noise after compression, but they take up more memory. 

Example: `_WORK\DATA\TEXTURES\SKY\NOMIP_16BIT\CLOUDS.TGA`.

**nomip**

By default, [Mipmaps](#mipmaps) are generated for all textures. However, if the texture path contains the directory `nomip`, then a Mipmap will not be created for such a texture. It makes sense to use if you experience visual problems or interference associated with the use of Mipmaps, and also to save memory if the texture is rarely used in the game, or the texture is too small. 

Example: `_WORK\DATA\TEXTURES\EFFECTS\NOMIP\LIGHTNING.TGA`

## Tools
There are some tools created by the Gothic community, that simplify working with ZenGin textures.

### GoMan
Oldest texture tool, created by PyroX. Has a good viewer, but there are already better alternatives.

[:octicons-download-16: Download](https://www.worldofgothic.de/dl/download_97.htm)

### GoTex
Simple converter, written by [ThielHater](https://forum.worldofplayers.de/forum/members/52111-ThielHater?). Implements features like custom mipmaps and popular image formats support.

[:material-forum: Thread on WoG](https://forum.worldofplayers.de/forum/threads/1601349-Tool-GoTex)

[:fontawesome-brands-github: GitHub](https://github.com/ThielHater/GoTex)

### zTEXiPy
Latest tool, developed by [Shoun](https://gitlab.com/Shoun2137). Offers batch conversion, an intuitive viewer, and Windows context menu shortcuts.

[:fontawesome-brands-gitlab: GitLab](https://gitlab.com/Shoun2137/ztexipy)

