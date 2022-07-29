# Hooking Daedalus
Daedalus hooking is one of the most powerful features of this plugin. Hooking is a mechanism that allows you replace any scripted object with new one. To do thos, you must define a new object with the same type, name and in the same [namespace](zPE_namespaces.md).

Hook/replacement will be performed only, if the `MergeMode` setting is set to true for the current script in the META block, or in the the parameter of the same name in the `.ini` file of the mod.

!!! warning
    If you forget to turn on the `MergeMode`, the compilation will fail with the redefinition error.

When an object (instanc, function or variable) is hooked/replaced, the original one is available under the same name with the `_old` suffix (`PC_Hero` -> `PC_Hero_old`), this allows you to refer to the old object.

## Function hook example
```c++
void void ZS_Attack_Loop()
{
    // if the enemy is a player and has no weapon, then
    // also sheath the weapon.
    if (Npc_IsPlayer(other) && !Npc_HasReadiedWeapon(other))
    {
      return LOOP_END;
    };

    // otherwise call the original function
    return ZS_Attack_Loop_Old();
};
```

This kind of substitution works for instances and variables too.

!!! warning
    While hooking instances, you have to take care not to call the prototype. Prototype should be always changed back to the original class.
  
    
    ```c++ title="This is wrong"
    instance pc_hero(Npc_Default)
    {
        pc_hero_old();
        name = "Pepe";
    };
    ```
    This leads to a double call of `prototype Npc_Default` which is considered an unsafe practice with undefined behaviour.

The correct way is to call it like this:
```c++
instance pc_hero(C_NPC) // no prototype Npc_Default
{
    pc_hero_old();
    name = "Pepe";
};  
```
This way the prototype is called in the original function `pc_hero_old()` and not for the second time, when creating the new hooked instance.

## Dialogue hook example

The hooking mechanism is designed to introduce new dialogues into the game, as well as to replace old ones with hooks. The scripter can create new merchants, quests, dialogues, as well as attach svm phrases to them.
  
All new or replaced dialogues will immediately become available, including from saves. In the event that new dialogs are disabled (plugin or script removed), the engine will continue to keep them in the save file, which will allow the dialogs to return at any time with the same state they were in the last time.

!!! warning
    Currently not working as intended (I think). The old dialogue is still used and as a result you will end up with both the old and the new dialogue (unless you edit the old condition function).
  
```c++
instance DIA_XARDAS_HELLO(C_INFO)
{
    DIA_XARDAS_HELLO_old();
    important = FALSE;
};
```
  