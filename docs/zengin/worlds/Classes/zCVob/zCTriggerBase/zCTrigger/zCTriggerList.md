# zCTriggerList

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCTriggerList`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `59776`<br/>
    — Gothic II: `5505`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_zctriggerlist/1-1-0-534)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCTriggerList/)

A special trigger which emits the `OnTrigger` events emitted by the [`zCTrigger`](index.md) to multiple targets.
How the events are sent can be configured through [`listProcess`](#listprocess). The
[`triggerTarget`](../index.md#triggertarget) and [`fireDelaySec`](index.md#firedelaysec) properties of
[`zCTrigger`](index.md) should be ignored.

`OnUntrigger` events sent to the trigger list are propagated to all targets in the list.

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - zCTriggerList
      {: .sp-class}
        - TriggerList
          {: .sp-folder}
            - [listProcess](#listprocess) = LP_ALL
              {: .sp-enum}
            - [triggerTarget0](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay0](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget1](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay1](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget2](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay2](#firedelay) = 0
              {: .sp-float}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - zCTriggerList
      {: .sp-class}
        - TriggerList
          {: .sp-folder}
            - [listProcess](#listprocess) = LP_ALL
              {: .sp-enum}
            - [triggerTarget0](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay0](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget1](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay1](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget2](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay2](#firedelay) = 0
              {: .sp-float}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - zCTriggerList
      {: .sp-class}
        - TriggerList
          {: .sp-folder}
            - [listProcess](#listprocess) = LP_ALL
              {: .sp-enum}
            - [triggerTarget0](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay0](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget1](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay1](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget2](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay2](#firedelay) = 0
              {: .sp-float}
            - [actTarget](#acttarget) = 0
              {: .sp-int}
            - [sendOnTrigger](#sendontrigger) = TRUE
              {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](../index.md)
      {: .sp-class}
    - [zCTrigger](index.md)
      {: .sp-class}
    - zCTriggerList
      {: .sp-class}
        - TriggerList
          {: .sp-folder}
            - [listProcess](#listprocess) = LP_ALL
              {: .sp-enum}
            - [triggerTarget0](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay0](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget1](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay1](#firedelay) = 0
              {: .sp-float}
            - [triggerTarget2](#triggertarget) = ""
              {: .sp-string}
            - [fireDelay2](#firedelay) = 0
              {: .sp-float}
            - [actTarget](#acttarget) = 0
              {: .sp-int}
            - [sendOnTrigger](#sendontrigger) = TRUE
              {: .sp-bool}

## Class member overview

### `listProcess` {: .sp-enum}

Controls how events are sent to the targets.

**Accepted values:**
    
* `LP_ALL` — Every target in the trigger list is sent the `OnTrigger` event sequentially. The [`fireDelay`](#firedelay)
  of each target is taken into account so that target `n` is fired after `sum(fireDelay0, ..., fireDelayN-1)` seconds.
* `LP_NEXT_ONE` — The event is sent to the next target in the list.
* `LP_RAND_ONE` — The event is sent to a random target in the list.

### `triggerTarget` {: .sp-string}

The name of the VObject to send events to. Behaves like [`triggerTarget`](../index.md#triggertarget).

### `fireDelay` {: .sp-float}

The delay after which to fire the event to the target. Behaves like [`fireDelaySec`](index.md#firedelaysec).

### `actTarget` {: .sp-int}

Unknown.

!!! warning
    This property is only available in saved games.

### `sendOnTrigger` {: .sp-bool}

Unknown.

!!! warning
    This property is only available in saved games.
