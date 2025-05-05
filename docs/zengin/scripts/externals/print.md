# Print functions
Functions for printing text to the screen, zSpy, or dialog boxes.

## Functions

### `Print`
!!! function "`Print`"
    Prints text at the top of the screen
    ```dae
    func void Print(var string text) 
    ```

    **Parameters**  

    - `#!dae var string text` - text to print

### `PrintDebug`
!!! function "`PrintDebug`"
    Prints debug text to zSpy if "toogle debug" is enabled
    ```dae
    func void PrintDebug(var string text) 
    ```

    **Parameters**  

    - `#!dae var string text` - debug text

### `PrintDebugCh`
!!! function "`PrintDebugCh`"
    Prints text to zSpy on a specific debug channel (if channel is enabled)
    ```dae
    func void PrintDebugCh(var int channel, var string text) 
    ```

    **Parameters**  

    - `#!dae var int channel` - channel number
    - `#!dae var string text` - debug text

### `PrintDebugInst`
!!! function "`PrintDebugInst`"
    Prints text to zSpy if global `self` is on debug instances list    
    `debug focus` command can add instance to the list   
    `debugAllInstances` in the `Gothic.ini` can enable all instances
    ```dae
    func void PrintDebugInst(var string text) 
    ```

    **Parameters**  

    - `#!dae var string text` - string text to print

### `PrintDebugInstCh`
!!! function "`PrintDebugInst`"
    Prints text to zSpy if global `self` is on debug instances list on a specific debug channel (if channel is enabled)   
    `debug focus` command can add instance to the list   
    `debugAllInstances` in the `Gothic.ini` can enable all instances
    ```dae
    func void PrintDebugInstCh(var int channel, var string text)
    ```

    **Parameters**  

    - `#!dae var string text` - string text to print
    - `#!dae var int channel` - channel number

### `PrintDialog`
!!! function "`PrintDialog`"
    Displays a text in a dialog box
    ```dae
    func int PrintDialog(var int window, var string text, var int posx, var int posy, var string font, var int timesec) 
    ```

    **Parameters**  

    - `#!dae var int window` - id of a dialog window
    - `#!dae var string text` - displayed text
    - `#!dae var int posx` - x position as percent (-1 to center)
    - `#!dae var int posy` - y position as percent (-1 to center)
    - `#!dae var string font` - font to use
    - `#!dae var int timesec` - display duration in seconds

    **Return value**  
    The function returns TRUE if the dialog was displayed successfully, FALSE otherwise

### `PrintMulti`
!!! function "`PrintMulti`"
    Randomly selects one of the texts and prints it
    ```dae
    func void PrintMulti(var string text1, var string text2, var string text3, var string text4, var string text5) 
    ```

    **Parameters**  

    - `#!dae var string text1` - first text
    - `#!dae var string text2` - second text
    - `#!dae var string text3` - third text
    - `#!dae var string text4` - fourth text
    - `#!dae var string text5` - fifth text

### `PrintScreen`
!!! function "`PrintScreen`"
    Prints a message to the screen with specified font and position
    ```dae
    func void PrintScreen(var string text, var int posx, var int posy, var string font, var int timesec) 
    ```

    **Parameters**  

    - `#!dae var string text` - message to print
    - `#!dae var int posx` - x position as percent (-1 to center)
    - `#!dae var int posy` - y position as percent (-1 to center)
    - `#!dae var string font` - font to use
    - `#!dae var int timesec` - display duration in seconds
