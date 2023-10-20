---
title: AI_Function
---
# AI_Function
This package allows time-delayed functions to be called by enqueuing the functions in the AI queue of the NPC in question. This can be very useful in writing cutscenes on engine or implementing new routines.

## Dependencies

- [HookEngine](hook_engine.md)

## Initialization
Initialize with `LeGo_AI_Function` flag.
```dae
LeGo_Init(LeGo_AI_Function);
```
## Implementation
[:material-github: AI_Function.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/AI_Function.d)

## Functions
The script function `function` is called with a delay: it joins the AI queue of `slf`.
```dae
func void AI_Function(var C_NPC slf, var func function)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC in whose AI queue the function is queued
- `#!dae var func function`  
    Name of function to be queued

Additionally, there are some overloads of `AI_Function`, which allow to call functions with parameters.
```dae
func void AI_Function_I  (var C_NPC slf, var func function, var int    param) {}; // Int
func void AI_Function_N  (var C_NPC slf, var func function, var int    param) {}; // Instance (e.g. NPC)
func void AI_Function_S  (var C_NPC slf, var func function, var string param) {}; // String
func void AI_Function_II (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Int, Int
func void AI_Function_NN (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Instance, Instance
func void AI_Function_SS (var C_NPC slf, var func function, var string param1, var string param2) {}; // String, String
func void AI_Function_IS (var C_NPC slf, var func function, var int    param1, var string param2) {}; // Int, String
func void AI_Function_SI (var C_NPC slf, var func function, var string param1, var int    param2) {}; // String, Int
func void AI_Function_NS (var C_NPC slf, var func function, var int    param1, var string param2) {}; // Instance, String
func void AI_Function_SN (var C_NPC slf, var func function, var string param1, var int    param2) {}; // String, Istance
func void AI_Function_IN (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Int, Instance
func void AI_Function_NI (var C_NPC slf, var func function, var int    param1, var int    param2) {}; // Instance, Int
```
Functions with more than two parameters cannot be called, but parameters can be passed indirectly via global variables.

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
As soon as the hero has reached the waypoint, `Wld_SendTrigger("CAMERASTART");` is called.