# oCMobInter

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCMobInter`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `35585`<br/>
    — Gothic II: `35585`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_ocmobinter/1-1-0-504)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCMobInter/)


Interactive objects can be interacted with by NPCs and the player. Every time the object is interacted with, an
`OnTrigger` event is sent to the [`triggerTarget`](#triggertarget) object.

## Class members

=== "Gothic 1"

    - [zCVob](../../../index.md)
      {: .sp-class}
    - [oCVob](../../index.md)
      {: .sp-class}
    - [oCMOB](../index.md)
      {: .sp-class}
    - oCMobInter
      {: .sp-class}
        - [stateNum](#statenum) = 0
          {: .sp-int}
        - [triggerTarget](#triggertarget) = ""
          {: .sp-string}
        - [useWithItem](#usewithitem) = ""
          {: .sp-string}
        - [conditionFunc](#conditionfunc) = ""
          {: .sp-string}
        - [onStateFunc](#onstatefunc) = ""
          {: .sp-string}
        - [rewind](#rewind) = FALSE
          {: .sp-bool}

=== "Gothic 2"

    - [zCVob](../../../index.md)
      {: .sp-class}
    - [oCVob](../../index.md)
      {: .sp-class}
    - [oCMOB](../index.md)
      {: .sp-class}
    - oCMobInter
      {: .sp-class}
        - [stateNum](#statenum) = 0
          {: .sp-int}
        - [triggerTarget](#triggertarget) = ""
          {: .sp-string}
        - [useWithItem](#usewithitem) = ""
          {: .sp-string}
        - [conditionFunc](#conditionfunc) = ""
          {: .sp-string}
        - [onStateFunc](#onstatefunc) = ""
          {: .sp-string}
        - [rewind](#rewind) = FALSE
          {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](../../../index.md)
      {: .sp-class}
    - [oCVob](../../index.md)
      {: .sp-class}
    - [oCMOB](../index.md)
      {: .sp-class}
    - oCMobInter
      {: .sp-class}
        - [stateNum](#statenum) = 0
          {: .sp-int}
        - [triggerTarget](#triggertarget) = ""
          {: .sp-string}
        - [useWithItem](#usewithitem) = ""
          {: .sp-string}
        - [conditionFunc](#conditionfunc) = ""
          {: .sp-string}
        - [onStateFunc](#onstatefunc) = ""
          {: .sp-string}
        - [rewind](#rewind) = FALSE
          {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](../../../index.md)
      {: .sp-class}
    - [oCVob](../../index.md)
      {: .sp-class}
    - [oCMOB](../index.md)
      {: .sp-class}
    - oCMobInter
      {: .sp-class}
        - [stateNum](#statenum) = 0
          {: .sp-int}
        - [triggerTarget](#triggertarget) = ""
          {: .sp-string}
        - [useWithItem](#usewithitem) = ""
          {: .sp-string}
        - [conditionFunc](#conditionfunc) = ""
          {: .sp-string}
        - [onStateFunc](#onstatefunc) = ""
          {: .sp-string}
        - [rewind](#rewind) = FALSE
          {: .sp-bool}

## Class member overview

### `stateNum` {: .sp-int}

Unknown.

### `triggerTarget` {: .sp-string}

The name of the VObject(s) to send an `OnTrigger` event to when this object is interacted with. Controlled by
the [`rewind`](#rewind) property.

### `useWithItem` {: .sp-string}

The name of the item which the player or NPC must have in their inventory in order to interact with the object.
Corresponds to the name of the item instance in the scripts.

### `conditionFunc` {: .sp-string}

The name of a script function which, when called, determines whether the object can be interacted with. The script
function returns an int which is either `0`, if the object should be disabled and `1` if it should be enabled.

### `onStateFunc` {: .sp-string}

The name of a script function to be called when the object is being used.

### `rewind` {: .sp-bool}

Determines whether an `OnTrigger` event should be sent every time the object is interacted with or only the first time.

**Accepted values:**

* `TRUE` — Send `OnTrigger` events multiple times
* `FALSE` — Only send the event once
