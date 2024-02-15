---
title: Focusnames
description: LeGo package that change NPCs/Object's focus name color based on its attitude
---
# Focusnames

!!! info inline end
    **Dependencies:**<br/>
    - [Interface](../tools/interface.md)<br/>
    - [HookEngine](../tools/hook_engine.md)<br/>
    **Implementation:**<br/>
    [:material-github: Focusnames.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Focusnames.d)

This package colors the focus names of the NPCs in appropriate colors according to the behavior defined below (alpha values are taken into account). Also affects monsters. (Mobs/Items get Color_Neutral)

## Initialization
Initialize with `LeGo_Focusnames` flag.
```dae
LeGo_Init(LeGo_Focusnames);
```

## Usage
If you want to change colors for any behavior edit the following functions directly in [`Focusnames.d`](https://github.com/Lehona/LeGo/blob/dev/Focusnames.d) file.

### `Focusnames_Color_Friendly`
!!! function "`Focusnames_Color_Friendly`"
    ```dae
    func int Focusnames_Color_Friendly()
    {
        return RGBA(0, 255, 0, 255); // Green
    };
    ```

### `Focusnames_Color_Neutral`
!!! function "`Focusnames_Color_Neutral`"
    ```dae
    func int Focusnames_Color_Neutral()
    {
        return RGBA(255, 255, 255, 255); // White
    };
    ```

### `Focusnames_Color_Angry`
!!! function "`Focusnames_Color_Angry`"
    ```dae
    func int Focusnames_Color_Angry()
    {
        return RGBA(255, 180, 0, 255); // Orange
    };
    ```

### `Focusnames_Color_Hostile`
!!! function "`Focusnames_Color_Hostile`"
    ```dae
    func int Focusnames_Color_Hostile()
    {
        return RGBA(255, 0, 0, 255); // Red
    };
    ```
