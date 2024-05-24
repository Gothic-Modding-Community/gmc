# oCMobContainer

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCMobContainer`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `64513`<br/>
    — Gothic II: `64513`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/ocmobcontainer/1-1-0-509)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCMobContainer/)

An object which contains items.

## Class members

=== "Gothic 1"

    - [zCVob](../../../../index.md)
      {: .sp-class}
    - [oCVob](../../../index.md)
      {: .sp-class}
    - [oCMOB](../../index.md)
      {: .sp-class}
    - [oCMobInter](../index.md)
      {: .sp-class}
    - [*oCMobLockable*](index.md)
      {: .sp-class}
    - oCMobContainer
      {: .sp-class}
        - Container
          {: .sp-folder}
            - [contains](#contains) = ""
              {: .sp-string}

=== "Gothic 2"

    - [zCVob](../../../../index.md)
      {: .sp-class}
    - [oCVob](../../../index.md)
      {: .sp-class}
    - [oCMOB](../../index.md)
      {: .sp-class}
    - [oCMobInter](../index.md)
      {: .sp-class}
    - [*oCMobLockable*](index.md)
      {: .sp-class}
    - oCMobContainer
      {: .sp-class}
        - Container
          {: .sp-folder}
            - [contains](#contains) = ""
              {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](../../../../index.md)
      {: .sp-class}
    - [oCVob](../../../index.md)
      {: .sp-class}
    - [oCMOB](../../index.md)
      {: .sp-class}
    - [oCMobInter](../index.md)
      {: .sp-class}
    - [*oCMobLockable*](index.md)
      {: .sp-class}
    - oCMobContainer
      {: .sp-class}
        - Container
          {: .sp-folder}
            - [contains](#contains) = ""
              {: .sp-string}
        - [NumOfEntries](#numofentries) = 0
          {: .sp-int}
        - [oCItem](../../../oCItem.md) ... = NULL
          {: .sp-class}

=== "Gothic 2 (Save)"

    - [zCVob](../../../../index.md)
      {: .sp-class}
    - [oCVob](../../../index.md)
      {: .sp-class}
    - [oCMOB](../../index.md)
      {: .sp-class}
    - [oCMobInter](../index.md)
      {: .sp-class}
    - [*oCMobLockable*](index.md)
      {: .sp-class}
    - oCMobContainer
      {: .sp-class}
        - Container
          {: .sp-folder}
            - [contains](#contains) = ""
              {: .sp-string}
        - [NumOfEntries](#numofentries) = 0
          {: .sp-int}
        - [oCItem](../../../oCItem.md) ... = NULL
          {: .sp-class}

## Class member overview

### `contains` {: .sp-string}

The items found inside the container as a comma-separated list. Each element of the list starts with the name of the
item script instance and is optionally followed by a colon and a number, indicating the number of that item to be
found inside.
<br />Example: `ItMi_Gold:75, ItFo_Fish:2, ItMi_Quartz`.

### `NumOfEntries` {: .sp-int}

The number of items in the container.

!!! warning
    This property is only available in saved games.
