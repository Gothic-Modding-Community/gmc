# CAST - data type conversion functions
External functions for data type conversion and pointer casting.

### Cast_PointerToInstance
Converts memory address (pointer) to an instance
```c++
func instance Cast_PointerToInstance(var int address) {};
```

- `address` - object pointer
- `return` - instance of the object

### Cast_InstanceToPointer
Converts instance to a memory address (pointer)
```c++
func int Cast_InstanceToPointer( var instance object) {};
```

- `object` - object instance
- `return` - memory address (pointer) of the object

### Cast_PointerToNpc
Casts memory address (pointer) to an NPC
```c++
func C_NPC Cast_PointerToNpc( var int address) {};
```

- `address` - npc pointer
- `return` - NPC instance

### Cast_PointerToItem
Casts memory address (pointer) to an Item
```c++
func C_ITEM Cast_PointerToItem( var int address) {};
```

- `address` - item pointer
- `return` - item instance

### Cast_InstanceIsNpc
Checks whether object is an NPC
```c++
func int Cast_InstanceIsNpc( var instance object) {};
```

- `object` - object to check
- `return` - `TRUE` or `FALSE`

### Cast_InstanceIsItem
Checks whether object is an Item
```c++
func int Cast_InstanceIsItem( var instance object) {};
```

- `object` - object to check
- `return` - `TRUE` or `FALSE`

### Cast_InstanceIsMob
Checks whether object is an MOB
```c++
func int Cast_InstanceIsMob( var instance object) {};
```

- `object` - object to check
- `return` - `TRUE` or `FALSE`

### Cast_GetInstanceIndex
Returns symbolID of the object, returns -1 when not found
```c++
func int Cast_GetInstanceIndex( var instance object) {};
```

- `object` - instance of an object
- `return` - symbol table index, -1 when not found

### Cast_GetClassID
Returns the class identifier of a class by its name
```c++
func int Cast_GetClassID( var string className ) {};
```

- `className` - name of the class
- `return` - class identifier

### Cast_GetVobClassID
Returns class identifier of the zCObject vob class
```c++
func int Cast_GetVobClassID( var instance object ) {};
```

- `object` - object instance
- `return` - class zCObject identifier

### Cast_CheckVobClassID
Checks if the classId class is the parent class of the object
```c++
func int Cast_CheckVobClassID( var int classId, var instance object ) {};
```

- `classId` - class identifier, from Cast_GetClassID function
- `object` - object instance
- `return` - class zCObject identifier

# Externals with docu comments
```c++
/// Converts memory address (pointer) to a instance
/// 
/// @param address object pointer
/// @return instance of the object
func instance Cast_PointerToInstance(var int address) {};

/// Converts instance to a memory address (pointer)
/// 
/// @param object object instance
/// @return memory address (pointer) of the object
func int Cast_InstanceToPointer( var instance object) {};

/// Casts memory address (pointer) to an NPC
/// 
/// @param address npc pointer
/// @return NPC instance
func C_NPC Cast_PointerToNpc( var int address) {};

/// Casts memory address (pointer) to an Item
/// 
/// @param address item pointer
/// @return Item instance
func C_ITEM Cast_PointerToItem( var int address) {};

/// Checks whether object is an NPC
/// 
/// @param object object to check
/// @return `TRUE` or `FALSE`
func int Cast_InstanceIsNpc( var instance object) {};

/// Checks whether object is an Item
/// 
/// @param object object to check
/// @return `TRUE` or `FALSE`
func int Cast_InstanceIsItem( var instance object) {};

/// Checks whether object is an MOB
/// 
/// @param object object to check
/// @return `TRUE` or `FALSE`
func int Cast_InstanceIsMob( var instance object) {};

/// Returns symbolID of the object, returns -1 when not found
/// 
/// @param object instance of an object
/// @return symbol table index, -1 when not found
func int Cast_GetInstanceIndex( var instance object) {};

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
