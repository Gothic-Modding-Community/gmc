# AI - functions for working with AI
Functions to work with the new `C_Trigger` class and NPC's AI queue.




```c++
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
