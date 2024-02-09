---
title: Dialoggestures
description: LeGo package for modifying the NPCs' gestures during dialogue
---
# Dialoggestures
This package can modify the NPCs' gestures during dialogue to better bring out emotions.

## Dependencies

- [AI_Function](../tools/ai_function.md)

## Initialization
N/A

## Implementation
[:material-github: Dialoggestures.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Dialoggestures.d)

## Functions

### `DIAG`
With this function the dialog gestures for all NPCs can be overridden. To understand the principle, it is recommended to take a look at the [examples](#examples). 

The full name of the animation can be described as follows:
```dae
DIAG_Prefix + aniName + DIAG_Suffix + ((rand() % (max - (min - 1))) + min).ToString("00");
```
`DIAG_Prefix` and `DIAG_Suffix` are [user constants](../various/userconstants.md#dialoggestures).

```dae
func void DIAG(var string AniName, var int Min, var int Max)
```
**Parameters**

- `#!dae var string AniName`  
    The new dialogue gesture
- `#!dae var int Min`  
    Lowest animation number
- `#!dae var int Max`  
    Highest animation number

### `DIAG_Reset`
Resets the dialog gestures to the default.
```dae
func void DIAG_Reset()
```

### `DIAG_SetAni`
Sets animation directly.
```dae
func void DIAG_SetAni(var string AniName)
```
**Parameters**

- `#!dae var string AniName`  
    Animation name

### `DIAG_SetMinMax`
Sets animation numbers directly.
```dae
func void DIAG_SetMinMax(var int min, var int max)
```
**Parameters**

- `#!dae var int min`  
    Lowest animation number
- `#!dae var int max`  
    Highest animation number

## Examples
!!! Note
    See Examples in the [Trialoge article](trialoge.md#examples).
