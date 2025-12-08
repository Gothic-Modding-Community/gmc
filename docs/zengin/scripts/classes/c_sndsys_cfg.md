---
title: C_SNDSYS_CFG
---

# C_SNDSYS_CFG Daedalus class
Class `C_SNDSYS_CFG` defines the global settings for the game's sounds.

!!! Danger
    An instance of this class is declared only once and should be named `sndSysConfig`.

## Class definition
Class definition as it is defined in [`Scripts/System/_intern/SFX.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/SFX.d#L19-L27) script file.

```dae
class C_SndSys_Cfg
{
    var float  volume;             // Sound volume
    var int	   bitResolution;      // Sound quality
    var int	   sampleRate;         // Frequency
    var int	   useStereo;          // Stereo sound
    var int	   numSFXChannels;     // Number of sound channels
    var string used3DProviderName; // Name of the 3D sound provider
};
```

## Members

### `float` volume {: .typed .float}
The overall volume of the background music (soundtrack). This value ranges from 0.0 to 1.0, where 0.0 is completely muted and 1.0 is the maximum volume.

### `int` bitResolution {: .typed .int}
Defines the sound quality in terms of bit depth. It can be either 8-bit or 16-bit, with 16-bit providing higher audio fidelity.

### `int` sampleRate {: .typed .int}
Specifies the frequency at which the sound is sampled. This value ranges from 11050 Hz to 44100 Hz, with higher values offering better sound quality.

### `int` useStereo {: .typed .int}
A flag indicating whether stereo sound is enabled. A value of 1 means stereo sound is used, while 0 means mono sound.

### `int` numSFXChannels {: .typed .int}
Determines the number of sound effect channels available. This value ranges from 1 to 32, allowing for multiple sound effects to be played simultaneously.

### `string` used3DProviderName {: .typed .string}
Name of the 3D sound provider. One of the constants defined in [`Scripts/System/_intern/SFX.d`](https://github.com/VaanaCZ/gothic-2-addon-scripts/blob/Unified-EN/_work/Data/Scripts/System/_intern/SFX.d#L4-L15).

```dae
CONST STRING PROV_DOLBY_SURR	    = "Dolby Surround";
CONST STRING PROV_A3D		        = "Aureal A3D Interactive(TM)";
CONST STRING PROV_D3D_HW	        = "DirectSound3D Hardware Support";
CONST STRING PROV_D3D_SW	        = "DirectSound3D Software Emulation";
CONST STRING PROV_D3D_EAX	        = "DirectSound3D with Creative Labs EAX(TM)";
CONST STRING PROV_D3D7_FULL_HRTF    = "DirectSound3D 7+ Software - Full HRTF";
CONST STRING PROV_D3D7_LIGHT_HRTF   = "DirectSound3D 7+ Software - Light HRTF";
CONST STRING PROV_D3D7_PAN	        = "DirectSound3D 7+ Software - Pan and Volume";
CONST STRING PROV_EAX		        = "Creative Labs EAX (TM)";
CONST STRING PROV_EAX2		        = "Creative Labs EAX 2 (TM)";
CONST STRING PROV_MILES_2D          = "Miles Fast 2D Positional Audio";
CONST STRING PROV_RSX		        = "RAD Game Tools RSX 3D Audio";
```