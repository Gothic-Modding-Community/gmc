---
title: Pętla while
---
# Natywna pętla WHILE
Podobnie jak [Ikarus](../../ikarus/functions/jumps_loops.md#while-loop) zParserExtender implementuje pętlę while.

```dae
var int value; value = 10;
while(value > 0)
{
    if (value == 8)
    {
        continue;
    };
 
    if (value == 2)
    {
        break;
    };
};
```
!!! note
    Aby aktywować `while` konieczne jest ustawienie `NativeWhile` w SystemPack.ini
    ```ini
    [ZPARSE_EXTENDER]
    NativeWhile = true
    ```
    
    Skompilowana pętla while działa w silniku vanilla bez pluginu.
