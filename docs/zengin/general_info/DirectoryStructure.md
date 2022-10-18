# ZenGin directory structure

Modding is all about changing the game files. To achieve that, we have to know the directory (folder) structure of a Gothic game.

```
├── Data
│   ├── $Templates$
│   ├── modvdf
│   └── plugins
├── Miles
├── Saves
├── System
│   └── Autorun
└── _work
    └── DATA
        ├── Anims
        │   └── _Compiled
        ├── Meshes
        │   └── _Compiled
        ├── Music
        ├── PRESETS
        ├── Scripts
        │   ├── _compiled
        │   └── content
        │       └── CUTSCENE
        ├── Sound
        ├── Textures
        ├── Video
        └── Worlds
```

## `Data`

Data directory contains [`.vdf` volumes](vdfs/index.md) of the game. These contain `anims.vdf` - animations, `speech.vdf` - dubbing, `worlds.vdf` - world ZEN files.

## `Saves`

Contains saved games.

## `System`

The system directory contains the game executable, `GothicStarter.exe`, `GothicStarter_mod.exe`, configuration `.ini` files, mod `.ini` files and mod icons and description `.rtf` files.

**`system/Autorun`** is a Union specific directory, it serves as a default search directory for Daedalus injection scripts with zParserExtender and Union plugins.

## `_work/DATA`

This is where the magic happens:

- `Anims` - contains animations and animated models.
	- `_compiled` - contains compiled animations.
- `Meshes` - contains meshes source and compiled files.
	- `_compiled` - contains compiled meshes.
- `Music` - contains music files.
- `Presets` - contains basic presets.
- `Scripts`
	- `_compiled` - contains compiled scripts - `.dat` files.
  	- `Content` - contains scripts that make up the content of the game.
  	- `System` - contains scripts that make up the menu.
- `Sound` - contains sound effects `.wav` or `.ogg` format (Union only).
- `Video` - contains videos in `.bik` format.

