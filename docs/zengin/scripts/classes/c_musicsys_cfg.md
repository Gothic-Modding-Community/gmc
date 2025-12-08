---
title: C_MUSICSYS_CFG
---

# C_MUSICSYS_CFG Daedalus class
Class `C_MUSICSYS_CFG` defines the global settings for the game's music[^1].

!!! Danger
    An instance of this class is declared only once and should be named `musicSysConfig`.

## Definition
Class definition as it is defined in [`Scripts/System/_intern/Music.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/Music.d#L40) script file.

```dae
class C_MusicSys_CFG
{
    var float volume;              // Music volume
    var int   bitResolution;       // Sound quality
    var int   globalReverbEnabled; // Enable global reverb
    var int   sampleRate;          // Frequency
    var int   numChannels;         // Sound channels
    var int   reverbBufferSize;    // Reverb buffer size
};
```

## Members

### `float` volume {: .typed .float}
The overall volume of the background music (soundtrack). From 0.0 to 1.0. 

### `int` bitResolution {: .typed .int}
Sound quality. 8 or 16 bit. 

### `int` globalReverbEnabled {: .typed .int}
Enable global reverb. 

### `int` sampleRate {: .typed .int}
Frequency. From 11050 to 44100. 

### `int` numChannels {: .typed .int}
Number of sound channels. From 16 to 32. 

### `int` reverbBufferSize {: .typed .int}
The size of the reverb buffer.

[^1]: Heavily inspired by the amazing documentation site [Gothic library](http://gothic-library.ucoz.org/publ/class_c_musicsys_cfg/1-1-0-40).