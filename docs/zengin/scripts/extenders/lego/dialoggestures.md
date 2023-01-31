# Dialoggestures
This package can modify the npcs' gestures during dialogue to better bring out emotions.

## Dependencies

- [AI_Function](../lego/ai_function.md)

## Initialization
No initialization

## Implementation
[:material-github: Dialoggestures.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Dialoggestures.d)

## Functions

### DIAG
With this function the dialog gestures for all Npcs can be overridden. To understand the principle, I recommend taking a look at the examples. 

The full name of the animation can be described as follows:
```dae
DIAG_Prefix + aniName + DIAG_Suffix + ((rand() % (max - (min - 1))) + min).ToString("00");
```
DIAG_Prefix and DIAG_Suffix are user constants.

```dae
func void DIAG(string aniName, int min, int max) {};
```

- `aniName` - The new dialogue gesture
- `min` - Lowest animation number
- `max` - Highest animation number

### DIAG_Reset
Resets the dialog gestures to the default.
```dae
func void DIAG_Reset() {};
```

## Examples
!!! Note
    See Examples in [Trialoge article](../lego/trialoge.md/#examples).

[//]: <> (@auronen please see if all that explanation in DIAG function is necessary)