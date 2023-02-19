# Ikarus examples
A collection of examples ported from the original Ikarus documentation.

!!! note
    The original Ikaurs documentation is a part of the code. You can find it in the [github repository](https://github.com/Lehona/Ikarus/blob/master/Ikarus_Doc.d)

## Open focused chest or door
```dae
func void OpenFocussedChestOrDoor() 
{
    var oCNpc her; her = Hlp_GetNpc(hero);

    // No focus vob at all?
    if (!her.focus_vob) 
    {
        Print ("No focus!");
        return;
    };

    // Focus vob not a lockable vob?
    if (!Hlp_Is_oCMobLockable(her.focus_vob))
    {
        Print ("No chest or door in focus!");
        return;
    };

    var oCMobLockable Lockable;
    Lockable = MEM_PtrToInst (her.focus_vob);

    if (Lockable.bitfield & oCMobLockable_bitfield_locked) 
    {
        Lockable.bitfield = Lockable.bitfield & ~ oCMobLockable_bitfield_locked;
        Print (ConcatStrings ("Opened the following vob: ", Lockable._zCObject_objectName));
    } 
    else
    {
        Print (ConcatStrings ( Lockable._zCObject_objectName, "wasn't even complete!"));
    };
};
```

## Print camera position
```dae
func void PrintCameraPos()
{
    // Initialize global instances (which only exist once):
    // Initializes MEM_World, MEM_Game, etc. including MEM_Camera
    MEM_InitGlobalInst();

    /* The camera object is not a vob (but something abstract), 
    do not know where and how there are position data.
    I prefer to work on the camera vob : */
    var zCVob camVob;
    camVob = MEM_PtrToInst (MEM_Camera.connectedVob);

    /* Here you have to know how the transformation matrix is structured:

    It consists of three vectors, the x, y and z directions of the local coordinate system of the camera vob
    in world coordinates (where z specifies the
    line of sight). These vectors are
    denoted by v1, v2, v3.
    In addition, in the 4th column there is the translation,
    that is, the position of the camera.

    v1_x v2_x v3_x x
    v1_y v2_y v3_y y
    v1_z v3_z v3_z z
    0 0 0 0

    The matrix is stored row by row in memory.
    Since we are interested in the last column are the indices
    in the trafoWorld Array 3, 7 and 11 that we need. */

    Print (ConcatStrings ("x: ",IntToString(roundf(camVob.trafoObjToWorld[3]))));
    Print (ConcatStrings ("y: ",IntToString(roundf(camVob.trafoObjToWorld[7]))));
    Print (ConcatStrings ("z: ",IntToString(roundf(camVob.trafoObjToWorld[11]))));
};
```

## Start rain
```dae
func void StartRain()
{
    // Initialize global instances
    // This also includes Skycontroller
    MEM_InitGlobalInst(); 

    // start at the beginning of the day (12:00 noon)
    MEM_SkyController.rainFX_timeStartRain = 0; //FLOATNULL;
    // end at the end of the day (12:00 noon of the next day)
    MEM_SkyController.rainFX_timeStopRain = 1065353216; //FLOATEINS;

    /* Note: The start and end times are floating point numbers.
    * 0 stands for the beginning of the day 1 for the end of the day.
    * a day in the game begins at 12:00 p.m.
    * For the structure of the floating point format, google for IEEE-745.*/

    /* Result: rain all day! (unless you are in a zone
    * in which it snows, then snow all day) */
};
```

## Nested loop
```dae
// Should enumerate all pairs (x,y) with 0 <= x < max_x, 0 <= j < max_y

func void printpairs(var int max_x, var int max_y)
{
    // Initialize labels
    MEM_InitLabels();
    // PrintDebug should be used, i.e. activate debug output
    MEM_SetShowDebug (1);

    var int x; var int y; x = 0;

    // while (x < max_x)
    var int x_loop; x_loop = MEM_StackPos.position;
    if (x < max_x)
    { 
        y = 0;
        // while (y < max_y) 
        var int y_loop; y_loop = MEM_StackPos.position;
        if (y < max_y)
        { 
            var string out; out = "(";
            out = ConcatStrings (out, IntToString (x));
            out = ConcatStrings (out, ", ");
            out = ConcatStrings (out, IntToString (y));
            out = ConcatStrings (out, ")");
            PrintDebug (out);
            y += 1;

            //continue y_loop 
            MEM_StackPos.position = y_loop;
        };
        x += 1;
        // continue x_loop
        MEM_StackPos.position = x_loop;
    };
};

/*
    Output of a call printpairs(4,2) would then be: 
    00:36 Info: 5 U: Skript: (0, 0) .... 
    00:36 Info: 5 U: Skript: (0, 1) .... 
    00:36 Info: 5 U: Skript: (1, 0) .... 
    00:36 Info: 5 U: Skript: (1, 1) .... 
    00:36 Info: 5 U: Skript: (2, 0) .... 
    00:36 Info: 5 U: Skript: (2, 1) .... 
    00:36 Info: 5 U: Skript: (3, 0) .... 
    00:36 Info: 5 U: Skript: (3, 1) .... 
*/
```

## Calling a function by their name
```dae

// This example doesn't show why MEM_CallByString * is useful, but how to use the function.

var zCVob someObject;
func int MyFunction(var int param1, var string str1, var int param2, var string str2)
{
    Print (ConcatStrings (str1, str2)); //(*)
    return 100 * param1 + param2;
};

func void foo()
{ 
    var int result;

    // The code between A and B is in this case equivalent to:
    // result = MyFunction(42, "Hello", 23, "World!");

    // Lay the call arguments on the call stack
    MEM_PushIntParam (42);
    MEM_PushStringParam ("Hello ");
    MEM_PushIntParam (23);
    MEM_PushStringParam ("World!");

    MEM_CallByString ("MYFUNCTION");

    // the function puts the result (of type int in this case) on the stack
    // we pop the int result and save it to a variable
    result = MEM_PopIntResult();

    // print the result
    Print (IntToString (result));
};

/*
    Note: Since symbol indices are continuous and someObject's symbol index 
    is simply given by someObject itself, could
    MEM_CallByString("MYFUNCTION"); 
    also be replaced here by 
    MEM_CallByID(someObject + 1);
*/
}
```
