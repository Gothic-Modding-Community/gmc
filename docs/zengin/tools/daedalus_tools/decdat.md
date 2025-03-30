# DecDat

DecDat[^1] is a daedalus scripts decompiler originally created by [Gottfried](https://forum.worldofplayers.de/forum/members/28709-Gottfried). Its goal is to replace Gothic Sourcer's decompiler, which wouldn't been able to decompile scripts with [Ikarus](../../scripts/extenders/ikarus/index.md) and [LeGo](../../scripts/extenders/lego/index.md). However, that doesn't mean that DecDat is able to produce data that can be compiled again. This tool should be used mainly for research and educational purposes. Source code is available [here](https://github.com/auronen/DecDat/).

## Installation

The tool is written in Java, allowing it to be executed seamlessly on both Windows and Linux operating systems. To utilize the tool, ensure that Java is installed on your system. We recommend using the Java version available [here](https://adoptium.net/temurin/releases/). Once you have your Java installed, download the latest tool version from GitHub [releases page](https://github.com/auronen/DecDat/releases/), and run the `DecDat.jar` file.

## Usage
After opening a DecDat you will see a following window.

![DecDat window](../../../assets/images/decdat_window.png)

To import a `.DAT` file click at `File -> Open DAT...` select the file encoding, the file itself and optionally `OU.BIN` file if you want to parse dialogues.

And that's it, now you have a `.DAT` file loaded into app, and you can export the code or search for a specific part.

![DecDat with loaded .DAT](../../../assets/images/decdat_loaded.png)

[^1]: The original DecDat release post can be found [here](https://forum.worldofplayers.de/forum/threads/1151032-Tool-DecDat).