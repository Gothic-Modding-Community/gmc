# NPC - character functions
NPC realted functions.
```dae
func void Npc_SetAsHero( var C_NPC npc ) {};

func void Npc_OpenInventory( var C_NPC npc ) {};

func void Npc_OpenInventorySteal( var C_NPC npc ) {};

func void Npc_OpenInventoryTrade( var C_NPC npc ) {};

/// Returns an item in NPC's left hand slot
///
/// @param npc npc to be affected
func C_Item Npc_GetLeftHandItem( var C_Npc npc ) {};

/// Returns an item in NPC's right hand slot
///
/// @param npc npc to be affected
func C_Item Npc_GetRightHandItem( var C_Npc npc ) {};

/// Returns an item from a slot with the slotName
///
/// @param npc npc to be affected
/// @param slotName name of the slot
func C_Item Npc_GetSlotItem( var C_Npc npc, var string slotName ) {};

/// Places an instance of the oCVom class (including items and NPCs) object into the slotName of the NPC
/// The copyInInv parameter determines wheter a copy of the object should remian in the character's inventory
///
/// @param npc npc to remove the item from
/// @param slotName name of the slot fro which to remove the item
/// @param object object to be inserted into the slot
/// @param copyInInv should a copy of the object stay in character inventory
func void Npc_PutInSlot(var C_Npc npc, var string slotName, var instance object, var int copyInInv) {};

/// Removes an object from the slotName of the NPC.
/// The dropIt parameter in Gothic 2 defines, wheter or not the object should drop out of the slot. In Gothic 1, this parameter is reserved and must be 0.
///
/// @param npc npc to remove the item from
/// @param slotName name of the slot fro which to remove the item
/// @param dropIt should the object be dropped
func void Npc_RemoveFromSlot(var C_Npc npc, var string slotName, var int dropIt) {};

```
