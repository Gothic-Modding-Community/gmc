# Sound
ZenGin uses `.wav` files for playing Sound Effects and Dubbing.

!!! Info
    In-game soundtrack isn't saved in `.wav` sound files. See [Music](../music.md).

## Properties
Original gothic sound files has following properties:

- One channel (Mono)
- [44100 Hz](https://en.wikipedia.org/wiki/44,100_Hz) frequency
- 32-bit [depth](https://en.wikipedia.org/wiki/Audio_bit_depth)

## SFX
Sound effects (SFX) are sounds made by monsters, spells, weapons etc. Sound effects are defined in multiple places, in `.mds` files as part of the animation [EventBlocks](../anims/events.md), or in the SFX Daeduls scripts. Sounds are located in the `_work/Data/Sound/SFX` directory. 

## Speech
Dubbing for dialogues is located into `_work/Data/Sound/Speech` folder. Every single `AI_Output` has its own sound file with name defined in the function itself.

For this dialogue line
```dae
AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //I'm Diego.
```
the engine will play `Info_Diego_Gamestart_11_00.wav` sound file (if it exists).
