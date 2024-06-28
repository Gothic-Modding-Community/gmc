# zSplitDialogs

Union plugin created by [Top Layer](https://worldofplayers.ru/members/107921/), which gives possibility to extract dialogues from compiled scripts. That could be useful for creating dubbing, especially if you want to know which dialogues are voiced and which are not. 

[:octicons-download-16: Download](https://drive.google.com/file/d/1v3t0_Oyynf8LPyYa46G4cu5NSDLX5Ds1/view)

[:fontawesome-brands-github: Source code](https://github.com/UnresolvedExternal/Plugins_2021/tree/main/src/zSplitDialogs)

## Usage

1. Install Union 1.0l+ ([zParserExtender](../../../scripts/extenders/zparserextender/index.md) is needed - it is inside Union since 1.0l version)
2. Make sure zParserExtender is enabled in `SystemPack.ini`
```ini
[CORE]
ParserExtenderAlwaysOn = true
```
3. Put `zSplitDialogs.vdf` into `Data\` directory
2. Start game

After this steps `.txt` file with dialogues will be created in `Dialogs\` directory.

??? example "Example of a plugin output"
    ![Output](../../../assets/images/zsplitdialogs.png)


## Configuration
At first run, in `gothic.ini` will be created following section:

```ini
[ZSPLITDIALOGS]
UnvoicedOnly=0
```

You can change value to `1` to receive only unvoiced subtitles.
