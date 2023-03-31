# Music

Zengin uses [DirectMusic](https://en.m.wikipedia.org/wiki/DirectMusic) for playing in-game soundtrack. To edit Gothic music files you need the [Direct Music Producer](https://en.m.wikipedia.org/wiki/DirectMusic), a program released by Microsoft and provided with older DirectX SDK.  

!!! Warning
    Music files can't be packed in the `.vdf` or `.mod` archives, all music files must be located in `/_work/Data/Music` directory.

## File formats

The music directory contains these file types:

- `.dls` - [Downloadable Sound](https://en.wikipedia.org/wiki/DLS_format) format file. This is the base for all other files. Contains:   
    - Collections of virtual musical instruments.
    - Wave files instruments use.

- `.sty` - Style file. Contains:
    - Bands - settings for virtual instruments from `.dls`.
    - Patterns - fragments of tracks, that can be later merged, looped and superimposed on each other

- `.sgt` - File with properly connected patterns - the final track
