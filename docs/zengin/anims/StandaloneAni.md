!!! example "Acknowledgment"

    This tutorial would not be possible without the ZenGin documentation available in the mod-kit, [Mark56](https://carnage-markus.blogspot.com) who helped me understand animations in the first place. [Fawkes](https://www.youtube.com/channel/UCheR2tr8u1CsUGG15Lu2mxQ) and his request for me to do some animations for his excellent mod - Replay Mod. And flosha from the Phoenix team, who was the one, to whom I offered to write this tutorial, to help with the development of the [Phoenix project](https://phoenixthegame.com/).

# Standalone animation
Let's start with the easiest animation, lets make a very simple gesturing animation.

!!! info

    Some of the videos that I write about in the text below are in this [play-list](https://www.youtube.com/playlist?list=PLn8QrKx4F-EITe0yG_2n0z9p4q6EAp6rx).
    
First we have to have the animation source files ready, I usually decompile them using [Gothic Sourcer](https://worldofplayers.ru/threads/41942/). In GothicSourcer you choose **Tools > Decompiler models > Dynamic (MDS or MSB)** and choose an MDS file of your choice - `Humans.mds` in our case and then click the decompile button.

## Animating
Open Blender, **File > Import > Kerrax ASCII model (.asc)**, navigate to the folder with your decompiled animation files and select `HUM_BODY_NAKED0.ASC`, this file contains the skeleton and skin model for human NPCs.

!!! tip "What bone hierarchy is this model using?"
    From the `.mds` file, if you open it again, there is a command `meshAndTree` that specifies, what model contains the skeleton. And there lies our answer:
    
    ```c++
    Model ("HuS")
    {
        meshAndTree ("Hum_Body_Naked0.ASC" DONT_USE_MESH)
	```

A windows pops up, you can read some interesting information about the model you are about to import, what we are interested in is, that **Completely replace current scene** is ticked, we want to use **Armature modifier**, and we also want to **Try to connect bones** and **Use sample meshes from folder**. You should provide a path to a directory with the sample meshes - these are meshes for items, that usually go into slot bones. And lastly, the **space transformation scale** should be set to **0.01**, this is because ZenGin works with centimeter units and one unit in Blender is a meter.

Click import and wait for the magic to happen.

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/UKltt7mOfj0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

This video shows a freshly imported model with all default meshes.

!!! note
    Now if we wanted to play (or edit) existing animation, we can now load it on top of this. Just do as before **File > Import > Kerrax ASCII model (.asc)** and select different animation file (or armour file) for example `Hum_SmokeHerb_Layer_M01.asc` for an animation file.
    <center><iframe width="560" height="315" src="https://www.youtube.com/embed/FDicnSwhv0w" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Gothic characters are modular, you can change their heads on the fly (during gameplay even, as seen in this amazing video of my dear friend and colleague Fawkes - [Head changing](https://www.youtube.com/watch?v=2GBmpeyqKIA)), let's add a head, so we can see how the whole body will behave while we are animating. **File > Import > Kerrax ASCII model (.asc)** and navigate to your head model (for this, you will have to decompile it, like we did with the body itself). I will import `HUM_HEAD_PONY.ASC`. Please make sure to select the target bone for importing **Bip01 Head**, this will attach the head to the proper bone, just like the engine does it.

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/AzotIDHFCSo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Now we have everything ready to start animating. The video shows the DopeSheet a nice way to edit keyframes.

!!! tip "DopeSheet"
    Blender's dope sheet can be used to copy entire sets of keyframes. Useful if we want to create a looping animation.

We can import an animation into Blender as a base.

!!! tip
    If you don't know, what the animation is called, just go into the game, and make your character to perform the animation you want, while in MARVIN mode, you can press `G` and the animation information (and some other info too) will be displayed right on the screen

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/boUwngFLA-U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In this video you can see, that the idle standing animation is `s_run`. Because we want to make an animation, that is going to start from this idle animation, we will import it into blender. Where do we find it? Just look into the `.mds` file, look for `s_run` name and get the name of the file.
```c++
ani	("s_Run" 1 "s_Run" 0.1 0.1 MI "Hum_RunAmbient_M01.asc" F 1 50)
```
As we can see, we have to import the `Hum_RunAmbient_M01.asc` file. 

Next goes the first trick. Since we want our animation to end exactly, as it started - wither because we want the hero to continue his standing animation, or we want to make a looping animation we somehow have to copy the pose. I use the DopeSheet screen, to delete all keyframes and then copy the keyframe set from keyframe number 0 and then drag it somewhere to the end of the timeline.

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/2vOMrM-9aWc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>


Once the animation is done, we have to export it into a `asc` format again, **File > Export > Kerrax ASCII model (.asc)** and then save it to `_work\data\Anims\asc\` so the engine can see it and convert it.
There are many options here, that we will explore later, but we have tick **Export animation** and pick bones that we want to export - this is useful for animations that are played on different layers (dialoge gestures, scratching head, scratching a shoulder,...).

## Animation script

Now, that we have exported the animation, now we have to define it in `Humans.mds`. 

Open the file, scroll to the end and define a new animation. 

!!! attention
    All ani code has to be between the curly brackets, this means you have to insert it before the last two closing curly brackets `} }`.

Let's write it
```c++
ani ("t_backpain" 1 "" 0.0 0.0 M. "Hum_back.ASC" F 0 121)
```

Save the `Humans.mds` file and try it in game. Nothing happens! The reason is, the `mds` has been already compiled, and we have to recompile it. The easiest is to go to `Anims\_compiled` and delete `HUMANS.MSB`.
Run the game and try to play the animation again (`play ani t_backpain` in MARVIN console) now everything should work.

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/-i2un91x1UI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Amazing, now you have your first animation in the game. And you can use it to do some fun stuff, like in dialogues using the `AI_PlayAni` function.


## Example dialogue
```c++
instance DIA_Xardas_Back (C_INFO)
{
    npc         = NONE_100_Xardas;
    nr          = 11;
    condition   = DIA_Xardas_Back_Condition;
    information = DIA_Xardas_Back_Info;
    permanent   = TRUE;
    description = "What's wrong?";
};

func int DIA_Xardas_Back_Condition () {
	return TRUE;
};

func void DIA_Xardas_Back_Info () {
	AI_Output (self, hero, "DIA_Xardas_MOB_14_00"); // My back hurts so much.
	
	// This is our animation!!!!!
	AI_PlayAni(self, "T_BACKPAIN"); 
	AI_Output (self, hero, "DIA_Xardas_MOB_14_01"); // How do YOU feel?
	
	AI_Output (hero, self, "DIA_Xardas_MOB_14_02"); // My back is fine.
	AI_StopProcessInfos(self);
};
```

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/G14lgjA49wU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>
























