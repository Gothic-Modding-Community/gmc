# Interface
This package offers a lot of useful functions to work with the 2D interface.

## Dependencies

- [AI_Function](ai_function.md)
- [Anim8](../applications/anim8.md)
- [HookEngine](hook_engine.md)
- [PermMem](permmem.md)


## Initialization
Initialize with `LeGo_Interface` and `LeGo_PrintS` flag.
```dae
LeGo_Init(LeGo_Interface | LeGo_PrintS);
```

## Implementation
[:material-github: Interface.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Interface.d)

## Functions

### `sysGetTime`
Better alternative for `MEM_GetSysTime()` from [Ikarus](../../ikarus/index.md).
```dae
func int sysGetTime()
```
**Return value**

The function returns elapsed time since game (system) startup.

### `RGBA`
Generates a full `zColor`.
```dae
func int RGBA(var int r, var int g, var int b, var int a)
```
**Parameters**

- `#!dae var int r`  
    Red channel value (0..255)
- `#!dae var int g`  
    Green channel value (0..255)
- `#!dae var int b`  
    Blue channel value (0..255)
- `#!dae var int a`  
    Alpha (0..255, 0 = invisible)

**Return value**

The function returns a `zColor` object.

### `ChangeAlpha`
Overrides the alpha value of a given `zColor`.
```dae
func int ChangeAlpha(var int zCol, var int a)
```
**Parameters**

- `#!dae var int zCol`  
    `zColor` to modify
- `#!dae var int a`  
    New alpha value

**Return value**

The function returns a modified `zColor` object.

### `GetAlpha`
Returns the alpha value of a given `zColor`.
```dae
func int GetAlpha(var int zCol)
```
**Parameters**

- `#!dae var int zCol`  
    `zColor` to get alpha from

### `Print_CreateText`
Creates a new `zCViewText` on the screen with PermMem that can be freely edited.
```dae
func int Print_CreateText(var string text, var string font)
```
**Parameters**

- `#!dae var string text`  
    The text of the `zCViewText`
- `#!dae var string font`  
    Font of text

**Return value**

The function returns a handle to `zCViewText`.

### `Print_CreateTextPtr`
`Print_CreateText` but returns pointer to `zCViewText` instead of handle.
```dae
func int Print_CreateTextPtr(var string text, var string font)
```
**Parameters**

- `#!dae var string text`  
    The text of the `zCViewText`
- `#!dae var string font`  
    Font of text

**Return value**

The function returns a pointer to `zCViewText`.

### `Print_CreateTextPtrColored`
`Print_CreateTextPtr` but with additional parameter to chose color of text.
```dae
func int Print_CreateTextPtrColored(var string text, var string font, var int color)
```
**Parameters**

- `#!dae var string text`  
    The text of the `zCViewText`
- `#!dae var string font`  
    Font of text
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function

**Return value**

The function returns a pointer to `zCViewText`.

### `Print_GetText`
Returns `zCViewText` instance from handle.
```dae
func zCViewText Print_GetText(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle to `zCViewText`

### `Print_GetTextPtr`
Returns `zCViewText` pointer from handle.
```dae
func int Print_GetTextPtr(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle to `zCViewText`

### `Print_DeleteText`
Removes a `zCViewText` from the screen.
```dae
func void Print_DeleteText(var int hndl)
```
**Parameters**

- `#!dae var int hndl`  
    Handle to `zCViewText` (form `Print_CreateText` or `Print_Ext`)

### `Print_SetAlpha`
Changes the alpha value of a given `zCViewText`.
```dae
func void Print_SetAlpha(var int hndl, var int a)
```
**Parameters**

- `#!dae var int hndl`  
    Handle to `zCViewText`
- `#!dae var int a`  
    New alpha value

### `PrintPtr_SetAlpha`
`Print_SetAlpha` but with pointer to `zCViewText` instead of handle.
```dae
func void PrintPtr_SetAlpha(var int ptr, var int a)
```
**Parameters**

- `#!dae var int ptr`  
    Pointer to `zCViewText`
- `#!dae var int a`  
    New alpha value

### `Print_GetScreenSize`
Writes the current resolution to the Print_Screen array and the current aspect ratio to Print_Ratio variable.
```dae
func void Print_GetScreenSize()
```

#### `Print_Screen`
An int array holding the current resolution. (Filled by `Print_GetScreenSize`)
```dae
int Print_Screen[2];
```

- `Print_Screen[PS_X]` is the horizontal resolution

- `Print_Screen[PS_Y]` is the vertical resolution

#### `Print_Ratio`
A float variable that holds the current aspect ratio. (Filled by `Print_GetScreenSize`)
```dae
int Print_Ratio;
```

#### `PS_VMax`
An int constant that holds the highest possible value of a virtual coordinate.
```dae
const int PS_VMax = 8192;
```

### `Print_ToVirtual`
Convents pixel position to a virtual position.
```dae
func int Print_ToVirtual(var int pxl, var int dim)
```
**Parameters**

- `#!dae var int pxl`  
    Pixel position to convert
- `#!dae var int dim`  
    PS_X or PS_Y (see `Print_Screen`)

**Return value**

The function returns a virtual position of a given pixel position.

### `Print_ToVirtualF`
`Print_ToVirtual` but returns Ikarus float value instead of integer.
```dae
func int Print_ToVirtualF(var int pxl, var int dim)
```
**Parameters**

- `#!dae var int pxl`  
    Pixel position to convert
- `#!dae var int dim`  
    PS_X or PS_Y (see `Print_Screen`)

**Return value**

The function returns a virtual position of a given pixel position as Ikarus float.

### `Print_ToPixel`
Convents virtual position to a pixel position.
```dae
func int Print_ToPixel(var int vrt, var int dim)
```
**Parameters**

- `#!dae var int vrt`  
    Virtual position to convert
- `#!dae var int dim`  
    PS_X or PS_Y (see `Print_Screen`)

**Return value**

The function returns a pixel position of a given virtual position.

### `Print_ToPixelF`
`Print_ToPixel` but returns Ikarus float value instead of integer.
```dae
func int Print_ToPixelF(var int vrt, var int dim)
```
**Parameters**

- `#!dae var int vrt`  
    Virtual position to convert
- `#!dae var int dim`  
    PS_X or PS_Y (see `Print_Screen`)

**Return value**

The function returns a pixel position of a given virtual position as Ikarus float.

### `Print_ToRatio`
Gets the size in the specified dimension in ratioed by the screen.
```dae
func int Print_ToRatio(var int size, var int dim)
```
**Parameters**

- `#!dae var int size`  
    Size to convert
- `#!dae var int dim`  
    PS_X or PS_Y (see `Print_Screen`)

**Return value**

The function returns size correctly calculated to the ratio.

??? abstract "Example"
    If you have a view and the view you need to be a square of 400 units, you would do:
    ```dae
    height = Print_ToRatio(400, PS_Y);
    width = 400;
    ```
    This is because width is always the max in virtual coordinates - 8192 virtual points and the height has a different height based on the ratio, this function calculates it for you.

    `PS_X` can be used in function, if you already have the height but need the width in the correct ratio.

### `Print_ToRadian`
Converts angle in degrees to radians.
```dae
func int Print_ToRadian(var int angle)
```
**Parameters**

- `#!dae var int angle`  
    Angle in degrees

**Return value**

The function returns calculated angle in radians.

### `Print_ToDegree`
Converts angle in radians to degrees.
```dae
func int Print_ToDegree(var int angle)
```
**Parameters**

- `#!dae var int angle`  
    Angle in radians

**Return value**

The function returns calculated angle in degrees.

### `Print_GetFontPtr`
Returns a pointer to a `zCFont` by its name.
```dae
func int Print_GetFontPtr(var string font)
```
**Parameters**

- `#!dae var string font`  
    Name of font

### `Print_GetFontName`
Returns a name of a `zCFont` from its pointer.
```dae
func string Print_GetFontName(var int fontPtr)
```
**Parameters**

- `#!dae var int fontPtr`  
    Pointer to font

### `Print_GetStringWidth`
Returns the width of a string in pixels.
```dae
func int Print_GetStringWidth(var string s, var string font)
```
**Parameters**

- `#!dae var string s`  
    Measured string
- `#!dae var string font`  
    Name of font

### `Print_GetStringWidthPtr`
`Print_GetStringWidth` but with `zCFont` pointer instead of name.
```dae
func int Print_GetStringWidthPtr(var string s, var int font)
```
**Parameters**

- `#!dae var string s`  
    Measured string
- `#!dae var int font`  
    `zCFont` pointer

### `Print_GetFontHeight`
Returns the height of a string in pixels.
```dae
func int Print_GetFontHeight(var string font)
```
**Parameters**

- `#!dae var string font`  
    Name of font

### `Print_Ext`
Like the external `PrintScreen`, writes a text on the screen, but with more options.
```dae
func int Print_Ext(var int x, var int y, var string text, var string font, var int color, var int time)
```
**Parameters**

- `#!dae var int x`  
    X coordinate on the screen (virtual)
- `#!dae var int y`  
    Y coordinate on the screen (virtual)
- `#!dae var string text`  
    Displayed text
- `#!dae var string font`  
    Name of font
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function
- `#!dae var int time`  
    display time in milliseconds (-1 = permanent)

**Return value**

If `time == -1`, a valid handle is returned. If `time != -1`, the print is only volatile and no handle is returned.

??? abstract "Example"
    ```dae
    func void Example1()
    {
        //           x, y, text,   font,        color,                time
        Print_ExtPxl(2, 2, "Text", FONT_Screen, RGBA(255, 0, 0, 128), 500);
    };
    ```

### `Print_ExtPxl`
`Print_Ext` but with pixel coordinates instead of virtual.
```dae
func int Print_ExtPxl(var int x, var int y, var string text, var string font, var int color, var int time)
```
**Parameters**

- `#!dae var int x`  
    X coordinate on the screen (pixel)
- `#!dae var int y`  
    Y coordinate on the screen (pixel)
- `#!dae var string text`  
    Displayed text
- `#!dae var string font`  
    Name of font
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function
- `#!dae var int time`  
    display time in milliseconds (-1 = permanent)

**Return value**

If `time == -1`, a valid handle is returned. If `time != -1`, the print is only volatile and no handle is returned.

### `Print_LongestLine`
Returns the longest line from `text` as a string, using default line separator tilde `~`.
```dae
func string Print_LongestLine(var string text, var string font)
```
**Parameters**

- `#!dae var string text`  
    Measured text
- `#!dae var string font`  
    Name of font

### `Print_LongestLineExt`
Returns the longest line from `text` as a string, but you specify new line separator.
```dae
func string Print_LongestLineExt(var string text, var string font, var string separator)
```
**Parameters**

- `#!dae var string text`  
    Measured text
- `#!dae var string font`  
    Name of font
- `#!dae var string separator`  
    New line separator

### `Print_LongestLineLength`
Returns the longest line width in pixels, using default line separator tilde `~`.
```dae
func int Print_LongestLineLength(var string text, var string font)
```
**Parameters**

- `#!dae var string text`  
    Measured text
- `#!dae var string font`  
    Name of font

### `Print_LongestLineLengthExt`
Returns the longest line width in pixels, but allows you to specify new line separator.
```dae
func int Print_LongestLineLengthExt(var string text, var string font, var string separator)
```
**Parameters**

- `#!dae var string text`  
    Measured text
- `#!dae var string font`  
    Name of font
- `#!dae var string separator`  
    New line separator

### `Print_TextField`
Creates a text field (view with text) using virtual coordinates.
```dae
func int Print_TextField(var int x, var int y, var string text, var string font, var int height)
```
**Parameters**

- `#!dae var int x`  
    X coordinate (virtual)
- `#!dae var int y`  
    Y coordinate (virtual)
- `#!dae var string text`  
    Text to be printed
- `#!dae var string font`  
    Name of font
- `#!dae var int height`  
    A specific line `height`

**Return value**

The function returns a text field pointer. Here is how it is used:
```dae
var zCView view; view = get(viewHndl);
view.textLines_next = Print_TextField(x, y, text, FONT, fontHeight);
```

### `Print_TextFieldPxl`
`Print_TextField` but with pixel coordinates.
```dae
func int Print_TextFieldPxl(var int x, var int y, var string text, var string font)
```
**Parameters**

- `#!dae var int x`  
    X coordinate (pixel)
- `#!dae var int y`  
    Y coordinate (pixel)
- `#!dae var string text`  
    Text to be printed
- `#!dae var string font`  
    Name of font

**Return value**

The function returns a text field pointer. Look at the `Print_TextField` return value to see an example.

### `Print_TextFieldColored`
`Print_TextField` but you specify the color of text.
```dae
func int Print_TextFieldColored(var int x, var int y, var string text, var string font, var int height, var int color)
```
**Parameters**

- `#!dae var int x`  
    X coordinate (virtual)
- `#!dae var int y`  
    Y coordinate (virtual)
- `#!dae var string text`  
    Text to be printed
- `#!dae var string font`  
    Name of font
- `#!dae var int height`  
    A specific line `height`
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function

**Return value**

The function returns a text field pointer. Look at the `Print_TextField` return value to see an example.

### `PrintS`
Same function as the external `Print`, but with smooth animations. The effect can be changed as desired with the [user constants](../various/userconstants.md#prints).
```dae
func void PrintS(var string txt)
```
**Parameters**

- `#!dae var string txt`  
    Printed text

### `PrintS_Ext`
`PrintS` but with an additional parameter to choose the color of the text.
```dae
func void PrintS_Ext(var string txt, var int color)
```
**Parameters**

- `#!dae var string txt`  
    Printed text
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function

### `AI_PrintS`
Version of `PrintS` that enqueue in given NPCs AI queue.
```dae
func void AI_PrintS(var c_npc slf, var string txt)
```
**Parameters**

- `#!dae var c_npc slf`  
    NPC to whose AI queue the function is enqueued
- `#!dae var string txt`  
    Printed text

### `AI_PrintS_Ext`
Version of `PrintS_Ext` that enqueue in given NPCs AI queue.
```dae
func void AI_PrintS_Ext(var c_npc slf, var string txt, var int color)
```
**Parameters**

- `#!dae var c_npc slf`  
    NPC to whose AI queue the function is enqueued
- `#!dae var string txt`  
    Printed text
- `#!dae var int color`  
    `zColor` e.g. generated with [RGBA](#rgba) function

## Examples

### Manage a print via zCViewText
It is also possible to create the text only via [Print_CreateText](#print_createtext) and set it yourself. In this example, a text should fly over the image from left to right and be deleted again. The movement is handled by [Anim8](../applications/anim8.md):
```dae
var int MyText;
var int MyAnim8;
func void PrintMyScrollingText(var string text) {
    MyText = Print_CreateText(text, FONT_Screen); // We create an empty text item with the font FONT_Screen

    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText); // Now we get the empty text item in a zCViewText

    MyTextObject.posx = 1;      // adjust position
    MyTextObject.posy = 1;      // ATTENTION: These values are virtual, i.e.: 0 = far left, 8192 = far right (i.e. no pixel specification)
                                // (But if I prefer to have pixel coordinates I could use e.g. Print_ToVirtual)
    MyTextObject.timed = false; // The text should not be timed (not disappear)

    // Anim8 will animate a text
    // First we need a new Anim8 object:
    MyAnim8 = Anim8_New(1, false); // Start position is 1 and this value is not a float

    Anim8(MyAnim8, 8192, 2000, A8_Constant); // Target Position is 8192, Duration is 2000 milliseconds, and Movement Form is Constant

    // Now all we need is a loop that matches the x value of the text to the value of Anim8:
    FF_Apply(ScrollMyText);
};

func void ScrollMyText() {
    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText); // Get the text as an object again

    // And now compare the values:
    MyTextObject.posx = Anim8_Get(MyAnim8);

    // When Anim8 is done with that, we end the loop and delete the text:
    if(Anim8_Empty(MyAnim8)) {
        Print_DeleteText(MyText);
        FF_Remove(ScrollMyText);
        // The Anim8 object must of course also be deleted. We don't need it anymore.
        Anim8_Delete(MyAnim8);
    };
};
```

### Manage a print via zCViewText with LeGo 2.2+
In those days it was perhaps pleasant, but today it is no longer.
Anim8 has seen a few improvements with LeGo 2.2 that make it much easier to create the same effect:
```dae
var int MyText;
var int MyAnim8;
func void PrintMyScrollingText(var string text) {
    // Create and set text:
    MyText = Print_CreateText(text, FONT_Screen);

    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText);

    MyTextObject.posx = 1;
    MyTextObject.posy = 1;

    MyTextObject.timed = false;

    // But now comes the trick: We use Anim8_NewExt, this allows us to set a "Handler" and "Data".
    MyAnim8 = Anim8_NewExt(1, ScrollMyText, MyText, false);

    // ScrollMyText is passed as the handler and MyText as the data.
    // In concrete terms, this means: ScrollMyText is always called
    // when Anim8 has recalculated the position.
    // Pass data and the new position as parameters. Let's see how it goes.

    // Set the animation again as usual:
    Anim8(MyAnim8, 8192, 2000, A8_Constant);

    // And this time no FrameFunction.
    // Instead, we tell Anim8 to clean up by itself when it's done:
    Anim8_RemoveIfEmpty(MyAnim8, true);

    // The text should also disappear by itself:
    Anim8_RemoveDataIfEmpty(MyAnim8, true);

    // Since MyText is a handle, this will work.
    // If MyText were a pointer, RemoveDataIfEmpty should not be activated, it would lead to an error message.
};

func void ScrollMyText(var int MyText, var int Position) {
     // Get the text as an object again
    var zCViewText MyTextObject; MyTextObject = Print_GetText(MyText);

    // And now compare the values:
    MyTextObject.posx = Position;

    // Since Anim8 does the deleting itself, we don't have to worry about that.
};
```
