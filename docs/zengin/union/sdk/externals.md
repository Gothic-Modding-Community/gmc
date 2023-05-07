# Externals
Externals are functions defined by the Gothic engine that can be called from scripts. Union SDK provides symbols for pointers to global `zCParser` instances that we can use to interact with the parser and to define a custom external function.

```cpp
extern zCParser*    parser;
extern zCParser*&   parserSoundFX;
extern zCParser*&   parserParticleFX;
extern zCParser*&   parserVisualFX;
extern zCParser*&   parserCamera;
extern zCParser*&   parserMenu;
extern zCParser*&   parserMusic;
```

## Creating custom external
To create an external we need to define a function handler and register it in the parser. Before we start, it's good to write down a Daedalus function signature so we can see the return and argument types that will be important later.
```dae
func string AddNumbers(var int FirstArgument, var int SecondArgument, var string ThirdArgument)  {}
```

### Function handler
External function handler signature must:

* return `int` or `bool`
* use `__cdecl` calling convention (default in C++)
* take no arguments

Inside the handler, we can use the global `parser` to pop function arguments and push the return value from/to the stack. It's important to pop the arguments **in reverse order** and to pop all of them even if we are not going to use them. Similarly, the return value must always be set if any and must never be set if the function returns `void`. If we don't follow the rules, the stack may get corrupted and lead to the Gothic crash.

```cpp
// __cdecl is optional because it's the default calling convention
int __cdecl AddNumbers_External()
{
    // Declare arguments
    int FirstArgument;
    int SecondArgument;
    zSTRING ThirdArgument;

    // Pop arguments from the stack **IN REVERSE ORDER**
    parser->GetParameter(ThirdArgument);
    parser->GetParameter(SecondArgument);
    parser->GetParameter(FirstArgument);

    // Execute function logic
    int result = FirstArgument + SecondArgument;
    zSTRING output = ThirdArgument + zSTRING(result);

    // Push return value
    parser->SetReturn(output);

    // Return value is ignored, so 0 or 1 is fine.
    return 0;
}
```

### Register external
Externals should be registered in the parser during the `Game_DefineExternals` game event. We need to call `parser->DefineExternal` with variadic arguments:

* external function name in Daedalus
* reference to function handler
* return type 
* ...argument types
* `zPAR_TYPE_VOID` indicates the end of the argument types list

```cpp
void Game_DefineExternals() {
    parser->DefineExternal("AddNumbers", AddNumbers_External, zPAR_TYPE_STRING, zPAR_TYPE_INT, zPAR_TYPE_INT, zPAR_TYPE_STRING, zPAR_TYPE_VOID);
}
```

Available types are defined by an enum:
```cpp
enum {
    zPAR_TYPE_VOID,
    zPAR_TYPE_FLOAT,
    zPAR_TYPE_INT,
    zPAR_TYPE_STRING,
    zPAR_TYPE_CLASS,
    zPAR_TYPE_FUNC,
    zPAR_TYPE_PROTOTYPE,
    zPAR_TYPE_INSTANCE
};
```