---
title: MMS MorphMeshScript
---

# MMS - Morph Mesh Script
MMS files are used to define morph mesh animations. They are similar to MDS files but simpler in structure.

## Syntax
The MMS file is a plain text file with a simple syntax. It consists of commands and parameters.

**Comments**

Comments start with `//` and continue to the end of the line.
```dae
// This is a comment
```

## morphMesh
The whole script is wrapped in the `morphMesh` block. It defines the name of the morph mesh this script belongs to.
```dae
morphMesh ("MORPH_MESH_NAME")
```
!!! Bug
    This command really does nothing and the morph mesh name is taken from the file name itself, but it is good to have it here for consistency with MDS files.

**Parameters**

`MORPH_MESH_NAME` - name of the morph mesh this script belongs to, usually the same as the `.ASC` file name.

### morphRef
Defines the reference mesh for this morph mesh. The reference mesh is the base mesh that contains all the vertices that will be morphed during animations.
```dae
morphRef ("MORPH_MESH_FILE")
```
**Parameters**

`MORPH_MESH_FILE` - name of the source `.ASC` file that contains the reference mesh.

### morphAni
Defines a morph animation. 
```dae
morphAni ("ANI_NAME" LAYER BLEND_IN HOLDTIME BLEND_OUT FLAGS "ASC_NAME" START_FRAME END_FRAME SPD)
```

!!! Example
    ```dae
    morphAni ("S_NORMAL" 1 0.1 -1 0.1 L "Bow_Long_01.ASC" 0 0 SPD:25)
    ```

**Parameters**

`ANI_NAME` - name of the animation

`LAYER` - animation layer, probably unused since morph animations can't be combined

`BLEND_IN` - time in seconds to blend into this animation

`HOLDTIME` - time in seconds to hold the animation after it has finished, `-1` means to hold indefinitely

`BLEND_OUT` - time in seconds to blend out of this animation

`FLAGS` - animation flags, can be a combination of the following:

- **D** - discontinuity, animation frames are selected randomly
- **L** - loop, animation will loop indefinitely
- **S** - shape animation, the animation represents a complete mesh shape rather than a relative deformation
- **R** - reference mesh, the compiler will check if vertices and polygons of the next animations match the reference mesh

`ASC_NAME` - name of the source `.ASC` file that contains the animation frames

`START_FRAME` - starting frame of the animation in the `.ASC` file

`END_FRAME` - ending frame of the animation in the `.ASC` file

`SPD` - frames per second, specified as `SPD:XX`