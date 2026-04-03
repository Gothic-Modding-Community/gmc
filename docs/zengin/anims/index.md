
# Animation
Animations in ZenGin consist of animation files and animation scripts. Working with them requires deep understanding of the architecture and concepts. This section provides information necessary to effectively work with animations within the engine.

## Types
There are two main types of animations - `skeletal` and `morphmesh`. Skeletal animations are used for animating characters and objects with a skeleton, while morph mesh animations are used for animating facial expressions and other models that require vertex-based deformations.

## Formats

### Raw

**Animation files**

ZenGin uses the `.ASC` file format for raw animation files. Following things could be saved as the `.ASC` file:

- Animation model (skeleton + skin or morph mesh)
- Actual animation data (keyframes)
- Animation targets (like doors, beds etc.)


The `.ASC` files can be imported into blender using the [KrxImpExp](#krximpexp) add-on.

**Script files**

Every animated model in ZenGin has its own animation script file with the `.MDS` extension for skeleton based models and `.MMS` for morph mesh based models. These files are used to define animation data. You can find more about these files in the [MDS](mds.md) and [MMS](mms.md) sections.

### Compiled
Raw formats are great for editing, but can be a bit heavy for the engine use (ASCII based formats are slower to parse and work with), because of that ZenGin compiles these animations into various internal formats.

| Format | Extension | Content |
|--------|-----------|-------------|
| Model Animation | `.MAN` | Single animation data |
| Model Hierarchy | `.MDH` | Skeletal structure and slots for a model |
| Model Mesh | `.MDM` | Softskin mesh and proto mesh structure for a model |
| Model | `.MDL` | `.MDH` + `.MDM` combined |
| Model Script | `.MSB` | Compiled version of the `.MDS` file |
| Morph Mesh | `.MMB` | Morph mesh with its mesh and animation data |



## Engine compilation
By default, animations are compiled by the engine when the model appears in the game or a game is started with `-zconvertall` parameter.

!!! Danger
    If you want to recompile animations, make sure that the `.MSB` or `.MMS` files are deleted, including the ones in the VDF volumes, otherwise the engine will not recompile them.

### Graphical overview

A star `*` means that multiple files could be used/generated.

<div class="grid" markdown>

=== "Skeletal Animation"
    ``` mermaid
    flowchart TD
    A[Model .ASC] --> D(Compilation)
    B[Animation .ASC *] --> D
    C[Model Script .MDS] --> D
    D --> E[Compiled Model Script .MSB]
    D --> F[Model Animation .MAN *]
    D --> G[Model Hierarchy .MDH]
    D --> H[Model Mesh .MDM]
    ```


=== "Morph Mesh Animation"
    ``` mermaid
    flowchart TD
    A[Model .ASC] --> D(Compilation)
    B[Animation .ASC *] --> D
    C[Morph Mesh Script .MMS] --> D
    D --> E[Morph Mesh .MMB]
    ```
    
</div>


## Tools

### KrxImpExp
Blender add-on that implements support for Gothic 3D formats.

[:fontawesome-brands-gitlab: GitLab](https://gitlab.com/Patrix9999/krximpexp)

### Gothic Sourcer
Tool for decompiling animation files.

[:octicons-arrow-right-24: Read more](../tools/gothic_sourcer.md)

### ZenKit
C++ Library for loading and saving various ZenGin files (including some animation formats).

[:octicons-arrow-right-24: Read More](../tools/libraries/zenkit.md)
