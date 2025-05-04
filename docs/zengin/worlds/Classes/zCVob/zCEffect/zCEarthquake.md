# zCEarthquake

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCEarthquake`<br/>
    **Version Identifiers:**<br />
    — Gothic I: *Unused*<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/zcearthquake/1-1-0-516)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCEarthquake/)


A VObject used to create an earthquake effect when it receives an `OnTrigger` event. An earthquake is represented
by a shaking camera.

!!! warning
    This VObject is only available in Gothic II.

## Class members

=== "Gothic 1"

    *Unavailable*

=== "Gothic 2"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCEffect*](index.md)
      {: .sp-class}
    - zCEarthquake
      {: .sp-class}
        - Earthquake
          {: .sp-folder}
            - [radius](#radius) = 200
              {: .sp-float}
            - [timeSec](#timesec) = 5
              {: .sp-float}
            - [amplitudeCM](#amplitudecm) = 0
              {: .sp-vec}

=== "Gothic 1 (Save)"

    *Unavailable*

=== "Gothic 2 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [*zCEffect*](index.md)
      {: .sp-class}
    - zCEarthquake
      {: .sp-class}
        - Earthquake
          {: .sp-folder}
            - [radius](#radius) = 200
              {: .sp-float}
            - [timeSec](#timesec) = 5
              {: .sp-float}
            - [amplitudeCM](#amplitudecm) = 0
              {: .sp-vec}

## Class member overview

### `radius` {: .sp-float}

The radius of the earthquake effect

### `timeSec` {: .sp-float}

The duration of the earthquake effect in seconds.

### `amplitudeCM` {: .sp-float}

The amplitude of the earthquake effect.
