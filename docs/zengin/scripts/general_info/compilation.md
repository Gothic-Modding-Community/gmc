---
title: Compilation
---
# Daedalus Compilation
Before loading the data by game the Daedalus scripts have to be parsed and compiled into a `.dat` file. This is done by the engine itself, but the `.d` files have to be listed in `.src` files first.

## Parsers
The engine itself has multiple parser instances used for parsing different `.src` files.

- Game Parser - parses `Scripts\Content\Gothic.src` and creates `Gothic.dat`
- SFX Parser - parses `Scripts\System\SFX.src` and creates `SFX.dat`
- PFX Parser - parses `Scripts\System\ParticleFX.src` and creates `ParticleFX.dat`
- VFX Parser - parses `Scripts\System\VisualFX.src` and creates `VisualFX.dat`
- Camera Parser - parses `Scripts\System\Camera.src` and creates `Camera.dat`
- Menu Parser - parses `Scripts\System\Menu.src` and creates `Menu.dat`
- Music Parser - parses `Scripts\System\Music.src` and creates `Music.dat`

## SRC syntax
The `.src` files are simple text files that contain the paths to the `.d` files that have to be parsed. The paths are relative to the folder where the `.src` file is located.

!!! Warning
    Booth `\` and `/` can be used as path separators, but in the wildcards only `\` is supported.


**Example file structure:**

``` title="&lt;gothic-root&gt;/_work/Data/"
└── Scripts
    ├── _compiled
    └── content
        ├── Story
        │   ├── SubStory
        │   │   ├── SubSrc.src
        │   │   ├── SubFile1.d
        │   │   ├── SubFile2.d
        │   │   └── SubFile3.d
        │   ├── Classes.d
        │   ├── Constants.d
        │   └── Main.d
        └── Gothic.src
```

That is how the `Gothic.src` file can look like:

``` title="Gothic.src"
Story\Constants.d
Story\Classes.d
Story\Main.d
Story\SubStory\SubFile1.d
Story\SubStory\SubFile2.d
Story\SubStory\SubFile3.d
```

Multiple `.d` in one folder can be parsed by using wildcards.

``` title="Gothic.src" hl_lines="4"
Story\Classes.d
Story\Constants.d
Story\Main.d
Story\SubStory\*.d
```

In addition, `.src` file can contain paths to other src files.

``` title="Gothic.src" hl_lines="4"
Story\Classes.d
Story\Constants.d
Story\Main.d
story\SubStory\SubSrc.src
```

``` title="SubSrc.src"
SubFile1.d
SubFile2.d
SubFile3.d
```

## Code order
The order of the code and therefore files in `.src` is crucial, as Daedalus parser is lineal. If you refer to the symbol that wasn't parsed it would throw an error. 

Something like this wouldn't work as the `bar()` doesn't exist at the moment of parsing `foo()`
```dae
func void foo()
{
	bar(); // would throw an error
};

func void bar()
{
};
```
The same applies to files order in `.src` if in one file refers to the symbol form other it has to be listed later.

``` title="Gothic.src" hl_lines="1 3"
Story\Classes.d
Story\Constants.d
Story\Main.d
```

```dae title="Classes.d"
func void bar()
{
};
```

```dae title="Main.d"
func void foo()
{
	bar(); // correct order
};
```
