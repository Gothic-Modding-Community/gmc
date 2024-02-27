# oCItem

!!! abstract inline end "Quick Infos"
    **Class Name:** `oCItem`<br/>
    **Version Identifiers:**<br />
    — Gothic I: `0`<br/>
    — Gothic II: `0`<br/>
    **Sources:**<br/>
    — [gothic-library.ru](http://www.gothic-library.ru/publ/class_occstrigger/1-1-0-530)<br/>
    — [zk.gothickit.dev](https://zk.gothickit.dev/engine/objects/oCItem/)

Represents an item in the game world. Items are special VObjects which are tied to a script instance which defines
their attributes. They have physics enabled and can be targeted and picked up by the player.

## Class members

=== "Gothic 1"

    - [zCVob](../index.md)
      {: .sp-class}
    - [oCVob](index.md)
      {: .sp-class}
    - oCItem
      {: .sp-class}
        - [itemInstance](#iteminstance) = ""
          {: .sp-string}

=== "Gothic 2"

    - [zCVob](../index.md)
      {: .sp-class}
    - [oCVob](index.md)
      {: .sp-class}
    - oCItem
      {: .sp-class}
        - [itemInstance](#iteminstance) = ""
          {: .sp-string}

=== "Gothic 1 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [oCVob](index.md)
      {: .sp-class}
    - oCItem
      {: .sp-class}
        - [itemInstance](#iteminstance) = ""
          {: .sp-string}
        - [amount](#amount) = 0
          {: .sp-int}
        - [flags](#flags) = 0
          {: .sp-int}

=== "Gothic 2 (Save)"

    - [zCVob](../index.md)
      {: .sp-class}
    - [oCVob](index.md)
      {: .sp-class}
    - oCItem
      {: .sp-class}
        - [itemInstance](#iteminstance) = ""
          {: .sp-string}
        - [amount](#amount) = 0
          {: .sp-int}
        - [flags](#flags) = 0
          {: .sp-int}

## Class member overview

### `itemInstance` {: .sp-string}

The name of the script instance representing the item.

### `amount` {: .sp-int}

Unknown.

!!! warning
    This property is only available in saved games.

### `flags` {: .sp-int}

Unknown.

!!! warning
    This property is only available in saved games.
