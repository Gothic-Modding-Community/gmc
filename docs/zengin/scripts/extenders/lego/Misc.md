# Misc

The Misc package introduces various helper functions, that did not fit into any other package.

## Dependencies  
No dependencies

## Initialization  
No initialization

## Implementation
[:material-github: Misc.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Misc.d)

## Functions

### atan2f
Calculates the arcus tangent of an angle between the origin and (x, y) point
```dae
func float atan2f(var int x, var int y) {};
```

- `x` -  x-coordinate
- `y` -  y-coordinate
- `return` - arcus tangent in radians as Ikarus `float`

### sin
Calculates the sine of an angle given in radians.
```dae
func float sin (var float angle) {};
```

- `angle` - the angle in radians as a Ikarus `float`
- `return` - sine of the angle

### cos
Calculates the cosine of an angle given in radians.
```dae
func float cos (var float angle) {};
```

- `angle` - the angle in radians as a Ikarus `float`
- `return` - cosine of the angle


### tan
Calculates the tangent of an angle given in radians.
```dae
func float tan (var float angle) {};
```

- `angle` - the angle in radians as a Ikarus `float`
- `return` - tangent of the angle

### asin
Calculates the arcus sine
```dae
func float asin (var float sine) {};
```

- `sine` - the sine of an angle
- `return` - arcus sine of the angle

### acos
Calculates the arcus cosine
```dae
func float acos (var float cosine) {};
```

- `sine` - the cosine of an angle
- `return` - arcus cosine of the angle


### distance2D
Calculates the distance between two points on a two-dimensional plane
```dae
func int distance2D(var int x1, var int x2, var int y1, var int y2) {};
```

- `x1` - X-coordinate of the first point
- `x2` - X-coordinate of the second point
- `y1` - Y-coordinate of the first point
- `y2` - Y-coordinate of the second point
- `return` - the distance between the two points

### distance2Df
Calculates the distance between two points on a two-dimensional plane as Ikarus `floats`
```dae
func float distance2Df(var float x1, var float x2, var float y1, var float y2) {};
```

- `x1` - X-coordinate of the first point
- `x2` - X-coordinate of the second point
- `y1` - Y-coordinate of the first point
- `y2` - Y-coordinate of the second point
- `return` - the distance between the two points as Ikarus `float`

