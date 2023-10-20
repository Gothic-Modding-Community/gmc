# Talents
The Talents package does two things:

1. save any number of values for a specific NPC (effectively AIVar array extension).
2. identify NPC by unique ID.

Talents package uses one free AIVar variables, the default is AIVar with the index 89 that can be customized in `Userconst.d` the [`AIV_TALENT` constant](../various/userconstants.md#talents).

## Dependencies

- [PermMem](permmem.md)

## Initialization
Initialize with `LeGo_PermMem` flag.
```dae
LeGo_Init(LeGo_PermMem);
```

## Implementation
[:material-github: Talents.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

## Functions

### `NPC_GetID`
Returns unique ID specific for provided NPC.

```dae
func int NPC_GetID(var C_NPC slf)
```
**Parameters**

- `#!dae var C_NPC slf`  
    NPC to get ID

**Return value**

The function returns NPCs unique ID.

### `NPC_FindByID`
Finds the NPC pointer of an NPC with the given ID.
```dae
func int NPC_FindByID(var int ID)
```
**Parameters**

- `#!dae var int ID`  
    NPC ID

**Return value**

The function returns NPC pointer.

### `TAL_CreateTalent`
Creates a talent into which you can later save a value for every NPC (just like `AI_Var`).
```dae
func int TAL_CreateTalent()
```
**Return value**

The function returns value that can be later used as a talent ID.

### `TAL_SetValue`
Sets a new value to the specified talent.
```dae
func void TAL_SetValue(var C_NPC npc, var int talent, var int value)
```
**Parameters**

- `#!dae var C_NPC npc`  
    Set the talent value for this NPC
- `#!dae var int talent`  
    Talent ID
- `#!dae var int value`  
    Value to be set

### TAL_GetValue
Returns the value of a saved talent for specified NPC.
```dae
func int TAL_GetValue(var C_NPC npc, var int talent)
```
**Parameters**

- `#!dae var C_NPC npc`  
    Get the talent value from this NPC
- `#!dae var int talent`  
    Talent ID
