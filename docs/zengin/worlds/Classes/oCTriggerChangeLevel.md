# oCTriggerChangeLevel

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCTriggerChangeLevel`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `24577`<br/>
    — Gothic II: `24577`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCTouchDamage/)

A special [`zCTrigger`](zCTrigger.md) which in addition to performing all other trigger actions also causes the engine
to load another level when activated.

## Class members

=== "Gothic 1"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [zCTrigger](zCTrigger.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 2"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [zCTrigger](zCTrigger.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [zCTrigger](zCTrigger.md)
      {: .sp-class}
    - oCTriggerChangeLevel
      {: .sp-class}
        - [levelName](#levelname) = ""
          {: .sp-string}
        - [startVobName](#startvobname) = ""
          {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - [zCTrigger](zCTrigger.md)
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
