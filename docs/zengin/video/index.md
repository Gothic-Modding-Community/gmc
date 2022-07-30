# Video

To get a video cutscene, intro or outro into the game the video needs to be in a proper format - BINK video format `.bik`.

## Editing the video

Okay, I know this might be a bit out of the scope of this, but the video you recorded has to be edited. My go-to editor for this is [kdenlive](https://kdenlive.org/en/). It works very well, it is free and open source, and it supports BINK video as an input, which is great if you want to include subtitles in the video.

My version of kdenlive does not knw how to export video straight to `.bik`, so I just export my video to `.mp4` and then convert it with RAD Video Tools.

## RAD Video Tools

[RAD Video Tools](http://www.radgametools.com/bnkdown.htm) is a tool for converting other video formats to BINK `.bik` that Gothic can use.

!!! warning
    Gothic 1 bink implementation has some problems, in RAD tools you have to set the audio compression to 104 and above to get video to work in Gothic 1.
    
    NicoDE's comment:
    > Add 100 to the audio compression level when encoding videos, e.g. 104 for level 4 with old sound format (should be mentioned in the RAD Video Tools documentation) for G1 without updated Miles libraries.

!!! note
    Newest Union (1.0m at the time of writing) has a new patch for BINK video playback. The issue with sound should be fixed.

