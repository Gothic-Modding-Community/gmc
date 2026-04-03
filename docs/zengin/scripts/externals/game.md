# Game functions
Game functions are used to control general game related operations, playing videos, and displaying chapter windows.

## Functions

### `IntroduceChapter`
!!! function "`IntroduceChapter`"
    Dipslays a new chapter window on the screen
    ```dae
    func void IntroduceChapter(var string chapter, var string text, var string texture, var string sound, var int waittime) 
    ```

    **Parameters**  

    - `#!dae var string chapter` - upper text (chapter number)
    - `#!dae var string text` - lower text (chapter title)
    - `#!dae var string texture` - back texture
    - `#!dae var string sound` - sound to play
    - `#!dae var int waittime` - apperance time in milliseconds

### `ExitGame`
!!! function "`ExitGame`"
    Exits the game
    ```dae
    func void ExitGame() 
    ```

### `ExitSession`
!!! function "`ExitSession`"
    Exits the current session to the main menu
    ```dae
    func void ExitSession() 
    ```

    !!! Warning
        !!! Warning
        This function is only available in Gothic  2

### `Perc_SetRange`
!!! function "`Perc_SetRange`"
    Sets the range of passive perceptions for all NPCs
    ```dae
    func void Perc_SetRange(var int percid, var int range) 
    ```

    **Parameters**  

    - `#!dae var int percid` - perception ID
    - `#!dae var int range` - range in cm

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

### `PlayVideoEx`
!!! function "`PlayVideoEx`"
    Plays a video and allows to exit the session
    ```dae
    func int PlayVideoEx(var string filename, var int screenblend, var int exitsession) 
    ```

    **Parameters**  

    - `#!dae var string filename` - name of the video file
    - `#!dae var int screenblend` - if TRUE, the screen will be blended out before the video is played
    - `#!dae var int exitsession` - if TRUE, the session will be exited after the video is played

    **Return value**  
    The function returns TRUE if the video was played successfully, FALSE otherwise

    !!! Warning
        This function is only available in Gothic 2

## Deprecated

### `Game_InitEnglish`
!!! function "`Game_InitEnglish`"

    ```dae
    func void Game_InitEnglish() 
    ```

    !!! Warning
        This function is only available in Gothic 2

### `Game_InitEngIntl`
!!! function "`Game_InitEngIntl`"
    ```dae
    func void Game_InitEngIntl() 
    ```

    !!! Warning
        This function is only available in Gothic 2

### `Game_InitGerman`
!!! function "`Game_InitGerman`"
    ```dae
    func void Game_InitGerman() 
    ```

    !!! Warning
        This function is only available in Gothic 2

### `SetPercentDone`
!!! function "`SetPercentDone`"
    ```dae
    func void SetPercentDone(var int percentdone) 
    ```

### `Tal_Configure`
!!! function "`Tal_Configure`"
    ```dae
    func void Tal_Configure(var int talent, var int value) 
    ```
