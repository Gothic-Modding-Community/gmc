# MOB - interactive object functions
Functions to manipulate interactive objects like destroying MOBs, setting lockpick combination and such.




```c++
func void Mob_Destroy( var instance object ) {};

func void Mob_RemoveItem( var instance object, var int item ) {};

func void Mob_RemoveItems( var instance object, var int item, var int cnt ) {};

func void Mob_InsertItem( var instance object, var int item ) {};

func void Mob_InsertItems( var instance object, var int item, var int cnt ) {};

func string Mob_GetLockCombination( var instance object ) {};

func void Mob_SetLockCombination( var instance object, var string comb ) {};

func int Mob_IsLocked( var instance object ) {};

func void Mob_SetLocked( var instance object, var int locked ) {};

func instance Mob_GetKeyInstance( var instance object ) {};

func void Mob_SetKeyInstance( var instance object, var int key ) {};
```
