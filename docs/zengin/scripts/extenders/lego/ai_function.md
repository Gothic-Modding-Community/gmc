# AI Function
This package allows time-delayed functions to be called by enqueuing the functions in the AI queue of the NPC in question. This can be very useful for e.g. cutscenes.

## Dependencies

- HookEngine

## Initialization
Initialize with `LeGo_AI_Function` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_AI_Function);
```
## Implementation
[:material-github: AI_Function.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/AI_Function.d)

## Functions
The script function `function` is called with a delay: it joins the AI queue of `slf`.
```dae
func void AI_Function(c_npc slf, func function) {};
```

- `slf` - NPC in whose AI queue the function is queued
- `function` - name of function to be queued

Additionally there are some overloads of `AI_Function`, which allow to call functions with parameters.
```dae
func void AI_Function_I  (c_npc slf, func function, int    param)                 {}; //Int
func void AI_Function_N  (c_npc slf, func function, int    param)                 {}; //Instance (e.g. NPC)
func void AI_Function_S  (c_npc slf, func function, string param)                 {}; //String
func void AI_Function_II (c_npc slf, func function, int    param1, int    param2) {}; // Int, Int
func void AI_Function_NN (c_npc slf, func function, int    param1, int    param2) {}; // Instance, Instance
func void AI_Function_SS (c_npc slf, func function, string param1, string param2) {}; //String, String
func void AI_Function_IS (c_npc slf, func function, int    param1, string param2) {}; //Int, String
func void AI_Function_SI (c_npc slf, func function, string param1, int    param2) {}; //String, Int
func void AI_Function_NS (c_npc slf, func function, int    param1, string param2) {}; //Instance, String
func void AI_Function_SN (c_npc slf, func function, string param1, int    param2) {}; //String, Istance
func void AI_Function_IN (c_npc slf, func function, int    param1, int    param2) {}; //Int, Instance
func void AI_Function_NI (c_npc slf, func function, int    param1, int    param2) {}; //Instance, Int
```
Unfortunately, functions with more than two parameters cannot be called, but parameters can be passed indirectly via global variables.

In the called function, `slf` can be accessed as follows:
```dae
var oCNpc slf; slf = _^(ECX);
```
!!! Info
    From LeGo 2.7.2 the global instance `self` is provided correctly and can be used directly.

## Examples

### Enqueueing a simple function
Before a function is called, any Npc should first complete its AI queue.

Here the hero is supposed to run to a waypoint, and only when he has arrived is to start a tracking shot.
```dae
func void Example1() {
    Npc_ClearAIQueue(hero);
    AI_GotoWP(hero, "MYWAYPOINT");

    AI_Function_S(hero, Wld_SendTrigger, "CAMERASTART");
};
```
As soon as the hero has reached the waypoint, `Wld-SendTrigger("CAMERASTART");` is called.