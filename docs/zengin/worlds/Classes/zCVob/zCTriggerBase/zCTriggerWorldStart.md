# zCTriggerWorldStart

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCTriggerWorldStart`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `52224`<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCTriggerWorldStart/)

A special trigger which fires an `OnTrigger` event to its [`triggerTarget`](index.md#triggertarget) when the
world is loaded and started.

## Class members

=== "Gothic 1"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCTriggerWorldStart
      {: .sp-class}
        - [fireOnlyFirstTime](#fireonlyfirsttime) = FALSE
          {: .sp-bool}

=== "Gothic 2"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCTriggerWorldStart
      {: .sp-class}
        - [fireOnlyFirstTime](#fireonlyfirsttime) = FALSE
          {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCTriggerWorldStart
      {: .sp-class}
        - [fireOnlyFirstTime](#fireonlyfirsttime) = FALSE
          {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCTriggerBase*](index.md)
      {: .sp-class}
    - zCTriggerWorldStart
      {: .sp-class}
        - [fireOnlyFirstTime](#fireonlyfirsttime) = FALSE
          {: .sp-bool}

## Class member overview

### `fireOnlyFirstTime` {: .sp-bool}

Determines whether to fire the `OnTrigger` event only the first time the world is loaded.

**Accepted values:**

* `TRUE` — Only fire the event if this is the first time the world is loaded.
* `FALSE` — Fire the event every time the world is loaded.
