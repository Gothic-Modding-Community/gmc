---
title: Plugins
---
# Union Plugins
Plugins are libraries dynamically loaded via Union. They can be used to modify the behavior of the game, add new features, and fix bugs. Plugins are written in C++ and compiled into DLL files. The [Union SDK](../sdk/index.md) and Gothic API provide a set of functions and classes that can be used to create plugins.

!!! Warning
     The plugin system is also a potential source of errors. If the plugin is written incorrectly, it can cause the game to crash or behave incorrectly. Therefore, when using plugins, you should be careful and follow the instructions of the plugin authors.

## Loading
Loading can be done both Physically and from VDF or MOD volumes. There are three options for loading libraries:

### Systempack.ini
The classic way is to specify the list of library names in SystemPack.ini -> PluginList separated by commas. Also through this parameter you can control the priority of launching plugins:

1. If you specify two asterisks (plugin.dll**) at the end of the library name, then it will be loaded earlier than the Virtual file system. But in this case it cannot be loaded from VDF or MOD volume.

2. If you specify one asterisk (plugin.dll*) at the end of the library name, then it will be launched immediately after the Virtual file system. At this stage the library can be loaded from VDF or MOD volume.

3. If the name of the library is specified without changes (plugin.dll), then it will be loaded simultaneously with the game. At this stage libraries have the ability to use global instances of Gothic classes.

### Autorun
If the library is located in the Physical Directory `System/Autorun` or in the Virtual Directory `*/Autorun`, then the library will be loaded along with the engine, as in step 1.III. In current versions of Union, the order of loading plugins from this folder is determined by the dependencies of the libraries on each other. This means that if one plugin imports symbols from another, then the Exporting will be loaded first, and then the Importing.

### Patch File
The patch files start automatically. This means that plugins can also run patches along with them. There are two script functions: `LoadLibrary("plugin.dll")` and `LoadPlugins("plugin1.dll", ..., "pluginN.dll")`.