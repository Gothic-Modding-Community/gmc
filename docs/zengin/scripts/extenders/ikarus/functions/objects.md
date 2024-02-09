# zCObjects

Set of functions for working with `zCObject` and its subclasses instances.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L3755-L4197)

## Global instances
Ikarus package introduces the following instances: 

```dae
instance MEM_Game (oCGame);
instance MEM_World(oWorld);
instance MEM_Timer(zCTimer);
instance MEM_WorldTimer(oCWorldTimer);
instance MEM_Vobtree(zCTree);
instance MEM_InfoMan(oCInfoManager);
instance MEM_InformationMan (oCInformationManager);
instance MEM_Waynet(zCWaynet);
instance MEM_Camera(zCCamera);
instance MEM_SkyController(zCSkyController_Outdoor);
instance MEM_SpawnManager (oCSpawnManager);
instance MEM_GameMananger (CGameManager);
instance MEM_GameManager (CGameManager);
instance MEM_Parser(zCParser);
```

The classes used here all have one thing in common: there is a maximum of one object of them at the same time (e.g. there is not two worlds or two sky at the same time). 

[`MEM_InitGlobalInst`](#mem_initglobalinst) function sets the offsets of these instances to the corresponding unique object. While it has been called, all of the above instances can be used.

### `MEM_InitGlobalInst`
Initializes global instances of commonly used objects in the game (is called by the `MEM_InitAll` function).
```dae
func void MEM_InitGlobalInst()
```

!!! Warning
    `MEM_InitGlobalInst` must be executed once after loading a savegame. The easiest way is do it is to call this function from `INIT_GLOBAL`.

## Functions

??? Trivia "About zCClassDef"
    For every class (derived from `zCObject`) there is an "administrative object" of type `zCClassDef`. This encapsulates some useful information about all objects in this class.

    ```dae
    class zCClassDef {
        var string className;            //zSTRING
        var string baseClassName;        //zSTRING
        var string scriptClassName;      //zSTRING
        var int baseClassDef;            //zCClassDef*
        var int createNewInstance;       //zCObject* ( *) (void) 
        var int createNewInstanceBackup; //zCObject* ( *) (void)
        var int classFlags;              //zDWORD
        var int classSize;               //zDWORD
        var int numLivingObjects;
        var int numCtorCalled;
        var int hashTable;               //zCObject**
        var int objectList_array;        //zCObject**
        var int objectList_numAlloc;     //int
        var int objectList_numInArray;   //int
        var int bitfield;
    };
    ```

    Full Ikarus definition of this class, with members description can be found in [`Misc.d`](https://github.com/Lehona/Ikarus/blob/master/EngineClasses_G1/Misc.d#L490-L537) file. The class is same for G1 and G2A engines.

### `MEM_GetClassDef`
Returns a pointer to the `zCClassDef` of the object. For more info see the **About zCClassDef** section above.

Passing these functions a pointer that does not point to a zCObject will most likely result in a crash
lead. 

```dae
func int MEM_GetClassDef(var int objPtr)
```
**Parameters**

- `#!dae var int objPtr`   
    A pointer to the object whose class definition is to be retrieved

**Return value**

The function returns a pointer to the `zCClassDef` of the object.

??? abstract "Example"
    This would return a pointer to the `zCClassDef` object that belongs to the `oCNpc` class.
    ```dae
    func int example1
    {
        var int her; her = MEM_InstToPtr(hero);
        return MEM_GetClassDef(her);
    };
    ```


### `MEM_GetClassName`
This function returns the name of the class to which an object belongs.
```dae
func string MEM_GetClassName(var int objPtr)
```
**Parameters**

- `#!dae var int objPtr`   
    A pointer to the object whose class name is to be retrieved

**Return value**

The function returns the objects class name as a string, if the object is invalid an empty string is returned.

??? abstract "Example"
    This would return a name of the `oCNpc` class as a string.
    ```dae
    func string example2
    {
        var int her; her = MEM_InstToPtr(hero);
        return MEM_GetClassName(her);
    };
    // return: "oCNpc"
    ```

### `MEM_CheckInheritance`
Checks if an object is derived from a specific class definition.
```dae
func int MEM_CheckInheritance(var int objPtr, var int classDef)
```
**Parameters**

- `#!dae var int objPtr`   
    A pointer to the object to be checked
- `#!dae var int classDef`   
    A pointer to the class definition to check against

**Return value**

The function returns `TRUE` if the object is derived from the specified class definition, `FALSE` is returned otherwise.

#### `Hlp_Is_*`
In addition [`MEM_CheckInheritance`](#mem_checkinheritance) function has some overloads with hardcoded `classDef` parameter.

```dae
func int Hlp_Is_oCMobFire(var int ptr){};
func int Hlp_Is_zCMover(var int ptr){};
func int Hlp_Is_oCMob(var int ptr){};
func int Hlp_Is_oCMobInter(var int ptr){};
func int Hlp_Is_oCMobLockable(var int ptr){};
func int Hlp_Is_oCMobContainer(var int ptr){};
func int Hlp_Is_oCMobDoor(var int ptr){};
func int Hlp_Is_oCMobBed(var int ptr){};
func int Hlp_Is_oCMobSwitch(var int ptr){};
func int Hlp_Is_oCMobWheel(var int ptr){};
func int Hlp_Is_oCMobLadder(var int ptr){};
func int Hlp_Is_oCNpc(var int ptr){};
func int Hlp_Is_oCItem(var int ptr){};
func int Hlp_Is_zCVobLight(var int ptr){};
```

The usage of these functions is probably obvious, they checks if the given object belongs to class given in the function name.


### `MEM_InsertVob`
Inserts a Vob with the visual `vis` at the waypoint `wp`. If the visual or waypoint does not exist, this is the behaviour this function undefined. 

!!! Note
    The inserted Vob is even an `oCMob`, so it can be given a focus name, for example. But you can treat it like a [`zCVob`](../../../../worlds/Classes/zCVob.md)), if you don't need the additional properties. 
```dae
func int MEM_InsertVob(var string vis, var string wp)
```
**Parameters**

- `#!dae var string vis`   
    Name of the inserted Vob visual (`"FAKESCROLL.3DS"`, `"FIRE.PFX"`, `"SNA_BODY.ASC"`, `"CHESTSMALL_NW_POOR_LOCKED.MDS"`, `"ADD_PIRATEFLAG.MMS"` etc.)
- `#!dae var string wp`   
    Name of the waypoint to insert Vob on

**Return value**

The function returns a pointer to the created object.

### `MEM_DeleteVob`
Deletes a specific Vob form world.
```dae
func void MEM_DeleteVob(var int vobPtr)
```
**Parameters**

- `#!dae var int vobPtr`   
    Pointer to a [`zCVob`](../../../../worlds/Classes/zCVob.md) object to be deleted

### `MEM_RenameVob`
Renames the passed Vob to the `newName` that is also passed. 

The object becomes this first removed from the Vob-hashtable, then unnamed and then again inserted into the Vob-hashtable under a new name.
```dae
func void MEM_RenameVob(var int vobPtr, var string newName)
```
**Parameters**

- `#!dae var int vobPtr`   
    Pointer to a [`zCVob`](../../../../worlds/Classes/zCVob.md) object to be renamed
- `#!dae var string newName`   
    The new Name of the Vob

=== "MEM_TriggerVob"

    ### `MEM_TriggerVob`
    Sends a trigger message to the Vob.
    ```dae
    func void MEM_TriggerVob(var int vobPtr)
    ```
    **Parameters**

    - `#!dae var int vobPtr`   
        Pointer to a triggered [`zCVob`](../../../../worlds/Classes/zCVob.md)

    !!! Danger
        If triggering the Vob has immediate effects (even before MEM_TriggerVob is exited), the name of the Vob is corrupted during this time. It is not advisable to rename, trigger again or destroy the object at this moment, the behavior in such cases is untested.
=== "MEM_UntriggerVob"

    ### `MEM_UntriggerVob`
    Sends an untrigger message to the Vob.
    ```dae
    func void MEM_TriggerVob(var int vobPtr)
    ```
    **Parameters**

    - `#!dae var int vobPtr`   
        Pointer to an untriggered [`zCVob`](../../../../worlds/Classes/zCVob.md)

    !!! Danger
        If untriggering the Vob has immediate effects (even before MEM_TriggerVob is exited), the name of the Vob is corrupted during this time. It is not advisable to rename, trigger again or destroy the object at this moment, the behavior in such cases is untested.

### `MEM_SearchVobByName`
Returns the address of a [`zCVob`](../../../../worlds/Classes/zCVob.md) named `str` if such a Vob exists.
```dae
func int MEM_SearchVobByName(var string str)
```
**Parameters**

- `#!dae var string str`   
    Name of searched [`zCVob`](../../../../worlds/Classes/zCVob.md)

**Return value**

The function returns a pointer to the [`zCVob`](../../../../worlds/Classes/zCVob.md) if the object with the given name exist. `0` is returned otherwise.


### `MEM_SearchAllVobsByName`
Variation of [`MEM_SearchVobByName`](#mem_searchvobbyname). Creates a `zCArray` in which all pointers are to Vobs with the name `str`. If no Vob with the name exists, an empty `zCArray` is created. A pointer to the created `zCArray` is then returned. This can be evaluated, but should be released again with `MEM_ArrayFree` before the end of the frame (before the player can load) to avoid memory leaks.
```dae
func int MEM_SearchAllVobsByName(var string str)
```
**Parameters**

- `#!dae var string str`   
    Name of searched [`zCVob`](../../../../worlds/Classes/zCVob.md)

**Return value**

The function returns a pointer to the created `zCArray`, that contains pointers to the all Vobs with the specified name. 

### `MEM_GetBufferCRC32`
Calculates the CRC32 hash value from a byte array starting at the address specified by `buf` and having a length of `buflen`.
```dae
func int MEM_GetBufferCRC32(var int buf, var int buflen)
```
**Parameters**

- `#!dae var int buf`   
    Address of a byte array, the hash calculation will begin from

- `#!dae var int buflen`   
    The length of the byte array starting from the address specified by `buf`

**Return value**

The function returns the calculated CRC32 hash value.


### `MEM_GetStringHash`
Calculates the CRC32 hash value for a string.
```dae
func int MEM_GetStringHash(var string str)
```
**Parameters**

- `#!dae var string str`   
    A string for which the hash value is to be calculated

**Return value**

The function returns an integer representing the calculated hash value for the input string.