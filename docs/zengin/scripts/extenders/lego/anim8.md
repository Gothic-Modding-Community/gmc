# Anim8
This package allows int or float values to be "animated" over a period of time. It is possible to string several commands together and to set the type of movement. The new version of PrintS from Interface uses Anim8.

## Dependencies

- Floats

## Initialization
Initialize with `LeGo_Anim8` flag.
```dae
func void LeGo_Init(var int flags) {};
LeGo_Init(LeGo_Anim8);
```
## Implementation
[:material-github: Anim8.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Anim8.d)

## Functions

### Anim8_New
Creates a new Anim8 object that can be filled with commands.
```dae
func int Anim8_New(var int/float value, var int IsFloat) {};
```

- `value` - The assumed initial value of the object
- `IsFloat` - Are floats or ints used? (true means float)
- `return` - A handle to the new object that must be fed to other Anim8 functions

### Anim8_NewExt
Creates a new Anim8 object with advanced options.
```dae
func int Anim8_NewExt(var int value, var func handler, var int data, var int IsFloat) {};
```

- `value` - The assumed initial value of the object
- `handler` - This function is called whenever the object is updated. The signature is `handler(int/float value)`. If additional data ! = 0, it is also passed as a parameter: `handler(int data, int/float value)`
- `data`- Optional parameter to send an additional value to handler. If data == 0, it is ignored
- `IsFloat` - Are floats or ints used? (true means float)
- `return` - A handle to the new object that must be fed to other Anim8 functions

### Anim8_Delete
Deletes an Anim8 object created with `Anim8_New`.
```dae
func void Anim8_Delete(var int hndl) {};
```

- `hndl` - Handle returned from `Anim8_New`

### Anim8_Get
Returns the current value of the object.
```dae
func int Anim8_Get(var int hndl) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `return` - Value of the object

### Anim8_Set
Sets the value of the object.
```dae
func void Anim8_Set(var int hndl, var int value) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `value` - New value of the object

### Anim8_Empty
Indicates whether the object is empty, i.e. has no more commands to process.
```dae
func int Anim8_Empty(var int hndl) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `return` - TRUE if object is empty (has no more commands), FALSE othrewise

### Anim8_RemoveIfEmpty
If desired, Anim8 can automatically delete an object after it is empty.
```dae
func void Anim8_RemoveIfEmpty(var int hndl, var int on) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `on` - 1: enable, 0: disable

### Anim8_RemoveDataIfEmpty
With `Anim8_NewExt` handler and data can be set. If this function is called with TRUE, `data` is taken as a handle and delete(data) is called if the object is empty. Works only if `Anim8_RemoveIfEmpty` is also activated.
```dae
func void Anim8_RemoveDataIfEmpty(var int hndl, var int on) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `on` - 1: enable, 2: disable

### Anim8
Packet core. Gives the object a new command to process.
```dae
func void Anim8(var int hndl, var int target, var int span, var int interpol) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `target` - Target value of this command. When the object's value has reached this value, the command is considered completed and deleted
- `span` - How many milliseconds should the command last?
- `interpol` - What form of movement to use? (See [constants](various/userconstants.md#anim8) for this)

### Anim8q
As already mentioned above, Anim8 can also process several commands one after the other. While Anim8 completely resets the object and deletes all commands, Anim8q just appends a new command to the list. This will be processed as soon as the previous one is completed.
```dae
func void Anim8q(var int hndl, var int target, var int span, var int interpol) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `target` - Target value of this command. When the object's value has reached this value, the command is considered completed and deleted
- `span` - How many milliseconds should the command last?
- `interpol` - What form of movement to use? (See [constants](various/userconstants.md#anim8) for this)

### Anim8_CallOnRemove
Registers a function to be called when the object is deleted (e.g. by `Anim8_RemoveIfEmpty`)
```dae
func void Anim8_CallOnRemove(var int hndl, var func dfnc) {};
```

- `hndl` - Handle returned from `Anim8_New`
- `dfnc` - This function is called when the object is deleted

## Examples

### Count up to a number
Count from 0 to 10 in 10 seconds. We use Print_Ext from Interface to display the text.
```dae
func void Example1() {
    // First we create a handle to a text:
    var int MyText; MyText = Print_Ext(20, 20, "0", Font_Screen, COL_White, -1);

    // After that we create a new, extended Anim8 object.
    // It gets a handler and the handle to the text as data:
    var int MyAnim8; MyAnim8 = Anim8_NewExt(0, MyLoop1, MyText, false); 
    // Start value 1, MyLoop1 as handler, MyText as data and no float

    // Now the command to count to 10:
    Anim8(MyAnim8, 10, 10000, A8_Constant); // With MyAnim8 to 10 within 7500ms with constant motion.

    // So that the text and the Anim8 object are deleted after the process. 
    // Now we have to do two more things:
    Anim8_RemoveIfEmpty(MyAnim8, true);
    Anim8_RemoveDataIfEmpty(MyAnim8, true);
};

func void MyLoop1(var int MyText, var int Number) {
    var zCViewText t; t = _^(myText);

    // Now the text is set to the value of the Anim8 object:
    t.text = IntToString(Number);

    // As I said, everything is deleted fully automatically
};
```
A similar example can be found in the Interface samples (translation palned).

### Moving zCVob in loop
And now a bit more Gothic-specific application: I want a vob to constantly move back and forth (without a mover!). FrameFunctions are used for the loop:
```dae
var zCVob MyVob;
var int MyVobAni;

func void Example2() {
    // First we use Ikarus to conjure up the desired vob in MyVob:
    MyVob = MEM_PtrToInst(MEM_SearchVobByName("MYVOB"));
    // Of course, there must be a vob with the appropriate name in the world for this.

    // Since the positions of a vob are floats, this time Anim8 must also use floats:
    MyVobAni = Anim8_New(MyVob.trafoObjToWorld[3], true);
    // The X position of the vob serves as the starting value.
    // We will also move it along this axis.

    // Now start a loop that "nudges" the vob over and over again:
    FF_Apply(MyVobLoop);
};

func void MyVobLoop() {
    // Sicherheitshalber suchen wir das Vob jedes Mal neu:
    MyVob = MEM_PtrToInst(MEM_SearchVobByName("MYVOB"));

    if(Anim8_Empty(MyVobAni)) {
        // Whenever there are no more commands, I add new ones:

        // First move by three meters:
        Anim8(MyVobAni, addf(MyVob.trafoObjToWorld[3], mkf(300)), 1000, A8_SlowEnd);
        // Then wait half a second:
        Anim8q(MyVobAni, 0, 500, A8_Wait);
        // And then back again:
        Anim8q(MyVobAni, MyVob.trafoObjToWorld[3], 1000, A8_SlowEnd);
        // And wait another half a second:
        Anim8q(MyVobAni, 0, 500, A8_Wait);
        // Note the 'q' in the follow-up commands.
        // While Anim8 completely resets the command list, i.e. starts again, Anim8q appends the command.
        // So you can tinker with a command sequence.
    };
    // Of course, we always have to balance the values:
    MyVob.trafoObjToWorld[3] = Anim8_Get(MyVobAni);
};
```
That's it.
A few lines of nice code and no mover.. Great.
We don't use a handler in this case because it doesn't offer the possibility to check for Anim8_Empty.