# Random
Provides more random randomization than `Hlp_Random()` function.

## Dependencies
No dependencies

## Initialization
Initialize with `LeGo_Random` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Random);
```

## Implementation
[:material-github: Random.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Random.d)

## Functions

### r_Next
Returns a random number.
```dae
func int r_Next() {};
```

- `return` - random number

### r_Max
Returns a random number from 0 to 'max'.
```dae
func int r_Max(int max) {};
```

- `max` - maximum value
- `return` - random number in the specified range

### r_MinMax
Returns a random number from 'min' to 'max'.
```dae
func int r_MinMax(int min, int max) {};
```

- `min` - minimum value
- `max` - maximum value
- `return` - random number in the specified range

### r_Init
Initializes the random number generator. Happens optionally in `LeGo_Init`.
```dae
func void r_Init(int seed) {};
```
- `initVal` - seed value

### r_DefaultInit
Initializes the random number generator based on the current time.
```dae
func void r_DefaultInit() {};
```
