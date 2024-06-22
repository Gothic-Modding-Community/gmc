# Textures

Textures are pictures that get projected onto 3D models and on a 2D user interface in the game. ZenGin uses its own texture format `.TEX`, that in fact is a container for the texture in one of available formats. This section will discuss how to work with textures in ZenGin.

!!! Note
    Technical documentaion of the `.TEX` texture format can be found in the [ZenKit documentaion](https://zk.gothickit.dev/engine/formats/texture/).


Here are some tips for working with Gothic textures:

- Textures must have dimensions that are multiples of 4.
- Square textures (with some exceptions, like faces or some interface elements) are preferred for easier mipmap generation.
- The maximum resolution for textures is 4096x4096.

## Formats

When working with textures in ZenGin, it is recommended to use the default texture format if you are unsure about other options. Many of the other formats are either unsupported or buggy in gothic. For transparency, `DXT3` format should be used. For pure RGB colors, `DXT1` format is recommended.

!!! Tip
    Formats like `rgba8888`, `bgra8888`, `argb8888` and `abgr8888` are properly supported with the zSurface32 patch. It is advised to use `bgra8888` due to performance reasons, as other colorspaces require additional conversion at runtime. 

By default, `.tga` files with a proper resolution are converted to `.TEX` files by the engine, when they appear in the game or a game is started with `-convertall` parameter. Also, you can convert textures to `.TEX` manually using one of the [available tools](#tools).

## Mipmaps

[Mipmaps](https://en.wikipedia.org/wiki/Mipmap) are pre-generated versions of textures at different levels of detail. They are used to improve rendering performance and reduce aliasing artifacts. When engine converts the texture it automatically generates mipmaps. Other tools may handle it differently, so it's better to check it before conversion.


## Tools
There are some tools created by the Gothic community, that simplify working with ZenGin textures.

### GoMan
Oldest texture tool, created by PyroX. Has a good viewer, but there are already better alternatives.

[Download](https://www.worldofgothic.de/dl/download_97.htm)

### GoTex
Simple converter, written by [ThielHater](https://forum.worldofplayers.de/forum/members/52111-ThielHater?). Implements features like custom mipmaps and popular image formats support.

[Thread on WoG](https://forum.worldofplayers.de/forum/threads/1601349-Tool-GoTex)

[:fontawesome-brands-github: GitHub](https://github.com/ThielHater/GoTex)

### zTEXiPy
Latest tool, developed by [Shoun](https://gitlab.com/Shoun2137). Offers batch conversion, an intuitive viewer, and Windows context menu shortcuts.

[:fontawesome-brands-gitlab: GitLab](https://gitlab.com/Shoun2137/ztexipy)

