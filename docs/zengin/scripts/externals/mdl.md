# MDL functions



```dae
func void Mdl_ApplyOverlayMDSTimed(var c_npc self, var string overlayname, var float timeticks) {};
func void Mdl_ApplyOverlayMDS(var c_npc n0, var string s1) {};
func void Mdl_ApplyRandomAniFreq(var c_npc n0, var string s1, var float f2) {};
func void Mdl_ApplyRandomAni(var c_npc n0, var string s1, var string s2) {};
func void Mdl_ApplyRandomFaceAni(var c_npc self,
                                 var string name,
                                 var float timemin,
                                 var float timeminvar,
                                 var float timemax,
                                 var float timemaxvar,
                                 var float probmin) {};
func void Mdl_RemoveOverlayMDS(var c_npc self, var string overlayname) {};
func void Mdl_SetModelFatness(var c_npc self, var float fatness) {};
func void Mdl_SetModelScale(var c_npc self, var float x, var float y, var float z) {};
func void Mdl_SetVisualBody(var instance n0,
                            var string s1,
                            var int i2,
                            var int i3,
                            var string s4,
                            var int i5,
                            var int i6,
                            var int i7) {};
func void Mdl_SetVisual(var instance n0, var string s1) {};
func void Mdl_StartFaceAni(var c_npc self, var string name, var float intensity, var float holdtime) {};
```

