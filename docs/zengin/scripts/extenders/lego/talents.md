# Talents
The Talents package does two things:

1. save any number of values for a specific NPC (effectively AIVar array extension).
2. identify NPC by unique ID.

Talents package uses one free AIVar variables, the default is AIVar with the index 89 that can be customized in `Userconst.d` the [`AIV_TALENT` constant](https://github.com/Lehona/LeGo/blob/55ae79a781f79cda649fa42d7f64250befa71212/Userconst.d#L120).

## Dependencies

- PermMem

## Initialization
Initialize with `LeGo_PermMem` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_PermMem);
```

## Implementation
[:material-github: Talents.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

## Functions

### NPC_GetID
Returns unique ID specific for provided NPC.

```dae
func int NPC_GetID(var c_npc slf) {};
```

- `slf` NPC
- `return` NPCs unique ID

### NPC_FindByID
Finds the NPC pointer of an NPC with the given ID.
```dae
func int NPC_FindByID(var int ID) {};
```

- `ID` - NPC ID
- `return` - NPC pointer

### NPC_FindByID
Finds the NPC pointer of an NPC with the given ID.
```dae
func int NPC_FindByID(var int ID) {};
```

- `ID` NPC ID
- `return` NPC pointer

### TAL_CreateTalent
Creates a talent into which you can later save a value for every NPC (just like AI_Var).
```dae
func int TAL_CreateTalent() {};
```

- `return` - Value that can be later used as a talent index

### TAL_SetValue
Sets a new value to the specified talent.
```dae
func void TAL_SetValue(var c_npc npc, var int talent, var int value) {};
```

- `npc` - Set the talent value for this NPC
- `talent` - Talent ID
- `value` - Value to be set

### TAL_GetValue
Returns the value of a saved talent for specified NPC.
```dae
func int TAL_GetValue(var c_npc npc, var int talent) {};
```

- `npc` - Get the talent value from this NPC
- `talent` - Talent ID
