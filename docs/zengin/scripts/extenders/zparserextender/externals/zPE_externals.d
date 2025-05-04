// zParserExtender externals with docu comments for DLS implementation
// documentation links lead to the Gothic Modding Community documentation github page
//
// zParserExtender: https://github.com/Gratt-5r2/zparserextender
// GMC: https://github.com/Gothic-Modding-Community/gmc

// =========================================================
//
//  AI functions
//
// =========================================================

/// Adds a `funcName` function call to the AI queue
///
/// @param funcName name of the function to be called
/// @param slf will be inserted into global `self` instance
/// @param oth will be inserted into global `other` instance
func void AI_CallScript(var string funcName,
                        var C_NPC slf,
                        var C_NPC oth) {};

/// Creates a trigger script that calls function `funcName` once every `interval` in milliseconds
///
/// @param funcName name of the function to be called
/// @param interval call period in milliseconds
/// @return created C_Trigger instance
func C_Trigger AI_startTriggerScript(var string funcName, var int interval) {};

/// Extended version call - Creates a trigger script, that calls function `funcName` once every
/// `interval` in milliseconds also updates the `self`, `other` and `victim` global instances
/// based on `slf`, `oth` and `vct` parameters respectively
/// 
/// @param funcName name of the function to be called
/// @param interval call period in milliseconds
/// @param slf will be inserted into global `self` instance
/// @param oth will be inserted into global `other` instance
/// @param vct will be inserted into global `victim` instance
/// @return created C_Trigger instance
func C_Trigger AI_startTriggerScriptEx( var string funcName,
                                        var int interval,
                                        var C_NPC slf,
                                        var C_NPC oth,
                                        var C_NPC vct) {};

/// Returns a C_Trigger instance from the array of active triggers by the array index `ID`
///
/// @param ID array id
/// @return active C_Trigger instance
func C_Trigger AI_GetTriggerByID(var int ID) {};

/// Returns the number of active C_Trigger scripts
///
/// @return number of active C_Trigger scripts
func int AI_GetTriggersNum() {};

const int selfID   = 0;
const int otherID  = 1;
const int victimID = 2;

/// Returns the npc associated with the C_Trigger script based on the ID
/// selfID   = 0;
/// otherID  = 1;
/// victimID = 2;
///
/// @param trigger C_Trigger script
/// @param npcID [selfID, otherID, victimID] NPC id
/// @return active C_Trigger instance
func C_NPC AI_GetTriggerNPC(var C_Trigger trigger, var int npcID) {};

/// Returns the function associated with the specified C_Trigger
///
/// @param trigger C_Trigger script
/// @return trigger function
func func AI_GetTriggerFunc(var C_Trigger trigger) {};

/// Returns the function name of a function associated with the specified C_Trigger
///
/// @param trigger C_Trigger script
/// @return active C_Trigger instance
func string AI_GetTriggerFuncName(var C_Trigger trigger) {};

/// Returns the next trigger in the active trigger array based on the trigger function,
/// starting on the `startTrigger` trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param function function to be matched
/// @return C_Trigger instance
func C_Trigger Ai_GetNextTriggerByFunc(var C_Trigger startTrigger, var func function) {};

/// Returns the next trigger in the active trigger array based on the trigger function
/// name, starting on the `startTrigger` trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param functionName name of a function to be matched
/// @return C_Trigger instance
func C_Trigger Ai_GetNextTriggerByFuncName(var C_Trigger startTrigger, var string functionName) {};

/// Returns the next trigger in the active trigger array based on the `self` trigger
/// parameter, starting on the `startTrigger` instance set in the trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param self C_NPC instance
/// @return C_Trigger instance
func C_Trigger Ai_GetNextTriggerBySelf(var C_Trigger startTrigger, var C_NPC self) {};

/// Returns the next trigger in the active trigger array based on the `other` trigger
/// parameter, starting on the `startTrigger` instance set in the trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param other C_NPC instance
/// @return C_Trigger instance
func C_Trigger Ai_GetNextTriggerByOther(var C_Trigger startTrigger, var C_NPC other) {};

/// Returns the next trigger in the active trigger array based on the `victim` trigger 
/// parameter, starting on the `startTrigger` instance set in the trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param victim C_NPC instance
/// @return C_Trigger instance
func C_Trigger Ai_GetNextTriggerByVictim(var C_Trigger startTrigger, var C_NPC victim) {};

/// Returns the next trigger in the active trigger array based on all the NPCs
/// set in the trigger script `self`, `other` and `victim`,
/// starting on the `startTrigger` instance set in the trigger
///
/// @param startTrigger C_Trigger script to start the search from
/// @param self self C_NPC instance
/// @param other other C_NPC instance
/// @param victim victim C_NPC instance
/// @return C_Trigger instance
func c_trigger Ai_GetNextTriggerByNPCs(var C_Trigger startTrigger,
                                        var C_NPC self,
                                        var C_NPC other,
                                        var C_NPC victim) {};


// =========================================================
//
//  CAST functions
//
// =========================================================

/// Converts memory address (pointer) to an instance
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


// =========================================================
//
//  HLP functions
//
// =========================================================

/// Returns `TRUE`, if a specified NPC has a Vob in focus
///
/// @param npc NPC
/// @return `TRUE` if npc has a focus Vob, `FALSE` if it does not
func int Hlp_HasFocusVob( var C_NPC npc ) {};

/// Returns NPC's focus Vob
///
/// @param npc NPC
/// @return focus vob
func instance Hlp_GetFocusVob( var C_NPC npc ) {};

/// Returns the name of NPC's focus vob
///
/// @param npc NPC
/// @return focus vob name
func string Hlp_GetFocusVobName( var C_NPC npc ) {};

/// Returns the length of a specified string
///
/// @return str input string
/// @return length of `str`
func int Hlp_GetStringLength( var string str ) {};

/// Checks whether floating point number is valid
///
/// @return `TRUE` if `value` is NaN, `FALSE` if `value` is a valid floating point number
func int IsNAN( var float value ) {};

/// Checks whether `key` is toggled
///
/// @param key key code
/// @return `TRUE` if key is toggled, `FALSE` if key is not toggled
func int Hlp_KeyToggled( var int key ) {};

/// Checks whether `key` is pressed
///
/// @param key key code
/// @return `TRUE` if key is pressed, `FALSE` if key is not pressed
func int Hlp_KeyPressed( var int key ) {};

/// Checks whether logical `key` is toggled
///
/// @param key key code
/// @return `TRUE` if key is toggled, `FALSE` if key is not toggled
func int Hlp_LogicalKeyToggled( var int key ) {};

/// Checks whether the game is paused
///
/// @return `TRUE` if the game is paused, `FALSE` if the game is not paused
func int Hlp_GameOnPause() {};

/// Opens a message box with a specified message
///
/// @param message message to be printed
func void Hlp_MessageBox( var string message ) {};

/// Prints a message to the Union debug console
///
/// @param message message to be printed
func void Hlp_PrintConsole(var string message) {};

/// Checks whether the `entry` in `section` in `.ini` file `optName` exists
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[GAME]`
/// @param entry one setting entry like `playLogoVideos`
/// @return `TRUE` if the option exists, `FALSE` if the option does not exist
func int Hlp_OptionIsExists(var string optName, var string section, var string entry) {};

/// Read an integer value from specified `.ini` file, section and entry.
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[GAME]`
/// @param entry one setting entry like `playLogoVideos`
/// @param default default value - if the value is empty
/// @return the option value
func int Hlp_ReadOptionInt(var string optName, var string section, var string entry, var int default) {};

/// Read a floating point value from specified `.ini` file, section and entry.
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[INTERFACE]`
/// @param entry one setting entry like `scale`
/// @param default default value - if the value is empty
/// @return the option value
func float Hlp_ReadOptionFloat(var string optName, var string section, var string entry, var float default) {};

/// Read a string value from specified `.ini` file, section and entry.
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[INTERFACE]`
/// @param entry one setting entry like `scale`
/// @param default default value - if the value is empty
/// @return the option value
func string Hlp_ReadOptionString(var string optName, var string section, var string entry, var string default) {};

/// Writes an integer value to specified `.ini` file, section and entry.
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[INTERFACE]`
/// @param entry one setting entry like `scale`
/// @param value value to be written
func void Hlp_WriteOptionInt(var string optName, var string section, var string entry, var int value) {};

/// Writes a floating point value to specified `.ini` file, section and entry.
///
/// `optName` values
/// - `Gothic`
/// - `Mod`
/// - `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[INTERFACE]`
/// @param entry one setting entry like `scale`
/// @param value value to be written
func void Hlp_WriteOptionFloat(var string optName, var string section, var string entry, var float value) {};

/// Writes a string value to specified `.ini` file, section and entry.
///
/// `optName` values: `Gothic`, `Mod`, `SystemPack`
///
/// @param optName the `.ini` file
/// @param section settings section like `[INTERFACE]`
/// @param entry one setting entry like `scale`
/// @param value value to be written
func void Hlp_WriteOptionString(var string optName, var string section, var string entry, var string value) {};

/// Returns the name of the current Steam user
/// Returns empty string when not run with Steam
///
/// @return string containing the Steam username, or an empty string
func string Hlp_GetSteamPersonalName() {};

// =========================================================
//
//  LOG functions
//
// =========================================================

/// Returns the status of diary topic
/// `-1` - Not found
/// `0` - Free
/// `1` - Running
/// `2` - Success
/// `3` - Failure
/// `4` - Obsolete
///
/// @param topic name of the topic
/// @return topic status
func int Log_GetTopicStatus(var string topic) {};

/// Returns the topic the diary topic is in
/// `-1` - Not found
/// `0` - Missions
/// `1` - Notes
/// `2` - All
///
/// @param topic name of the topic
/// @return topic section
func int Log_GetTopicSection(var string topic) {};

// =========================================================
//
//  MDL functions
//
// =========================================================

/// Returns animation's index for specified NPC based on animation's name
///
/// @param npc NPC with the animation
/// @param ani_name name of the animation in uppercase
/// @return animation index
func int Mdl_GetAnimationIndex( var C_NPC npc, var string ani_name ) {};

/// Returns animation's name for specified NPC based on animation's index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return animation name
func string Mdl_GetAnimationName( var C_NPC npc, var int ani_index ) {};

/// Checks whether animation exists
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return animation name
func int Mdl_AnimationIsExists( var C_NPC npc, var int ani_index ) {};

/// Checks whether animation is active (whether it is currently played)
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @return `TRUE` if the animation is playing, `FALSE` if it is not playing
func int Mdl_AnimationIsActive( var C_NPC npc, var int ani_index ) {};

/// Set framerate for all animations
///
/// @param npc NPC with the animation
/// @param fps framerate
func void Mdl_SetAllAnimationsFPS( var C_NPC npc, var float fps ) {};

/// Reset framerate for all animations to default value
///
/// @param npc NPC with the animation
func void Mdl_ResetAllAnimationsFPS( var C_NPC npc ) {};

/// Set framerate for animation specified by animation index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
/// @param fps framerate
func void Mdl_SetAnimationFPS( var C_NPC npc, var int ani_index, var float fps ) {};

/// Reset framerate to default for animation specified by animation index
///
/// @param npc NPC with the animation
/// @param ani_index animation index
func void Mdl_ResetAnimationFPS( var C_NPC npc, var int ani_index ) {};

/// Set NPCs visibility
///
/// @param npc specified NPC
/// @param isVisible [TRUE, FALSE] `TRUE` - visible, `FALSE` - invisible
func void Mdl_SetVisible( var C_NPC npc, var int isVisible ) {};

/// Applies or moves existing overlay to the top of the list
///
/// @param mdsName name of the overlay
func void Mdl_ApplyOverlayMds_AtFirst( var string mdsName ) {};

/// Sets a multiplier for animation speed
/// 1.0 = 100% speed (normal speed)
///
/// @param npc npc to be affected
/// @param multiplier speed of the animation
func void Mdl_SetNpcSpeedMultiplier( var C_Npc npc, var float multiplier ) {};

/// Resets the animation speed of an NPC
///
/// @param npc npc to be affected
func void Mdl_ResetNpcSpeedMultiplier( var C_Npc npc ) {};

// =========================================================
//
//  MENU functions
//
// =========================================================

/// Find all C_MenuItem object instances by the mask and automatically places them in the current menu instance
/// 
/// @param mask regex like mask for searching
/// [Menu_SearchItems on GMC](https://gothic-modding-community.github.io/gmc/zengin/scripts/extenders/zparserextender/externals/menu/)
func void Menu_SearchItems( var string mask ) {};

// =========================================================
//
//  MOB functions
//
// =========================================================

/// Marks oCMOB as destroyed, changes the visual to visualDestroyed (if present).
///
/// @param object oCMOB to be destroyed
func void Mob_Destroy( var instance object ) {};

/// Removes an item from a oCMobContainer
///
/// @param object oCMobContainer object
/// @param item {C_ITEM} item to be removed
func void Mob_RemoveItem( var instance object, var int item ) {};

/// Removes specified number of items from a oCMobContainer
///
/// @param object oCMobContainer object
/// @param item {C_ITEM} item to be removed
/// @param cnt number of items to be removed
func void Mob_RemoveItems( var instance object, var int item, var int cnt ) {};

/// Inserts an item into a oCMobContainer
///
/// @param object oCMobContainer object
/// @param item {C_ITEM} item to be inserted
func void Mob_InsertItem( var instance object, var int item ) {};

/// Inserts specified number of items into a oCMobContainer
///
/// @param object oCMobContainer object
/// @param item {C_ITEM} item to be inserted
/// @param cnt number of items to be inserted
func void Mob_InsertItems( var instance object, var int item, var int cnt ) {};

/// Returns a lock combination of a oCMobContainer
///
/// @param object oCMobContainer object
/// @return lock combination
func string Mob_GetLockCombination( var instance object ) {};

/// Sets a lock combination to a oCMobContainer
///
/// @param object oCMobContainer object
/// @param comb lock combination
func void Mob_SetLockCombination( var instance object, var string comb ) {};

/// Returns `TRUE` if the object is locked
///
/// @param object oCMobLockable object
/// @return `TRUE` if locked, `FALSE` if unlocked
func int Mob_IsLocked( var instance object ) {};

/// Set the lock status of the object
///
/// @param object oCMobLockable object
/// @param locked [TRUE, FALSE] lock or unlock the object
func void Mob_SetLocked( var instance object, var int locked ) {};

/// Returns the key instance, that unlocks the object
///
/// @param object oCMobLockable object
/// @return the key C_ITEM instance
func instance Mob_GetKeyInstance( var instance object ) {};

/// Stets the key instance, that unlocks the object
///
/// @param object oCMobLockable object
/// @param key the key C_ITEM instance
func void Mob_SetKeyInstance( var instance object, var int key ) {};

// =========================================================
//
//  NPC functions
//
// =========================================================

/// Changes players character to specified `npc`
///
/// @param npc NPC to be set as players character
func void Npc_SetAsHero( var C_NPC npc ) {};

/// Opens NPCs main inventory
///
/// @param npc NPC
func void Npc_OpenInventory( var C_NPC npc ) {};

/// Opens the steal inventory of `npc`'s focus NPC
///
/// @param npc NPC
func void Npc_OpenInventorySteal( var C_NPC npc ) {};

/// Start the trading dialogue with specified NPC
///
/// @param npc NPC
func void Npc_OpenInventoryTrade( var C_NPC npc ) {};

/// Returns an item in NPC's left hand slot
///
/// @param npc npc to be affected
/// @return found C_ITEM instance
func C_Item Npc_GetLeftHandItem( var C_Npc npc ) {};

/// Returns an item in NPC's right hand slot
///
/// @param npc npc to be affected
/// @return found C_ITEM instance
func C_Item Npc_GetRightHandItem( var C_Npc npc ) {};

/// Returns an item from a slot with the slotName
///
/// @param npc npc to be affected
/// @param slotName name of the slot
/// @return found C_ITEM instance
func C_Item Npc_GetSlotItem( var C_Npc npc, var string slotName ) {};

/// Places an instance of the oCVom class (including items and NPCs) object into the slotName of the NPC
/// The copyInInv parameter determines whether a copy of the object should remain in the character's inventory
///
/// @param npc npc to remove the item from
/// @param slotName name of the slot from which to remove the item
/// @param object object to be inserted into the slot
/// @param copyInInv should a copy of the object stay in character inventory
func void Npc_PutInSlot(var C_Npc npc, var string slotName, var instance object, var int copyInInv) {};

/// Removes an object from the slotName of the NPC.
/// The dropIt parameter in Gothic 2 defines, whether object should drop out of the slot. In Gothic 1, this parameter is reserved and must be 0.
///
/// @param npc npc to remove the item from
/// @param slotName name of the slot from which to remove the item
/// @param dropIt should the object be dropped
func void Npc_RemoveFromSlot(var C_Npc npc, var string slotName, var int dropIt) {};

// =========================================================
//
//  PAR functions
//
// =========================================================

/// Returns a parser ID of the parser with a `parName` name
///
/// Parser names:
/// - "Game"
/// - "SFX"
/// - "PFX"
/// - "VFX"
/// - "Camera"
/// - "Menu"
/// - "Music"
/// 
/// @param parName parser name
/// @return parser ID
func int Par_GetParserID(var string parName) {};

/// Returns symbol ID for the symbol specified by its name
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol ID
func int Par_GetSymbolID(var int parId, var string symName) {};

/// Returns symbol length (number of elements)
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol length
func int Par_GetSymbolLength(var int parId, var int symId) {};

/// Returns the integer value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func int Par_GetSymbolValueInt(var int parId, var int symId) {};

/// Returns the float value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func float Par_GetSymbolValueFloat(var int parId, var int symId) {};

/// Returns the string value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func string Par_GetSymbolValueString(var int parId, var int symId) {};

/// Returns the instance value of specified symbol
///
/// @param parID parser ID
/// @param symName symbol name
/// @return symbol value
func instance Par_GetSymbolValueInstance(var int parId, var int symId) {};

/// Returns the value of specified integer array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func int Par_GetSymbolValueIntArray(var int parId, var int symId, var int arrayId) {};

/// Returns the value of specified float array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func float Par_GetSymbolValueFloatArray(var int parId, var int symId, var int arrayId) {};

/// Returns the value of specified string array at the `arrayID` index
///
/// @param parID parser ID
/// @param symName symbol name
/// @param arrayID array index
/// @return value
func string Par_GetSymbolValueStringArray(var int parId, var int symId, var int arrayId) {};

/// Sets a new integer value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueInt(var int value, var int parId, var int symId) {};

/// Sets a new float value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueFloat(var float value, var int parId, var int symId) {};

/// Sets a new string value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueString(var string value, var int parId, var int symId) {};

/// Sets a new instance value to specified symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
func void Par_SetSymbolValueInstance(var instance value, var int parId, var int symId, var int arrayId) {};

/// Sets a new integer value to specified integer array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueIntArray(var int value, var int parId, var int symId, var int arrayId) {};

/// Sets a new float value to specified float array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueFloatArray(var float value, var int parId, var int symId, var int arrayId) {};

/// Sets a new string value to specified string array symbol
///
/// @param value value to be set
/// @param parID parser ID
/// @param symId symbol ID
/// @param arrayId array index
func void Par_SetSymbolValueStringArray(var string value, var int parId, var int symId, var int arrayId) {};

// =========================================================
//
//  String functions
//
// =========================================================

/// Returns formatted string using format specifiers
/// 
/// Format specifiers:
/// %s - inserts a string
/// %i - inserts an integer number
/// %x - inserts an integer in hexadecimal
/// %f - inserts a floating point number
/// %b - inserts a logical expression
/// %p - inserts a pointer
/// 
/// @return formatted string
//TODO: func string Str_Format( var string format, ... ) {};

/// Returns a string in the current language, otherwise in English.
/// Arguments MUST be encoded in UTF-8! The result string will be converted to appropriate ANSI string.
///
/// @param russian Russian string
/// @param english English string
/// @param german  German string
/// @param polish  Polish string
///
/// @return string in the current language
func string Str_GetLocalizedString( var string russian,
                                    var string english,
                                    var string german,
                                    var string polish ) {};

/// Returns a string in the current language, otherwise in English.
/// Offers additional languages
///
/// @param russian  Russian string
/// @param english  English string
/// @param german   German string
/// @param polish   Polish string
/// @param romanian Romanian string
/// @param italian  Italian string
/// @param czech    Czech  string
/// @param spanish  Spanish string
///
/// @return string in the current language
func string Str_GetLocalizedStringEx(   var string russian,
                                        var string english,
                                        var string german,
                                        var string polish,
                                        var string romanian,
                                        var string italian,
                                        var string czech,
                                        var string spanish ) {};

/// Converts UTF-8 string into an ANSI string with codePage
///
/// @param utf8 string encoded in UTF8
/// @param codePage codePage id, can be obtained from Str_GetCurrentCP 
func string Str_UTF8_to_ANSI( var string utf8, var int codePage ) {};

/// Return the code page corresponding to the current language set in the Union System
///
/// @return code page corresponding to the current language
func int Str_GetCurrentCP() {};

/// Returns the length of a string
///
/// @param str string to be measured
/// @return length of the string
func int Str_GetLength( var int str ) {};

// =========================================================
//
//  VOB functions
//
// =========================================================

/// Returns the current position of the object in the world
/// 
/// @param vob vob to ge the position of
/// @return C_Position instance - position of the VOB
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
func C_MobInter_Data Vob_GetMobInterData( var C_Vob mobInter ) {};

/// Sets the data of the oCMobInter object
///
/// @param mobInter oCMobInter object
/// @param data C_MobInter_Data of the object
func void Vob_SetMobInterData( var C_Vob mobInter, var C_MobInter_Data data ) {};

/// Returns the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// return C_MobLockable_Data of the object
func C_MobLockable_Data Vob_GetMobLockableData( var C_Vob mobLock ) {};

/// Sets the data of the oCMobLockable object
///
/// @param mobLock oCMobLockable object
/// @param data C_MobLockable_Data of the object
func void Vob_SetMobLockableData( var C_Vob mobLock, var C_MobLockable_Data data ) {};

// =========================================================
//
//  WLD functions
//
// =========================================================

/// Trigger level change.
///
/// @param world name of the world 
/// @param waypoint target waypoint
func void Wld_ChangeLevel( var string world, var string waypoint ) {};

/// Return the VOB instance based on its name.
///
/// @param vobname name of the vob
/// @param return zCVob pointer
func instance Wld_FindVob( var string vobname ) {};

/// Play a visual effect at specified vob
///
/// @param effect effect name
/// @param pvob Vob to play the effect at
/// @param level effect level
/// @param damage damage amount
/// @param damage_type damage type
/// @param damage_speed damage interval
func void Wld_PlayEffectVob(    var string effect,
                                var instance pvob,
                                var int level,
                                var int damage,
                                var int damage_type,
                                var int damage_speed ) {};

/// Play a visual effect at specified world coordinates
///
/// @param effect effect name
/// @param coord world coordinates to play the effect at
/// @param level effect level
/// @param damage damage amount
/// @param damage_type damage type
/// @param damage_speed damage interval
func void Wld_PlayEffectAt( var string effect,
                            var instance coord,
                            var int level,
                            var int damage,
                            var int damage_type,
                            var int damage_speed ) {};

/// Turns on the rain
///
/// @param weight the strength of the rain
/// @param time rain duration
func void Wld_ToggleRain( var float weight, var float time ) {};

/// Sets the weather type.  
/// Types:
/// 
/// `0` - snow
/// `1` - rain
///
/// @param type weather type
func void Wld_SetWeatherType( var int type ) {};

/// Returns the weather type.  
/// Types:
/// 
/// `0` - snow
/// `1` - rain
///
/// @return weather type
func int Wld_GetWeatherType() {};