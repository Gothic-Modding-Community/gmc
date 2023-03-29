# Sound
Zengin use `.wav` files for playing Sound Effects and Dubbing.

!!! Info
    Ingame soundtrack isn't saved in a `.wav` sound files. See article about [Music](../music.md).

## Poperties
Original gothic sound files has following properties:

- One channel (Mono)
- [44100 Hz](https://en.wikipedia.org/wiki/44,100_Hz) frequency
- 32-bit [depth](https://en.wikipedia.org/wiki/Audio_bit_depth)

## SFX
Sound effects (SFX) are sounds made by monsters, spels, weapons etc. Playing of most of them are defined in `.mds` files and conected with proper animations. After unpacking these files are located in the `/Sound/SFX` folder. 

## Speech
Dubbing for dialogues is located into `/Sound/Speech` folder. Every single `AI_Output` has its own sound file with name defined in the function itself.

For this dialogue line:
```dae
AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //I'm Diego.
```
File should have following name: `Info_Diego_Gamestart_11_00.wav`