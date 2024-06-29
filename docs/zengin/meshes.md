# Meshes

In 3D graphics, meshes are collections of vertices, edges, and faces that create 3D objects. Game engine use meshes to create the world and objects in the world.

## Mesh types

In ZenGin there are two types of meshes: 

### World Meshes
These are the meshes that are used to create the world terrain. In world meshes, there are some special materials that allow creating things like water or occluders.

### Object Meshes
These are the meshes that are used to create static (non-animated) objects in the world ([Vobs](worlds/Classes/zCVob/index.md)).

##  File Format

ZenGin uses the `.3ds` file format for meshes. This is a file format that is used by 3D Studio Max. However, ZenGin compiles the `.3ds` files into `.MRM` (Multi Resolution Mesh) files, or embeds them into the `.ZEN` files.

The `.3ds` files can be opened with any 3D modeling software that supports this format. But, to easily import/export them with engine-specific settings, it is recommended to use Blender 2.80+ with the [KrxImpExp](https://gitlab.com/Patrix9999/krximpexp) extension