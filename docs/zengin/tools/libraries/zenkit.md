# ZenKit

![ZenKit Logo](https://zk.gothickit.dev/assets/logo.png)

[ZenKit](https://github.com/GothicKit/ZenKit) is a C++-library for loading and saving proprietary *ZenGin* files and
is intended to be a successor to [Andre Taulien](https://github.com/ataulien/)'s
[ZenLib](https://github.com/ataulien/ZenLib). ZenKit wrappers for *Java* and *C#* are also available in the form of
[ZenKitCS](https://github.com/GothicKit/ZenKitCS) and [ZenKit4J](https://github.com/GothicKit/ZenKit4J) which are also
published to [NuGet](https://www.nuget.org/packages/ZenKit) and
[Maven Central](https://mvnrepository.com/artifact/dev.gothickit/zenkit) respectively.

ZenKit is used as the file loading and scripting backend for [OpenGothic](https://github.com/Try/OpenGothic) and has
recently found adoption in [GothicVR](https://github.com/GothicVRProject/GothicVR).

## File Support

The following file types and operations are supported by ZenKit. Requests to support additional file types are welcome
and can be submitted to [the GitHub repository](https://github.com/GothicKit/ZenKit).

| File Type             | Extension                      | Load[^1] | Save[^2] | Comment                                                            |
|-----------------------|--------------------------------|----------|----------|--------------------------------------------------------------------|
| Model Animation       | `.MAN`                         | ✓ Yes    | ✘ No     | —                                                                  |
| Model Hierarchy       | `.MDH`                         | ✓ Yes    | ✓ Yes    | —                                                                  |
| Model Mesh            | `.MDM`                         | ✓ Yes    | ✓ Yes    | Saving is only partially supported                                 |
| Model                 | `.MDL`                         | ✓ Yes    | ✓ Yes    | Saving is only partially supported                                 |
| Morph Mesh            | `.MMB`                         | ✓ Yes    | ✘ No     | —                                                                  |
| Multi Resolution Mesh | `.MRM`                         | ✓ Yes    | ✓ Yes    | —                                                                  |
| Mesh                  | `.MSH`                         | ✓ Yes    | ✓ Yes    | Saving is only partially supported                                 |
| Daedalus Script       | `.DAT`                         | ✓ Yes    | ✘ No     | A VM implementation is available (see [Daedalus VM](#daedalus-vm)) |
| Texture               | `.TEX`                         | ✓ Yes    | ~ Yes    | There is currently no API to alter image data                      |
| Font                  | `.FNT`                         | ✓ Yes    | ✓ Yes    | —                                                                  |
| ZenGin Archive        | `.ZEN`                         | ✓ Yes    | ✓ Yes    | —                                                                  |
| Text/Cutscenes        | `.BIN`, `.CSL`, `.DAT`, `.LSC` | ✓ Yes    | ✓ Yes    | —                                                                  |
| Model Script          | `.MDS`, `.MSB`                 | ✓ Yes    | ✘ No     | —                                                                  |
| Virtual File System   | `.VDF`                         | ✓ Yes    | ✓ Yes    | Allows full integration with the host file system                  |

## Daedalus VM

Along facilities to read and write most resource files you might find in a typical Gothic installation, ZenKit also
includes a virtual machine which can execute Daedalus scripts. An extensive API is available to inspect the files,
add external handlers and bind Daedalus classes into C++-structs. Bindings for the original classes are available
as an extension to ZenKit and available to the *C#* and *Java* wrappers natively.

## Documentation

Additional documentation for ZenKit can be found at [zk.gothickit.dev](https://zk.gothickit.dev/library/overview/).

[^1]: ZenKit is able to fully load these files
[^2]: ZenKit is able to save these files at least partially 