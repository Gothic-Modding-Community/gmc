# oCMobLockable

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCMobLockable`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `12289`<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCMobLockable/)

The base class for many lockable objects like [containers](oCMobContainer.md) and [doors](oCMobDoor.md).

!!! warning
    This object is an abstract base class and cannot be instantiated by itself.

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
    - oCMobContainer
      {: .sp-class}
        - Lockable
          {: .sp-folder}
            - [locked](#locked) = FALSE
              {: .sp-bool}
            - [keyInstance](#keyinstance) = ""
              {: .sp-string}
            - [pickLockStr](#picklockstr) = ""
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
    - oCMobContainer
      {: .sp-class}
        - Lockable
          {: .sp-folder}
            - [locked](#locked) = FALSE
              {: .sp-bool}
            - [keyInstance](#keyinstance) = ""
              {: .sp-string}
            - [pickLockStr](#picklockstr) = ""
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
    - oCMobContainer
      {: .sp-class}
        - Lockable
          {: .sp-folder}
            - [locked](#locked) = FALSE
              {: .sp-bool}
            - [keyInstance](#keyinstance) = ""
              {: .sp-string}
            - [pickLockStr](#picklockstr) = ""
              {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](../../../../index.md)
      {: .sp-class}
    - [oCVob](../../../index.md)
      {: .sp-class}
    - [oCMOB](../../index.md)
      {: .sp-class}
    - [oCMobInter](../index.md)
      {: .sp-class}
    - oCMobContainer
      {: .sp-class}
        - Lockable
          {: .sp-folder}
            - [locked](#locked) = FALSE
              {: .sp-bool}
            - [keyInstance](#keyinstance) = ""
              {: .sp-string}
            - [pickLockStr](#picklockstr) = ""
              {: .sp-string}

## Class member overview

### `locked` {: .sp-bool}

Determines whether the container is locked.

**Accepted values:**

* `TRUE` — The container is locked
* `FALSE` — The container is not locked

### `keyInstance` {: .sp-string}

The name of the item script instance which unlocks the container.

!!! tip
    Only relevant if the container is locked.

### `pickLockStr` {: .sp-string}

The combination which unlocks this container when picking the lock. Each character of the string is either `R` or
`L` where `R` stands for "Right" and `L` stands for "Left". If empty, the lock can not be picked.
<br />Example: `LRRLLRL`.

!!! tip
    Only relevant if the container is locked.
