# zSplitDialogs

The plugin for a dubbing creators. And not only.

Union plugin by [Top Layer](worldofplayers.ru/members/107921/), which gives possibility to extract dialogues from compiled scripts simply by putting `zSplitDialogs.vdf` file into `Data\` directory and run the game. You can configure, that already dubbed subtitles will be outputed.

The output is the `Dialogs\` directory with `.txt` files with a structure as follow:

??? example "Example of a plugin output"
    ![zSpy](../../assets/images/zSplitDialogs.png)


## [Download](https://drive.google.com/file/d/1v3t0_Oyynf8LPyYa46G4cu5NSDLX5Ds1/view)


## [Source code](https://github.com/UnresolvedExternal/Plugins_2021/tree/main/src/zSplitDialogs)

   
## The usage

- Install Union 1.0l+ (zParserExtender is needed - it is inside Union since 1.0l version)
- Put `zSplitDialogs.vdf` into `Data\` directory
- Start game
- Dialogues will be created in `Dialogs\` directory


At first run, in `gothic.ini` will be created following section:

```
[ZSPLITDIALOGS]
UnvoicedOnly=0
```

You can change value to `1` to receive only unvoiced subtitles.
