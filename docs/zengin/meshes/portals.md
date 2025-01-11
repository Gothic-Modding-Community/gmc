# Portals

## Introduction

Static level meshes are created in modeling programs, like Blender, and then imported into the [Spacer](../worlds/spacer.md) as `.3ds` files. To increase rendering performance, certain contiguous areas of the level are identified as sectors during the modeling of the level meshes and separated from each other by portals. At runtime, the engine is then able to determine and exclude from the rendering process those sectors that are not visible or are far away from the current camera position due to occlusion.

!!! Danger
    The distinction between outdoor/indoor levels must be explicitly selected when compiling a level within the Spacer editor, as the conventions for equipping levels with sectors/portals for outdoor and indoor levels differ slightly.

## Outdoor
In outdoor levels, only the interiors of buildings, caves, etc. are marked as sectors, whereas the entire open-air area itself is treated as one large "outside" sector. 

### Naming

Outdoor portals materials have the following naming convention: 
```
P[N]:Front_Back
```

All materials of portal type, have to start with `P:` or `PN:`, the difference between each of them is only in game engine, `PN:` stands for Portal NonFading, and`P:` stands for Portals and if player is standing close by, when a player is close to the portal then it becomes more transparent, so the opacity decreases.

!!! Note
    Material names with the prefix `PN:` (N for NoFade) "open" visually as the camera approaches, but do not fade out like the other `P:` portals. This makes sense, for example, if there is a texture with an alpha channel on such a portal.

For every portal, 2 materials have to be created - one for each direction. Their names have to match the direction they're facing. For example, the portal for entering room 2 from room 1 should be named `P:room1_room2`. And vice versa the second portal to go back from room 2 to room 1 should be named `P:room2_room1`.

In addition, a blank string `""` is used to refer to the outside world. For example, if you are entering corridor 1 from the outside world, then you need to name portal `P:_corridor1`. If you want to go back from corridor 1 to the outside world, then you need to name portal `P:corridor1_`.


![](../../assets/images/portals/outdoor_naming.png)


!!! Warning
    Names such as `room1`, `room2` are just examples. You can name your sectors as you wish, as long as you use ASCII characters only.

### Modeling
Outdoor portals must be double-sided polygons, pointing the opposite directions. The portal should close the area between two sectors, by touching all vertices of the sector entrance/exit. 

![](../../assets/images/portals/outdoor_modeling1.png)

The sectors should be tightly closed, and contain no gaps between the walls i.e. all polys vertices should be connected to each other.

![](../../assets/images/portals/outdoor_modeling2.png)   

Also, the polys inside the sector must be connected to the walls of the sector. If some polys will be floating in the air, the engine could not render them properly.

![](../../assets/images/portals/outdoor_modeling3.JPG)


### Ghostoccluder

Ghostoccluders are polys in outdoor levels that have a material called `GHOSTOCCLUDER`. Such polygons are not displayed in the game, but serve to mask areas of the level that are unnecessary for visualization (“Occlusion”). Unlike other polygons, Ghostoccluder polys do not depend on size, and also do not need to be segmented, as in the case of [water modeling](water.md#segmentation). 

![](../../assets/images/portals/ghostoccluder.png)

## Indoor
In indoor levels, the entire level should be partitioned into a set of sectors. Portals are used to separate related areas, the sectors, from each other. 

### Naming
Portals must have materials whose names begin with the prefix `PI:`. The rest of the name doesn't matter at the moment. The information about sector names that was previously required outdoors is no longer required here.

### Modeling
Portals must be convex polygons (triangle, quad, npoly). More precisely: a portal between two sectors consists of exactly one convex polygon. 

In contrast to outdoor portals, indoor portals (“PI:”) are single-sided. The program automatically generates the second page that is still necessary internally. They are also no longer need to be merged with the polys/verts of the static level mesh. 

Portals are typically placed at passageways/doors or at tunnel beginnings and ends. They must intersect or touch all polys of the passageway where they are placed, i.e. the polys of the walls, ceilings and floor. The program therefore knows where the limitation of the sector is. However, the portal poly may NOT touch any other polys other than the directly adjacent polys of the passage. The portal poly can therefore be a little larger than the passage, but not so large that other polys that are not involved are touched. It is also important for the performance of occlusion culling that portals are not unnecessarily large. A poly of the level may penetrate a maximum of one portal poly.

![](../../assets/images/portals/indoor_modeling1.png)

**Additional notes for level modeling:**

- Polys must not penetrate each other.
- Remove all polys that are never visible to the player.
- Ensure no gaps between polygons meant to form a continuous surface. For example, the bottom edge of a wall should align perfectly with the floor edge. Basically, this requirement means precise vertex placement. 
- Indoor levels must be completely enclosed, with no gaps or 'leaks'. This means:
    - No line of sight from inside to outside the level.
    - No 'paper walls' where the invisible backside is visible from within.
    - No polys with fronts that can't be seen from any position inside the level.
- Avoid 'T-junctions' by adding collinear vertices to polygons.



[^1]: Inspired by the article about portals from [Gothic Editing Wiki](https://wiki.worldofgothic.de/doku.php?id=zengin:portale)
[^2]: Special thanks to Anrez_ for help with images and naming conventions explanation.