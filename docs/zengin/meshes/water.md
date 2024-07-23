# Water

Water in ZenGin is a special surface. Therefore, there are some rules that have to be followed, to make it work properly.

## Water Modeling

Water is created in Gothic using a double-sided tarp that is assigned a water material. This means you have to create a surface with the normal pointing upwards and the same surface facing downwards again. There must be a floor under the water tarp, otherwise you won't be able to swim. It also makes sense not to connect the double-sided water tarpaulin to the coast, otherwise the coast will follow the wave movement of the water. It's best to let the water run a little into the coast so that the wave movements don't create holes between the water and the coast.

## Segmentation

You should segment (divide) the water surface for the following reasons:

- **Performance**: Areas are always calculated in their entirety. If the area is too large, unnecessary areas (e.g. under an island) are also calculated, which additionally deducts computing power. By segmenting you can delete areas of water that are not visible.
- **Display error**: The entire area is also displayed. However, if the end is out of sight, the water may flicker.
- **Wave movement**: The up and down movement of the water takes place at the corners of the water surfaces. If you have smaller areas, the waves are also more precise.
- In addition, an area that is too large may not work at all, meaning you can walk on it or even fall over.

Water is a big power drain. It is advisable to make the segments towards the coast smaller and smaller so that an unnecessary number of areas in the distance do not have to be calculated, but the wave movement on the coast still looks fine enough. Here are two examples of possible segmentation of the water surface (in Blender):

![Water Segmentation Examples](../../assets/images/segmente.gif)

In the example on the left, the water area was created from squares that get smaller the closer they are to the coast. Since Gothic automatically divides the squares into triangles anyway, the example on the right makes even more sense. The water surface was created from a hexagon and consists of whole or halved equilateral triangles. In addition, the outer boundary of the water is at a more even distance from the coast. In both examples, the segments in the middle of the island are deleted.

## Water Material Properties

To be able to swim in water, you need to place a water material on the double-sided water surfaces. By default, without changing any material settings the water will be frozen. To change that you have to edit [zCMaterial](../worlds/Classes/zCMaterial.md) settings in [Spacer](../worlds/spacer.md).

!!! Tip
    You can also place different water materials on the top and bottom.

The most important property - the one that tells the engine that the material is a water and player can swim in it - is [matGroup](../worlds/Classes/zCMaterial.md#matgroup). It has to be set to `WATER`.

To make water look like actual water consider changing following parameters:

- [color](../worlds/Classes/zCMaterial.md#color) - Material color. Something like `150 241 238 200` (in RGBA) will add a little transparency and blue "glow".
- [texAniFPS](../worlds/Classes/zCMaterial.md#texanifps) - Speed at which the animation of the texture should be played.
- [texAniMapDir](../worlds/Classes/zCMaterial.md#texanimapdir) - Speed at which the texture should be moved in the x or y direction (useful for waterfalls and rivers).

Some parameters have only been available since Gothic 2:

- [environmentalMapping](../worlds/Classes/zCMaterial.md#environmentalmapping) - Simulation of a reflection of the surface.
- [environmentalMappingStrength](../worlds/Classes/zCMaterial.md#environmentalmappingstrenght) - Strength of surface reflection.
- [waveMode](../worlds/Classes/zCMaterial.md#wavemode) - Type of wave motion.
- [waveSpeed](../worlds/Classes/zCMaterial.md#wavespeed) - Wave speed. The higher the value, the faster the waves move.
- [waveMaxAmplitude](../worlds/Classes/zCMaterial.md#wavemaxamplitude) - Wave height. 
- [waveGridSize](../worlds/Classes/zCMaterial.md#wavegridsize) - Wave expansion.


[^1]: This article is mostly a translation of the one posted on [Gothic Editing Wiki](https://wiki.worldofgothic.de/doku.php?id=quickstart:zengin:wasser)
