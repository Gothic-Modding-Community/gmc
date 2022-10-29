# Sign post teleportation
This is a short "problem-solving" example, where we try to demonstrate the power of Daedalus injection using [zParserExtender](../../index.md). GaroK asked me if there is a way to teleport to all the sign posts in Khorinis to gather information for a Gothic wiki article.  
The goal is to introduce a function that will teleport you to every signpost in Khorinis with the press of a button.

## The problem
In ZenGin you can teleport to named game objects with the `goto vob {vobname}` command. But since the signposts do not have a vobname defined, I had to figure out a different approach.

## ASCII ZEN
We want to get all the signposts position from Khorinis. The game world was loaded into one of the available world editor, I found one of the signposts and noted the `visual` which dictates the model of the in-game object `nw_misc_sign_01.3DS`. Alternatively, you can find the standard vanilla objects from both games on this [website](https://dziejekhorinis.org/dev/vobbilder/).  
Next, the world was saved as a `ASCII ZEN` format. This allows us to write a macro to search for all instances of objects with a specific visual and extract the position vector.

```ini title="One signpost object" hl_lines="6 8"
[% oCMOB:zCVob 47105 317]
	pack=int:0
	presetName=string:
	bbox3DWS=rawFloat:7564.8291 127.361191 -80.5309067 7611.52441 377.422913 1.67681122 
	trafoOSToWSRot=raw:73e1673f9c4ec33b15efd8be4465d7bba0fe7f3f30ea7137e5edd83eecaa353bb7e2673f
	trafoOSToWSPos=vec3:7588.17627 252.391052 -39.4283791
	vobName=string:
	visual=string:NW_MISC_SIGN_01.3DS
	showVisual=bool:1
	visualCamAlign=enum:0
	visualAniMode=enum:0
	visualAniModeStrength=float:0
	vobFarClipZScale=float:1
	cdStatic=bool:1
	cdDyn=bool:1
	staticVob=bool:1
	dynShadow=enum:0
	zbias=int:0
	isAmbient=bool:0
	[visual zCProgMeshProto 53505 318]
	[]
	[ai % 0 0]
	[]
	focusName=string:MOBNAME_INCITY02
	hitpoints=int:10
	damage=int:0
	moveable=bool:0
	takeable=bool:0
	focusOverride=bool:0
	soundMaterial=enum:0
	visualDestroyed=string:
	owner=string:
	ownerGuild=string:
	isDestroyed=bool:0
[]
```

!!! Tip
    You can also see that the `focusName` has a `MOBNAME_INCITY02` string constant.  
    This constant is defined in the scripts and its content is used as the focus name.  
    ```dae
    const string MOBNAME_INCITY02 = "To Marketplace";
    ```

## The injectable script
As it is an injectable script, we have to specify the `META` tag.  
Lets tell zParseExtender to insert this code into the game parser.  
```dae
META
{
    Parser = Game
};
```
We want to teleport the player and for this we will need the [`C_Position`](../../helperclasses/#c_position) and [`C_Vob_Data`](../../helperclasses/#c_vob_data) classes.
```dae
class C_Position
{
    var int X; // X coordinate
    var int Y; // Y coordinate
    var int Z; // Z coordinate
};

class C_VOB_DATA
{
    var string Name;              // object name
    var float VisualAlpha;        // object's transparency 0.0 - 1.0
    var int ShowVisual;           // display the mode
    var int DrawBBox3D;           // show objects bounding box
    var int VisualAlphaEnabled;   // enables objects transparency
    var int PhysicsEnabled;       // enables object's physics
    var int IgnoredByTraceRay;    // allow any object collisions
    var int CollDetectionStatic;  // allow collision with static world polygons
    var int CollDetectionDynamic; // allow collision with dynamic world objects
    var int CastDynShadow;        // display shadow of the object
    var int LightColorStatDirty;  // allow static liging of the object
    var int LightColorDynDirty;   // allow dynamic lighing of the object
    var int SleepingMode;         // sets object's activity mode (0 - inactive, 1 - active, 2 - AI only)
    var int DontWriteIntoArchive; // turns of the serialization of this object to the save file 
};
```
It turns out there is 54 instances of objects with the desired visual. Let us define `const int NUM_OF_SIGNS = 54` and a `const int MAX_COORDS = 3 * NUM_OF_SIGNS` - we will store 3 times 54 integers - for every signpost a `x`, `y` and `z` coordinate. And lastly a `const int` array containing all the positions.
```dae
// Number of signs we want to jump to
const int NUM_OF_SIGNS = 54;
const int MAX_COORDS = 3 * NUM_OF_SIGNS;

const int sign_coordinates[MAX_COORDS] = {
    11974,  309,   6815,
    12024,  310,   6778,
    12411,  1668,  -22495,
    19491,  1281,  1669,
    19563,  1281,  1687,
    20294,  2058,  12487,
    20324,  2058,  12419,
    21917,  2900,  -22751,
    2600,   -57,   -4351,
    26695,  2419,  4308,
    26770,  2418,  4319,
    26978,  2937,  6130,
    27015,  2936,  6104,
    27049,  2937,  6159,
    2964,   2142,  14424,
    31383,  3896,  4699,
    31427,  3896,  4640,
    35368,  3870,  -4374,
    35435,  3870,  -4355,
    35437,  3871,  -4399,
    36205,  3333,  -27186,
    37774,  3875,  -501,
    37812,  3874,  -469,
    37849,  3874,  -512,
    38291,  3732,  -6699,
    39276,  3926,  -3357,
    39307,  3924,  -3313,
    39351,  3924,  -3359,
    39435,  4350,  10902,
    39458,  4350,  10827,
    40932,  3861,  -3054,
    42454,  2838,  -19437,
    5297,   387,   -2145,
    5358,   387,   -2184,
    5362,   387,   -2128,
    54006,  1723,  -10316,
    54035,  1723,  -10387,
    551,    -62,   -1820,
    61080,  2132,  -11622,
    61155,  2132,  -11625,
    6408,   392,   3598,
    6432,   393,   3652,
    7000,   387,   -1482,
    73439,  3341,  -11307,
    7588,   252,   -39,
    7590,   252,   -109,
    7642,   253,   -83,
    7713,   387,   -4782,
    7758,   386,   -4775,
    7776,   388,   -4811,
    8154,   1206,  -17022,
    8855,   395,   -2402,
    9704,   393,   5129,
    9738,   392,   5108
};

```
Next define a built in [event](../../events) `GameLoop` function, to check for a pressed key. If the key `U` is pressed, the `jump_to_sign` function is called.
```dae
// check for pressed U button every frame
func event GameLoop()
{
    // if U is toggled, run the function
    if (Hlp_KeyToggled(KEY_U))
    {
        jump_to_sign();
    };
};
```

Let's look at the `jump_to_sign` function now.  
This function is called on every `U` key press and goes through all the signposts and teleports the player to them.  
At the start of the function we check if the index is not out of bounds and if it is, sets it back to 0 and starts over.
```dae
    // if we reached the end, start over
    if (tp_index >= NUM_OF_SIGNS)
    {
        tp_index = 0;
    };
```
Notice the use of [`Str_Format`](../externals/string.md#str_format) function for the formatted output.
```dae
// give information to the player
Print(Str_Format("Sign %i/%i", tp_index+1, NUM_OF_SIGNS));

var C_Position pos;  pos  = Vob_GetVobPosition(hero);
var C_Vob_Data data; data = Vob_GetVobData(hero);
```
Daedalus does not allow array access with variables (only constants and literals). To access the coordinate array we use a selection of [parser](../externals/PAR/) functions.  
Firstly we get the game parser ID. Then we can use the `Par_GetSymbolValueIntArray` to access the `sign_coordinates` array and assign the coordinates to the `pos` variable.
```dae
// get parser ID for the GAME parser
var int game_par_id; game_par_id = Par_GetParserID("game");

// get parser ID of the array
var int arr_id; arr_id = Par_GetSymbolID(game_par_id ,"sign_coordinates");

// access the coordinates from above array
pos.x = Par_GetSymbolValueIntArray(game_par_id ,arr_id ,tp_index * 3    ); 
pos.y = Par_GetSymbolValueIntArray(game_par_id ,arr_id ,tp_index * 3 + 1);
pos.z = Par_GetSymbolValueIntArray(game_par_id ,arr_id ,tp_index * 3 + 2);
```
And now comes the big trick. If you try to just change the position the dynamic and static collision is going to stop you at the first wall, tree or a mountain. To disable it, we can use the `C_Vob_Data` helper class, get players data, and disable both the static a dynamic collision. First we create a backup of the values just so we can restore them back after the teleport.
```dae
// backup original collision detection
var int dyn;   dyn = data.CollDetectionDynamic;
var int stat; stat = data.CollDetectionStatic;

// turn off collision detection 
data.CollDetectionDynamic = 0;
data.CollDetectionStatic  = 0;
```
Let us apply the changed data to the player and edit the position.
```dae
// apply the edited data to player
Vob_SetVobData(hero, data);

// move the player 
Vob_SetVobPosition(hero, pos);
```
Restore the collision detection data from the backup we made and set it.
```dae
// restore collision detection
data.CollDetectionDynamic = dyn;
data.CollDetectionStatic  = stat;

// apply the edited data to player
Vob_SetVobData(hero, data);
```
Finally, we advance the index to jump to another signpost.
```dae
// advance the index
tp_index += 1;
```
