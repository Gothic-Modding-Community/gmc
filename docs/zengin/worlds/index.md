# Worlds

!!! example "Acknowledgment"
    This article is heavily inspired by various tutorials from the polish [TheModders forums](https://themodders.org/index.php#c13).

Worlds, saved as `.ZEN` files in ZenGin, are archives that contain the world mesh (model), BSP tree, materials and the information of all objects in the world. These objects are called VOBs ("virtual objects"). ZEN files can be saved in two ways; compiled and uncompiled. The compiled version is a full-fledged level with a terrain model. Uncompiled ZENs only save the VOB tree and are meant for specific use-cases.

Spacer is used to create these `.ZEN` files. There are also [other world editors](../tools/index.md). The way of doing things can vary between these editors, so the specifics will be discussed in separate articles for those tools; at the same time, a lot of knowledge carries over between them. Also have in mind that Spacer is the least comfortable of the editors.

## World contents

The content of worlds in Gothic can be roughly separated in the following way:

- Base level mesh - terrain and buildings, sometimes also trees.
- VOBs ([`zCVob`](Classes/zCVob/index.md) and subclasses) - all interactive objects, items, foliage, small rocks, huts, furniture, ramps etc.

Asides from those elements, there are also many invisible VOBs, such as:

- Waypoints ([`zCVobWaypoint`](Classes/zCVob/zCVobWaypoint.md)) - used for NPC navigation.
- Freepoints ([`zCVobSpot`](Classes/zCVob/zCVobSpot.md)) - used mainly for NPC routines and roaming behavior for monsters.
- Startpoints ([`zCVobStartpoint`](Classes/zCVob/zCVobStartpoint.md)) - used only to spawn the player when starting a new game. Teleporting between levels is handled with scripts and uses freepoints to determine where the player will appear.
- Sound emitters
- Music zones  
    - [`oCZoneMusic`](Classes/zCVob/zCZone/oCZoneMusic/index.md) - music which plays inside the bounding box of this zone.
    - [`oCZoneMusicDefault`](Classes/zCVob/zCZone/oCZoneMusic/oCZoneMusicDefault.md) - default music which plays whenever the player is not inside some `oCZoneMusic`.
- Fog zones ([`zCZoneZFog`](Classes/zCVob/zCZone/zCZoneZFog/index.md)) - areas which add fog, e.g. like in swamp areas where the sky is not visible. The setting to fade out the sky is optional though.
- PFX - particle effects (fire, smoke, fireflies, falling leaves etc.)

!!! note
    This list isn't exhaustive.

World also contains information about all materials used by level mesh and VOBs. They are stored in the form of [`zCMaterial`](Classes/zCMaterial.md) instances.

## Creating a ZEN file

Before VOBs can be added to a world model, the world needs to be compiled.
After importing a 3ds model, the world can be compiled as an outdoor or indoor world and saved as a ZEN.

The submeshes used in ZEN files have triangle count limits (it is also advisable to keep triangle count for each submesh under 50k for performance reasons). To get around this limitation and to parallelize work on various areas, it is possible to join multiple ZEN files together, which is done with special macros.

If you take a look at the original maps for Gothic 2, you can notice that they are in folders, where there's e.g. a file called `NEWWORLD.ZEN` and multiple `.ZEN` files with "part" in their name. The latter are the sub-zens used to create the full level.

However, a possibly more comfortable workflow is to have a single world mesh which is internally separated into multiple submeshes. This way triangle count limits won't be exceeded and the world won't need compiling from parts. As a trade-off, it is likely that it won't be possible for multiple people to work on the ZEN world at the same time.

## Lighting

There are two light types in the game:

- Static lights, which are baked onto the level. They can cast shadows (these only take static VOBs into consideration) and don't leak through walls. These have to be recompiled after making changes, but this process should only take moments. Static lights have the downside of only working in indoor worlds and in rooms which are closed with portals.
- Dynamic lights are calculated during runtime, which allows them to move and change properties (their color, for example), but has a performance cost. Additionally, they don't look the best and will often leak through walls.

It is generally advised to use static lights whenever possible.

## Portals

Portals are special parts of outdoor world meshes which separate interiors from exteriors. This allows the level to have dark areas: otherwise interiors are lit the same way as any outside area. Additionally, portals help with performance (interiors aren't rendered unless the player is nearby). Creation of portals has many caveats and will be discussed in a separate article. Portals are also related to NPC behavior (e.g. setting ownership of a room).

## Water

Water is a special surface in the world. It has to be properly modelled, and its material has to be set up correctly. You can read more about it in the [dedicated article](../meshes/water.md).

## Optimisation

The game uses occlusion culling, which means that if an object is covered by another object, it is not rendered and saves performance. This means that the performance in a level can be boosted by a lot by creating city walls and mountains and valleys which separate areas.

Occlusion culling isn't a perfect process, so there's also the option of adding GHOSTOCCLUDERs, which are invisible walls which stop areas behind them from rendering. They are a part of the world mesh and are created by assigning a material called GHOSTOCCLUDER to chosen faces. The color of the material is traditionally purplish-blue or pink, but the material itself is not rendered in-game, so this is only to make them stand apart from the rest of the level during modelling. To get more technical, these occluder walls are used to help the BSP algorithm which runs during world compilation.

As mentioned before, another ways of optimisation are portals and limiting the number of dynamic lights. It is also not advisable to make many VOBs be affected by wind.
