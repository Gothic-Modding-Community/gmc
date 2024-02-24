# zCVobSoundDaytime

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCVobSoundDaytime`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `12289`<br/>
    — Gothic II: `12289`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_zcvobsounddaytime/1-1-0-702)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/zCVobSoundDaytime/)

Emits a sound defined by a script instance in a given radius during a given time during the day. Optionally, another
sound can be defined which is played outside the defined time range (example: birds during the day and crickets at night). 

## Class members

=== "Gothic 1"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - [zCVobSound](index.md)
      {: .sp-class}
    - zCVobSoundDaytime
      {: .sp-class}
        - SoundDaytime
          {: .sp-folder}
            - [sndStartTime](#sndstarttime) = 0
              {: .sp-float}
            - [sndEndTime](#sndendtime) = 0
              {: .sp-float}
            - [sndName2](#sndname2) = ""
              {: .sp-string}

=== "Gothic 2"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - [zCVobSound](index.md)
      {: .sp-class}
    - zCVobSoundDaytime
      {: .sp-class}
        - SoundDaytime
          {: .sp-folder}
            - [sndStartTime](#sndstarttime) = 0
              {: .sp-float}
            - [sndEndTime](#sndendtime) = 0
              {: .sp-float}
            - [sndName2](#sndname2) = ""
              {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - [zCVobSound](index.md)
      {: .sp-class}
    - zCVobSoundDaytime
      {: .sp-class}
        - SoundDaytime
          {: .sp-folder}
            - [sndStartTime](#sndstarttime) = 0
              {: .sp-float}
            - [sndEndTime](#sndendtime) = 0
              {: .sp-float}
            - [sndName2](#sndname2) = ""
              {: .sp-string}

=== "Gothic 2 (Save)"

    - [zCVob](../../index.md)
      {: .sp-class}
    - [*zCZone*](../index.md)
      {: .sp-class}
    - [zCVobSound](index.md)
      {: .sp-class}
    - zCVobSoundDaytime
      {: .sp-class}
        - SoundDaytime
          {: .sp-folder}
            - [sndStartTime](#sndstarttime) = 0
              {: .sp-float}
            - [sndEndTime](#sndendtime) = 0
              {: .sp-float}
            - [sndName2](#sndname2) = ""
              {: .sp-string}

## Class member overview

### `sndStartTime` {: .sp-float}

The time of day after which the sound can be heard (`13.5` corresponds to `13:30`). Must be less
than [`sndEndTime`](#sndendtime).

### `sndEndTime` {: .sp-float}

The time of day after which the sound can no longer be heard (`13.5` corresponds to `13:30`). Must be greater than
[`sndStartTime`](#sndstarttime).

### `sndName2` {: .sp-string}

The name of the script instance describing the sound to play outside the hours defined by
[`sndStartTime`](#sndstarttime) and [`sndendtime`](#sndendtime). May be empty.
