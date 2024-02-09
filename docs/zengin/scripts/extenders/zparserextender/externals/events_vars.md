---
title: Event functions
---
# Event functions and variables
On top of external functions, zParserExtender also adds these event functions and constants.

```dae
/// Every event function with this name is executed once every frame
func event GameLoop() {};

/// Every event function with this name is executed once on game init
func event GameInit() {};

/// empty instance
const instance null;

/// not a number floating point constant
const float NaN;
```
