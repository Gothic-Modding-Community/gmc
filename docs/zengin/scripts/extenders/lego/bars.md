# Bars
This package makes it very easy to add new bars, for e.g. stamina.

## Dependencies

- PermMem
- View

## Initialization
Initialize with `LeGo_Bars` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Bars);
```
## Implementation
[:material-github: Bars.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Bars.d)

## Functions

!!! Note
    If the `GothicBar` prototype is selected as the initial type (`GothicBar@` as the constructor), the user's own bars are visually indistinguishable from those used in Gothic.

### Bar_Create
Creates a new bar from a constructor instance.
```dae
func int Bar_Create(var int inst) {};
```

- `inst` - constructor instance of `Bar` class
- `return` - handle to the new bar 

### Bar_Delete
Deletes a bar from the screen and from memory. 
```dae
func void Bar_Delete(var int bar) {};
```

- `bar` - handle returned from `Bar_Create`

### Bar_SetMax
Changes a bar's maximum value but does not update its bar length (only `Bar_SetPercent`, `Bar_SetPromille` and `Bar_SetValue`)
```dae
func void Bar_SetMax(var int bar, var int max) {};
```

- `bar` - handle returned from `Bar_Create`
- `max` - the new maximum value

### Bar_SetValue
Sets the value of the bar.
```dae
func void Bar_SetValue(var int bar, var int val) {};
```

- `bar` - handle returned from `Bar_Create`
- `val` - new value of the bar

### Bar_SetPercent
Sets the value of the bar but as a percentage (0..100).
```dae
func void Bar_SetPercent(var int bar, var int perc) {};
```

- `bar` - handle returned from `Bar_Create`
- `perc` - new value of the bar in percent

### Bar_SetPromille
Sets the value of the bar but per mille (0..1000).
```dae
func void Bar_SetPromille(var int bar, var int pro) {};
```

- `bar` - handle returned from `Bar_Create`
- `pro` - new value of the bar in per mille

### Bar_Hide
Hides a bar. It will not be deleted. 
```dae
func void Bar_Hide(var int bar) {};
```

- `bar` - handle returned from `Bar_Create`

### Bar_Show
Displays a bar again after using `Bar_Hide`. 
```dae
func void Bar_Show(var int bar) {};
```

- `bar` - handle returned from `Bar_Create`

### Bar_MoveTo
Move the bar to virtual position. 
```dae
func void Bar_MoveTo(var int bar, var int x, var int y) {};
```

- `bar` - handle returned from `Bar_Create`
- `x` - new horizontal position in virtual coordinates
- `y` - new vertical position in virtual coordinates

### Bar_MoveToPxl
Move the bar to pixel position. 
```dae
func void Bar_MoveToPxl(var int bar, var int x, var int y) {};
```

- `bar` - handle returned from `Bar_Create`
- `x` - new horizontal position in pixels
- `y` - new vertical position in pixels

### Bar_SetAlpha
Sets the transparency of the bar.
```dae
func void Bar_SetAlpha(var int bar, var int alpha) {};
```

- `bar` - handle returned from `Bar_Create`
- `alpha` - transparency value (0..255) 

### Bar_SetBarTexture
Sets the foreground texture of the bar.
```dae
func void Bar_SetBarTexture(var int bar, var string barTex) {};
```

- `bar` - handle returned from `Bar_Create`
- `barTex` - the new foreground texture

### Bar_SetBackTexture
Sets the background texture of the bar.
```dae
func void Bar_SetBackTexture(var int bar, var string backTex) {};
```

- `bar` - handle returned from `Bar_Create`
- `backTex` - The new background texture

### Bar_Resize
Resize an existing bar.
```dae
func void Bar_Resize(var int bar, var int width, var int height) {};
```

- `bar` - handle returned from `Bar_Create`
- `width` - new width in virtual coordinates
- `height` - new height in virtual coordinates

### Bar_ResizePxl
Resize existing bar (in pixels).
```dae
func void Bar_ResizePxl(var int bar, var int x, var int y) {};
```

- `bar` - handle returned from `Bar_Create`
- `x` - new width in pixels
- `y` - new height in pixels

## Examples
!!! Note
    The bars assume a certain basic understanding of the PermMem module. 

### Display a simple bar
As a first example, let's just create a bar that does nothing.
It should only be half full (or half empty?).
```dae
func void Example_1()
{
    var int bar; bar = Bar_Create(GothicBar@); // Create a new bar
    Bar_SetPercent(bar, 50);                   // And set the value to 50%
};
```
Finished. Without any settings? And what is `GothicBar@`? Let's take a look at a more elaborate example.

### A dedicated experience bar
Bars implement the `Bar` class. It looks like this:
```dae
class Bar
{
    var int x;          // X position on the screen (middle of the bar)
    var int y;          // Y position on the screen (middle of the bar)
    var int barTop;     // Top/bottom margin
    var int barLeft;    // Left/right margin
    var int width;      // Bar width
    var int height;     // Bar height
    var string backTex; // Background texture
    var string barTex;  // Actual bar texture
    var int value;      // Current value
    var int valueMax;   // Maximum value
};
```
The `GothicBar` prototype is a bar that mimics the standard Gothic status bar.
```dae
prototype GothicBar(Bar)
{
    x = Print_Screen[PS_X] / 2;
    y = Print_Screen[PS_Y] - 20;
    barTop = 3;
    barLeft = 7;
    width = 180;
    height = 20;
    backTex = "Bar_Back.tga";
    barTex = "Bar_Misc.tga";
    value = 100;
    valueMax = 100;
};
```

It is much easier to set up a new instance using this prototype. `GothicBar` without modifications can be found as the `GothicBar@` instance, which we used to create the bar in the example above.
`GothicBar` is located in the middle of the screen and looks exactly like the Gothic underwater bar.  
But let us make a bar that is located in the top left of the screen and displays players experience points.  
Derive `GothicBar` again and only change the position. Of course add a loop using the [FrameFunctions](frame_functions.md):
```dae
// Instance created from 
instance Bar_1(GothicBar)
{
    x = 100;
    y = 20;
};

func void Example_1()
{
    // Example_1 could e.g. be called in Init_Global
    FF_ApplyOnce(Loop_1);
};

func void Loop_1()
{
    // Example_1 gets this loop running.
    // Here the bar should be constructed once
    // and then adapted to the EXP of the hero:
    var int MyBar;
    if(!Hlp_IsValidHandle(MyBar))
    {
        MyBar = Bar_Create(Bar_1); // Our Bar_1
    };
    // The rest is probably self-explanatory:
    Bar_SetMax(MyBar, hero.exp_next);
    Bar_SetValue(MyBar, hero.exp);
};
```
!!! Note
    This is translation of article originally written by Gottfried and Lehona and hosted on LeGo's official documentation [website](https://lego.worldofplayers.de/?Beispiele_Bars).
