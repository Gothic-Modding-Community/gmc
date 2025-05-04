---
title: Setup
---

# LeGo Setup

!!! Danger
    LeGo depends on [Ikarus](../ikarus/index.md) script packet, if you didn't install it yet check the [Ikarus Setup](../ikarus/setup.md). This guide assumes that you already have Ikarus running.

## Download
First you need to download LeGo from the [official github repository](https://github.com/Lehona/LeGo). We recommend using the `dev` branch as it contains the latest and most up-to-date version of the package. However, you can also download a specific release if needed.

## File location
If you followed the Ikarus Setup guide you probably have a "MOD" (or any other named) folder inside the `<Gothic-dir>\_work\Data\Scripts\Content` directory. If not create it. 

Unpack the downloaded files into this folder. The archiver should create a folder named `LeGo-dev` or `LeGo-X.X.X`. For better readability change its name to just `LeGo`.

!!! Tip
    It's a good practice to delete any unused files, so delete files for other gothic version than this you are using.

## Parsing
LeGo has a special header files, one for each supported engine version. All you need to do is to include them in `Gothic.src` right after the Ikarus files.


=== "Gothic.src (G1)"
    ```
    _INTERN\CONSTANTS.D
    _INTERN\CLASSES.D
    MOD\IKARUS\IKARUS_G1.SRC
    MOD\LEGO\HEADER_G1.SRC
    ```
=== "Gothic.src (G2)"
    ```
    _INTERN\CONSTANTS.D
    _INTERN\CLASSES.D
    MOD\IKARUS\IKARUS_G2.SRC
    MOD\LEGO\HEADER_G2.SRC
    ```

## Initialization
Before you can use LeGo and its packages, it must be properly initialized.

!!! Warning
    Gothic 1 by default doesn't have its own `INIT_GLOBAL` function inside `Startup.d` file. If you haven't created it yet see how to do it [here](../ikarus/setup.md#gothic-1).

You initialize LeGo by calling the `LeGo_Init(var int flags)` function and specifying the flags.

=== "Init All"
    With `LeGo_All` flag you initialize all packages, excluding experimental [Buffs](./applications/buffs.md) and [Render](./applications/render.md).
    ```dae title="Startup.d"
    FUNC VOID INIT_GLOBAL()
    {
        // Init Ikarus
        MEM_InitAll ();
        // Init LeGo
        LeGo_Init(LeGo_All)
    };
    ```
=== "Exclude packages"
    By the bitwise `NOT` operator you can exclude specific packages from `LeGo_All` flag.
    ```dae title="Startup.d"
    FUNC VOID INIT_GLOBAL()
    {
        // Init Ikarus
        MEM_InitAll ();
        // Init LeGo
        LeGo_Init(LeGo_All &~ (LeGo_Focusnames | LeGo_Bloodsplats));
    };
    ```

=== "Init specific packages"
    You could also init specific packages with bitwise `OR`.
    ```dae title="Startup.d"
    FUNC VOID INIT_GLOBAL()
    {
        // Init Ikarus
        MEM_InitAll ();
        // Init LeGo
        LeGo_Init(LeGo_AI_Function | LeGo_Saves);
    };
    ```