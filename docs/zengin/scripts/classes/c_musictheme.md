---
title: C_MUSICTHEME
---

# C_MUSICTHEME Daedalus class

!!! example "Acknowledgment"
    Heavily inspired by the amazing documentation site [Gothic library](http://www.gothic-library.ru)

Class `C_MusicTheme` describes musical themes.
## Class definition
Class definition as it is defined in [`Scripts/System/_intern/Music.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Music.d#L52) script file.

??? "C_MusicTheme Daedalus class"
    ```dae
    class C_MusicTheme
    {
        var string      file;           // Sound file in DirectMusic `.sgt` format
        var float       vol;            // Sound volume
        var int         loop;           // Enable cycle
        var float       reverbMix;      // Reverb mixing
        var float       reverbTime;     // Reverb time
        var int         transType;      // Type of transition to the next theme
        var int         transSubType;   // Subtype of transition to the next theme song
    };
    ```
## Class members

| Variable                          | Type   | Description                                                                         |
|-----------------------------------|--------|-------------------------------------------------------------------------------------|
| [file](#file)                     | string | Sound file in DirectMusic `.sgt` format                                             |
| [vol](#vol)                       | float  | Sound volume                                                                        |
| [loop](#loop)                     | int    | Enable/disable cycle                                                                |
| [reverbMix](#reverbmix)           | float  | Reverb mixing                                                                       |
| [reverbTime](#reverbtime)         | float  | Reverb time                                                                         |
| [transType](#transtype)           | int    | The type of transition to the next theme song                                       |
| [transSubType](#transsubtype)     | int    | The subtype of transition to the next theme song                                    |

## Class member overview
Description of the class member variables.

### file
DirectMusic sound in *.sgt format or MIDI file. 

### vol
The volume of the theme song. From 0.0 to 1.0. 

### loop
Enable/disable theme music looping. Disabled = 0. Enabled = 1. 

### reverbMix
Reverb mixing. Measured in decibels. 

### reverbTime
Reverberation time in milliseconds.

### transType
The type of transition to the next theme song. 

The list of constants for all transitions types is described in the file [`Scripts/System/_intern/Music.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Music.d#L24)

```dae
const int TRANSITION_TYPE_NONE          = 1;    // No transition
const int TRANSITION_TYPE_GROOVE        = 2;    // Ripple
const int TRANSITION_TYPE_FILL          = 3;    // Padding
const int TRANSITION_TYPE_BREAK         = 4;    // Break
const int TRANSITION_TYPE_INTRO         = 5;    // Introductory
const int TRANSITION_TYPE_END           = 6;    // End topic
const int TRANSITION_TYPE_ENDANDINTRO   = 7;    // End and start new
```

### transSubType
The subtype of transition to the next theme song. 

The list of constants for all transitions subtypes is described in the file [`Scripts/System/_intern/Music.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Music.d#L33)

```dae
const INT TRANSITION_SUB_TYPE_IMMEDIATE = 1;    // Instant transition
const INT TRANSITION_SUB_TYPE_BEAT      = 2;    // Rhythmic transition
const INT TRANSITION_SUB_TYPE_MEASURE   = 3;    // Gradual transition
```

## Name features
The musical themes of the game are played depending on the game situation. By default, the theme with the ending is played `_STD` (standard). In case of a threat, the theme will be played with the ending `_THR` (threat). Theme plays during combat `_FGT` (fight). 

```dae
instance WOO_DAY_STD(C_MUSICTHEME_STANDARD)
{
    file = "woo_daystd.sgt";
};
 
instance WOO_DAY_THR(C_MUSICTHEME_THREAT)
{
    file = "woo_daythr.sgt";
};
 
instance WOO_DAY_FGT(C_MUSICTHEME_FIGHT)
{
    file = "woo_dayfgt.sgt";
};
```
In addition, with the suffix `_DAY_` and `_NGT_` determined by day or night, the theme is played.
```dae
instance OWD_DAY_FGT(C_MUSICTHEME_FIGHT)
{
    file = "owp_dayfgt.sgt";
};
 
instance OWD_NGT_STD(C_MUSICTHEME_STANDARD)
{
    file = "owd_daystd.sgt";
};
```
Themes from prototypes are used by default `C_MUSICTHEME_STANDARD`, `C_MUSICTHEME_THREAT` and `C_MUSICTHEME_FIGHT`.