
void Bar_MoveTo(int handle, int x, int y)
```
- `handle` - Handle from `Bar_Create`
- `x` - New horizontal position
- `y` - New vertical position
### Bar_SetAlpha
Sets the opacity of the bar.
```c++
void Bar_SetAlpha(int handle, int alpha)
```
- `handle` - Handle from `Bar_Create`
- `alpha` - transparency value (0..255) 
### Bar_SetBarTexture
Sets the foreground texture of the bar.
```c++
void Bar_SetBarTexture(int handle, string texture)
```
- `handle` - Handle from `Bar_Create`
- `texture` - The new foreground texture
### Bar_SetBackTexture
Sets the background texture of the bar.
```c++
void Bar_SetBackTexture(int handle, string texture)
```
- `handle` - Handle from `Bar_Create`
- `texture` - The new background texture
## Examples
!!! Note
  The bars assume a certain basic understanding of PermMem ahead. 
### Display a simple bar
First we just create a bar that does nothing.
It should only be half full (or empty?) on the screen.
```c++
func void Example_1()
{
    var int bar; bar = Bar_Create(GothicBar@); // Create a new bar
    Bar_SetPercent(bar, 50);                   // And set the value to 50%
};
```
Finished. Without any settings? And what is GothicBar? Let's take a look behind the scenes:

### A dedicated experience bar
Bars offers the 'Bar' class for the user. It looks like this:
```c++
class Bar
{
    var int x;          // X position on screen (middle of bar)
    var int y;          // Y position on screen (middle of bar)
    var int barTop;     // Spacing bar - background top/bottom
    var int barLeft;    // Spacing bar - background left/right
    var int width;      // Width
    var int height;     // Height
    var string backTex; // background texture
    var string barTex;  // Actual bar texture
    var int value;      // Start value
    var int valueMax;   // Maximum value
};
```
With this I could now create an instance that fulfills my wishes. In addition, Bars also contains a prototype:
```c++
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
It's much easier to derive an instance from this. Bar without changes can be found as a GothicBar instance, which is how we created the bar in the example above.
GothicBar is located in the middle of the screen and looks exactly like the Gothic Underwater Bar.
<br/><br/>
But lets make a bar that hangs in the top left of the picture and displays the experience points.
<br/>
Derive again GothicBar and only change the position. Of course, add a loop using the FrameFunctions:
```c++
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
    // Example_1 gets this loop running. Here the bar should be constructed once and then adapted to the EXP of the hero:
    var int MyBar;
    if(!Hlp_IsValidHandle(MyBar))
    {
        MyBar = Bar_Create(Bar_1); // Unsere Bar_1
    };
    // The rest is probably self-explanatory:
    Bar_SetMax(MyBar, hero.exp_next);
    Bar_SetValue(MyBar, hero.exp);
};
!!! Note
  This is translation of article originally written by Gottfried and Lehona and hosted on lego oficial website
