# oCMOB

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCMOB`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `47105`<br/>
    — Gothic II: `47105`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/ocmob_class/1-1-0-503)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCMOB/)

A VObject which can optionally be moved and/or carried.

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [oCVob](../index.md)
      {: .sp-class}
    - oCMOB
      {: .sp-class}
        - MOB
          {: .sp-folder}
            - [focusName](#focusname) = ""
              {: .sp-string}
            - [hitpoints](#hitpoints) = 0
              {: .sp-int}
            - [damage](#damage) = 0
              {: .sp-int}
            - [moveable](#moveable) = FALSE
              {: .sp-bool}
            - [takeable](#takeable) = FALSE
              {: .sp-bool}
            - [focusOverride](#focusoverride) = FALSE
              {: .sp-bool}
            - [soundMaterial](#soundmaterial) = WOOD
              {: .sp-enum}
            - [visualDestroyed](#visualdestroyed) = ""
              {: .sp-string}
            - [owner](#owner) = ""
              {: .sp-string}
            - [ownerGuild](#ownerguild) = ""
              {: .sp-string}
        - [isDestroyed](#isdestroyed) = ""
          {: .sp-bool}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [oCVob](../index.md)
      {: .sp-class}
    - oCMOB
      {: .sp-class}
        - MOB
          {: .sp-folder}
            - [focusName](#focusname) = ""
              {: .sp-string}
            - [hitpoints](#hitpoints) = 0
              {: .sp-int}
            - [damage](#damage) = 0
              {: .sp-int}
            - [moveable](#moveable) = FALSE
              {: .sp-bool}
            - [takeable](#takeable) = FALSE
              {: .sp-bool}
            - [focusOverride](#focusoverride) = FALSE
              {: .sp-bool}
            - [soundMaterial](#soundmaterial) = WOOD
              {: .sp-enum}
            - [visualDestroyed](#visualdestroyed) = ""
              {: .sp-string}
            - [owner](#owner) = ""
              {: .sp-string}
            - [ownerGuild](#ownerguild) = ""
              {: .sp-string}
        - [isDestroyed](#isdestroyed) = ""
          {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [oCVob](../index.md)
      {: .sp-class}
    - oCMOB
      {: .sp-class}
        - MOB
          {: .sp-folder}
            - [focusName](#focusname) = ""
              {: .sp-string}
            - [hitpoints](#hitpoints) = 0
              {: .sp-int}
            - [damage](#damage) = 0
              {: .sp-int}
            - [moveable](#moveable) = FALSE
              {: .sp-bool}
            - [takeable](#takeable) = FALSE
              {: .sp-bool}
            - [focusOverride](#focusoverride) = FALSE
              {: .sp-bool}
            - [soundMaterial](#soundmaterial) = WOOD
              {: .sp-enum}
            - [visualDestroyed](#visualdestroyed) = ""
              {: .sp-string}
            - [owner](#owner) = ""
              {: .sp-string}
            - [ownerGuild](#ownerguild) = ""
              {: .sp-string}
        - [isDestroyed](#isdestroyed) = ""
          {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [oCVob](../index.md)
      {: .sp-class}
    - oCMOB
      {: .sp-class}
        - MOB
          {: .sp-folder}
            - [focusName](#focusname) = ""
              {: .sp-string}
            - [hitpoints](#hitpoints) = 0
              {: .sp-int}
            - [damage](#damage) = 0
              {: .sp-int}
            - [moveable](#moveable) = FALSE
              {: .sp-bool}
            - [takeable](#takeable) = FALSE
              {: .sp-bool}
            - [focusOverride](#focusoverride) = FALSE
              {: .sp-bool}
            - [soundMaterial](#soundmaterial) = WOOD
              {: .sp-enum}
            - [visualDestroyed](#visualdestroyed) = ""
              {: .sp-string}
            - [owner](#owner) = ""
              {: .sp-string}
            - [ownerGuild](#ownerguild) = ""
              {: .sp-string}
        - [isDestroyed](#isdestroyed) = ""
          {: .sp-bool}

## Class member overview

### `focusName` {: .sp-string}

The name of the object as seen in-game when focusing it.

### `hitpoints` {: .sp-int}

The number of hitpoints of the object.

### `damage` {: .sp-int}

The damage dealt by the object when being used.

### `moveable` {: .sp-bool}

Whether the object can be moved by the player.

**Accepted values:**

* `TRUE` — The object can be moved
* `FALSE` — The object can not be moved

### `takeable` {: .sp-bool}

Whether the object can be carried by the player.

**Accepted values:**

* `TRUE` — The object can be carried
* `FALSE` — The object can not be carried

### `focusOverride` {: .sp-bool}

Unknown.

### `soundMaterial` {: .sp-enum}

The sound to play when the object is hit.

**Accepted values:**

* `WOOD` — Wood.
* `STONE` — Stone.
* `METAL` — Metal.
* `LEATHER` — Leather.
* `CLAY` — Clay.
* `GLAS` — Glass.

### `visualDestroyed` {: .sp-string}

The name of the visual to use when the object is destroyed. Behaves like [zCVob.visual](../../index.md#visual).

### `owner` {: .sp-string}

The name of the script instance of the NPC who is the owner of this object.

### `ownerGuild` {: .sp-string}

The name of the guild this object belongs to. This name corresponds to the script constant for
each guild (i.e. `GIL_BAU`), found in `Constants.d`.

### `isDestroyed` {: .sp-bool}

Unknown.
