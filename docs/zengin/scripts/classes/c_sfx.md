---
title: C_SFX
---

# C_SFX Daedalus class

Class `C_SFX` defines sound effects of the game. 

## Class definition

Class definition as it is defined in [`Scripts/System/_intern/SFX.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/SFX.d#L30-L41) script file. 

??? "C_Sfx Daedalus class"
    ```dae
    CLASS C_SFX
    {
        VAR string  file;				// Sound file in `.wav` format
        VAR int     pitchOff;			// Pitch offset in semitones
        VAR int     pitchVar;			// Semitone variance
        VAR int     vol;				// Sound volume
        VAR int     loop;				// Enable looping
        VAR int	    loopStartOffset;    // Loop start offset
        VAR int	    loopEndOffset;      // Loop end offset
        VAR float   reverbLevel;		// Reverb level
        VAR string	pfxName;            // Particle effect name
    };
    ```

## Class members

| Variable            | Type   | Description                           |
|---------------------|--------|---------------------------------------|
| [file](#file)       | string | Sound file in `.wav` format           |
| [pitchOff](#pitchoff) | int    | Pitch offset in semitones             |
| [pitchVar](#pitchvar) | int    | Semitone variance                     |
| [vol](#vol)         | int    | Sound volume                          |
| [loop](#loop)       | int    | Enable looping                        |
| [loopStartOffset](#loopstartoffset) | int | Loop start offset               |
| [loopEndOffset](#loopendoffset) | int | Loop end offset                   |
| [reverbLevel](#reverblevel) | float | Reverb level                        |
| [pfxName](#pfxname) | string | Particle effect name                  |

## Class member overview

### file
This variable holds the name of the sound file in `.wav` format. It is used to specify which sound effect should be played. The file must be located in the `_work/Data/Sound/SFX/` directory, so the game can access it.

### pitchOff
The `pitchOff` variable sets the pitch offset in semitones. This allows you to adjust the pitch of the sound effect up or down, providing flexibility in how the sound is perceived in the game.

### pitchVar
`pitchVar` defines the semitone variance for the sound effect.

### vol
This variable controls the sound volume.

### loop
The `loop` variable enables or disables looping of the sound effect. When set to true, the sound will continuously repeat, which is useful for background sounds or ambient effects like fire or wind.

### loopStartOffset
`loopStartOffset` specifies the point in the sound file where looping should start. This allows for more precise control over which part of the sound effect is repeated.

### loopEndOffset
Similar to `loopStartOffset`, `loopEndOffset` defines where the looping should end. Together, these two variables allow you to create seamless loops by specifying the exact segment of the sound file to be repeated.

### reverbLevel
The `reverbLevel` variable sets the level of reverb applied to the sound effect.

### pfxName
This variable holds the name of the particle effect associated with the sound.

