# Random
Provides more random randomization than `Hlp_Random()` function.

## Dependencies
N/A

## Initialization
Initialize with `LeGo_Random` flag.
```dae
LeGo_Init(LeGo_Random);
```

## Implementation
[:material-github: Random.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Random.d)

## Functions

### `r_Next`
Returns a random number.
```dae
func int r_Next()
```
**Return value**

The function returns a random number.

### `r_Max`
Returns a random number from 0 to `max`.
```dae
func int r_Max(var int max)
```
**Parameters**

- `#!dae var int max`  
    Maximum value of number

**Return value**

The function returns a random number from 0 to 'max'.

### `r_MinMax`
Returns a random number from 'min' to 'max'.
```dae
func int r_MinMax(var int min, var int max)
```
**Parameters**

- `#!dae var int max`  
    Maximum value of number
- `#!dae var int min`  
    Minimum value of number

**Return value**

The function returns a random number from `min` to `max`.

### `r_Init`
Initializes the random number generator. Happens optionally in `LeGo_Init`.
```dae
func void r_Init(var int seed)
```
**Parameters**

- `#!dae var int seed`  
    The initializing value

### `r_DefaultInit`
Initializes the random number generator based on the current time.
```dae
func void r_DefaultInit()
```
