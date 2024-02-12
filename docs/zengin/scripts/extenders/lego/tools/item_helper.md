---
title: ItemHelper
description: LeGo package that makes changing `C_ITEM` instance to `oCItem` pointer possible
---
# ItemHelper

!!! info inline end
    **Dependencies:**<br/>
    - None<br/>
    **Implementation:**<br/>
    [:material-github: ItemHelper.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/ItemHelper.d)

This package is very simple - it retrieves a `oCItem` pointer from an `C_ITEM` instance valid for the current world and session.

!!! Warning
    Make sure every world has waypoint with name `TOT` ("dead" in German). Ikarus & LeGo need this waypoint to spawn helper NPCs.  
    This is especially important in Gothic 1 since G1 vanilla worlds do not have the `TOT` waypoint.

## Initialization
N/A

## Functions

### `Itm_GetPtr`
!!! function "`Itm_GetPtr`"
    ```dae
    func int Itm_GetPtr(var int instance)
    ```
    **Parameters**

    - `#!dae var int instance`  
        `C_ITEM` instance to get the pointer of

    **Return value**
    The function returns `oCItem` pointer of the `C_ITEM` instance.
