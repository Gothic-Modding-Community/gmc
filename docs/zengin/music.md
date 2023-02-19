# Music

Zengin uses implementation of [DirectMusic](https://en.m.wikipedia.org/wiki/DirectMusic) for playing ingame soundtrack. To edit gothic music files you need Direct Music Producer, a program released by Microsoft and provided with older DirectX SDKs'. 

!!! Warning
    Music files can't be converted to the `.vdf` or `.mod` volume, all files must be located in `/_work/Data/Music` folder.

## File formats

If you open a folder with music you will see a files in various formats, lets introduce them:

- `.dls` - [Downloadable Sound](https://en.wikipedia.org/wiki/DLS_format) format file. This is a base for all other files. Contains:   
    - Collections of virtual musical instruments.
    - Wave files instruments uses.

- `.sty` - Style file. Contains:
    - Bands - settings for virtual instruments from `.dls`.
    - Patterns - fragments of tracks, that can be later merged, looped and superimposed on each other

- `.sgt` - File whit properly conected bands - final track
