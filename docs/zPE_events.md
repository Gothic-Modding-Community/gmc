# Event functions
Event functions are functions sharing the same name, that can be defined multiple times, but only once per file. Such functions are useful for implementing *callback* type functions. Every time an event is called, all instances of the same name will be called. The event is `func` with a return type `event`. Events are defined globally, meaning, they ignore namespace they are in. To call an event from a script, use the external function [`Hlp_DoEvent(var string funcName)`](#hlp-help-functions).

```c++
func void GiveXP()
{
    Hlp_DoEvent("OnGiveXP");
};

func event OnGiveXP()
{
    // TODO
    // This function can be defined in many files to do different things
    // more appropriate for that file's context and all of them will be
    // called, when function GiveXP (above) is called.
};
```
Plugin implements two of these [event functions](#event-functions-and-variables)

- `func event GameInit()` - called when entering the main menu on game start
- `func event GameLoop()` - called every frame when a world is loaded

Define these in any file in your scripts and they will be automatically called
