---
title: Talents
description: LeGo package providing an extension for AIVar array
---
# Talents

!!! info inline end
    **Dependencies:**<br/>
    - [PermMem](permmem.md)<br/>
    **Implementation:**<br/>
    [:material-github: Talents.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

The Talents package does two things:

1. save any number of values for a specific NPC (effectively AIVar array extension).
2. identify NPC by unique ID.

Talents package uses one free AIVar variables, the default is AIVar with the index 89 that can be customized in `Userconst.d` the [`AIV_TALENT` constant](../userconstants.md#talents).

## Initialization
Initialize with `LeGo_PermMem` flag.
```dae
LeGo_Init(LeGo_PermMem);
```

## Functions

### `Npc_GetID`
!!! function "`Npc_GetID`"
    Returns unique ID specific for provided NPC.

    ```dae
    func int Npc_GetID(var C_NPC slf)
    ```
    **Parameters**

    - `#!dae var C_NPC slf`  
        NPC to get ID

    **Return value**

    The function returns NPCs unique ID.

### `Npc_FindByID`
!!! function "`Npc_FindByID`"
    Finds the NPC pointer of an NPC with the given ID.
    ```dae
    func int Npc_FindByID(var int ID)
    ```
    **Parameters**

    - `#!dae var int ID`  
        NPC ID

    **Return value**

    The function returns NPC pointer.

### `TAL_CreateTalent`
!!! function "`TAL_CreateTalent`"
    Creates a talent into which you can later save a value for every NPC (just like `AI_Var`).
    ```dae
    func int TAL_CreateTalent()
    ```
    **Return value**

    The function returns value that can be later used as a talent ID.

### `TAL_SetValue`
!!! function "`TAL_SetValue`"
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

### `TAL_GetValue`
!!! function "`TAL_GetValue`"
    Returns the value of a saved talent for specified NPC.
    ```dae
    func int TAL_GetValue(var C_NPC npc, var int talent)
    ```
    **Parameters**

    - `#!dae var C_NPC npc`  
        Get the talent value from this NPC
    - `#!dae var int talent`  
        Talent ID
