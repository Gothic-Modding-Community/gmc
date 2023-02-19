# Names
Allows the user to change NPC name e.g. after he shows up.

## Dependencies
No dependencies

## Initialization
No Initialization

## Implementation
[:material-github: Names.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Names.d)

## Functions

### SetName
Should be set in InitGlobal().
```dae
func void SetName(c_npc npc, string name) {};
```

- `npc` - The NPC to be named
- `name` - The name of the NPC

### ShowName
Permanently displays the name set by `SetName` function above the npc.
```dae
func void ShowName(c_npc npc) {};
```

- `npc` - The NPC whose name should be shown

## Examples

### Show the name of an NPC later
```dae
instance PAL_100_Friend(c_npc)
{
    name = "Paladin";

    // [...]
};

func void Init_Global()
{
    SetName(PAL_100_Friend, "Arto");
};
```
At the start of the game, the name "Paladin" is displayed above `PAL_100_Friend`.

If `ShowName(PAL_100_Friend);` is used during a dialogue, the name "Arto" is permanently visible above the npc.
