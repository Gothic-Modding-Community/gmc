# AI - functions for working with AI
Functions to work with the new [`C_Trigger`](../c_trigger.md) class and NPC's AI queue.

## AI_CallScript
Adds a `funcName` function call to the AI queue

```dae
func void AI_CallScript(var string funcName, var C_NPC slf, var C_NPC oth) {};
```

- `funcName` - name of the function to be called
- `slf` - will be inserted into global `self` instance
- `oth` - will be inserted into global `other` instance

## AI_startTriggerScript
Creates a trigger script, that calls function `funcName` every `delay` miliseconds

```dae
func C_Trigger AI_startTriggerScript(var string funcName, var int delay) {};
```

- `funcName` - name of the function to be called
- `delay` - call period in miliseconds
- `return` - created C_Trigger instance

## AI_startTriggerScriptEx
Extended version call - Creates a trigger script, that calls function `funcName` every
`delay` miliseconds also updates the `self`, `other` and `victim` global instances
based on `slf`, `oth` and `vct` parameters respectively

```dae
func C_Trigger AI_startTriggerScriptEx(var string funcName,
                                       var int delay,
                                       var C_NPC slf,
                                       var C_NPC oth,
                                       var C_NPC vct) {};
```

- `funcName` - name of the function to be called
- `delay` - call period in miliseconds
- `slf` - will be inserted into global `self` instance
- `oth` - will be inserted into global `other` instance
- `vct` - will be inserted into global `victim` instance
- `return` - created C_Trigger instance

## AI_GetTriggerByID
Returns a C_Trigger instance from the array of active triggers by the array index `ID`

```dae
func C_Trigger AI_GetTriggerByID(var int ID) {};
```

- `ID` - array id
- `return` - active C_Trigger instance

## AI_GetTriggersNum()
Returns the number of active C_Trigger scripts

```dae
func int AI_GetTriggersNum() {};
```

- `return` - number of active C_Trigger scripts

## AI_GetTriggerNPC
Returns the npc associated with the C_Trigger script based on the ID
selfID   = 0;
otherID  = 1;
victimID = 2;

```dae
func C_NPC AI_GetTriggerNPC(var C_Trigger trigger, var int npcID) {};
```

- `trigger` - C_Trigger script
- `npcID` - [selfID, otherID, victimID] NPC id
- `return` - active C_Trigger instance

## AI_GetTriggerFunc
Returns the function asociated with the specified C_Trigger

```dae
func func AI_GetTriggerFunc(var C_Trigger trigger) {};
```

- `trigger` - C_Trigger script
- `return` - trigger function

## AI_GetTriggerFuncName
Returns the function name of a function asociated with the specified C_Trigger

```dae
func string AI_GetTriggerFuncName(var C_Trigger trigger) {};
```

- `trigger` - C_Trigger script
- `return` - active C_Trigger instance

## Ai_GetNextTriggerByFunc
Returns the next trigger in the active trigger array based on the trigger function,
starting on the `startTrigger` trigger

```dae
func C_Trigger Ai_GetNextTriggerByFunc(var C_Trigger startTrigger, var func function) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `function` - function to be matched
- `return` - C_Trigger instance

## Ai_GetNextTriggerByFuncName
Returns the next trigger in the active trigger array based on the trigger function
name, starting on the `startTrigger` trigger

```dae
func C_Trigger Ai_GetNextTriggerByFuncName(var C_Trigger startTrigger, var string functionName) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `functionName` - name of a function to be matched
- `return` - C_Trigger instance

## Ai_GetNextTriggerBySelf
Returns the next trigger in the active trigger array based on the `self` trigger
parameter, starting on the `startTrigger` instance set in the trigger

```dae
func C_Trigger Ai_GetNextTriggerBySelf(var C_Trigger startTrigger, var C_NPC self) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `self` - C_NPC instance
- `return` - C_Trigger instance

## Ai_GetNextTriggerByOther
Returns the next trigger in the active trigger array based on the `other` trigger
parameter, starting on the `startTrigger` instance set in the trigger

```dae
func C_Trigger Ai_GetNextTriggerByOther(var C_Trigger startTrigger, var C_NPC other) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `other` - C_NPC instance
- `return` - C_Trigger instance

## Ai_GetNextTriggerByVictim
Returns the next trigger in the active trigger array based on the `victim` trigger
parameter, starting on the `startTrigger` instance set in the trigger

```dae
func C_Trigger Ai_GetNextTriggerByVictim(var C_Trigger startTrigger, var C_NPC victim) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `victim` - C_NPC instance
- `return` - C_Trigger instance

## Ai_GetNextTriggerByNPCs
Returns the next trigger in the active trigger array based on all the NPCs
set in the trigger script `self`, `other` and `victim`,
starting on the `startTrigger` instance set in the trigger

```dae
func c_triggetr Ai_GetNextTriggerByNPCs(var C_Trigger startTrigger,
                                        var C_NPC self,
                                        var C_NPC other,
                                        var C_NPC victim) {};
```

- `startTrigger` - C_Trigger script to start the search from
- `self` - self C_NPC instance
- `other` - other C_NPC instance
- `victim` - victim C_NPC instance
- `return` - C_Trigger instance
