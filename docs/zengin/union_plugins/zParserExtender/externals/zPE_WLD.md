# WLD - world manipulation functions
Functions related to the world. 
```c++
func void Wld_ChangeLevel( var string world, var string waypoint ) {};

func instance Wld_FindVob( var string vobname ) {};

func void Wld_PlayEffectVob( var string effect,
                             var instance pvob,
                             var int level,
                             var int damage,
                             var int damage_type,
                             var int damage_speed ) {};

func void Wld_PlayEffectAt(  var string effect,
                             var instance coord,
                             var int level,
                             var int damage,
                             var int damage_type,
                             var int damage_speed ) {};

func void Wld_ToggleRain( var float weight, var flaot time ) {};

func void Wld_SetWeatherType( var int type ) {};

func int Wld_GetWeatherType() {};
```
