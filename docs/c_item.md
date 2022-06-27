# C_ITEM Daedalus class

The `C_ITEM` class as it is defined in `Scripts/Content/_intern/Clases.d` script file. 

```c++
CLASS C_Item 
{
	// Für alle Items
	VAR INT		id								;				
	VAR STRING  name,nameID						;
	VAR INT		hp,hp_max						;

	VAR INT     mainflag,flags					;		//	Hauptflag und weitere Flags
	VAR INT		weight,value					;			
															
	// Für Waffen								
	VAR INT		damageType						;		//	Welche Schadensarten
	VAR	INT		damageTotal						;
	VAR INT		damage			[DAM_INDEX_MAX]	;

	// Für Rüstungen
	VAR INT		wear							;
	VAR INT		protection		[PROT_INDEX_MAX];

	// Für Nahrung
	VAR INT		nutrition						;		//	HP-Steigerung bei Nahrung

	// Benötigte Attribute zum Benutzen des Items
	VAR INT		cond_atr		[3]				;
	VAR INT		cond_value		[3]				;

	// Attribute, die bei anlegen des Items verändert werden
	VAR INT		change_atr		[3]				;
	VAR INT		change_value	[3]				;

	// Parserfunktionen
	VAR FUNC	magic							;		//	Parserfunktion zum "Magie Header"
	VAR FUNC	on_equip						;		//	Parserfunktion, wenn Item equipped wird.
	VAR FUNC	on_unequip						;		//	Parserfunktion, wenn Item unequipped wird.
	VAR FUNC	on_state		[4]				;			
															
	// Besitzer									
	VAR FUNC	owner							;		//	Besitzer : Instanz-Name
	VAR INT		ownerGuild						;		//	Besitzer : Gilde
	VAR INT		disguiseGuild					;		//	Zur Schau getragene Gilde durch Verkleidung

	// Die 3DS-Datei
	VAR STRING	visual							;

	// Veränderung des NSC-Meshes beim Anlegen dieses Gegenstandes
	VAR STRING  visual_change					;		//	ASC - File
	VAR STRING  effect;								//	Effekt Instanz

	VAR INT		visual_skin						;
	
	VAR STRING 	scemeName						;
	VAR INT		material						;	
	// VAR STRING	pfx								;		//	Magic Weapon PFX
	VAR INT		munition						;		//	Instance of Munition
															
	var int 	spell							;			
	var int		range							;			
	
	var int		mag_circle						;
	
	VAR STRING	description						;
	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
	
	// inventory darstellungs geschichten, wird nur benutzt, falls von 0 abweichend
	var int	    inv_zbias;								//  wie weit ist das item im inventory richtung far plane verschoben (integer scale 100=1)
	var	int		inv_rotx;								//  wieviel grad um die x achse ist das item im inv gedreht
	var int 	inv_roty;								//  wieviel grad um die y achse ist das item im inv gedreht
	var int 	inv_rotz;								//  wieviel grad um die z achse ist das item im inv gedreht
	var int 	inv_animate;							//  soll das item in inv rotiert werden
};
```
It has many member variables, but not all of them are used for every item. But it is not necessary to define every one of these variables for every item, as it was discussed [here](https://ataulien.github.io/Inside-Gothic/objects/item/).

## Creating your own item

Since the `C_ITEM` class contains all information for every item type. As with everything, it is best to look at how it has been done in the game. 

You can look into your own game into the Item directory `Content/Items` (provided you have installed the MDK). Or [Vaana's unified scripts](https://github.com/VaanaCZ/gothic-1-classic-scripts/tree/1.08j-EN/_work/Data/Scripts/Content/Items)

### Example: Sword

As an example we can take the rusty sword you can find at the start in Gothic. Here it is [in the scripts](https://github.com/VaanaCZ/gothic-1-classic-scripts/blob/b224f067beef35d8b685220865425db2532058d0/_work/Data/Scripts/Content/Items/Melee_Weapons.d#L200).

```c++
INSTANCE ItMw_1H_Sword_Old_01 (C_Item)
{	
	name 			=	"Rusty Sword";

	mainflag 		=	ITEM_KAT_NF;
	flags 			=	ITEM_SWD;	
	material 		=	MAT_METAL;

	value 			=	10;

	damageTotal		= 	10;
	damagetype 		=	DAM_EDGE;
	range    		=  	100;		

	cond_atr[2]   		= 	ATR_STRENGTH;
	cond_value[2]  		= 	5;
	visual 			=	"ItMw_1H_Sword_Old_01.3DS";

	description		= name;
	TEXT[2]			= NAME_Damage;					COUNT[2]	= damageTotal;
	TEXT[3] 		= NAME_Str_needed;				COUNT[3]	= cond_value[2];
	TEXT[4] 		= NAME_OneHanded;
	TEXT[5]			= NAME_Value;					COUNT[5]	= value;
};
```

Let's go over the code. First we define new instance `instance` then the identifier (you may recognize these as the MARVIN mode insert codes) and then in parentheses that contain the `class` or `prototype`. Then come the curly brackets in which we define the member variables we want to.

- `name` - type string - the focus name of the item (as you can see it on the ground)
- `mainflag` - type int - determines in what inventory category the item belongs to
- `flag` - type int - determines more granular category - one handed sword, key, bow, etc.
- `value` - type int - the value of the item
- `damageTotal` - type int - how much damage the weapon does
- `damagetype` - type int - damage type (more information on [Inside-gothic](https://ataulien.github.io/Inside-Gothic/damage/))
- `range` - type int - the range of the weapon
- `cond_atr` - type int array -
- `cond_value` - type int array -
- `visaul` - type string - the model the item is going to have in-game
- `description` - name of the item in your inventory, in this case we just assign the `name` value
- `text` - type string array - array of strings, that shows up on the left side in the item info box
- `count` - type int array - array of integers, that shows up on the right side in the item info box