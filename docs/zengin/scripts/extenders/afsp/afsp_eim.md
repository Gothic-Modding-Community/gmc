# Enhanced Information Manager

!!! Warning
    This is a quick paste-in of and old version of AFSP's documentation and the information should be taken with a grain of salt. It may not be up-to-date since AFSP is being developed all the time and this is only a demo page.

Enhanced Information Manager allows you to more precisely control the Information Manager (dialogue manager). Change color, font and much more!
This package "scans" the dialogue string for modifiers and alters the string based on the modifiers you specify.

## Initialization
To use this feature you have to:

1. Add `_headers_G[1/2]_EnhancedInfoManager.src` or `_headers_G[1/2]_All.src` to your `Gothic.src` after Ikarus and LeGo initialization.
2. Call `G12_EnhancedInfoManager_Init();` from your `INIT_GLOBAL()` function in `Startup.d`

<!-- ## Features -->
<!-- * [Change colour](#change-colour) -->
<!-- * [Change font](#change-font) -->
<!-- * [Change text alignment](#change-text-alignment) -->
<!-- * [Disable dialogue](#disable-dialogue) -->
<!-- * [Text input field](#text-input-field) -->
<!-- * [Dialogue numbers](#dialogue-numbers) -->
<!-- * [Dialogue keyboard controls](#dialogue-keyboard-controls) -->
<!-- * [Spinners](#spinners) -->

## Change colour
Set font color for a dialogue choice.
```
h@[hex color value]
```
Set font color for highlighted dialogue choice.
```
hs@[hex color value]
```
```dae title="Example"
description = "h@2a85a3 hs@2ea9d1 This dialogue is blue.";
```

## Change font
Set font itself for a dialogue choice.
```
f@[font name]
```
Set font itself for highlighted dialogue choice.
```
fs@[font name]
```
```dae title="Example"
description = "f@font_old_20_white.tga fs@font_old_10_white.tga This dialogue has a different font, when selected.";
```

## Change text alignment
Align text left.
```
al@
```
Align text center.
```
ac@
```
Align text right.
```
ar@
```
```dae title="Example"
description = "al@ This dialogue has LEFT alignment.";
description = "ac@ This dialogue has CENTER alignment.";
description = "ar@ This dialogue has RIGHT alignment.";
```

## Disable dialogue
Player cannot highlight (and select) this dialogue.
```
d@
```

## Text input field
Input field allows you to turn a dialogue choice into an input text field.
```
a@
```
```dae title="Example"
INSTANCE DIA_Xardas_Password (C_Info)
{
    npc         = NONE_100_Xardas;
    nr          = 1;
    condition   = DIA_Xardas_Password_Condition;
    information = DIA_Xardas_Password_Info;
    permanent   = FALSE;
    description = "a@ What is the password to get to the Mages of Water?";
};

FUNC INT DIA_Xardas_Password_Condition () {
    return TRUE;
};

FUNC VOID DIA_Xardas_Password_Info () {
    if (Hlp_StrCmp (InfoManagerAnswer, "TETRIANDOCH"))
    {
        PrintScreen ("Yes that is correct!", -1, -1, "font_old_10_white.tga", 3);
    }
    else
    {
        PrintScreen ("No that is wrong!", -1, -1, "font_old_10_white.tga", 3);
    };
};
```

## Dialogue numbers
This feature shows a dialogue number next to the dialogue line (visual for [Dialogue keyboard controls](#dialogue-keyboard-controls)).
To turn this on you just set `InfoManagerNumKeysNumbers` variable to true. (in your `INIT_GLOBAL()` function).
```dae
InfoManagerNumKeysNumbers = TRUE;
```

## Dialogue keyboard controls
!!! Note
    This has also been fixed in Union and we noticed a strange behavior with different keyboard layouts.

This feature changes the way number keys affect dialogue selection. The first dialogue is no longer 0 and you highlight the dialogue option by pressing appropriate number.
```dae
InfoManagerNumKeysControls = TRUE;
```

## Spinners
This is by far the most flashy feature of EIM as it allows you to use left/right arrow keys on a dialogue option to increase/decease numerical value. This can be used in many ways.

This feature is a bit more complex:  

1. Set up a standard dialogue

    !!! Notice
        Notice we are using "*dummy*" as a description, since it is going to get updated. If something goes wrong the "*dummy*" string shows up and you can clearly tell something went wrong.
    
    ```dae
    INSTANCE PC_Pan_Cook_Meat (C_Info)
    {
        nr           = 1;
        condition    = PC_Pan_Cook_Meat_Condition;
        information  = PC_Pan_Cook_Meat_Info;
        permanent    = TRUE;
        description  = "dummy"; //Description is updated in PC_Pan_Cook_Meat_Condition
    };
    ```

2. Most of the magic takes place in the condition function (apart from the code behind the scenes, of course).

    ```dae
    var int selectedMeat; // global variable for this spinner value
    
    FUNC INT PC_Pan_Cook_Meat_Condition ()
    {
        if (PLAYER_MOBSI_PRODUCTION == MOBSI_DIALOG_PAN)
        {
            var string lastSpinnerID;
    
            var int total; total = NPC_HasItems (self, ItFoMuttonRaw);
    
            if (selectedMeat == 0) { selectedMeat = 1; }; //Default initial value
    
            //Check currently selected spinned ID --> is it this one?
            if (Hlp_StrCmp (InfoManagerSpinnerID, "CookMeat"))
            {
                //Setup spinner if spinner ID has changed
                if (!Hlp_StrCmp (InfoManagerSpinnerID, lastSpinnerID))
                {
                    //Restore previous value
                    InfoManagerSpinnerValue = selectedMeat;
                };
    
                //Page Up/Down quantity
                InfoManagerSpinnerPageSize = 5;
    
                //Min/Max value (Home/End keys)
                InfoManagerSpinnerValueMin = 1;
                InfoManagerSpinnerValueMax = total;
    
                //Update number which is shown in description (in case it was changed by _HOOK_VIEWDIALOGCHOICE_HANDLEEVENT
                selectedMeat = InfoManagerSpinnerValue;
    
            };
    
            lastSpinnerID = InfoManagerSpinnerID; //Remember last active spinner ID
    
            var string newDescription;
    
            //Spinner ID 'CookMeat'
            newDescription = "s@CookMeat Cook some meat: ";
    
            newDescription = ConcatStrings (newDescription, IntToString (selectedMeat));
            newDescription = ConcatStrings (newDescription, " / ");
            newDescription = ConcatStrings (newDescription, IntToString (total));
    
            //Update description
            PC_Pan_Cook_Meat.description = newDescription;
            return TRUE;
        };
    
        return FALSE;
    };
    ```

3. We can use the spinner value stored in `selectedMeat` variable here in the info function to create the meat (or do other stuff with it).

    ```dae
    FUNC VOID PC_Pan_Cook_Meat_Info () {
        //If we don't have any meat ... don't cook any :)
        if (!NPC_HasItems (self, ItFoMuttonRaw)) { return; };
    
        //This should not happen - but you never know!
        if (selectedMeat < 1) { return; };
    
        //This should not happen either! but just in case
        if (selectedMeat > (NPC_HasItems (self, ItFoMuttonRaw))) {
            selectedMeat = NPC_HasItems (self, ItFoMuttonRaw);
        };
    
        NPC_RemoveInvItems (self, ItFoMuttonRaw, selectedMeat);
        CreateInvItems (self, ItFoMutton, selectedMeat);
    
        //Reset value for next time
        selectedMeat = 1;
    };
    ```
     
### Spinners: Full code example

??? "Spinner example"
    ```dae
    INSTANCE PC_Pan_Cook_Meat (C_Info)
    {
        nr           = 1;
        condition    = PC_Pan_Cook_Meat_Condition;
        information  = PC_Pan_Cook_Meat_Info;
        permanent    = TRUE;
        description  = "dummy"; //Description is updated in PC_Pan_Cook_Meat_Condition
    };
    
    var int selectedMeat;
    
    FUNC INT PC_Pan_Cook_Meat_Condition ()
    {
        if (PLAYER_MOBSI_PRODUCTION == MOBSI_DIALOG_PAN)
        {
            var string lastSpinnerID;
    
            var int total; total = NPC_HasItems (self, ItFoMuttonRaw);
    
            if (selectedMeat == 0) { selectedMeat = 1; }; //Default initial value
    
            //Check currently selected spinned ID --> is it this one?
            if (Hlp_StrCmp (InfoManagerSpinnerID, "CookMeat"))
            {
                //Setup spinner if spinner ID has changed
                if (!Hlp_StrCmp (InfoManagerSpinnerID, lastSpinnerID))
                {
                    //Restore previous value
                    InfoManagerSpinnerValue = selectedMeat;
                };
    
                //Page Up/Down quantity
                InfoManagerSpinnerPageSize = 5;
    
                //Min/Max value (Home/End keys)
                InfoManagerSpinnerValueMin = 1;
                InfoManagerSpinnerValueMax = total;
    
                //Update number which is shown in description (in case it was changed by _HOOK_VIEWDIALOGCHOICE_HANDLEEVENT
                selectedMeat = InfoManagerSpinnerValue;
            };
    
            lastSpinnerID = InfoManagerSpinnerID; //Remember last active spinner ID
    
            var string newDescription;
    
            //Spinner ID 'CookMeat'
            newDescription = "s@CookMeat Cook some meat: ";
    
            newDescription = ConcatStrings (newDescription, IntToString (selectedMeat));
            newDescription = ConcatStrings (newDescription, " / ");
            newDescription = ConcatStrings (newDescription, IntToString (total));
    
            //Update description
            PC_Pan_Cook_Meat.description = newDescription;
            return TRUE;
        };
    
        return FALSE;
    };
    
    FUNC VOID PC_Pan_Cook_Meat_Info ()
    {
        //If we don't have any meat ... don't cook any :)
        if (!NPC_HasItems (self, ItFoMuttonRaw)) { return; };
    
        //This should not happen - but you never know!
        if (selectedMeat < 1) { return; };
    
        //This should not happen either! but just in case
        if (selectedMeat > (NPC_HasItems (self, ItFoMuttonRaw)))
        {
            selectedMeat = NPC_HasItems (self, ItFoMuttonRaw);
        };
    
        NPC_RemoveInvItems (self, ItFoMuttonRaw, selectedMeat);
        CreateInvItems (self, ItFoMutton, selectedMeat);
    
        //Reset value for next time
        InfoManagerSpinnerValue = 1;
    };
    
    INSTANCE PC_Pan_Cook_Meat_Exit (C_Info)
    {
        nr          = 999;
        condition   = PC_Pan_Cook_Meat_Exit_Condition;
        information = PC_Pan_Cook_Meat_Exit_Info;
        permanent   = TRUE;
        description = "End";
    };
    
    FUNC INT PC_Pan_Cook_Meat_Exit_Condition ()
    {
        if (PLAYER_MOBSI_PRODUCTION == MOBSI_DIALOG_PAN)
        {
            return TRUE;
        };
        return FALSE;
    };
    
    FUNC VOID PC_Pan_Cook_Meat_Exit_Info ()
    {
        if (PLAYER_MOBSI_PRODUCTION != MOBSI_DIALOG_NONE)
        {
            PLAYER_MOBSI_PRODUCTION = MOBSI_DIALOG_NONE;
            hero.aivar[AIV_INVINCIBLE] = FALSE;
            AI_StopProcessInfos (hero);
        };
    };
    ```
