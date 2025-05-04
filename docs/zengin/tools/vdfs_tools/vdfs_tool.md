# VDFS Tool

VDFS Tool[^1] is a new program that supports new features introduced to VDFS by the Union team. Like ZIP compression or drag and drop support.

## Download

You can download the tool using the [Resource Manager](https://worldofplayers.ru/threads/41415/) or directly from the post on [WoP.ru - VDFS Tool](https://worldofplayers.ru/threads/42314/).

## Features

### Volume compression
Volumes are compressed using the classic zip algorithm. The zlib library for buffer compression and decompression was taken as a basis. In order for the game to decompress the volume in real time without loss of performance, a special interface [Gratt-5r2/ZippedStream](https://github.com/Gratt-5r2/ZippedStream) was implemented and built into `vdfs32g`. The essence of the interface is that it allows you to pack and read files in blocks of a given size and keep unpacked data in memory in a specific range.

!!! Warning
    Compresed `.mod` and `.vdf` archives works only with [Union](../../union/index.md) installed.

### Volume optimization
Optimization refers to the procedure of identifying files with the same content and combining them under a common data source.

### File Explorer Interface
The program interface has a set of standard file explorer operations - copying, pasting, renaming, searching, etc.

### Drag&Drop
The function allows you to drag files into the program, as well as pull them out of it. For this function to work correctly, user (administrator) rights must match for the program and Explorer.

### Updating a volume in 1 click
The program analyzes shared files in the volume and in the game directories (Ctrl + U). If there are physical copies, when you save the volume, updated files will be written to it.

### Opening files directly from a volume
To avoid wasting time unpacking the volume, double-click on the file of interest, after which it will be opened.

[^1]: This is mostly a translation of the orginal [release post](https://worldofplayers.ru/threads/42314/).