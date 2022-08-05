# Talents
The Talents package does two things

1. save any number of values for a specific NPC (effectively AIVar array extension),
2. identify NPC by unique ID.

Talents package uses one free AIVar variables, the default is AIVar with the index 89, but can be customized in `Userconst.d` the [`AIV_TALENT` constant](https://github.com/Lehona/LeGo/blob/55ae79a781f79cda649fa42d7f64250befa71212/Userconst.d#L120).

## Dependencies

- PermMem

## Initialization
Initialize with `LeGo_PermMem` flag.
```c++
LeGo_Init(LeGo_PermMem)
```

## Implementation
[:material-github: Talents.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Talents.d)

## Functions

### NPC_GetID
Returns unique ID specific for provided NPC.

```c++
int NPC_GetID(c_npc slf)
```

- `slf` NPC
- `return` NPCs unique ID

### NPC_FindByID
Finds the NPC pointer of an NPC with the given ID.
```c++
int NPC_FindByID(int ID)
```

- `ID` - NPC ID
- `return` - NPC pointer

### NPC_FindByID
Finds the NPC pointer of an NPC with the given ID.
```c++

int NPC_FindByID(int ID)
```

- `ID` NPC ID
- `return` NPC pointer

### TAL_CreateTalent
Creates a talent, into which you can later save a value for every NPC (just like AI_Var).
```c++
int TAL_CreateTalent()
```

- `return` - Value that can be later used as a talent index

### TAL_SetValue
Sets a new value to the specified talent.
```c++

void TAL_SetValue(c_npc npc, int talent, int value)
```

- `npc` - Set the talent value for this NPC
- `talent` - Talent ID
- `value` - Value to be set

### TAL_GetValue
Returns the value of a save talent for specified NPC.
```c++
int TAL_GetValue(c_npc npc, int talent)
```

- `npc` - Get the talent value from this NPC
- `talent` - Talent ID
