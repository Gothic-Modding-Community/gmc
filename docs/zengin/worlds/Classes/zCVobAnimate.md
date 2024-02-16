# zCVobAnimate

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCVobAnimate`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `12289`<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/zcvobanimate/1-1-0-523)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCVobAnimate/)


A VObject used to create animated models. The visual of such objects can either be a
[morph mesh](../../engine/formats/morph-mesh.md) or a model with a skeletal animation
(i.e. a [model script](../../engine/formats/model-script.md)). The animation of these objects can be started
and stopped using `OnTrigger` and `OnUntrigger` events.

## Class members

=== "Gothic 1"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCVobAnimate
      {: .sp-class}
        - [startOn](#starton) = ""
          {: .sp-bool}

=== "Gothic 2"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCVobAnimate
      {: .sp-class}
        - [startOn](#starton) = ""
          {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCVobAnimate
      {: .sp-class}
        - [startOn](#starton) = ""
          {: .sp-bool}
        - [isRunning](#isrunning) = FALSE
          {: .sp-bool}

=== "Gothic 2 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCVobAnimate
      {: .sp-class}
        - [startOn](#starton) = ""
          {: .sp-bool}
        - [isRunning](#isrunning) = FALSE
          {: .sp-bool}

## Class member overview

### `startOn` {: .sp-bool}

Whether to start this animation when loading the level.

**Accepted values:**

* `TRUE` — Immediately start the animation when the level is loaded.
* `FALSE` — Don't automatically start the animation.

### `isRunning` {: .sp-bool}

Unknown.

!!! warning
    This property is only available in saved games.
