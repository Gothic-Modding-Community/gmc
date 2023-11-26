# Spacer

Spacer is the original world editor used to create maps in Gothic and it's installed by the MDK installer.

A good `.ZEN` file to start experimenting with Spacer is [Toten Insel](https://www.worldofgothic.de/?go=moddb&action=view&fileID=742&cat=18&page=1&order=0). It's a simple level which should load without issues for everyone. The map contains a custom texture, but it can be safely ignored.

## Introduction

Upon launching Spacer, multiple windows will appear. They are:

- The main viewport (black with text on launch)
- The vobtree - allows to browse and select the objects already placed in a level
- The object window - it has 3 tabs: Create, Modify and "...".
- Toolbars - there's two of them and each button has a hover hint.
- The help window - sometimes when clicking on something, this window will show a description. It's usually empty though.
- The objectpages window - allows access to specific VOB settings. The contents of this window be changed with buttons on the horizontal toolbar.

Other windows dedicated to specific functionalities can also be opened or toggled (Window tab in the viewport or the horizontal toolbar).

When importing a mesh instead of a `.ZEN` file, some things will change. In this mode, objectpages has material data, one of the toolbars changes completely and the vobtree window changes into a texture browser.

### Configuration

Before doing anything else, you will probably want to change a few settings first. Select `Settings: View` in the Settings tab in the main viewport to increase the viewport resolution. After doing that, press `Align Toolwindows at Screen` or `Align Toolwindows at Spacer` in the Window tab to clean up the window placement. You might still need to move some of the tool windows around after this, as they can overlap.

The most comfortable option we found was to set the resolution to something slightly smaller than the screen resolution (e.g. 1600:900 on a 1920:1080 screen) and then aligning the tool windows to screen.

To help with the control sensitivity issues, change the camera movement speed in the `Settings: General`.

### Viewport controls

The camera has multiple modes of operation. Some of the controls may sound confusing, but will make sense once you try them.

**Default selection mode**

Arrows move the camera back and forward and rotate it sideways. `A` moves the camera up and `Y` lowers it.

`PageUp` and `PageDown` rotate the camera up and down. `End` resets this rotation.

Selecting VOBs is done by simply pointing at them with the mouse and clicking.

**First-person selection mode**

Toggled by the `F3` button.

In this mode, you can point the camera with your mouse, and selection is done by pointing the green reticle at a VOB and clicking `LMB`. Arrows now move the camera parallel to itself (including sideways).

`PageUp` and `PageDown` still rotate the camera up and down, but it's better not to use them because it affects how the arrow movement behaves. `End` resets this rotation.



**Default VOB movement mode**

When a VOB is selected, press `M` to enter and exit this mode.

The arrows now move the VOB horizontally. Moving it up and down is done with `A` and `Y`.

The keys above the arrows now rotate the VOB:

- Axis 1: `Delete` and `PageDown`
- Axis 2: `Insert` and `PageUp`
- Axis 3: `Home` and `End`

**First-person VOB movement mode**

When a VOB is selected, press `T` to enter and exit this mode.

The controls are the same as the default selection mode, but the camera is now placed at the selected VOB and it moves with the camera.

One caveat is that the controls are in the local space of the object. What this basically means is that if you rotated the object in any other way than horizontally, the movement and rotation will now be skewed.

**Mixed VOB movement mode**

When a VOB is selected, press `C` to enter and exit this mode. The VOB is now controlled like in the first-person movement mode, but the camera is not placed at the VOB: in other words, the camera remains in the same place.

**General**

Holding down `Shift` speeds up the camera in all of the modes. The numpad can be used for rotating instead of the buttons above the arrows. Both movement modes can be used from either of the selection modes. Movement modes can be selected from the vertical toolbar. This toolbar also has a "toggle camera position" button; this switches between two camera placements, which can be controlled independently.

The objects location can also be entered manually through the object window: open the Internals folder and select `trafoOSToWSPos` to input them at the bottom of the window. Don't forget to press "Apply". Unfortunately the rotation setting uses an odd format and can't be set manually.

## Basic usage

This section covers some of the basic things done in the editor.

### Inserting a VOB

- In the Create tab in the Objects window, select the VOB type. Choose `zcVob` to add a simple decorative model.
- Right click anywhere on the viewport
- Select the insert option (`Insert [zcVob]` in this case)
- A VOB without a mesh will be created in the middle of the screen. Try to not deselect it, but if you do, it can be found in the vobtree under the appropriate folder (`zcVob` in this case); it can be identified by a green dot.
- In the Modify tab in the Object window, select "visual". Insert the model name in the text form at the bottom of the window. You can use `pc_lob_sleeper3.3ds` for now; this mesh should be present in both Gothic 1 and 2. 
- If you unpacked the meshes while installing the MDK or with GothicVDFS, you can also browse to the file using the file button next to the text form.
- Make sure to click the Apply button. Do this after making any changes in the Object window or they will be lost.

!!! tip
    You can use the VOB Bilder tool to comfortably browse model images and names. An online version is currently available [here](https://dziejekhorinis.org/dev/vobbilder/). The UI on the website is in Polish but it's simple enough to not matter.

- To make the VOB have collision in-game, double click on `cdDyn` ("collision detection dynamic") to set it to true. Sometimes this is unadvised, e.g. with bushes or grass.

!!! tip
    When placing pickable items, you can press the "apply physics on selected VOB" button in the vertical toolbar to make the item drop on the ground. It can save you a lot of work with placing those items. This won't work with a plain cVob though.

### Common VOB settings

VOB settings vary depending on what the VOB type is. They all have common parameters of the base VOB class though. The full descripton of a zCVob class can be found [here](Classes/zCVob.md).

## Issues

Spacer 2 received the last update in 2003 and is a very buggy tool. Here are some known issues.

**Framerate dependence**

The speed of camera in Spacer depends on the framerate. Depending on the angle of the camera and the level, Spacer can have huge framerate, which will make the camera move too quick.

You can try to limit the framerate of Spacer with external tools, but your mileage may vary. Such tools often only limit rendering using fake Vsync, but the underlying logic of the program can still run too fast.

Using the grid snap function can help when the framerate is high, but again: your mileage may vary.

**Random freezes and crashes**

Spacer will freeze or crash quite often at seemingly random moments. It is extremely important to save often and back up your work.

One of the common ways the editor can freeze is when rotating the camera vertically when the framerate is very high. In that case, changing the camera mode to F3 and back can sometimes help.

**Copying VOBs**

When copy-pasting a VOB in Spacer (right click menu), the new VOB might be created as a child of the original one and moving one of them will move both. This doesn't seem to be consistent, but it's worth checking before you accidentally ruin the careful placement of the original VOB.

## Troubleshooting

You can have issues with loading a ZEN or a world model for a multitude of reasons. Here is some of the known ones.

- Some terrain models aren't set up or exported properly.
- Maps which use custom assets will cause issues or won't even load unless these assets are included in appropriate directories. The severity of this is different depending on the asset type. For example, textures will be replaced with a placeholder, but animations will cause crashes.

!!! note
    This section is not exhaustive.


## Creating ZENs

Presented here are the ways of working with new terrain models.

### Compiling a world mesh

To create a completely new ZEN, you will first need a level mesh. These can be made from scratch or downloaded, but be aware that meshes, which aren't properly prepared won't compile correctly (you won't be able to move in the viewport). As with any other mesh in Gothic, it has to be in the 3ds format. It is recommended to place the mesh file somewhere in the `_work/Data/Meshes` (can be your own subfolder).

You can find free terrain models [here](https://www.worldofgothic.de/?go=moddb&cat=10) if you want to practice this. Note that not all of them might compile properly; [this one](https://www.worldofgothic.de/?go=moddb&action=view&fileID=1266&cat=10&page=1&order=0) should be fine though.

First, load the mesh from the File tab of the viewport. To compile the mesh, press `Compile World` in the World tab. From here, multiple options are available:

- Indoor/Outdoor: determines if the world will have a sky and the way that lighting behaves.
- Detect leaks: might be related to checking if indoor ("underground") worlds have holes in them. In some games such holes can cause performance issues, perhaps it's the same here. Doesn't hurt to enable it.
- Quick compile: self-explanatory, but the exact effects of this are unknown.
- Polycheck: presumably checks if the model doesn't exceed triangle limits.
- Editormode:

    * On: Spacer will load the mesh in editor mode, which allows you to change materials assigned to triangles and other mesh operations. It is more comfortable to do these things in an external 3D editor, but sometimes using this is recommended, e.g. for setting up portals. You can save the model as a `.3ds` in this mode.

    * Off: Spacer will create a ZEN where you can normally place VOBs. You can now save the world as a compiled ZEN and add VOBs to it.

### Compiling a world from multiple meshes

First and foremost, the models used for this must be properly positioned and separated in your 3D editor of choice. Then each section must be exported as separate `.3ds` files. After that, compile each model and save it as a compiled ZEN. Place them in their own folder. You can place VOBs in those ZEN files, the VOB trees will be merged too.

Now, to join these zens together, you will need to define a macro in `Tools>Macros`. These are pretty much identical except for the ZEN list; for example, the Mining Colony ZEN in Gothic 2 (`OLDWORLD.ZEN`) is comprised of two models, and the macro looks like this:

```
reset
set error 3
Load world oldworld\SURFACE.ZEN
Load world oldworld\OLDCAMP.ZEN
compile world outdoor
compile light high
```

Then you double-click the macro name to run it and wait. The macro contains the reset directive, but it's worth doing it on a freshly opened Spacer instance just to be safe.

Keep in mind that compiling a world from multiple ZENs is meant as a final step in level production. This is because doing it will cause issues with culling and stop interiors from rendering (and thus stop you from editing it). Instead, the part ZENs are filled with VOBs separately and the world is compiled as a final step before testing the map.


### Updating world meshes in a compiled ZEN

Ideally, updating the world mesh would be avoided, but it's an inevitable need when iterating a map design. Doing this in the original Spacer might not be impossible, but it is generally avoided and Spacer.NET or other editors are used for this instead.
