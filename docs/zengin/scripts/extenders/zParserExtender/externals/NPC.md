# NPC - character functions
NPC related functions.

## Npc_SetAsHero
Changes players character to specified `npc`

```dae
func void Npc_SetAsHero( var C_NPC npc ) {};
```

- `npc` - NPC to be set as players character

## Npc_OpenInventory
Opens NPCs main inventory

```dae
func void Npc_OpenInventory( var C_NPC npc ) {};
```

- `npc` - NPC

## Npc_OpenInventorySteal
Opens the steal inventory of `npc`'s focus NPC

```dae
func void Npc_OpenInventorySteal( var C_NPC npc ) {};
```

- `npc` - NPC

## Npc_OpenInventoryTrade
Start the trading dialogue with specified NPC

```dae
func void Npc_OpenInventoryTrade( var C_NPC npc ) {};
```

- `npc` - NPC

## Npc_GetLeftHandItem
Returns an item in NPC's left hand slot

```dae
func C_Item Npc_GetLeftHandItem( var C_Npc npc ) {};
```

- `npc` - npc to be affected
- `return` - found C_ITEM instance

## Npc_GetRightHandItem
Returns an item in NPC's right hand slot

```dae
func C_Item Npc_GetRightHandItem( var C_Npc npc ) {};
```

- `npc` - npc to be affected
- `return` - found C_ITEM instance

## Npc_GetSlotItem
Returns an item from a slot with the slotName

```dae
func C_Item Npc_GetSlotItem( var C_Npc npc, var string slotName ) {};
```

- `npc` - npc to be affected
- `slotName` - name of the slot
- `return` - found C_ITEM instance

## Npc_PutInSlot
Places an instance of the oCVom class (including items and NPCs) object into the slotName of the NPC
The copyInInv parameter determines wheter a copy of the object should remian in the character's inventory

```dae
func void Npc_PutInSlot(var C_Npc npc, var string slotName, var instance object, var int copyInInv) {};
```

- `npc` - npc to remove the item from
- `slotName` - name of the slot fro which to remove the item
- `object` - object to be inserted into the slot
- `copyInInv` - should a copy of the object stay in character inventory

## Npc_RemoveFromSlot
Removes an object from the slotName of the NPC.
The dropIt parameter in Gothic 2 defines, wheter or not the object should drop out of the slot. In Gothic 1, this parameter is reserved and must be 0.

```dae
func void Npc_RemoveFromSlot(var C_Npc npc, var string slotName, var int dropIt) {};
```

- `npc` - npc to remove the item from
- `slotName` - name of the slot fro which to remove the item
- `dropIt` - should the object be dropped
