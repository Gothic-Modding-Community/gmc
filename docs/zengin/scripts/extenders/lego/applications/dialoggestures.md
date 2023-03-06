# Dialoggestures
This package can modify the NPCs' gestures during dialogue to better bring out emotions.

## Dependencies

- [AI_Function](../tools/ai_function.md)

## Initialization
No initialization

## Implementation
[:material-github: Dialoggestures.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Dialoggestures.d)

## Functions

### DIAG
With this function the dialog gestures for all NPCs can be overridden. To understand the principle, it is recommended to take a look at the [examples](#examples). 

The full name of the animation can be described as follows:
```dae
DIAG_Prefix + aniName + DIAG_Suffix + ((rand() % (max - (min - 1))) + min).ToString("00");
```
`DIAG_Prefix` and `DIAG_Suffix` are [user constants](../various/userconstants.md).

```dae
func void DIAG(string AniName, int Min, int Max) {};
```

- `AniName` - The new dialogue gesture
- `Min` - Lowest animation number
- `Max` - Highest animation number

### DIAG_Reset
Resets the dialog gestures to the default.
```dae
func void DIAG_Reset() {};
```

### DIAG_SetAni
Sets animation directly.
```dae
func void DIAG_SetAni(var string AniName) {};
```

- `AniName` - animation name

### DIAG_SetMinMax
Sets animation numbers directly.
```dae
func void DIAG_SetMinMax(var int min, var int max) {};
```

- `min` - Lowest animation number
- `max` - Highest animation number

## Examples
!!! Note
    See Examples in the [Trialoge article](trialoge.md#examples).
