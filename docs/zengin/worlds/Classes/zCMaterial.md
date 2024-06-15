# zCMaterial

!!! abstract inline end "Quick Infos"
    **Class Name:** `zCMaterial`<br/>
    **Sources:**<br/>
    — [spacerhilfedatei.sph](https://wiki.worldofgothic.de/doku.php?id=spacer:hilfedatei)<br/>
    — [gothic-library.ru](http://gothic-library.ucoz.org/publ/class_zcmaterial/1-1-0-469)

`zCMaterial` class describes the properties of the game materials.

!!! Danger
    `zCMaterial` objects are only saved in binary `.ZEN` files.

## Class members

=== "Gothic 1"

    - zCMaterial
      {: .sp-class}
        - Internals 
          {: .sp-folder}
            - [defaultMapping](#defaultmapping)
              {: .sp-misc}
        - [name](#name) = ""
          {: .sp-string}
        - [matGroup](#matgroup) = UNDEF
          {: .sp-enum}
        - [color](#color) = 255 255 255 255
          {: .sp-color}
        - [smoothAngle](#smoothangle) = 60
          {: .sp-float}
        - [texture](#texture) = ""
          {: .sp-string}
        - [texScale](#texscale) = 512 512
          {: .sp-string}
        - [texAniFPS](#texanifps) = 0
          {: .sp-float}
        - [texAniMapMode](#texanimapmode) = NONE
          {: .sp-enum}
        - [texAniMapDir](#texanimapdir) = 0 0
          {: .sp-string}
        - [noCollDet](#nocolldet) = FALSE
          {: .sp-bool}
        - [noLightmap](#nolightmap) = FALSE
          {: .sp-bool}
        - [lodDontCollapse](#loddontcollapse) = FALSE
          {: .sp-bool}
        - [detailObject](#detailObject) = ""
          {: .sp-string}

=== "Gothic 2"

    - zCMaterial
      {: .sp-class}
        - Internals 
          {: .sp-folder}
            - [defaultMapping](#defaultmapping) = 2.34375 2.34375
              {: .sp-misc}
        - [name](#name) = ""
          {: .sp-string}
        - [matGroup](#matgroup) = UNDEF
          {: .sp-enum}
        - [color](#color) = 255 255 255 255
          {: .sp-color}
        - [smoothAngle](#smoothangle) = 60
          {: .sp-float}
        - [texture](#texture) = ""
          {: .sp-string}
        - [texScale](#texscale) = 512 512
          {: .sp-string}
        - [texAniFPS](#texanifps) = 0
          {: .sp-float}
        - [texAniMapMode](#texanimapmode) = NONE
          {: .sp-enum}
        - [texAniMapDir](#texanimapdir) = 0 0
          {: .sp-string}
        - [noCollDet](#nocolldet) = FALSE
          {: .sp-bool}
        - [noLightmap](#nolightmap) = FALSE
          {: .sp-bool}
        - [lodDontCollapse](#loddontcollapse) = FALSE
          {: .sp-bool}
        - [detailObject](#detailobject) = ""
          {: .sp-string}
        - [detailObjectScale](#detailobjectscale) = 1
          {: .sp-float}
        - [forceOccluder](#forceoccluder) = FALSE
          {: .sp-bool}
        - [environmentalMapping](#environmentalmapping) = FALSE
          {: .sp-bool}
        - [environmentalMappingStrength](#environmentalmappingstrength) = 1
          {: .sp-float}
        - [waveMode](#wavemode) = NONE
          {: .sp-enum}
        - [waveSpeed](#wavespeed) = FALSE
          {: .sp-enum}
        - [waveMaxAmplitude](#wavemaxamplitude) = 30
          {: .sp-float}
        - [waveGridSize](#wavegridsize) = 100
          {: .sp-float}
        - [ignoreSunLight](#ignoresunlight) = FALSE
          {: .sp-bool}
        - [alphaFunc](#alphafunc) = NONE
          {: .sp-enum}

## Class member overview

### `defaultMapping` {: .sp-misc}
Default material mapping.

### `name` {: .sp-string}
Material name. In most cases corresponds to the name of the texture map.

### `matGroup` {: .sp-enum}
Sound accompaniment of the material. Must be specified to produce the correct sounds when moving across the specified material.

**Accepted values:**

- `UNDEF` - Undefined.
- `METAL` - Metal.
- `STONE` - Stone.
- `WOOD` - Wood.
- `EARTH` - Earth.
- `WATER` - Water.
- `SNOW` - Snow.

### `color` {: .sp-color}
Texture replacement color in RGBA format. The color the polygon will be painted in until the texture is applied.

### `smoothAngle` {: .sp-float}
Defines the angle of material smoothing between two faces.

### `texture` {: .sp-string}
Defines the name of the texture file used for the material. Also determines by file name whether the texture is animated or static. An animated texture is recognized by its file name.

To create animated textures, add a prefix to the file name `_A0`, e.g., `NW_Fire_A0.TGA`, `NW_Fire_A1.TGA` etc. The texture `NW_Fire_A0.TGA` is the first frame. The game engine will automatically search your hard drive for remaining animation files.

### `texScale` {: .sp-string}
Scaling along the x and y axes. Assigning the necessary texture coordinates to polygons.

### `texAniFPS` {: .sp-float}
If the texture is animated (`NAME_A0.*`), then the speed of texture animation is indicated here.

### `texAniMapMode` {: .sp-enum}
Texture animation mode.

**Accepted values:**

- `NONE` - No texture animation.
- `LINEAR` - Linear texture animation.

### `texAniMapDir` {: .sp-string}
The direction of movement and speed of movement of animated textures by polygons. The Accepted values should be significantly lower than 1 (For example 0.00005). The animation is only enabled when [`texAniMapMode`](#texanimapmode) is set to `LINEAR` mode.

### `noCollDet` {: .sp-bool}
Handling collisions with dynamic objects. In other words, whether the character will be able to pass through this texture or not.

**Accepted values:**

- `TRUE` - Passes through.
- `FALSE` - Does not pass.

### `noLightmap` {: .sp-bool}
Light map enable/disable switch.

**Accepted values:**

- `TRUE` - Disable baking of light maps on the material.
- `FALSE` - Enable baking of light maps on the material.

### `lodDontCollapse` {: .sp-bool}
If you activate this option, the texture will not degrade when the camera moves away.

**Accepted values:**

- `TRUE` - Disable texture degradation.
- `FALSE` - Enable texture degradation.

!!! Note 
    To prevent the texture from being distorted, you can cancel the creation of a MipMap. It is advisable to use for small objects.

### `detailObject` {: .sp-string}
An option that allows you to complement the material with a different texture.

### `detailObjectScale` {: .sp-float}
Tiling the overlay image selected in the [`detailObject`](#detailobject) property.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `forceOccluder` {: .sp-bool}
No information provided.

**Accepted values:**

- `TRUE`
- `FALSE`

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `environmentalMapping` {: .sp-bool}
Environment reflection mode, creating glare.

**Accepted values:**

- `TRUE` - Enable reflection mode.
- `FALSE` - Disable reflection mode.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `environmentalMappingStrength` {: .sp-float}
The amount of reflection of the environment.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `waveMode` {: .sp-enum}
Enable wave simulation mode. For example, `AMBIENT_GROUND` is used for water textures.

**Accepted values:**

- `NONE` - Wave simulation is disabled.
- `AMBIENT_GROUND` - Wave simulation is enabled.
- `GROUND` - No information.
- `AMBIENT_WALL` - No information.
- `WALL` - No information.
- `ENV` - No information.
- `AMBIENT_WIND` - No information.
- `WIND` - No information.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `waveSpeed` {: .sp-enum}
Wave speed.

**Accepted values:**

- `SLOW` - Slow.
- `NORMAL` - Normal.
- `FAST` - Fast.

!!! Warning
    This option is only available in Gothic II (Spacer2).  

### `waveMaxAmplitude` {: .sp-float}
Maximum wave amplitude.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `waveGridSize` {: .sp-float}
Wave mesh size.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `ignoreSunLight` {: .sp-bool}
Ignoring sunlight. In effect, the material will no longer support shadows.

**Accepted values:**

- `TRUE` - Ignore.
- `FALSE` - Don't ignore.

!!! Warning
    This option is only available in Gothic II (Spacer2).

### `alphaFunc` {: .sp-bool}
Alpha channel calculation function.

**Accepted values:**

- `NONE` - None.
- `MAT_DEFAULT` - Use texture alpha channel.
- `BLEND` - Mixing.
- `SUB` - Subtraction.
- `MUL` - Multiplication.
- `MUL2` - Multiplication 2.

!!! Warning
    This option is only available in Gothic II (Spacer2).