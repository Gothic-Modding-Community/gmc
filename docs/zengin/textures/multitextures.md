# Multitextures

Multitextures are used, for example, to create animation. For example, rippling water is represented by a sequence of textures `WATER_A0.TGA` that can be applied to 3D geometry. Also in Gothic, multitextures are used to replace the texture of a character's body.

## Naming convention

The naming convention for multitextures is as follows:
```
NAME_[Letter0][Number0]_..[LetterN][NumberN].TGA
```

Example: `HUM_HEAD_HAIR1_C0_V0.TGA`

In this way, multitextures are interconnected. The format is used exclusively for creating multitextures. Therefore, a name like `w_s2_v1.TGA` to name only one texture is not allowed. The engine handles incorrect names, but not quickly.

## Body textures

Multitextures used for the body use two channels:

- V - for skin variation
- C - for skin tone

For example, the texture `Hum_Body_Naked_V2_C3.tga` describes the body of a person without armor, variant 2, and skin tone 3 (Dark-skinned). Setting up specific character texture variations is determined in the script. 
