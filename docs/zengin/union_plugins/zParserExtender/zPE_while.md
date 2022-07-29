# Native WHILE loop
Just like [Ikarus](/docs/fnotready.md) zParserExtender implements a while loop.

```c++
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
    To activate `while` it is necessary to set `NetiveWhile` setting in SystemPack.ini
    ```ini
    [ZPARSE_EXTENDER]
    NativeWhile = true
    ```
    
    Compiled while loop works in vanilla engine without the plugin.
