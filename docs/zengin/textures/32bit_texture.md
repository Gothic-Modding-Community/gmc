# 32 Bit texture support

By default, ZenGin supports only compressed `DXT1` and `DXT3` textures. [zSurface32 patch](https://worldofplayers.ru/threads/43009/page-3#post-1180504), created by Gratt improves texture quality by adding proper `RGBA8888`, `BGRA8888`, `ARGB8888` and `ABGR8888` format readout and DirectX 32 Bit surface support in ZenGin[^1].

To use the patch you must have [Union](../union/index.md) installed. Download the `.patch` file [here](https://worldofplayers.ru/attachments/114570/), and put it into `system\` directory.

!!! Warning
    It is advised to use `BGRA8888` due to performance reasons, as other [color spaces](https://en.wikipedia.org/wiki/RGBA_color_model) require additional conversion at runtime.

## Compilation

ZenGin doesn’t natively support the compilation of such textures. This can only be achieved using external programs. The simplest method to create a texture is by utilizing [zTEXiPy](https://gitlab.com/Shoun2137/ztexipy).

1. Open your texture in zTEXiPy[^2]:
![zTEXiPy's splash dialog](../../assets/images/32bit-texture-support/STEP_1.WEBP)
2. Choose `Save TEX as...`
3. In this window:
![zTEXiPy's saving dialog](../../assets/images/32bit-texture-support/STEP_3.WEBP)
    - Uncheck `Generate Mipmaps` if your texture is meant to be used as UI.
    - Set the `Colorspace` to `BGRA8888 (zEnum:3)` or other supported format.
4. Press `Save` and check your texture in-game:
![In-game Example](../../assets/images/32bit-texture-support/EXAMPLE_INGAME.WEBP)

## But why?

This type of texture is compatible with any asset, whether it’s armour or a sword. However, the primary application for such high-quality textures is in user interface elements, which make extensive use of gradients and the alpha channel:

=== "BGRA8888 vs DXT3"

    ![Comparison between BGRA8888 vs DXT3 (Alpha)](../../assets/images/32bit-texture-support/EXAMPLE_1.WEBP){: style='background-color: white;'}

    This example shows comparison between raw BGRA8888 color space and DXT3 (BC2)[^3] compression.
    DXT3 shows noticeable banding throughout entire texture wherever there's alpha channel, while BGRA8888 has smooth gradient transition.

=== "BGRA8888 vs DXT1"

    ![Comparison between BGRA8888 vs DXT1](../../assets/images/32bit-texture-support/EXAMPLE_2.WEBP)

    This example shows comparison between raw BGRA8888 color space and DXT1 (BC1)[^3] compression.
    DXT1 shows lossy quantization artifacts, while BGRA8888 has none.

[Source comparison files are available here.](../../assets/examples/32bit_texture_support.7z)

The drawback of using these textures is their large size, as they contain uncompressed color data. However, this is a small price to pay for the improved quality of the final product.

!!! Note
    This article was originally written by [Shoun](https://gitlab.com/Shoun2137) and published on [G2O Docs](https://gothicmultiplayerteam.gitlab.io/docs/0.3.0/client-manual/32bit-texture-support/).
    

[^1]:
    To learn more about [ZenGin Textures reference click here](https://zk.gothickit.dev/engine/formats/texture/).

[^2]:
    zTEXiPy supports TGA, DDS, PNG and WEBP by default, so make sure it's one of those formats.

[^3]:
    To learn more about [DXTn Algorithm click here](https://www.buckarooshangar.com/flightgear/tut_dds.html).
