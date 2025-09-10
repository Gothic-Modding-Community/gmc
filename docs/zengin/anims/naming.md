---
title: Naming conventions
---
# Animation naming conventions
Animations in ZenGin follow a simple naming convention that helps to identify the purpose of each animation.

## Type

The animation prefix indicates a type of animation.

### State
`s_` is used for state animation. It is usually a looping animation that represents a character's state (e.g., standing, walking, running).
```
s_<state_name>
```
**Examples**

``` title="Running state animation"
s_Run
```

``` title="Blacksmith's anvil state 0 animation"
s_BSANVIL_S0
```

### Transition
`t_` is used for transition animations. These animations are played when transitioning from one state to another.
```
t_<from_state>_2_<to_state>
```
**Examples**

``` title="Transition from running to sneaking"
t_Run_2_Sneak
```

``` title="Transition for blacksmith's anvil standing to state 0"
t_BSANVIL_Stand_2_S0
```

### Random
`r_` is used for random animations. These are non-looping animations that can be played randomly, often used for idle behaviors or actions.
```
r_<action_name>
```
**Examples**

``` title="Random scratching head animation"
r_ScratchHead
```


### Combined

`c_` is used for parts of combined animation that are later combined with [`aniComb`](mds.md#anicomb) in MDS files
```
c_<anim_name>_<number>
```
**Examples**

``` title="Bow aiming"
c_bow_1
c_bow_2
...
s_bowAim <- final animation
```
