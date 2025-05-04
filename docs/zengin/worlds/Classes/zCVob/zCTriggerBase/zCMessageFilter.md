# zCMessageFilter

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCMessageFilter`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `0`<br/>
    — Gothic II: `0`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCMessageFilter/)

Transforms any incoming `OnTrigger` and `OnUntrigger` events before passing them on to the trigger target. All
`OnTrigger` and `OnUntrigger` messages received by this `zCMessageFilter` VObject are transformed according to
[`onTrigger`](#ontrigger) and [`onUntrigger`](#onuntrigger) and then passed on to the VObject with the name specified
in the [`triggerTarget`](index.md#triggertarget).

## Class members

=== "Gothic 1"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCMessageFilter
      {: .sp-class}
        - [onTrigger](#ontrigger) = MT_TRIGGER
          {: .sp-enum}
        - [onUntrigger](#onuntrigger) = MT_UNTRIGGER
          {: .sp-enum}

=== "Gothic 2"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCMessageFilter
      {: .sp-class}
        - [onTrigger](#ontrigger) = MT_TRIGGER
          {: .sp-enum}
        - [onUntrigger](#onuntrigger) = MT_UNTRIGGER
          {: .sp-enum}

=== "Gothic 1 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCMessageFilter
      {: .sp-class}
        - [onTrigger](#ontrigger) = MT_TRIGGER
          {: .sp-enum}
        - [onUntrigger](#onuntrigger) = MT_UNTRIGGER
          {: .sp-enum}

=== "Gothic 2 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCMessageFilter
      {: .sp-class}
        - [onTrigger](#ontrigger) = MT_TRIGGER
          {: .sp-enum}
        - [onUntrigger](#onuntrigger) = MT_UNTRIGGER
          {: .sp-enum}

## Class member overview

### `onTrigger` {: .sp-enum}

The type of event to emit to the [`triggerTarget`](index.md#triggertarget) if this VObject receives an `OnTrigger` message.

**Accepted values:**

* `MT_NONE` — Don't emit another event.
* `MT_TRIGGER` — Emit an `OnTrigger` event.
* `MT_UNTRIGGER` — Emit an `OnUntrigger` event.
* `MT_ENABLE` — Emit an `Enable` event.
* `MT_DISABLE` — Emit a `Disable` event.
* `MT_TOGGLE_ENABLED` — Emit a `ToggleEnabled` event.

### `onUntrigger` {: .sp-enum}

The type of event to emit to the [`triggerTarget`](index.md#triggertarget) if this VObject receives an `OnUntrigger` message.

**Accepted values:**

* `MT_NONE` — Don't emit another event.
* `MT_TRIGGER` — Emit an `OnTrigger` event.
* `MT_UNTRIGGER` — Emit an `OnUntrigger` event.
* `MT_ENABLE` — Emit an `Enable` event.
* `MT_DISABLE` — Emit a `Disable` event.
* `MT_TOGGLE_ENABLED` — Emit a `ToggleEnabled` event.
