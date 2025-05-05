# Dialog funtions
Functions related to the dialog system. For more information about the dialog system, see [`C_INFO`](../classes/c_info.md).

## Functions

### `InfoManager_HasFinished`
!!! function "`InfoManager_HasFinished`"
    Checks if the player finished the dialog
    ```dae
    func int InfoManager_HasFinished() 
    ```

    **Return value**  
    The function returns TRUE if the player finished the dialog, FALSE otherwise

### `Info_AddChoice`
!!! function "`Info_AddChoice`"
    Adds a dialog choice to the specified C_INFO instance
    ```dae
    func void Info_AddChoice(var C_INFO dialog, var string text, var func fnc) 
    ```

    **Parameters**  

    - `#!dae var C_INFO dialog` - dialog instance
    - `#!dae var string text` - description of the choice
    - `#!dae var func fnc` - function to execute if the choice is selected

### `Info_ClearChoices`
!!! function "`Info_ClearChoices`"
    Clears the choices of the specified C_INFO instance
    ```dae
    func void Info_ClearChoices(var C_INFO dialog) 
    ```

    **Parameters**  

    - `#!dae var C_INFO dialog` - dialog instance
