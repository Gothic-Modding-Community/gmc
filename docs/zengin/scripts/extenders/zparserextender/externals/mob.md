# MOB - interactive object functions
Functions to manipulate interactive objects like destroying MOBs, setting lockpick combination and such.

## Mob_Destroy
Marks oCMOB as destroyed, changes the visual to visualDestroyed (if present).

```dae
func void Mob_Destroy( var instance object ) {};
```

- `object` - oCMOB to be destroyed

## Mob_RemoveItem
Removes an item from a oCMobContainer

```dae
func void Mob_RemoveItem( var instance object, var int item ) {};
```

- `object` - oCMobContainer object
- `item` - item to be removed

## Mob_RemoveItems
Removes specified number of items from a oCMobContainer

```dae
func void Mob_RemoveItems( var instance object, var int item, var int cnt ) {};
```

- `object` - oCMobContainer object
- `item` - item to be removed
- `cnt` - number of items to be removed

## Mob_InsertItem
Inserts an item into a oCMobContainer

```dae
func void Mob_InsertItem( var instance object, var int item ) {};
```

- `object` - oCMobContainer object
- `item` - item to be inserted

## Mob_InsertItems
Inserts specified number of items into a oCMobContainer

```dae
func void Mob_InsertItems( var instance object, var int item, var int cnt ) {};
```

- `object` - oCMobContainer object
- `item` - item to be inserted
- `cnt` - number of items to be inserted

## Mob_GetLockCombination
Returns a lock combination of a oCMobContainer

```dae
func string Mob_GetLockCombination( var instance object ) {};
```

- `object` - oCMobContainer object
- `return` - lock combination

## Mob_SetLockCombination
Sets a lock combination to a oCMobContainer

```dae
func void Mob_SetLockCombination( var instance object, var string comb ) {};
```

- `object` - oCMobContainer object
- `comb` - lock combination

## Mob_IsLocked
Returns `TRUE` if the object is locked

```dae
func int Mob_IsLocked( var instance object ) {};
```

- `object` - oCMobLockable object
- `return` - `TRUE` if locked, `FALSE` if unlocked

## Mob_SetLocked
Set the lock status of the object

```dae
func void Mob_SetLocked( var instance object, var int locked ) {};
```

- `object` - oCMobLockable object
- `locked` - lock or unlock the object

## Mob_GetKeyInstance
Returns the key instance, that unlocks the object

```dae
func instance Mob_GetKeyInstance( var instance object ) {};
```

- `object` - oCMobLockable object
- `return` - the key C_ITEM instance

## Mob_SetKeyInstance
Stets the key instance, that unlocks the object

```dae
func void Mob_SetKeyInstance( var instance object, var int key ) {};
```

- `object` - oCMobLockable object
- `key` - the key C_ITEM instance