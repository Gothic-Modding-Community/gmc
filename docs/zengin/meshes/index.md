# Meshes

In 3D graphics, meshes are collections of vertices, edges, and faces that create 3D objects. ZenGin use meshes to create the world model and objects in the world.

!!! Info
    Not all objects that seem to be a mesh are in the "Meshes" category. Except every animated objects, the animation targets (like beds or doors) also belong to the [Animations](../anims/index.md).

## Formats

### Raw

ZenGin uses the `.3ds` file format for raw source meshes. That is one of the file formats used by the [Autodesk 3ds Max](https://en.wikipedia.org/wiki/Autodesk_3ds_Max), which was used by the Gothic developers.

The `.3ds` files can be opened with any 3D modeling software that supports this format. But, to easily import/export them with engine-specific settings, it is recommended to use Blender 2.80+ with the [KrxImpExp](#krximpexp) extension.

**3DS limitations**

The 3DS format has some disadvantages when building levels. With very large levels such as `SURFACE.3DS`, you reach the upper limit of 65,536 triangles per object that are permitted in a `.3ds` file. To get around this problem, proceed as follows: simply “cut” the mesh into several small parts that are below the 64K triangle limit. For example, the `SURFACE.3DS` was dismantled into 4 parts of roughly equal size and then completely exported. This meshes are then merged during the world compilation process into single object in the spacer.

### Compiled

Source formats are great for editing, but can be a bit heavy for the engine use (ASCII based formats are slower to parse and work with), because of that ZenGin compiles these meshes into internal compiled formats. In the case of the world it is `.MSH` format and in the case of objects in the world it is the `.MRM` (multi resolution mesh) with LOD information.

## Tools

### KrxImpExp
Blender add-on that implements support for Gothic 3D formats.

[:octicons-download-16: Download](https://gitlab.com/Patrix9999/krximpexp)

### ZenKit
C++ Library for loading and saving various ZenGin files (including some 3D formats).

[:octicons-arrow-right-24: Read More](../tools/libraries/zenkit.md)
