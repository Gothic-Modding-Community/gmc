# External functions
External functions are Daedalus functions (defined in the engine itself) used to interface with the enigne. zParseExtender adds quite a huge amount of new functions, that help scripters to interface with the engine in more ways, that was possible before (without script extenders such as Ikarus and LeGo).

## CAST - data type conversion functions
External functions for data type conversion and pointer casting.
<details>
  <summary>Show code</summary>
```c++
func instance Cast_PointerToInstance( var int address )

func int Cast_InstanceToPointer( var instance object )

func C_NPC Cast_PointerToNpc( var int address )

func C_ITEM Cast_PointerToItem( var int address )

func int Cast_InstanceIsNpc( var instance object )

func int Cast_InstanceIsItem( var instance object )

func int Cast_InstanceIsMob( var instance object )

func int Cast_GetInstanceIndex( var instance object )
```
</details>

## HLP - help functions
Helper functions, used for safety checks or to get specific information from the engine.
<details>
  <summary>Show code</summary>
```c++
func int Hlp_HasFocusVob( var C_NPC npc )

func instance Hlp_GetFocusVob( var C_NPC npc )

func string Hlp_GetFocusVobName( var C_NPC npc )

func int Hlp_GetStringLength( var string str )

func int IsNAN( var float value )

func int Hlp_KeyToggled( var int key )

func int Hlp_KeyPressed( var int key )

func int Hlp_LogicalKeyToggled( var int key )

func int Hlp_GameOnPause()

func void Hlp_MessageBox( var string message )

func void Hlp_PrintConsole(var string message)

func int Hlp_ReadOptionInt(var string optName, var string section, var string entry, var int default)

func float Hlp_ReadOptionFloat(var string optName, var string section, var string entry, var float default)

func string Hlp_ReadOptionString(var string optName, var string section, var string entry, var string default)

func int Hlp_OptionIsExists(var string optName, var string section, var string entry)

func void Hlp_WriteOptionInt(var string optName, var string section, var string entry, var int value)

func void Hlp_WriteOptionFloat(var string optName, var string section, var string entry, var float value)

func void Hlp_WriteOptionString(var string optName, var string section, var string entry, var string value)


```
</details>
## WLD - world manipulation functions
Functions related to the world. 
<details>
  <summary>Show code</summary>
```c++

func void Wld_ChangeLevel( var string world , var string waypoint )

func instance Wld_FindVob( var string vobname )

func void Wld_PlayEffectVob(
                             var string effect ,
                             var instance pvob ,
                             var int level ,
                             var int damage ,
                             var int damage_type ,
                             var int damage_speed )

func void Wld_PlayEffectAt(
                             var string effect ,
                             var instance coord ,
                             var int level ,
                             var int damage ,
                             var int damage_type ,
                             var int damage_speed )

func void Wld_ToggleRain( var float weight , var flaot time )

func void Wld_SetWeatherType( var int type )

func int Wld_GetWeatherType()


```
</details>
## MDL - model functions
Functions to tweak animation and other model related settings.
<details>
  <summary>Show code</summary>
```c++


func int Mdl_GetAnimationIndex( var C_NPC npc , var string ani_name )

func string Mdl_GetAnimationName( var C_NPC npc , var int ani_index )

func int Mdl_AnimationIsExists( var C_NPC npc , var int ani_index )

func int Mdl_AnimationIsActive( var C_NPC npc , var int ani_index )

func float Mdl_SetAllAnimationsFPS( var C_NPC npc , var float fps )

func float Mdl_ResetAllAnimationsFPS( var C_NPC npc )

func float Mdl_SetAnimationFPS( var C_NPC npc , var int idx , var float fps )

func float Mdl_ResetAnimationFPS( var C_NPC npc , var int ani_index )

func void Mdl_SetVisible( var C_NPC npc , var int isVisible )


```
</details>
## NPC - character functions
NPC realted functions.
<details>
  <summary>Show code</summary>
```c++


func void Npc_SetAsHero( var C_NPC npc )

func void Npc_OpenInventory( var C_NPC npc )

func void Npc_OpenInventorySteal( var C_NPC npc )

func void Npc_OpenInventoryTrade( var C_NPC npc )


```
</details>
## MOB - interactive object functions
Functions to manipulate interactive objects like destroying MOBs, setting lockpick combination and such.
<details>
  <summary>Show code</summary>
```c++


func void Mob_Destroy( var instance object )

func void Mob_RemoveItem( var instance object , var int item )

func void Mob_RemoveItems( var instance object , var int item , var int cnt )

func void Mob_InsertItem( var instance object , var int item )

func void Mob_InsertItems( var instance object , var int item , var int cnt )

func string Mob_GetLockCombination( var instance object )

func void Mob_SetLockCombination( var instance object , var string comb )

func int Mob_IsLocked( var instance object )

func void Mob_SetLocked( var instance object , var int locked )

func instance Mob_GetKeyInstance( var instance object )

func void Mob_SetKeyInstance( var instance object , var int key )


```
</details>
## AI - functions for working with AI
Functions to work with the new `C_Trigger` class and NPC's AI queue.
<details>
  <summary>Show code</summary>
```c++

func void AI_CallScript(var string funcName, var C_Npc slf, var C_Npc oth)

func C_Trigger AI_StartTriggerScript(var string funcName, var int delay)

func C_Trigger AI_StartTriggerScriptEx(var string funcName, var int delay, var C_Npc slf, var C_Npc oth, var C_Npc vct)

const int selfID   = 0;
const int otherID  = 1;
const int victimID = 2;

func int Hlp_IsNULL(var instance pointer);

func C_Trigger AI_GetTriggerByID(var int ID);

func int AI_GetTriggersNum();

func C_Trigger AI_GetTriggerNPC(var int npcID);

func func AI_GetTriggerFunc(var C_Trigger trigger);

func string AI_GetTriggerFuncName(var C_Trigger trigger);

AI_GetNextTriggerByFunc(var C_Trigger startTrigger, var func function);

AI_GetNextTriggerByFuncName(var C_Trigger startTrigger, var string functionName);

AI_GetNextTriggerBySelf(var C_Trigger startTrigger, var C_Npc self);

AI_GetNextTriggerByOther(var C_Trigger startTrigger, var C_Npc other);

AI_GetNextTriggerByVictim(var C_Trigger startTrigger, var C_Npc victim);

AI_GetNextTriggerByNPCs(var C_Trigger startTrigger, var C_Npc self, var C_Npc other, var C_Npc victim);
```
</details>
## PAR - Functions for parser manipulation
Parser functions are used to manipulate the parsers. Retrieve SymbolID, access arrays and such.
<details>
  <summary>Show code</summary>
```c++


func int Par_GetParserID(var string parName);

func int Par_GetSymbolID(var int parId, var string symName);

func int Par_GetSymbolLength(var int parId, var int symId);

func int Par_GetSymbolValueInt(var int parId, var int symId);

func float Par_GetSymbolValueFloat(var int parId, var int symId);

func string Par_GetSymbolValueString(var int parId, var int symId);

func instance Par_GetSymbolValueInstance(var int parId, var int symId);

func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId);

func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId);

func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueInt(var int value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueString(var string value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId);

func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId);

```
</details>
## Event functions and variables
On top of external functions, zParserExtender also adds functi
<details>
  <summary>Show code</summary>
```c++
func event GameLoop()

func event GameInit()

const instance null

const float nan


```
</details>
