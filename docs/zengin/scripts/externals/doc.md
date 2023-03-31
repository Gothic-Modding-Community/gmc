# Doc external functions

Doc functions are used to control the document manager. They allow you to fine tune the display of maps and documents.

## `Doc_Create`

Creates a new instance of the document manager and returns its ID.
```dae
func int Doc_Create() {};
```

**Return value**  
Returns the ID of the document manager instance.

!!! Example
    ```dae
    var int nDocID; // Variable to store the id in
    nDocID = Doc_Create();
    ```

## `Doc_CreateMap`

Creates a new instance of the document manager with the arrow showing players position on the map and returns its ID.
```dae
func int Doc_CreateMap() {};
```

**Return value**  
Returns the ID of the document manager instance.

!!! Example
    ```dae
    var int nDocID; // Variable to store the id in
    nDocID = Doc_CreateMap();
    ```

## `Doc_SetLevel`

Set a world level to a map. This maps the texture of the document to the bounding box of the provided level.
```dae
func void Doc_SetLevel(var int docID, var string level) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var string level`  
Name of the ZEN file

!!! Example
    ```dae
    nDocID = Doc_CreateMap();
    Doc_SetLevel(nDocID, "WORLD.ZEN");
    ```

## `Doc_SetLevelCoords`

!!! Warning
    This function is only available in Gothic 2

Sets the map coordinates. This is used to map smaller portions of the world map to the document map to correctly show players position on the map.
```dae
func void Doc_SetLevelCoords(var int docID, var int left, var int top, var int right, var int bottom) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int left`  
Left coordinate
- `#!dae var int top`  
Top coordinate
- `#!dae var int right`  
Right coordinate
- `#!dae var int bottom`  
Bottom coordinate

!!! Example
    ```dae
    Doc_SetLevelCoords(nDocID, -28000, 50500, 95500, -42500);
    ```

## `Doc_SetFont`
Sets a `font` to be used on a `page` in a document with `docID`. Can be called multiple times to diplay different lines with different fonts.

```dae
func void Doc_SetFont(var int docID, var int page, var string font) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int page`  
Page index, if set to `-1`, fonts will be applied to all pages 
- `#!dae var string font`  
Font to be used

!!! Example
    ```dae
    Doc_SetFont(nDocID, -1, "FONT_10_BOOK.TGA");
    ```

## `Doc_SetPages`

Sets the number of pages `numOfPages` of the document.
```dae
func void Doc_SetPages(var int docID, var int numOfPages) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int numOfPages`  
Number of pages

!!! Example
    ```dae
    nDocID = Doc_Create();
    Doc_SetPages(nDocID, 2);
    ```

## `Doc_SetPage`

Set `page` to have `texture` as a background with `scale`.
```dae
func void Doc_SetPage(var int docID, var int page, var string texture, var int scale) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int page`  
Page index, if set to `-1`, settings are applied to all pages
- `#!dae var string texture`  
Texture of the background
- `#!dae var int scale`  
Scale of the texture, `TRUE` to scale the page, `FALSE` to not scale 

!!! Example
    ```dae
    Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", FALSE);
    Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", FALSE);
    ```

## `Doc_SetMargins`

Sets text margins of the page
```dae
func void Doc_SetMargins(var int docID,
                         var int page,
                         var int left,
                         var int top,
                         var int right,
                         var int bottom,
                         var int pixels) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int page`  
Page index, if set to `-1`, settings are applied to all pages
- `#!dae var int left`  
Left margin
- `#!dae var int top`  
Top margin
- `#!dae var int right`  
Right margin
- `#!dae var int bottom`  
Bottom margin
- `#!dae var int pixels`  
`TRUE` to use pixels, `FALSE` to use virtual coordinates

!!! Example
    ```dae
    Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, TRUE);
    ```

## `Doc_PrintLine`

Prints a line of `text` (font is set using [Doc_SetFont](#doc_setfont)) onto the document with `docID`, onto the `page`. Does not split the text into multiple lines if they do not fit onto the page.
```dae
func void Doc_PrintLine(var int docID, var int page, var string text) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int page`  
Page index
- `#!dae var string text`  
Text to be printed

!!! Example
    ```dae
    Doc_PrintLine(nDocID, 0, ""); // insert empty line
    Doc_PrintLine(nDocID, 0, "The Book");
    ```

## `Doc_PrintLines`

Prints a line of `text` (font is set using [Doc_SetFont](#doc_setfont)) onto the document with `docID`, onto the `page`. Splits the text into multiple lines if they do not fit onto the page.
```dae
func void Doc_PrintLines(var int docID, var int page, var string text) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID
- `#!dae var int page`  
Page index
- `#!dae var string text`  
Text to be printed

!!! Example
    ```dae
    Doc_PrintLines(nDocID, 0, "The war had been decided. Varant had lost its seaports, vital to army supplies. King Rhobar had not lingered on the battle fields for a long time, but left his generals to deal with the few remaining enemy troops. Varant had only one large force left, commanded by Lukkor, the most capable warlord of the Varant army, who had more than once turned defeat into victory.");
    Doc_PrintLines(nDocID, 0, "But now his army was trapped. The situation was hopeless, even though his army greatly outnumbered the enemy. Lee, a war hero from Myrtana, had lured him into this trap. The heavy cavalry had been unable to fight on the thick, swamped ground of the narrow valley. Lee's soldiers had occupied the range of hills surrounding the swamp, and they had struck repeatedly, decimating the army. The desperate sallies his troops had launched had been cut short in pools of blood. He was beaten.");
    ```

## `Doc_Show`

Display the document using the document manager ID
```dae
func void Doc_Show(var int docID) {};
```

**Parameters**

- `#!dae var int docID`  
Document manager ID

!!! Example
    ```dae
    var int nDocID; // Variable to store the id in
    nDocID = Doc_Create();
    
    // ... document configuration
    
    Doc_Show(nDocID);
    ```

## Externals with docu comments

```dae
/// Creates a new instance of the document manager and returns its ID.
///
/// @return Returns the ID of the document manager instance.
func int Doc_Create() {};

/// Create a new instance of the document manager with the arrow showing players position on the map and returns its ID.
///
/// @return Returns the ID of the document manager instance.
func int Doc_CreateMap() {};

/// Prints a line of `text` onto the document with `docID`, onto the `page`.
/// Does not line break
/// 
/// @param docID document manager ID
/// @param page page index
/// @param text text to be printed
func void Doc_PrintLine(var int docID, var int page, var string text) {};

/// Prints a line of `text` onto the document with `docID`, onto the `page`. The `text` is automatically split into multiple lines
/// 
/// @param docID document manager ID
/// @param page page index
/// @param text text to be printed
func void Doc_PrintLines(var int docID, var int page, var string text) {};

/// Sets a `font` to be used on a `page` in a document with `docID`. Can be called multiple times to diplay different lines with different fonts.
///
/// @param docID document manager ID
/// @param page page index
/// @param font font to be used
func void Doc_SetFont(var int docID, var int page, var string font) {};

/// Sets the number of pages `numOfPages` of the document.
///
/// @param docID document manager ID
/// @param numOfPages number of pages
func void Doc_SetPages(var int docID, var int numOfPages) {};

/// Set `page` to have `texture` as a background with `scale`. 
///
/// @param docID document manager ID
/// @param page page index, if set to `-1`, settings are applied to all pages
/// @param texture texture of the background
/// @param scale scale of the texture, if set to 1, there will be no resizing
func void Doc_SetPage(var int docID, var int page, var string texture, var int scale) {};

/// Set a world level to a map.
///
/// @param docID document manager ID
/// @param level name of the ZEN file
func void Doc_SetLevel(var int docID, var string level) {};

/// Sets the map coordinates. 
/// 
/// @param docID document manager ID
/// @param left left
/// @param top top
/// @param right top
/// @param bottom bottom
func void Doc_SetLevelCoords(var int docID, var int left, var int top, var int right, var int bottom) {};

/// Sets text margins of the page
///
/// @param docID document manager ID
/// @param page page index, if set to `-1`, settings are applied to all pages
/// @param left left margin
/// @param top top margin
/// @param right right margin
/// @param bottom bottom margin
/// @param pixels `TRUE` to use pixels, `FALSE` to use virtual coordinates
func void Doc_SetMargins(var int docID,
                         var int page,
                         var int left,
                         var int top,
                         var int right,
                         var int bottom,
                         var int pixels) {};

/// Display the document using the document manager ID
///
/// @param docID document manager ID
func void Doc_Show(var int docID) {};



/// deprecated
func void Doc_Open (var string Texture) {};

/// deprecated
func void Doc_Font(var string Font) {};

/// deprecated
func void Doc_Print (var string Text) {};

/// deprecated
func void Doc_MapCoordinates(var string s0,
                             var float r1,
                             var float r2,
                             var float r3,
                             var float r4,
                             var float r5,
                             var float r6,
                             var float r7,
                             var float r8) {};
```


