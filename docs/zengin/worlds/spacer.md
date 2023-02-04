# Spacer

Spacer is the original world editor used to create maps in Gothic and it's installed by the MDK installer.

A good `.ZEN` file to start experimenting with Spacer is [Toten Insel](https://www.worldofgothic.de/?go=moddb&action=view&fileID=742&cat=18&page=1&order=0). It's a simple level which should load without issues for everyone. The map contains a custom texture, but it can be ignored for now.

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

Before doing anything else, you will probably want to change a few settings first. Select `Settings: View` in the Settings tab in the main viewport to increase the viewport resolution. After doing that, press `Allign Toolwindows at Screen` or `Allign Toolwindows at Spacer` in the Window tab to clean up the window placement. You might still need to move some of the tool windows around after this, as they can overlap.

The most comfortable option we found was to set the resolution to something slightly smaller than the screen resolution (e.g. 1600:900 on a 1920:1080 screen) and then alligning the tool windows to screen.

To help with the control sensitivity issues, change the camera movement speed in the `Settings: General`.

### Viewport controls

The camera has mutliple modes of operation. Some of the controls may sound confusing, but will make sense once you try them.

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

## Basic use cases

This section covers some of the basic things done in the editor.

### Creating a VOB

- In the Create tab in the Objects window, select the VOB type. Choose `zcVob` to add a simple decorative model.
- Right click anywhere on the viewport
- Select the insert option (`Insert [zcVob]` in this case)
- A VOB without a mesh will be created in the middle of the screen. Try to not deselect it, but if you do, it can be found in the vobtree under the appropriate folder (`zcVob` in this case); it can be identified by a green dot.
- In the Modify tab in the Object window, select "visual". Insert the model name in the text form at the bottom of the window. You can use `pc_lob_sleeper3.3ds` for now; this mesh should be present in both Gothic 1 and 2. 
- If you unpacked the meshes while installing the MDK or with GothicVDFS, you can also browse to the file using the file button next to the text form.
- Make sure to click the Apply button. Do this after making any changes in the Object window or they will be lost.

!!! tip
    You can use the VOB Bilder tool to browse model images and names. An online version is currently available [here](https://dziejekhorinis.org/dev/vobbilder/), but the UI is in Polish - it's simple enough to not matter though.

- To make the VOB have collission, double click on `cdDyn` ("collission detection dynamic") to set it to true. Sometimes this is unadvised, e.g. with bushes or grass. Note that this will affect your ability to move VOBs: if you want VOBs to intersect, you will need to disable this option and reenable it once the VOB is placed.
- `staticVob` should be set to true when placing pretty much anything that isn't a pickable item. This applies to interactives such as beds or alchemy stands, but can be skipped with invisible VOBs such as waypoints, freepoints, sounds etc.

!!! tip
    One of the best ways of learning how to do things in Spacer is opening one of the original maps and checking the type and configuration of the related VOBs. Some things will need scripting, however.


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

When copying a VOB in spacer, the new VOB might be created as a child of the original one and moving one of them will move both. This doesn't seem to be consistent, but it's worth checking before you accidentally ruin the careful placement of the original VOB.

## Troubleshooting

Be aware that maps which use custom assets will cause issues or won't even load unless these assets are included in appropriate directories. The severity of this is different depending on the asset type. For example, textures will be replaced with a placeholder, but animations will cause crashes.





