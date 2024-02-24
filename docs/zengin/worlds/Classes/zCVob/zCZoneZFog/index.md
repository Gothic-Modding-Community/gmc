# zCZoneZFog

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCZoneZFog`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `12289`<br/>
    — Gothic II: `52224`<br/>
    **Sources:**<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_zczonezfog/1-1-0-708)<br />
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCZoneZFog/)

A VObject which causes fog to appear within its bounding box.

## Class members

=== "Gothic 1"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCZoneZFog
      {: .sp-class}
        - ZoneZFog
          {: .sp-folder}
            - [fogRangeCenter](#fograngecenter) = 0.0
              {: .sp-float}
            - [innerRangePerc](#innerrangeperc) = 0.0
              {: .sp-float}
            - [fogColor](#fogcolor) = 0 0 0
              {: .sp-color}

=== "Gothic 2"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCZoneZFog
      {: .sp-class}
        - ZoneZFog
          {: .sp-folder}
            - [fogRangeCenter](#fograngecenter) = 0.0
              {: .sp-float}
            - [innerRangePerc](#innerrangeperc) = 0.0
              {: .sp-float}
            - [fogColor](#fogcolor) = 0 0 0
              {: .sp-color}
            - [fadeOutSky](#fadeoutsky) = FALSE
              {: .sp-bool}
            - [overrideColor](#overridecolor) = FALSE
              {: .sp-bool}

=== "Gothic 1 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCZoneZFog
      {: .sp-class}
        - ZoneZFog
          {: .sp-folder}
            - [fogRangeCenter](#fograngecenter) = 0.0
              {: .sp-float}
            - [innerRangePerc](#innerrangeperc) = 0.0
              {: .sp-float}
            - [fogColor](#fogcolor) = 0 0 0
              {: .sp-color}

=== "Gothic 2 (Save)"

    - [zCVob](zCVob.md)
      {: .sp-class}
    - zCZoneZFog
      {: .sp-class}
        - ZoneZFog
          {: .sp-folder}
            - [fogRangeCenter](#fograngecenter) = 0.0
              {: .sp-float}
            - [innerRangePerc](#innerrangeperc) = 0.0
              {: .sp-float}
            - [fogColor](#fogcolor) = 0 0 0
              {: .sp-color}
            - [fadeOutSky](#fadeoutsky) = FALSE
              {: .sp-bool}
            - [overrideColor](#overridecolor) = FALSE
              {: .sp-bool}

## Class member overview

### `fogRangeCenter` {: .sp-float}

The maximum distance of visibility if the player is in the center of the fog object.
    

### `innerRangePerc` {: .sp-float}

Unknown.

### `fogColor` {: .sp-color}

The color of the fog.

### `fadeOutSky` {: .sp-bool}

Whether to hide the sky when the player is inside the fog.

**Accepted values:**

* `TRUE` — Do not show the skybox when the player is inside the fog.
* `FALSE` — Do show the skybox when the player is inside the fog.
    
!!! warning
    This property is only available in Gothic II.

### `overrideColor` {: .sp-bool}

Unclear.

!!! warning
    This property is only available in Gothic II.
