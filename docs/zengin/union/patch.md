# Patch files
`.patch` files are scripts that are used to change memory values or committing some actions when starting the engine. Files patches are launched from any directories monitored by the file system (System, Saves, _Work and any others at the request of the engine). The launch is performed both from physical directories and from VDF & MOD. If physical and virtual directories contain identical patches with identical paths, physical copies will have read priority.

!!! Info
    An additional [patch name] .MAP file can be created. This happens when the patch file has at least one patch marked 'static' (see the description of the patch format for more details). This file allows you to immediately download all previously made changes to process memory, skipping re-parsing of static blocks. By default, the file cannot be seen through standard files explorer. To make the file hidden, but visible, set the value SystemPack.ini -> ShowHiddenFiles = true.
  
[Description of the patch format](https://worldofplayers.ru/threads/42178/)