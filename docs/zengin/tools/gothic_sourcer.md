# Gothic Sourcer
Gothic Sourcer is a multipurpose tool. It can be used to edit Daedalus scripts, decompile game animations, and more. 

## Download
You can download the latest version of Gothic Sourcer [here](https://github.com/muczc1wek/GothicSourcer/releases/tag/v3.16).

## Animation Decompiler
Gothic Sourcer can decompile compiled animations back to the raw ASCII format.

!!! Note
    If you are unfamiliar with the concepts of animation file formats, please refer to the [Animations](../anims/index.md) section first.

### Skeletal Animation
To decompile skeletal animations, sourcer needs the `.MDS` or `.MSB` to parse the animation data, and also the corresponding `.MDM`, `.MDH` and `.MAN` files to get information about the model and animations.

Choose **Tools > Decompiler models > Dynamic (MDS or MSB)** and select the file you want to decompile. The decompiled files will be saved in the `Gothic Projects\Anims\asc_<model_name>` directory, next to the `Gothic Sourcer` directory.

### Morph Mesh Animation
To decompile morph mesh animations, sourcer needs only the `.MMB` file.

Choose **Tools > Decompiler models > MorphMesh (MMS)** and select the file you want to decompile. The decompiled files will be saved in the `Gothic Projects\Anims\asc_<morphmesh_name>` directory, next to the `Gothic Sourcer` directory.