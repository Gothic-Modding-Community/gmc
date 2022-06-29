# Animation
!!! info

    Some of the videos that I write about in the text bellow are in this [play-list](https://www.youtube.com/playlist?list=PLn8QrKx4F-EITe0yG_2n0z9p4q6EAp6rx).

!!! example "Acknowledgment"

    This tutorial wouldn't be possible without the ZenGin documentation available in the mod-kit, [Mark56](ttps://carnage-markus.blogspot.com) who helped me understand animations in the first place. [Fawkes] and his request for me to do some animations for his excellent mod - Replay Mod. And flosha from the Phoenix team, who was the one, to whom I offered to write this tutorial, to help with the development of the [Phoenix project](https://phoenixthegame.com/).


# Animations in ZenGin
Animations (apart from maybe advanced programming work using Ikarus or Union) are on of the most advanced modding techniques, since you not only must understand the way they work, but also know how to write the animation script and understand the whole sceme selection system, naming convention and of course know how to animate (that is my biggest problem :D). To get a new animation into ZenGin (the Gothic engine) is not difficult per se, I would describe it as tedious.

Luckily, there are tools to help us to achieve our goal - get a new animation to be used by the engine, and in effect, to be used and seen in the game.

To describe the whole process, I constructed this small tutorial, to help other people to get animations working and to spare them many hours of searching the excellent forum posts, that describe parts of the process.

## Prerequisites - Tools & Materials
1. Gothic MDK (Mod Development Kit)
	- Gothic 1 MDK - [link](https://github.com/PhoenixTales/gothic-devkit)
	- Gothic 2 MDK - [link](https://www.worldofgothic.de/dl/download_94.htm)
2. [Blender](https://www.blender.org/)
3. [Kerrax's Import Export plugin](https://gitlab.com/Patrix9999/krximpexp) - follow the installation instructions to install the plugin, make sure to set up the texture paths too
4. Tool for decompiling animations [GothicSourcer](https://worldofplayers.ru/threads/41942/), or use [phoenix](https://github.com/lmichaelis/phoenix) or write your own using [ZenLib](https://github.com/Try/ZenLib)



##  The work flow
This is the basic step-by-step on how to get the animation into the game.

1. Load the actor (character or object) into your 3D software
2. Create your animation
3. Export the animation as an `.asc` file
4. Write the MDS file
5. Run the game to compile your animations
6. Test your animations in-game using a Daedalus script or a console command

That all sound great, but how do you actually do it? Even though, the steps start with loading the actor into blender, I think it is much more important, to understand the system of animations, to get high quality assets into your mod.

## Animation "types"
There are two main types of animations - skeletal and morphmesh animations. Character body animations are skeletal - meaning we animate a skeleton and the entire model (skin) moves around it. And the morph mesh animation, that is used for facial animations (eating, blinking, talking,...) and for animated meshes (wavy water ferns, fish in Khorinis' harbor,...).

The animations we are concerned with are the skeletal ones. I divide them into few types myself - I hope to have a demonstration on how to make each on of them.

1. Standalone animation - waving, bowing, eating
2. MOBSI animations - bed, alchemy table, anvil
3. Item animations - sweeping the floor with a broomstick, using the horn, playing the lute
4. Mandatory animations - running, walking, sneaking
5. Combined/interpolated animations - picking stuff up, aiming with a bow/crossbow

All of these animations are defined in a MDS file about which we will talk about in the next section.
