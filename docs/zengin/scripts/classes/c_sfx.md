---
title: C_SFX
---

# C_SFX Daedalus class

Class `C_SFX` defines sound effects of the game. 

## Definition

Class definition as it is defined in [`Scripts/System/_intern/SFX.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/SFX.d#L30-L41) script file. 

```dae
class C_Sfx
{
    var string file;			// Sound file in `.wav` format
    var int    pitchOff;		// Pitch offset in semitones
    var int    pitchVar;	    // Semitone variance
    var int    vol;				// Sound volume
    var int    loop;		    // Enable looping
    var int	   loopStartOffset; // Loop start offset
    var int	   loopEndOffset;   // Loop end offset
    var float  reverbLevel;		// Reverb level
    var string pfxName;         // Particle effect name
};
```

## Members

### `string` file {: .typed .string}
This variable holds the name of the sound file in `.wav` format. It is used to specify which sound effect should be played. The file must be located in the `_work/Data/Sound/SFX/` directory, so the game can access it.

### `int` pitchOff {: .typed .int}
The `pitchOff` variable sets the pitch offset in semitones. This allows you to adjust the pitch of the sound effect up or down, providing flexibility in how the sound is perceived in the game.

### `int` pitchVar {: .typed .int}
`pitchVar` defines the semitone variance for the sound effect.

### `int` vol {: .typed .int}
This variable controls the sound volume.

### `int` loop {: .typed .int}
The `loop` variable enables or disables looping of the sound effect. When set to true, the sound will continuously repeat, which is useful for background sounds or ambient effects like fire or wind.

### `int` loopStartOffset {: .typed .int}
`loopStartOffset` specifies the point in the sound file where looping should start. This allows for more precise control over which part of the sound effect is repeated.

### `int` loopEndOffset {: .typed .int}
Similar to `loopStartOffset`, `loopEndOffset` defines where the looping should end. Together, these two variables allow you to create seamless loops by specifying the exact segment of the sound file to be repeated.

### `float` reverbLevel {: .typed .float}
The `reverbLevel` variable sets the level of reverb applied to the sound effect.

### `string` pfxName {: .typed .string}
This variable holds the name of the particle effect associated with the sound.

