# Menu functions
Menu functions are used to perform operations while being in the menu.

!!! Danger
    The menu functions are only available in the menu parser. 

## Functions

### `Update_ChoiceBox`
!!! function "`Update_ChoiceBox`"
    Updates `C_MENU_ITEM` choice box with the current setting.
    This specific boxes are hardcoded in the function itself:   
    `MENUITEM_AUDIO_PROVIDER_CHOICE`,
    `MENUITEM_VID_DEVICE_CHOICE`,
    `MENUITEM_VID_RESOLUTION_CHOICE`
    ```dae
    func void Update_ChoiceBox(var string choicebox) 
    ```

    **Parameters**  

    - `#!dae var string choicebox` - name of the one of the hardcoded choice boxes

### `PlayVideo`
!!! function "`PlayVideo`"
    Plays a video
    ```dae
    func int PlayVideo(var string filename) 
    ```

    **Parameters**  

    - `#!dae var string filename` - name of the video file

    **Return value**  
    The function returns TRUE if the video was played successfully, FALSE otherwise

### `Apply_Options_Performance`
!!! function "`Apply_Options_Performance`"
    Applies the options for the performance, analyzes the system and changes the settings if necessary
    ```dae
    func void Apply_Options_Performance() 
    ```

### `Apply_Options_Video`
!!! function "`Apply_Options_Video`"
    Applies the options for the video, changes the resolution and graphics device if necessary
    ```dae
    func void Apply_Options_Video() 
    ```

## Deprecated

### `Apply_Options_Audio`
!!! function "`Apply_Options_Audio`"
    Meant to apply the options for the audio, does nothing apart playing an apply sound
    ```dae
    func void Apply_Options_Audio() 
    ```

### `Apply_Options_Game`
!!! function "`Apply_Options_Game`"
    Meant to apply the options for the game, does nothing apart playing an apply sound
    ```dae
    func void Apply_Options_Game() 
    ```

### `Apply_Options_Controls`
!!! function "`Apply_Options_Controls`"
    Meant to apply the options for the controls, does nothing apart playing an apply sound
    ```dae
    func void Apply_Options_Controls() 
    ```

