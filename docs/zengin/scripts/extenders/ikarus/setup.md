---
title: Setup
---

# Ikarus Setup

## Download
First you need to download ikarus from the [official github repository](https://github.com/Lehona/Ikarus). We recommend using the master branch as it contains the latest and most up-to-date version of Ikarus. However, you can also download a specific release if needed.

## File location
Before unpacking the downloaded archive it's needed to create a dedicated folder in `<Gothic-dir>\_work\Data\Scripts\Content` directory. You can name this folder as you wish; in this guide, we'll refer to it as the "MOD" folder. Unpack the downloaded files into this newly created folder. The archiver should create a folder named `Ikarus-master` or `Ikarus-X.X.X`. For better readability change its name to the much simpler `Ikarus`.

!!! Tip
    It's a good practice to delete any unused files, so delete files for other gothic version than this you are using.

## Parsing
Ikarus consists of three main parts, [constants](./constants.md), classes and the Ikarus core. It's essential to parse these in a specific order. Additionally, there is a [floats package](floats.md) which isn't essential, but it is highly recommended to parse it, especially if you are working with [LeGo](../lego/index.md) that depends on it.

The Ikarus Core is identical for both Gothic 1 and 2 and is contained in a single file, [`Ikarus.d`](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d). However, there are separate files for the constants and classes for each engine, and they must be parsed correctly. Ikarus uses a C_NPC and therefore has to be parsed after the C_NPC class (after the `classes.d` file). There are no other dependencies.

Since Ikarus 1.2.1 there is additional `.src` file for each game engine, to simplify adding files to `Gothic.src` 

!!! Warning
    Following example is for Gothic 2. If you are using Gothic 1 replace the `G2` at the end of the file/directory name with `G1`.

=== "Gothic.src"
    ```
    _INTERN\CONSTANTS.D
    _INTERN\CLASSES.D
    MOD\IKARUS\Ikarus_Const_G2.d
    MOD\IKARUS\EngineClasses_G2\*.d
    MOD\IKARUS\Ikarus.d
    MOD\IKARUS\float.d
    ```
=== "Gothic.src (Ikarus 1.2.1+)"
    ```
    _INTERN\CONSTANTS.D
    _INTERN\CLASSES.D
    MOD\IKARUS\IKARUS_G2.SRC
    ```

## Initialization
Before you can use Ikarus in your scripts, it must be properly initialized. The initialization process differs between Gothic 1 and Gothic 2.

### `MEM_InitAll`
This is main ikarus initialization function, however it consists of some smaller initialization functions.
=== "Declaration"
    ```dae
    func void MEM_InitAll()
    ```

=== "Definition"

    ```dae
    func void MEM_InitAll() {
        if (!MEMINT_ReportVersionCheck()) {
            return;
        };

        MEM_ReinitParser(); /* depends on nothing */
        MEM_InitLabels(); /* depends in MEM_ReinitParser */
        MEM_InitGlobalInst(); /* depends on MEM_ReinitParser */
        
        /* now I can use MEM_ReplaceFunc, MEM_GetFuncID */
        MEM_GetAddress_Init(); /* depends on MEM_ReinitParser and MEM_InitLabels */
        /* now the nicer operators are available */
        
        MEM_InitStatArrs(); /* depends on MEM_ReinitParser and MEM_InitLabels */
        ASMINT_Init();
        
        MEMINT_ReplaceLoggingFunctions();
        MEMINT_ReplaceSlowFunctions();
        MEM_InitRepeat();
        
        /* takes a wail the first time it is called.
            call it to avoid delay later */
        var int dump; dump = MEM_GetFuncIDByOffset(0);
    };
    ```

=== "List of functions"
    - [MEM_ReinitParser](functions/parser.md#mem_reinitparser)
    - [MEM_InitLabels](functions/jumps_loops.md#initialization)
    - [MEM_InitGlobalInst](functions/objects.md#mem_initglobalinst)
    - [MEM_GetAddress_Init](functions/parser.md#mem_getaddress_init)
    - [MEM_InitStatArrs](functions/parser.md#mem_initstatarrs)
    - [ASMINT_Init](functions/asm.md#asmint_init)
    - [MEM_InitRepeat](functions/jumps_loops.md#initialization_1)

### Gothic 1
To initialize Ikarus in Gothic 1 you must define your own `INIT_GLOBAL` function at the top of the `Startup.d` file. Then the `INIT_GLOBAL` should be called in every `INIT_<location>` function (e.g. `INIT_SURFACE`,`INIT_OLDCAMP` etc.). `INIT_SUB_<location>` functions can be skipped in that process.

Then in your `INIT_GLOBAL` function you call `MEM_InitAll()` initialization function.

```dae title="Startup.d"
FUNC VOID INIT_GLOBAL()
{
    // Init Ikarus
    MEM_InitAll ();
};

// [...]

func VOID INIT_SURFACE ()
{
	Init_Global();
    INIT_SUB_SURFACE ();
};
// [...]
```

### Gothic 2
Gothic 2 has its own `INIT_GLOBAL` function, so the initialization process is much simpler. All you have to do is to call `MEM_InitAll()` in `INIT_GLOBAL` function located in the `Startup.d` file.

```dae title="Startup.d"
FUNC VOID INIT_GLOBAL()
{
    // Init Ikarus
    MEM_InitAll ();
};

// [...]
```