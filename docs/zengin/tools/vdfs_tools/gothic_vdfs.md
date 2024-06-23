# GothicVDFS
Gothic VDFS is the most popular VDFS tool. It was created by NicoDE and allows viewing, extracting and building `.vdf` and `.mod` archives.

## Download

You can download the tool from NicoDE's website - [direct link](http://www.bendlins.de/nico/gothic2/GothicVDFS.zip).

## Working areas
GothicVDFS has two working areas one for viewing volumes and one for building volumes.

### Viewer
This is a blank VDFS viewer:

![Viewer](https://user-images.githubusercontent.com/30365395/176541176-7e081646-4e8a-4053-8a8f-d98d86ca07e1.png){ style="width:500px;"} 

There are two paths to choose at the top:

- Filename - Path of the currently opened `.vdf` or `.mod` archive
- Root Path - Path to the place where the files will be extracted

When you specify the `Filename` the VDFS will load the volume and display some information.

![Viewer](../../../assets/images/vdfs_viewer2.png){ style="width:500px;"} 

**Comment** is an information about loaded volume left by the author and **Timestamp** is a date and time set by the author. Usually the date coincides with the actual date of the volume's build, but it cannot be taken for granted as it can be easily changed.

At the bottom there are three different options for extracting files from archive:

1. Extract Volume - extract the whole volume to the Root Path
2. Extract Directory - extract only selected folder
3. Extract Selected - extract currently selected files

In addition, you can choose if files should keep their stucture after extraction or get extracted directly to the Root Path.

### Builder
The second working area is the Builder. It allows you to create new VDF archives.

Thats how initial builder looks like:

![Builder](../../../assets/images/vdfs_builder1.png){ style="width:500px;"} 

There are two paths to choose at the top:

- Filename - Path of the new `.vdf` or `.mod` archive
- Root Path - Path to the Gothic directory

In the middle there are three areas in which you can specify archive files.

-  File(mask)(s) to search for - list of file masks to load in VDF archive e.g. `_WORK/Data/Anims/_compiled/*`
-  File(mask)(s) to exclude - list of file masks to exclude
-  File(mask)(s) to include - list of file masks to include

At the bottom there are three buttons:

- Open Script - open a `.vm` script file with VDF configuration
- Save Script - save current VDF configuration to a `.vm` script file
- Build Volume - build the VDF archive with current configuration

Example build configuration could look like this:

![Builder](../../../assets/images/vdfs_builder2.png){ style="width:500px;"}

## CLI Interface
CLI interface is very simple and allows to build and extract VDF archives without GUI. Thats good for automation and scripting.

### Build VDF from script 
```shell
GothicVDFS.exe /B script.vm
```

### Extract VDF to directory
```shell
GothicVDFS.exe /X MySuperMod.mod ./extract_here
```

## Script Reference
GothicVDFS uses simple script language to define VDF archives. The script is a simple text file with `.vm` extension. The script is divided into sections, each section is marked by a header in square brackets. The script must contain at least `[BEGINVDF]` and `[ENDVDF]` sections.

### `[BEGINVDF]`

Marks the start of script and contains VDF properties.

#### `Comment=`

Comment of VDF achive. Equivalent of "Comment" from GUI.

#### `BaseDir=`

Root path of local files (relative to working directory). Equivalent of "Root Path" from GUI.

#### `VDFName=`

Name of final VDF file (relative to working directory). Equivalent of "Filename" from GUI.

### `[FILES]`

List of file masks to load in VDF archive (relative to BaseDir). Equivalent of "File(mask)(s) to search for" from GUI.

### `[EXCLUDE]`

List of file masks to exclude. Equivalent of "File(mask)(s) to exclude" from GUI.

### `[INCLUDE]`

List of file masks to include. Equivalent of "File(mask)(s) to include" from GUI.

### `[ENDVDF]`

Marks end of file.

## Example script

```ini title="example.vm"
[BEGINVDF]
Comment=Some VDFS archive
BaseDir=.
VDFName=SuperMod.mod
[FILES]
_work/Data/Anims/_compiled/*
_work/Data/Meshes/_compiled/*
_work/Data/Scripts/_compiled/*
[EXCLUDE]
*.wav
[INCLUDE]
this_is_fine.wav
[ENDVDF]
```