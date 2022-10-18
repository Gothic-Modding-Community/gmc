# WLD - world manipulation functions
Functions related to the world. 

## Wld_ChangeLevel
Trigger level change.

```dae
func void Wld_ChangeLevel( var string world, var string waypoint ) {};
```

- `world` - name of the world 
- `waypoint` - target waypoint

## Wld_FindVob
Return the VOB instance based on its name.

```dae
func instance Wld_FindVob( var string vobname ) {};
```

- `vobname` - name of the vob
- `return` - zCVob pointer

## Wld_PlayEffectVob

```dae
func void Wld_PlayEffectVob( var string effect,
                             var instance pvob,
                             var int level,
                             var int damage,
                             var int damage_type,
                             var int damage_speed ) {};
```

- `effect` - effect name
- `pvob` - Vob to play the effect at
- `level` - 
- `damage` - damage amount
- `damage_type` - damage type
- `damage_speed` - damage interval

## Wld_PlayEffectAt

```dae
func void Wld_PlayEffectAt(  var string effect,
                             var instance coord,
                             var int level,
                             var int damage,
                             var int damage_type,
                             var int damage_speed ) {};
```

- `effect` - effect name
- `coords` - world coordinates to play the effect at
- `level` - 
- `damage` - damage amount
- `damage_type` - damage type
- `damage_speed` - damage interval

## Wld_ToggleRain

```dae
func void Wld_ToggleRain( var float weight, var flaot time ) {};
```

- `weight` - the strength of the rain
- `time` - rain duration

## Wld_SetWeatherType
Sets the weather type.  
Types:

- `0` - snow
- `1` - rain

```dae
func void Wld_SetWeatherType( var int type ) {};
```

- `type` - weather type

## Wld_GetWeatherType
Gets the current weather type.  
Types:  

- `0` - snow
- `1` - rain

```dae
func int Wld_GetWeatherType() {};
```

- `return` - weather type

## Externals with Docu comments

```dae
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
