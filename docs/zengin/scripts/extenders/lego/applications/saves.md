---
title: Saves
description: LeGo package offering open data stream to the game save file
---
# Saves

!!! info inline end
    **Dependencies:**<br/>
    - [BinaryMachines](../tools/binary_machines.md)<br/>
    **Implementation:**<br/>
    [:material-github: Saves.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Saves.d)

Offers an open file stream that can read/write variables on save/load. It is used by [PermMem](../tools/permmem.md), so you don't need to address it manually anymore.

## Initialization
Initialize with `LeGo_Saves` flag.
```dae
LeGo_Init(LeGo_Saves);
```

## Functions

### `BW_Savegame`
!!! function "`BW_Savegame`"
    Custom function. It creates a stream to its own memory file, this can be filled with the `BW_*` functions from the [BinaryMachines](../tools/binary_machines.md#binarywriter).
    ```dae
    func void BW_Savegame()
    ```

### `BR_Savegame`
!!! function "`BR_Savegame`"
    Custom function. It opens a stream to a previously saved memory file, which can be read from the [BinaryMachines](../tools/binary_machines.md#binaryreader) using the `BR_*` functions.
    ```dae
    func void BR_Savegame()
    ```

## Examples

### Save a high score list
```dae
var string MyScoreList[10];
```

Since strings are not saved by the game by default, we use the functions from `Saves.d` to create an additional memory file that only belongs to us. At the top the [Saves.d](https://github.com/Lehona/LeGo/blob/dev/Saves.d) file has two functions: `BW_Savegame` and `BR_Savegame`. [BinaryMachines](../tools/binary_machines.md) functions are used to save or read the file, we don't need to do anything else than to use them here, the rest is done by `Saves.d` completely by itself. Therefore, we only modify these two functions.

```dae
func void BW_Savegame() 
{
    // Save high score list
    BW_String(MyScoreList[0]);
    BW_String(MyScoreList[1]);
    BW_String(MyScoreList[2]);
    BW_String(MyScoreList[3]);
    BW_String(MyScoreList[4]);
    BW_String(MyScoreList[5]);
    BW_String(MyScoreList[6]);
    BW_String(MyScoreList[7]);
    BW_String(MyScoreList[8]);
    BW_String(MyScoreList[9]);
};

func void BR_Savegame() 
{
    // Load high score list
    MyScoreList[0] = BR_String();
    MyScoreList[1] = BR_String();
    MyScoreList[2] = BR_String();
    MyScoreList[3] = BR_String();
    MyScoreList[4] = BR_String();
    MyScoreList[5] = BR_String();
    MyScoreList[6] = BR_String();
    MyScoreList[7] = BR_String();
    MyScoreList[8] = BR_String();
    MyScoreList[9] = BR_String();
};
```

!!! Tip
    Since LeGo 2.0, such things can be implemented much more elegantly with PermMem.
