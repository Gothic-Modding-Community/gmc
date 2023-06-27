# Buffs
This package allows you to easily create status effects that can affect any NPC.
Status effects on the hero are displayed graphically in a bar.

## Dependencies

- [PermMem](../tools/permmem.md)
- [FrameFunctions](../tools/frame_functions.md)

## Initialization
Initialize with `LeGo_Buffs` flag.
```dae
LeGo_Init(LeGo_Buffs);
```

!!! Warning
    This package is still experimental and not included in the `LeGo_All` initialization flag.

## Implementation
[:material-github: Buffs.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Buffs.d)

## Functions

### `Buff_Apply`
Applies a status effect to an NPC.
```dae
func int Buff_Apply(var C_NPC npc, var int buff)
```
**Parameters**

- `#!dae var C_NPC npc`  
    NPC to be affected by this effect

- `#!dae var int buff`  
    The instance of the effect to apply to the NPC

**Return value**

The function returns the handle of the buff, which was just generated.

### `Buff_ApplyUnique`
`Buff_Apply`, but nothing happens if a status effect of that kind is already on the NPC.
```dae
func int Buff_ApplyUnique(var C_NPC npc, var int buff)
```
**Parameters**

- `#!dae var C_NPC npc`  
    NPC to be affected by this effect

- `#!dae var int buff`  
    The instance of the effect to apply to the NPC

**Return value**

The function returns the handle of the buff, which was just generated or `0` if the buff is already applied on the NPC.

### `Buff_ApplyOrRefresh`
`Buff_Apply`, but if a status effect of this type is already affecting the NPC, the duration will be reset.
```dae
func int Buff_ApplyOrRefresh(var C_NPC n, var int buff)
```
**Parameters**

- `#!dae var C_NPC npc`  
    NPC to be affected by this effect

- `#!dae var int buff`  
    The instance of the effect to apply to the NPC

**Return value**

The function returns the handle of the buff, which was just generated or refreshed.

### `Buff_Refresh`
Resets the duration of the buff.
```dae
func void Buff_Refresh(var int buffHandle)
```
**Parameters**

- `#!dae var int buffHandle`  
    Handle of the buff to refresh

### `Buff_Remove`
Removes the buff from the all NPCs.

[//]: # (TODO Needs to be checked)
```dae
func void Buff_Remove(var int buffHandle)
```
**Parameters**

- `#!dae var int buffHandle`  
    Handle of the buff to remove

### `Buff_RemoveAll`
Removes the buffs form the NPC.

[//]: # (TODO Needs to be checked)
```dae
func void Buff_RemoveAll(var C_NPC npc, var int buffInstance)
```
**Parameters**

- `#!dae var C_NPC npc`  
    NPC whose buff should be removed

### `Buff_GetNpc`
Returns a pointer to the NPC, which is affected by the buff.
```dae
func int Buff_GetNpc(var int buffHandle)
```
**Parameters**

- `#!dae var int buffHandle`  
    Handle of the buff

**Return value**

The function returns a pointer to the NPC, which is affected by the buff.

### `Buff_Has`
Checks if the NPC already has an effect applied.
```dae
func int Buff_Has(var C_NPC npc, var int buff)
```
**Parameters**

- `#!dae var C_NPC npc`  
    Checked NPC

- `#!dae var int buff`  
    The instance of the effect

**Return value**

The function returns `TRUE` if the NPC has an effect applied. `FALSE` is returned otherwise.

### `SAVE_GetFuncID`
Same as `MEM_GetFuncID` but gets the current instance.
```dae
func int SAVE_GetFuncID(var func f)
```
**Parameters**

`#!dae var func f`  
    Function whose ID is got

**Return value**

The function returns the ID of given function.

## lCBuff class
The buffs package implements an `lCBuff` class, which looks like this:

```dae
class lCBuff
{
    var string name;    // buff name 
    var int buffType;   // GOOD / NEUTRAL / BAD | 1 / 0 / -1
    var int targetID;   // NPC that is currently affected by this buff
    var int durationMS; // buff duration in milliseconds
    var int tickMS;     // tick duration in milliseconds, first tick occurs at tickMS milliseconds
    var int nextTickNr; // e.g. before the first tick this will be 0; OBSOLETE, remove when possible

    var int OnApply; 
    var int OnTick;
    var int OnRemoved;

    var string buffTex;  // associated texture - currently only used for buffs applied on the hero
    // var int originID; // Who casted/created this buff?

    // Internal, no need to set during instance construction
    var int _startedTime;
    var int _endTime;    // Not rendundant with durationMS because buffs can be refreshed
};
```

## Examples

## Delayed poison
```dae
instance deadly_poison(lCBuff)
{
    name = "Deadly poison";
    bufftype = BUFF_BAD;
    
    durationMS = 10*1000; // 10 seconds long
    tickMS = 1000;        // Every second

    buffTex = "POISON.TGA";
};
```

Damage should also be added:
```dae
func void deadly_poison_damage(var int buffHandle)
{
    var int ptr; ptr = Buff_GetNpc(buffHandle);
    if (!ptr) { return; }; // Can happen if e.g. the world was changed

    var C_NPC npc; npc = _^(ptr);
    Npc_ChangeAttribute(npc, ATR_HITPOINTS, -3); // 3 damage
};
```
For complicated technical reasons we use the function `SAVE_GetFuncID` instead of `MEM_GetFuncID`.
```dae
instance deadly_poison(lCBuff)
{
    name = "Deadly poison";
    bufftype = BUFF_BAD;
    
    durationMS = 10 * 1000; //10 seconds long
    tickMS = 1000; // Every second
    
    onTick = SAVE_GetFuncID(deadly_poison_damage); // The damage should be applied every second
    buffTex = "POISON.TGA";
};
```

For example, if this buff is now applied to the hero, by calling `Buff_Apply(hero, deadly_poison)`, he loses a total of 30 HP over 10 seconds.

