# CAST - data type conversion functions
External functions for data type conversion and pointer casting.

```c++
func instance Cast_PointerToInstance( var int address ) {};

func int Cast_InstanceToPointer( var instance object ) {};

func C_NPC Cast_PointerToNpc( var int address ) {};

func C_ITEM Cast_PointerToItem( var int address ) {};

func int Cast_InstanceIsNpc( var instance object ) {};

func int Cast_InstanceIsItem( var instance object ) {};

func int Cast_InstanceIsMob( var instance object ) {};

func int Cast_GetInstanceIndex( var instance object ) {};

/// Returns the class identifier of a class by its name
///
/// @param className name of the class
/// @return class identifier
func int Cast_GetClassID( var string className ) {};

/// Returns class identifier of the zCObject vob class
///
/// @param object object instance
/// @return class zCObject identifier
func int Cast_GetVobClassID( var instance object ) {};

/// Checks if the classId class is the parent class of the object
///
/// @param classId class identifier, from Cast_GetClassID function
/// @param object object instance
/// @return class zCObject identifier
func int Cast_CheckVobClassID( var int classId, var instance object ) {};

```
