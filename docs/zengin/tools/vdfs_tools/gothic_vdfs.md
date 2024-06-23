# GothicVDFS
Gothic VDFS is the most popular VDFS tool. It was created by NicoDE and allows viewing, extracting and building `.vdf` and `.mod` archives.

## Download

You can download the tool from NicoDE's website - [direct link](http://www.bendlins.de/nico/gothic2/GothicVDFS.zip).

## Working areas
GothicVDFS has two working areas one for viewing volumes and one for building volumes.

### Viewer
This is a blank VDFS viewer:

![Viewer](../../../assets/images/vdfs_viewer1.png)

There are two paths to choose at the top:

- Filename - Path of the currently opened `.vdf` or `.mod` archive
- Root Path - Path to the place where the files will be extracted

When you specify the `Filename` the VDFS will load the volume and display some information.
![Viewer](../../../assets/images/vdfs_viewer2.png)

**Comment** is an information about loaded volume left by the author and **Timestamp** is a date and time set by the author. Usually the date coincides with the actual date of the volume's build, but it cannot be taken for granted as it can be easily changed.

At the bottom there are three different options for extracting files from archive:

1. Extract Volume - extract the whole volume to the Root Path
2. Extract Directory - extract only selected folder
3. Extract Selected - extract currently selected files

In addition, you can choose if files should keep their stucture after extraction or get extracted directly to the Root Path.

### Builder

!!! Info
    TODO