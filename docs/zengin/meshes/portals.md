# Portals

## Introduction

Static level meshes are created in modeling programs, like Blender, and then imported into the [Spacer](../worlds/spacer.md) as `.3ds` files. To increase rendering performance, certain contiguous areas of the level are identified as sectors during the modeling of the level meshes and separated from each other by portals. At runtime, the engine is then able to determine and exclude from the rendering process those sectors that are not visible or are far away from the current camera position due to occlusion.

!!! Danger
    The distinction between outdoor/indoor levels must be explicitly selected when compiling a level within the Spacer editor, as the conventions for equipping levels with sectors/portals for outdoor and indoor levels differ slightly.

## Outdoor
In outdoor levels, only the interiors of buildings, caves, etc. are marked as sectors, whereas the entire open-air area itself is treated as one large "outside" sector. 

### Naming

Outdoor portals materials use the following naming convention:
```
P[N]:Front_Back
```
`Front` is the name of the room that the portal poly normal points into. 

`Back` is the name of the room behind the portal. The name of the “outside world space” is “” (an empty string, see example).

Material names with the prefix `PN:` (“N” for NoFade) “open” visually as the camera approaches, but do not fade out like the other `P:` portals. This makes sense, for example, if there is a texture with an alpha channel on such a portal.

![](../../assets/images/portals/outdoor_naming.png)

<!-- Example:

"<" and ">" indicate the directions of the normals.

```
   * * *
   *A*BC*D
   * <|> <|>
   * * *
   * * *
   *Room1 *Room2* Outside world
   ***************

   Material A: "P:Room1_Room2" from Room1 to Room2
   Material B: "P:Room2_Room1" from Room2 to Room1
   Material C: "P:Room2_" from Room2 to the outside world
   Material D: "P:_Room2" from outside world to Room2 
``` -->
### Modeling
Outdoor portals must be double-sided polygons, pointing the opposite directions. The portal should close the area between two sectors, by touching all vertices of the sector entrance/exit. 


// ingame image / blender image

The sectors should be tightly closed, and contain no gaps between the walls i.e. all polys vertices should be connected to each other.

![](../../assets/images/portals/outdoor_modeling2.png)   

Also the polys inside the sector must be connected to the walls of the setor. If some polys will be floating in the air, the engine could not render them properly.

![](../../assets/images/portals/outdoor_modeling3.JPG)




### Ghostoccluder

Ghostoccluders are polys in outdoor levels that have a material called `GHOSTOCCLUDER`. Such polygons are not displayed in the game, but serve to mask areas of the level that are unnecessary for visualization (“Occlusion”). Unlike other polygons, Ghostoccluder polys  do not depend on size, and also do not need to be segmented, as in the case of [water modeling](water.md#segmentation). 

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

**Additional notes for modeling:**

- Polys are not allowed to penetrate each other
- All polys that cannot be seen by the player from any permitted, legal position/angle must be eliminated.
- It is important to ensure that there is really no space between polygons that are supposed to form a gap-free surface. For example, the bottom edge of a wall should be identical to an edge of the floor and therefore rest directly on the floor. Basically, this requirement means precise vertex placement. This could be achieved, for example, with a fine grid for vertex placement.
- Indoor levels (as opposed to outdoor levels) should be modeled to be completely enclosed. This means that if you (purely theoretically) filled a level with water, then the level's mesh would have no gaps or 'leaks' from which water could escape. This point is very important! Great care should be taken to ensure that there are no gaps between the polys. 'Waterproof' or 'leak-free' can be defined as follows:
    - You cannot set up a line of sight between a point inside the level and a point outside the level.
    - There are no 'paper walls' or polys whose invisible backside can be seen from within the level.
    - There must be no polys whose front cannot be seen from any position within the level. Or to put it another way: no poly can have its front side in contact with the 'nothing' surrounding the level. A negative example: a cube with 4 walls facing outwards is placed in the middle of the empty space around the level ⇒ not allowed!
- In general, so-called 'T-junctions' should be avoided by inserting collinear vertices into polygons.



[^1]: Inspired by the article about potrals from [Gothic Editing Wiki](https://wiki.worldofgothic.de/doku.php?id=zengin:portale)