# META block
The META block is optional. If it is specified, it has to be the very first thing in the file without any indent or a comment above it.

Syntax:
```dae
META
{
    Parser // specifies into which compiled file the scripts are going to be injected
    /*
        Code    Name              DAT file
        ---     ------            -------
        Game    parser            Gothic.dat
        SFX     parserSoundFX     SFX.dat
        PFX     parserParticleFX  ParticleFX.dat
        VFX     parserVisualFX    VisualFX.dat
        Camera  parserCamera      Camera.dat
        Menu    parserMenu        Menu.dat
        Music   parserMusic       Music.dat
    */
    MergeMode   // 0 - if conflict occurs = compilation error, 1 - if conflict occurs = hook
    Engine      // comma separated list of engines for which the scripts will be injected 
    /*
        Code  Engine          Human readable name
        ---   -----           -----------------------
        G1    Gothic I        Gothic I Classic
        G1A   Gothic Sequel   Gothic I Addon <3
        G2    Gothic II       Gothic II Classic
        G2A   Gothic II NoTR  Gothic II Addon
    */
  
    NativeWhile // use native while
    Namespace   // namespace of this script file
    Using       // comma separated list of namespaces, that are considered local for this script file
    Mod         // specify for which mod should this code be injected
    After       // comma separated list of scripts, after which this script should be parsed
};
```
  
!!! Example
    This is an example of a META block, that will inject the script into the `Menu.dat` file, for `Gothic II Classic` and `Gothic II Addon` engines, after the `TestScript.d` and `HelpFunctions.d` scripts, for `GothicGame.mod` and `LHiver.mod`.
    ```dae
    META
    {
        Parser = Menu;
        After  = TestScript.d, HelpFunctions.d;
        Engine = G2, G2A;
        Mod    = GothicGame.mod, LHiver.mod;
    };
    ```