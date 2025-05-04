# oCZoneMusic

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCZoneMusic`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `0`<br/>
    — Gothic II: `0`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_oczonemusic/1-1-0-700)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCZoneMusic/)

A VObject which defines the music to be played within its bounding box. Music zones may overlap; if they do, their
[`priority`](#priority) property determines which music zone should be used. The camera object is used to test which
music zone applies. If no music zone applies the music defined in the optional [`oCZoneMusicDefault`](oCZoneMusicDefault.md)
is used.

The name of the music theme to be played is defined by the [`vobName`](../../index.md#vobname). Notice that end of the name is taken as a [C_MUSICTHEME](../../../../../scripts/classes/c_musictheme.md) prefix. For example zone `OLDCAMP_OC` will play theme starting with `OC_`.

!!! tip
    If the suffix `_NCI` or `_NCO` is added to the end of the zone name, it snows instead of rains in the zone.

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - oCZoneMusic
      {: .sp-class}
        - [enabled](#enabled) = TRUE
          {: .sp-bool}
        - [priority](#priority) = 0
          {: .sp-int}
        - [ellipsoid](#ellipsoid) = FALSE
          {: .sp-bool}
        - [reverbLevel](#reverblevel) = 0
          {: .sp-float}
        - [volumeLevel](#volumelevel) = 100
          {: .sp-float}
        - [loop](#loop) = TRUE
          {: .sp-bool}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - oCZoneMusic
      {: .sp-class}
        - [enabled](#enabled) = TRUE
          {: .sp-bool}
        - [priority](#priority) = 0
          {: .sp-int}
        - [ellipsoid](#ellipsoid) = FALSE
          {: .sp-bool}
        - [reverbLevel](#reverblevel) = 0
          {: .sp-float}
        - [volumeLevel](#volumelevel) = 100
          {: .sp-float}
        - [loop](#loop) = TRUE
          {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - oCZoneMusic
      {: .sp-class}
        - [enabled](#enabled) = TRUE
          {: .sp-bool}
        - [priority](#priority) = 0
          {: .sp-int}
        - [ellipsoid](#ellipsoid) = FALSE
          {: .sp-bool}
        - [reverbLevel](#reverblevel) = 0
          {: .sp-float}
        - [volumeLevel](#volumelevel) = 100
          {: .sp-float}
        - [loop](#loop) = TRUE
          {: .sp-bool}
        - [local_enabled](#local_enabled) = FALSE
          {: .sp-bool}
        - [dayEntranceDone](#dayentrancedone) = FALSE
          {: .sp-bool}
        - [nightEntranceDone](#nightentrancedone) = FALSE
          {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - oCZoneMusic
      {: .sp-class}
        - [enabled](#enabled) = TRUE
          {: .sp-bool}
        - [priority](#priority) = 0
          {: .sp-int}
        - [ellipsoid](#ellipsoid) = FALSE
          {: .sp-bool}
        - [reverbLevel](#reverblevel) = 0
          {: .sp-float}
        - [volumeLevel](#volumelevel) = 100
          {: .sp-float}
        - [loop](#loop) = TRUE
          {: .sp-bool}
        - [local_enabled](#local_enabled) = FALSE
          {: .sp-bool}
        - [dayEntranceDone](#dayentrancedone) = FALSE
          {: .sp-bool}
        - [nightEntranceDone](#nightentrancedone) = FALSE
          {: .sp-bool}

## Class member overview

### `enabled` {: .sp-bool}

Whether the music zone is enabled when loading the level. When disabled, no music will be played in the zone.

**Accepted values:**

* `TRUE` — Enable the music zone when loading the level
* `FALSE` — The not enable the zone

### `priority` {: .sp-int}

The priority of the music zone if two zones overlap. A higher number means a higher priority. `0` is the lowest
possible priority.

!!! warning
    Only relevant if two `zCZoneMusic` zones overlap.

### `ellipsoid` {: .sp-bool}

Determines the shape of the zone.

**Accepted values:**

* `TRUE` — The zone forms an ellipsoid within the bounding box.
* `FALSE` — The zone exactly mirrors the bounding box.

### `reverbLevel` {: .sp-float}

Unclear.

### `volumeLevel` {: .sp-float}

Unclear.

### `loop` {: .sp-bool}

Unclear.

### `local_enabled` {: .sp-bool}

Unknown.

!!! warning
    This property is only available in saved games.

### `dayEntranceDone` {: .sp-bool}

Unknown.

!!! warning
    This property is only available in saved games.

### `nightEntranceDone` {: .sp-bool}

Unknown.

!!! warning
    This property is only available in saved games.
