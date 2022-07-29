# MDS - model animation script

!!! Tip
    The MDS syntax is very simple and the scripts can be edited in any text editor, but it is easier to work in an editor with the proper syntac highlighting. [Daedalus Language Server](https://github.com/kirides/vscode-daedalus/releases)'s dev branch already merged the MDS grammar for syntax highlighting, we can expact it in the next release.

Model animation script is a file, that describes what skeleton is to be used, what body meshes work with this set of animations and how the animations should be named, how fast they run, what animation is supposed to run after the current one is finished and much more.
These files are located in `Gothic\_work\DATA\Anims\` directory. 

You will see a lot of long and scary code, but it is actually very simple, lets learn what some of the most important commands mean.


!!! hint "Don't forget to use the search"
    If you search this file for `t_Yes`, you will get a example of the first type of animation - "standalone"
    
    To play the animation in game you use this console command `play ani t_yes`.

   <center><iframe width="560" height="315" src="https://www.youtube.com/embed/aOyuGVWDefc" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

    
## Syntax and keywords

Before we get into the keywords, lets get a quick look at the naming convention, to get a basic idea what is going on.

The first letter indicates a type of animation (transition - `t_` - or state - `s_`).
Then depending on the animation type we have:

**Transition animation**
```
t_Run_2_Sneak
```
Transition animation from the run animation to the sneak animation.
```
t_BSANVIL_Stand_2_S0
```
Transition animation for the blacksmith's anvil from standing to state 0.

**State animation**
```
s_Run
```
State animation for the looping animation.
```
s_BSANVIL_S0
```
State animation for the blacksmith's anvil and its first state.

### `ani`
This is the main command you will be using while defining new animations.

Example:
```c++
ani	("t_Yes" 2 "" 0.1 0.1 M. "Hum_Yes_M01.asc" F 1 44)
```
Syntax:
```c++
ani (ANI_NAME LAYER NEXT_ANI BLEND_IN BLEND_OUT FLAGS ASC_NAME ANI_DIR START_FRAME END_FRAME)
```
`ani` - is a keyword, we are defining new animation

Let's describe all of the parameters

`ANI_NAME`    - animation name, we use it in Daedalus as animation identifier

There is a naming convention, that is recommended (and sometimes required) to be used.

- prefix `t_` - transition animations
- prefix `s_` - state animations - they usually run in a loop
- prefix `c_` - animations used for animation combining/interpolation
	
`LAYER`       - layer number for multi-layer animations

`NEXT_ANI`    - name of the next animations

`BLEND_IN`    - time in seconds describing animation blending at the start

If we set it to 0.5, it takes 0.5 seconds for this animation to take full effect. At 0.0 s the previous animation has full effect on the bones of the skeleton, at 0.1 s it is influenced by 20% by this animation and at 0.5s it is completely influenced by this animation and the previous one has no effect.
	
`BLEND_OUT`   - time in seconds describing animation blending at the end

`FLAGS`       - flags, that describe animation behavior

- **M** - specifies a movement animation, the animation of the model translates into a changed position in the game world
- **R** - the same as M but for rotation
- **E** - this flag makes this animation run only, if the animation in the same layer are finished, this is used in the movement animations. The animation `s_walk` (walking loop animation) runs, when the player is walking,when he stops the transition animation to standing state is played `t_walk_2_stand`. This animation uses the E flag to wait for the walk cycle animation to finish, to smoothly transition into the standing state.
- **F** - the engine ignores height coordinate - doesn't keep the model "glued" to the ground (falling/flying animation)
- **I** - specifies idle animation - breathing, standing with a drawn weapon and moving the weapon...  
	
`ASC_NAME`    - name of the source file exported from Blender

`ANI_DIR`     - direction of the animation

- **F** - forward
- **R** - reverse
	
`START_FRAME` - on what frame from the source file the animation starts

`END_FRAME`   - on what frame from the source file the animation ends

### aniAlias
This is probably the second most useful command, it is used to do, what its name suggests it does, and that is creating a alias (similar to hard link for my fellow unix users) for already defined animations.

Example:
```c++
aniAlias ("t_Sneak_2_Run" 1 "s_Run" 0.0	0.1	M. "t_Run_2_Sneak" R)
```
Syntax:
```c++
aniAlias (ANI_NAME LAYER NEXT_ANI BLEND_IN BLEND_OUT FLAGS ALIAS_NAME ANI_DIR)
```

`ANI_NAME`   - name of the new animation

`LAYER`      - layer the animation is on

`NEXT_ANI`   - name of the next animations

`BLEND_IN`   - time in seconds describing animation blending at the start

`BLEND_OUT`  - time in seconds describing animation blending at the end

`FLAGS`      - flags, that describe animation behaviour

`ALIAS_NAME` - name of the animation we want to use as a source for the alias

`ANI_DIR`    - direction of the animation

If we look for the animation in the example we can see, that there is a related one just one line above
```c++
ani			("t_Run_2_Sneak" 1 "s_Sneak" 0.1 0.0 M. "Hum_Sneak_M01.asc"	 F 0 10)
aniAlias	("t_Sneak_2_Run" 1 "s_Run" 	 0.0 0.1 M. "t_Run_2_Sneak"      R)
```
In this example we are defining `t_Sneak_2_Run` animation, we specify, that the animation after this one is finished will be `s_Run` and that it is being made by reversing animation `t_Run_2_Sneak` by specifying the `R` flag.

### aniBlend
AniBlend is used to define animations that are a result of blending of two animations. This animation is not animated by hand, but it is dynamically generated by the engine during run-time.

Example
```c++
aniBlend ("t_RunR_2_Run" "s_Run" 0.2 0.2)
```
Syntax:
```c++
aniBlend (ANI_NAME NEXT_ANI BLEND_IN BLEND_OUT)
```

`ANI_NAME`   - name of the new animation

`NEXT_ANI`   - name of the next animations

`BLEND_IN`   - time in seconds describing animation blending at the start

`BLEND_OUT`  - time in seconds describing animation blending at the end


### aniSync
TODO: I think this one is not used.

### aniBatch
Not tested in engine - probably doesn't work well, isn't used in any of the games. Probably not wise to use it.

