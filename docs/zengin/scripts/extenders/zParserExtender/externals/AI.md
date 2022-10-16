# AI - functions for working with AI
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

func c_trigger ai_getnexttriggerbyfunc(var c_trigger starttrigger, var func function) {};

func c_triggetr ai_getnexttriggerbyfuncname(var c_trigger starttrigger, var string functionname) {};

func c_triggetr ai_getnexttriggerbyself(var c_trigger starttrigger, var c_npc self) {};

func c_triggetr ai_getnexttriggerbyother(var c_trigger starttrigger, var c_npc other) {};

func c_triggetr ai_getnexttriggerbyvictim(var c_trigger starttrigger, var c_npc victim) {};

func c_triggetr ai_getnexttriggerbynpcs(var c_trigger starttrigger, var c_npc self, var c_npc other, var c_npc victim) {};

```
