# oCTriggerScript

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCTriggerScript`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `24577`<br/>
    — Gothic II: `24577`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCTriggerScript/)

A special [`zCTrigger`](index.md) which in addition to performing all other trigger actions also calls a script
function when the trigger is activated. `OnUntrigger` events do not result in the script function being called.

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerScript
      {: .sp-class}
        - [scriptFunc](#scriptfunc) = ""
          {: .sp-string}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerScript
      {: .sp-class}
        - [scriptFunc](#scriptfunc) = ""
          {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerScript
      {: .sp-class}
        - [scriptFunc](#scriptfunc) = ""
          {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - oCTriggerScript
      {: .sp-class}
        - [scriptFunc](#scriptfunc) = ""
          {: .sp-string}

## Class member overview

### `scriptFunc` {: .sp-string}

The name script function to call when the trigger successfully processes a message.
