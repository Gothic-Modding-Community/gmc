# External functions
External functions are Daedalus functions (defined in the engine itself) used to interface with the engine. zParseExtender adds a rather huge amount of new functions that help scripters to interface with the engine in more ways than what was possible before without script extenders such as Ikarus and LeGo.

## CAST data type conversion functions
External functions for data type conversion and pointer casting.

```dae
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

## HLP help functions
Helper functions used for safety checks or to get specific information from the engine.

```dae
func int Hlp_HasFocusVob( var C_NPC npc ) {};

func instance Hlp_GetFocusVob( var C_NPC npc ) {};

func string Hlp_GetFocusVobName( var C_NPC npc ) {};

func int Hlp_GetStringLength( var string str ) {};

func int IsNAN( var float value ) {};

func int Hlp_KeyToggled( var int key ) {};

func int Hlp_KeyPressed( var int key ) {};

func int Hlp_LogicalKeyToggled( var int key ) {};

func int Hlp_GameOnPause() {};

func void Hlp_MessageBox( var string message ) {};

func void Hlp_PrintConsole(var string message) {};

func int Hlp_ReadOptionInt(var string optName, var string section, var string entry, var int default) {};

func float Hlp_ReadOptionFloat(var string optName, var string section, var string entry, var float default) {};

func string Hlp_ReadOptionString(var string optName, var string section, var string entry, var string default) {};

func int Hlp_OptionIsExists(var string optName, var string section, var string entry) {};

func void Hlp_WriteOptionInt(var string optName, var string section, var string entry, var int value) {};

func void Hlp_WriteOptionFloat(var string optName, var string section, var string entry, var float value) {};

func void Hlp_WriteOptionString(var string optName, var string section, var string entry, var string value) {};
```

## WLD world manipulation functions
Functions related to the world. 

```dae
func void Wld_ChangeLevel( var string world, var string waypoint ) {};

func instance Wld_FindVob( var string vobname ) {};

func void Wld_PlayEffectVob(    var string effect,
                                var instance pvob,
                                var int level,
                                var int damage,
                                var int damage_type,
                                var int damage_speed ) {};

func void Wld_PlayEffectAt(     var string effect,
                                var instance coord,
                                var int level,
                                var int damage,
                                var int damage_type,
                                var int damage_speed ) {};

func void Wld_ToggleRain( var float weight, var flaot time ) {};

func void Wld_SetWeatherType( var int type ) {};

func int Wld_GetWeatherType() {};
```

## MDL model functions
Functions to tweak animation and other model related settings.

```dae
func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};

func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};

func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};

func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};

func float Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};

func float Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};

func float Mdl_SetAnimationFPS( var C_NPC npc, var int idx, var float fps ) {};

func float Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};

func void Mdl_SetVisible( var C_NPC npc, var int isVisible ) {};

/// Applies or moves existing overlay to the top of the list
///
/// @param mdsName name of the overlay
func void Mdl_ApplyOverlayMds_AtFirst( var string mdsName ) {};

/// Sets a multipler for animation speed
/// 1.0 = 100% speed (normal speed)
///
/// @param npc npc to be affected
/// @param multiplier speed of the animation
func void Mdl_SetNpcSpeedMultiplier( var C_Npc npc, var float multiplier ) {};

/// Resets the animation speed of an NPC
///
/// @param npc npc to be affected
func void Mdl_ResetNpcSpeedMultiplier( var C_Npc npc ) {};

```

## NPC character functions
NPC related functions.

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

## MOB interactive object functions
Functions to manipulate interactive objects like destroying MOBs, setting lockpick combination and such.

```dae
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

## AI functions for working with AI
Functions to work with the new `C_Trigger` class and NPC's AI queue.

```dae
func void AI_CallScript(var string funcName, var C_Npc slf, var C_Npc oth) {};

func C_Trigger AI_StartTriggerScript(var string funcName, var int delay) {};

func C_Trigger AI_StartTriggerScriptEx(var string funcName, var int delay, var C_Npc slf, var C_Npc oth, var C_Npc vct) {};

const int selfID   = 0;
const int otherID  = 1;
const int victimID = 2;

func int Hlp_IsNULL(var instance pointer) {};

func C_Trigger AI_GetTriggerByID(var int ID) {};

func int AI_GetTriggersNum() {};

func C_Trigger AI_GetTriggerNPC(var int npcID) {};

func func AI_GetTriggerFunc(var C_Trigger trigger) {};

func string AI_GetTriggerFuncName(var C_Trigger trigger) {};

AI_GetNextTriggerByFunc(var C_Trigger startTrigger, var func function) {};

AI_GetNextTriggerByFuncName(var C_Trigger startTrigger, var string functionName) {};

AI_GetNextTriggerBySelf(var C_Trigger startTrigger, var C_Npc self) {};

AI_GetNextTriggerByOther(var C_Trigger startTrigger, var C_Npc other) {};

AI_GetNextTriggerByVictim(var C_Trigger startTrigger, var C_Npc victim) {};

AI_GetNextTriggerByNPCs(var C_Trigger startTrigger, var C_Npc self, var C_Npc other, var C_Npc victim) {};


/// Returns the name of the current Steam user
/// Returns empty string when not run with Steam
///
/// @return string containing the Steam username, or empty string
func string Hlp_GetSteamPersonalName() {};

```

## PAR functions for parser manipulation
Parser functions are used to manipulate the parsers. Retrieve SymbolID, access arrays and such.

```dae
func int Par_GetParserID(var string parName) {};

func int Par_GetSymbolID(var int parId, var string symName) {};

func int Par_GetSymbolLength(var int parId, var int symId) {};

func int Par_GetSymbolValueInt(var int parId, var int symId) {};

func float Par_GetSymbolValueFloat(var int parId, var int symId) {};

func string Par_GetSymbolValueString(var int parId, var int symId) {};

func instance Par_GetSymbolValueInstance(var int parId, var int symId) {};

func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId) {};

func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId) {};

func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueInt(var int value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueString(var string value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId) {};

func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId) {};
```

## VOB functions for object manipulation
VOB functions allow you to manipulate game world objects.

```dae
/// Returns the current position of the object in the world
/// 
/// @param vob vob to ge the position of
/// @return C_Position instace - position of the VOB
func C_Position Vob_GetVobPosition( var C_Vob vob ) {};

/// Sets the current position of the object in the world
/// 
/// @param vob vob to get the position of
/// @param pos new position of the vob
func void Vob_SetVobPosition( var C_Vob vob, var C_Position pos ) {};

/// Returns the universal data of the zCVob object
///
/// @param vob VOB to get the position of
/// @return general vob data C_Vob_Data
func C_Vob_Data Vob_GetVobData( var C_Vob vob ) {};

/// Sets the universal data to a zCVob object
///
/// @param vob VOB to get the position of
/// @param data general vob data C_Vob_Data
func void Vob_SetVobData( var C_Vob vob, var C_Vob_Data data ) {};

/// Returns zCVobLight object data
///
/// @param vobLight vobLight object
/// @return C_Light_Data of the light
func C_Light_Data Vob_GetLightData( var C_Vob vobLight ) {};

/// Sets the data of a zCVobLight object
///
/// @param vobLight object to apply the light data to
/// @param data C_Light_Data light data to be set
func void Vob_SetLightData( var C_Vob vobLight, var C_Light_Data data ) {};

/// Clears the list of animation colours for the light source
///
/// @param vobLight light vob
func void Vob_ClearLightAniList( var C_Vob vobLight ) {};

/// Adds a color to the colour list
///
/// @param vobLight object to apply the colour to
/// @param col colour to be applied
func void Vob_AddLightAniColor( var C_Vob vobLight, var C_Color col ) {};

/// Adds a color to the colour list
///
/// @param vobLight object to apply the colour to
/// @param r red colour channel
/// @param g green colour channel 
/// @param b blue colour channel
func void Vob_AddLightAniColorRGB(  var C_Vob vobLight,
                                    var int r,
                                    var int g,
                                    var int b ) {};

/// Returns the data of the oCMOB object
///
/// @param mob oCMOB object
/// @return mob data
func C_Mob_Data Vob_GetMobData( var C_Vob mob ) {};

/// Sets the data of the oCMOB object
///
/// @param mob oCMOB object
/// @param data C_Mob_Data to be set 
func void Vob_SetMobData( var C_Vob mob, var C_Mob_Data data ) {};

/// Returns the data of the oCMobInter object
///
/// @param mobInter oCMobInter object
/// @return MobInter_Data of the object
func MobInter_Data Vob_GetMobInterData( var C_Vob mobInter ) {};

/// Sets the data of the oCMobInter object
///
/// @param mobInter oCMobInter object
/// @param data MobInter_Data of the object
func void Vob_SetMobInterData( var C_Vob mobInter, var C_MobInter_Data data ) {};

/// Returns the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// @param data MobInter_Data of the object
func C_MobLockable_Data Vob_GetMobInterData( var C_Vob mobLock ) {};

/// Sets the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// @param data C_MobLockable_Data of the object
func void Vob_SetMobInterData( var C_Vob mobLock, var C_MobLockable_Data data ) {};
```

## String function
Functions to manipulate and format strings.

```dae
/// Returns formatted string using format specifiers
/// 
/// Format specifiers:
/// %s - inserts a string
/// %i - inserts a integer number
/// %x - inserts a integer in hexadecimal
/// %f - inserts a floating point number
/// %b - inserts a logical expression
/// %p - inserts a pointer
/// 
/// @return formatted string
func string Str_Format( var string format, ... ) {};

/// Returns a string in the current language, otherwise in English.
/// Arguments MUST be encoded in UTF-8! The result string will be converted to apropriate ANSI string.
///
/// @param russian Russian string
/// @param english English string
/// @param german  German string
/// @param polish  Polish string
///
/// @return string in the current language
func string Str_GetLocalizedString( var string russian, var string english, var string german, var string polish ) {};

/// Returns a string in the current language, otherwise in English.
/// Offers additional languages
///
/// @param russian  Russian string
/// @param english  English string
/// @param german   German string
/// @param polish   Polish string
/// @param czech    Czech  string
/// @param romanian Romanian string
/// @param italian  Italian string
/// @param spanish  Spanish string
///
/// @return string in the current language
func string Str_GetLocalizedStringEx( var string russian, var string english, var string german, var string polish, var string czech, var string romanian, var string italian, var string spanish ) {};

/// Converts UTF-8 string into an ANSI string with codePage
///
/// @param utf8 string encoded in UTF8
/// @param codePage codePage id, can be obtained from Str_GetCurrentCP 
func string Str_UTF8_to_ANSI( var string utf8, var int codePage ) {};

/// Return the code page corresponding to the current language set in the Union System
func int Str_GetCurrentCP() {};

/// Returns the length of a string
///
/// @param str string to be measured
/// @return length of the string
func int Str_GetLength( var int str ) {};
```

## Menu function

```dae
/// Find all C_MenuItem object instances by the mask and automatically places them in the current menu instance
/// 
/// @param mask regex like mask for searching
func void Menu_SearchItems( var string mask ) {};
```

## Log functions
As discussed on [Inside Gothic](), vanilla Gothic has no way of getting the status of a quest. These functions implement that functionality.

```dae
/// Returns the status of diary topic
/// Not found   - (-1)
/// Free        - 0
/// Running     - 1
/// Success     - 2
/// Failure     - 3
/// Obsolete    - 4
///
/// @param topic name of the topic
/// @return topic status
func int Log_GetTopicStatus(var string topic) {};

/// Returns the topic the diary topic is in
/// Not found   - (-1)
/// Missions    - 0
/// Notes       - 1
/// All         - 2
///
/// @param topic name of the topic
/// @return topic section
func int Log_GetTopicSection(var string topic) {};

```

## Event functions and variables
On top of external functions, zParserExtender also adds event functions and constants

```dae
func event GameLoop() {};

func event GameInit() {};

const instance null;

const float NaN;
```


