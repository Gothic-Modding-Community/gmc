---
title: VDFS virtual file system
---
# VDFS virtual file system

VDFS is the virtual file system used by ZenGin to distribute and store many, but not all, game assets.

!!! Example "Learn more"
    If you want a more technical documentation of the VDFS format, you can find it on [ZenKit site](https://zk.gothickit.dev/engine/formats/vdf/).

## Loading

### VDF
`.vdf` files can usually be found in the `Data/` directory of Gothic installations and the game loads them automatically.

Volumes are loaded based on the [timestamp](../tools/vdfs_tools/gothic_vdfs.md#viewer) specified inside the `.vdf` file. The volumes with the latest timestamp are loaded first.


### MOD
`.mod` files are stored in the `Data/ModVDF/` directory and loaded when they are specified in the current game `.ini`.
```ini title="MyMod.ini"
// [...]
[FILES]
VDF=MyMod.mod  MyMod_Textures.mod
// [...]
```
!!! Warning
    Notice that two spaces are used as a separator between the `.mod` files.

## Tools

The community created variety of different modding tools for work with VDFS volumes over the times, such as:

### [GothicVDFS](../tools/vdfs_tools/gothic_vdfs.md)
Most popular tool for working with VDFS volumes. Allows viewing, extracting and building `.vdf` and `.mod` archives, and has CLI interface.

### [VDFS Tool](../tools/vdfs_tools/vdfs_tool.md)
New tool for working with VDFS volumes, created to support features introduced by [Union](../union/index.md). Apart from viewing, extracting and building `.vdf` and `.mod` archives, it also supports optimizing and compressing them.


### Comparison

| Features | GothicVDFS | VDFS Tool |
|----------|------------|-----------|
| Viewing | ✔️ | ✔️ |
| Extracting | ✔️ | ✔️ |
| Building | ✔️ | ✔️ |
| Compression | ❌ | ✔️ |
| CLI | ✔️ | ❌ |