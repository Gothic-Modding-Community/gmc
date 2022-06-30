# Sound

Sound effects and dialogues are sound files playing durning the game.

This is Gothic VDFS. It's a tool that allows you to pack and unpack files in .VDF and .MOD format.

![Screenshot_1](https://user-images.githubusercontent.com/30365395/176541176-7e081646-4e8a-4053-8a8f-d98d86ca07e1.png)

Let us start with unpacking "Sound" file:

1. In the "(Viewer)" tab, in the "Filename", go to your Gothic or Gothic II/Data folder and choose "Sound.VDF";
2. Create a folder on your desktop or any other easily accessible place on your computer. Name it however you want;
3. Go to "Root path" and choose the folder you just created;
4. Press "Extract volume" if you want to unpack all sound files.

The chosen file should be unpacking right now.
![image](https://user-images.githubusercontent.com/30365395/176543044-6c2dc5a0-8ab2-4274-9ae7-85c989ca7db7.png)

Now, here are the files we just extracted:
![image](https://user-images.githubusercontent.com/30365395/176544137-5e49a728-fa59-4a49-b6e6-99e96645eff3.png)

A lot of times it can be tricky to find the sound you are looking for, but that we'll leave for later. Now let's just see how can we change a sound file in the game.

1. Get yourself any short sound file;
2. In order for the sound to work in the game, it needs to be in mono .wav format. A lot of programs let you convert a file, like Audacity, so do just that;
3. Rename your converted file into "INV_CHANGE.WAV" and replace it in SFX folder you just extracted;
4. Go back to Gothic VDFS, go to (Builder) tab;
5. In "Filename" you choose how do you want your file to be called and the location it's created in. I recommend creating separate folder and making it there. You can also name the file however you want, as long as it has higher time stamp (more on that later) than original Sounds file. To create is as .VDF file, in the "Save file as" choose "All file" and call it "Sounds.VDF";
6. In "Root path" go to and choose "_WORK" folder;
7. In the field just below "Comment", add a * character then click on the + next to it;
8. Press "Build", and if you did everything right, the folder is being packed back into .VDF file;

That's how a successful process looks like:
![image](https://user-images.githubusercontent.com/30365395/176548201-5d4aa758-4a53-401f-a0b5-02095ae38bb7.png)


Now, get the file you just created, and put it in your Gothic/Data folder, replacing the old one. The file we just replaced changes the sound in main menu and the inventory. If you can hear it, congratulations, you did it!
