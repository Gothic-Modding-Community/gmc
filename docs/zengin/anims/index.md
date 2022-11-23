
# Animation


# Animations in ZenGin
Animations are (apart from maybe advanced programming work using Ikarus or Union) one of the most advanced modding techniques, since you not only must understand the way they work, but also know how to write the animation script and understand the whole scheme selection system, naming convention and of course know how to animate (that is my biggest problem :D). To get a new animation into ZenGin (the Gothic engine) is not difficult per se, I would describe it as tedious.

Luckily, there are tools to help us to achieve our goal - get a new animation to be used by the engine, and in effect, to be used and seen in the game.

To describe the whole process, I constructed this small tutorial, to help other people to get animations working and to spare them many hours of searching the excellent forum posts, that describe parts of the process.  
__

Excluding advanced programming work with Ikarus or Union, animations are arguably the most advanced modding discipline of ZenGin engine. Its difficulty stems for the fact that you not only have to understand the general concept, but also learn how to write the animation scripts and understand the whole scheme selection system, including naming conventions and, most important for last - actually know how to animate. Adding new animations into ZenGin is more tedious than actually difficult.

There are tool to help with this endeavor - to get a new animation implemented in the engine, and seeing its effects in game. Following tutorial has been constructed to help others to get their animations working without having to scour old forum posts for hours.

## Prerequisites - Tools & Materials
1. Gothic Mod Development Kit (MDK)
    - Gothic 1 MDK - [link](https://github.com/PhoenixTales/gothic-devkit)
    - Gothic 2 MDK - [link](https://www.worldofgothic.de/dl/download_94.htm)
2. [Blender](https://www.blender.org/)
3. [Kerrax's Import Export plugin](https://gitlab.com/Patrix9999/krximpexp) - follow the installation instructions to install the plugin, make sure to set up the texture paths too
4. Tool for decompiling animations [GothicSourcer](https://worldofplayers.ru/threads/41942/), or use [phoenix](https://github.com/lmichaelis/phoenix) or write your own using [ZenLib](https://github.com/Try/ZenLib)



##  The workflow
This is the basic step-by-step workflow on how to get the animation into the game.

1. Load the actor (character or object) into your 3D software
2. Create your animation
3. Export the animation as an `.asc` file
4. Write the MDS file
5. Run the game to compile your animations
6. Test your animations in-game using a Daedalus script or a console command

Sounds simple enough, except there is a lot missing. Even though the steps start with loading the actor into blender, understanding the system of animations to get high quality assets into your mod is more important.

## Animation "types"
There are two main types of animations - `skeletal` and `morphmesh` animations. Character body animations are skeletal, and we animate the skeleton and the entire model (skin) moves around it. Morph mesh animation is, on the other hand, used for facial animations such as eating, blinking or talking and for animated meshes like wave water ferns or fish in Khorinis' harbor.

This guide focuses on skeletal animations. There are few different ones, all of which will have their own demonstration in the future. Categories are:

1. Standalone animation - waving, bowing, eating
2. MOBSI animations - bed, alchemy table, anvil
3. Item animations - sweeping the floor with a broomstick, using the horn, playing the lute
4. Mandatory animations - running, walking, sneaking
5. Combined/interpolated animations - picking stuff up, aiming with a bow/crossbow

All of these animations are defined in an MDS file which will be talked about in the next sections.
