# oCTriggerChangeLevel

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCTriggerChangeLevel`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `24577`<br/>
    — Gothic II: `24577`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCTriggerChangeLevel/)

A special [`zCTrigger`](index.md) which in addition to performing all other trigger actions also causes the engine
to load another level when activated.

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

## Class member overview

### `levelName` {: .sp-string}

The name of the level to load including the file extension.

### `startVobName` {: .sp-string}

The name of the VObject in the new level to place the player at.
