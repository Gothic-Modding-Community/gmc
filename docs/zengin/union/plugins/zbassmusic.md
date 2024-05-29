# zBassMusic

zBassMusic is a modern music system for Gothic games based on ZenGin.
It replaces the original DirectMusic system with a custom engine built on top
of [BASS Library](https://www.un4seen.com/)
to provide easier workflow for composers and additional functions for the perfect soundtrack design.
The most important features include:

!!! Info
    The plugin has its very own [docuentation site](https://silver-ore-team.github.io/zBassMusic/), if you are interested in including zBassMusic into your project see the detailed [User Guide](https://silver-ore-team.github.io/zBassMusic/user-guide/).

| Contacts ||
|:---------| :--- |
| Authors  | [:material-badge-account-horizontal: Silver Ore Team](https://github.com/Silver-Ore-Team) - [tehe](https://github.com/piotrmacha) |
| GitHub   | [:material-github: zBassMusic](https://github.com/Silver-Ore-Team/zBassMusic)|
| Discord  | [:simple-discord: Gothic Modding Community server](https://discord.gg/mCpS5b5SUY) |

## Features

* Direct playback of common audio formats (WAV, OGG, MP3) instead of DirectMusic proprietary formats
* Out-of-the-box support for existing music theme definitions (just change the audio file)
* Alternative scheduling & transition systems to support smooth cross-fades between themes
* Loading of music files from VDF volumes (DirectMusic required physical files)
* Scriptable interface for controlling the system from Deadalus scripts
* Backward compatibility with original `.sgt` music (it's redirected to the DirectMusic system)
