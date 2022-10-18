# Trigger functions and the `C_Trigger` class
zParserExtender also implements cyclical functions called triggers - not to e confused with triggers in ZEN files, similar to a part of the functionality implemented in [LeGo AI_Functions](../../../../notready.md). These functions are called independently after a specified period of time. These triggers can also store user information. Up to 16 int variables can be stored in each trigger as well as `self`, `other` and `victim` instances.

## Class definition
To define a trigger, the `C_Trigger` class is used:

```dae
/// Union zPraserExtender Trigger class
class C_Trigger
{
    var int Delay; // defines the frequency (in miliseconds) at which the function will be called.
    var int Enabled; // determines if the trigger is active. If the value is equal to zero, the trigger is destroyed.
    var int AIVariables[16]; // user data, which can be set independently when creating trigger (yes, you can write there absolutely everything you want).

    // Hidden variable members
    /*
     - Func   - The function that the trigger will call.
     - Self   - The NPC that will be placed in `self` when the function is called.
     - Other  - An NPC that will be placed in `other` when the function is called.
     - Victim - The NPC that will be placed in `victim` when the function is called.
    */
};
```

## Creating instances
There are two [external functions](externals.md#ai-functions-for-working-with-ai)

```dae
// function returns a trigger with no NPC (self, other or victim) bound to it
func C_Trigger AI_StartTriggerScript( var string funcName,
                                      var int delay)

// function is extended, if certain participants need to be assigned to it
func C_Trigger AI_StartTriggerScriptEx( var string funcName,
                                        var int delay,
                                        var C_Npc slf,
                                        var C_Npc oth,
                                        var C_Npc vct) 
```

Both of these functions return an instance of `C_Trigger`. You can of course configure the instance after its creation. You can, for example, fill in the `AIVariables` with relevant data. The trigger function has the required signature if 'func int f()'. It must return a value indicating the state of the loop. If the function returns `LOOP_END` the trigger will be stopped and the instance deleted. If `LOOP_CONTINUE` is returned, the function will be called again after `Delay` ms have passed.

## Poison example

```dae
// Implement a trigger to simulate the effect of poison debuff:
// Let's create a trigger on function `c_loop` with a call interval of 1 second.
// When the function is called, the instance hero will be placed in self (although it can be any other NPC if desired).
// The rest of the instances are left null (not used).

var C_Trigger trigger;
trigger = AI_StartTriggerScriptEx("c_loop", 1000, hero, null, null);
trigger.AIVariables[0] = 15; // how many times the function should be called
trigger.AIVariables[1] = 5;  // how much damage to deal each iteration
```

The trigger function

```dae
func int c_loop()
{
    // Create a loop end check, if the number of
    // available iterations has reached 0. If it did
    // we stop the trigger by returning the LOOP_END value.
    if (SelfTrigger.AIVariables[0] <= 0)
    {
        return Loop_end;
    };
    
    SelfTrigger.Delay -= 20;         // Accelerate loop each call by 20 ms
    SelfTrigger.AIVariables[0] -= 1; // Reduce number of remaining repeats
    self.Attribute[ATR_HITPOINTS] -= SelfTrigger.AIVariables[1]; // Take health from self
    return LOOP_CONTINUE;
};
```
## Trigger scope

Triggers can be divided into two types:

- Global trigger ( AI_StartTriggerScript )</br>
trigger created using this function works in all worlds. A trigger is considered global by default if neither `self` nor `other` nor `victim` has been provided for it.
- Local trigger ( AI_StartTriggerScriptEx)</br>
trigger created with this function only works in the world in which it was created. A trigger is considered local if it has been presented with at least one NPC in `self`, `other` or `victim` (not null). If you want to create a trigger without linking it to any NPC, it is recommended to simply pass hero as `self` to the trigger.

## Saving
The plugin creates a new save archive to save the information of the triggers that does not conflict with any of the built-in save files.

## Searching
To search for a specific trigger, for example by NPC, the [trigger external functions](externals.md#ai-functions-for-working-with-ai) can be used.

```dae
// This way you can disable all triggers running on the `hero` instance
var C_Trigger trigget = FirstTrigger;
var C_Trigger trigget_saved;
while (!Hlp_IsNULL(trigget))
{
    trigget_saved = trigger;
    trigger = AI_GetNextTriggerBySelf(hero);
    trigget_saved.Enabled = false;
};
```
