# Int64
Int64 implements basic arithmetic for 64-bit integers based on machine code (hence the function signatures are also in machine code style). Furthermore, Int64 offers the constructor int64@ for Int64 objects, but mk64 expects a pointer, not a handle.

## Dependencies
No dependencies

## Initialization
No Initialization

## Implementation
[:material-github: Int64.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Int64.d)

## Functions

### mk64
Writes `lo` and `hi` in one place (dest). Makes Int64, `hi` has to be `-1` for negative 32bit `lo`.
```dae
func void mk64(var int dest, var int hi, var int lo) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory.

### neg64
Negates the integer: ^`*`^`dest <- -(`^`*`^`dest)`
```dae
func void neg64(var int dest) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory.

### add64
Adds `src` to `dest`: ^`*`^`dest <- `^`*`^`dest + `^`*`^`src`
```dae
func void add64(var int dest, var int src) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `src` - A pointer to an Int64 object. Will not change.

### sub64
Subtracts `src` from `dest`: ^`*`^`dest <- `^`*`^`dest - `^`*`^`src`
```dae
func void sub64(var int dest, var int src) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `src` - A pointer to an Int64 object. Will not change.

### mul64
Multiplies `dest` by `src`: ^`*`^`dest <- `^`*`^`dest * `^`*`^`src`
```dae
func void mul64(var int dest, var int src) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `src` - A pointer to an Int64 object. Will not change.

### div64
Divides `dest` by `src`: ^`*`^`dest <- `^`*`^`dest / `^`*`^`src`
```dae
func void mul64(var int dest, var int src) {};
```

- `dest` - A pointer to an Int64 object or just 8 bytes of free memory. Will be changed.
- `src` - A pointer to an Int64 object. Will not change.