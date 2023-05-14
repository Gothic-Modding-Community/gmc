---
title: C_MUSICSYS_CFG
---

# C_MUSICSYS_CFG Daedalus class

!!! example "Acknowledgment"
    Heavily inspired by the amazing documentation site [Gothic library](http://www.gothic-library.ru)


Class `C_MusicSys_CFG` defines the global settings for the game's music.

An instance of this class is declared only once.
## Class definition
Class definition as it is defined in [`Scripts/System/_intern/Music.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Music.d#L40) script file.

??? "C_MusicSys_CFG Daedalus class"
    ```dae
    class C_MusicSys_CFG
    {
        var float volume;               // Music volume
        var int   bitResolution;        // Sound quality
        var int   globalReverbEnabled;  // Enable global reverb
        var int   sampleRate;           // Frequency
        var int   numChannels;          // Sound channels
        var int   reverbBufferSize;     // Reverb buffer size
    };
    ```
## Class members

| Variable                                    | Type   | Description                                                  |
|---------------------------------------------|--------|--------------------------------------------------------------|
| [volume](#volume)                           | float  | Overall game music volume                                    |
| [bitResolution](#bitresolution)             | int    | Sound quality                                                |
| [globalReverbEnabled](#globalreverbenabled) | int    | Enable global reverb                                         |
| [sampleRate](#samplerate)                   | int    | Frequency                                                    |
| [numChannels](#numchannels)                 | int    | Number of sound chanells                                     |
| [reverbBufferSize](#reverbbuffersize)       | int    | The size of reverb buffer                                    |

## Class member overview
Description of the class member variables.

### volume
The overall volume of the background music (soundtrack). From 0.0 to 1.0. 

### bitResolution
Sound quality. 8 or 16 bit. 

### globalReverbEnabled
Enable global reverb. 

### sampleRate
Frequency. From 11050 to 44100. 

### numChannels
Number of sound channels. From 16 to 32. 

### reverbBufferSize
The size of the reverb buffer. 