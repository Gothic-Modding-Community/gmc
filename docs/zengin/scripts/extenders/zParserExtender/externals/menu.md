# Menu function

## Menu_SearchItems
Finds all `C_MenuItem` object instances by the mask and automatically places them in the current menu instance

```dae
func void Menu_SearchItems( var string mask ) {};
```

- `mask` - string mask used in the search for menu items

### Example
This function is used in the Union Menu [API script](../../injection#api-script).  
In this script the `Menu_SearchItems` external is used to collect all Union menu scripts that are placed into the Union & Plugins menu that will appear in the game if you use any of the plugins that use this feature.  

```dae title="Usage of Menu_SearchItems external function"
instance MENU_OPT_UNION(C_MENU_DEF)
{
    Menu_SearchItems("MENUITEM_UNION_AUTO_*");
    MENU_OPT_UNION_PY = 1200;
    backpic           = MENU_BACK_PIC;
    items[0]          = "UNION_MENUITEM_TITLE";
    items[100]        = "UNION_MENUITEM_BACK";
    defaultoutgame    = 0;
    defaultingame     = 0;
    Flags             = Flags | MENU_SHOW_INFO;
};
```

In this case all instances are of the name `MENUITEM_UNION_AUTO_*` where `*` is a wildcard that can be substituted with anything. The plugin will search the scripts and find all instances (in the case of [zGamePad]() it is [`MenuItem_Union_Auto_zGamePad`](https://github.com/Gratt-5r2/zGamePad/blob/6be647685e2eee5da9aef9d141398fc69cf3a626/Utils/zGamePad_Menu.d#L28-L33))

This example comes from the `zUnionMenu.d` injectable [API script](../../injection#api-script) that is part of the [zGamePad]() plugin, [GitHub link](https://github.com/Gratt-5r2/zGamePad/blob/6be647685e2eee5da9aef9d141398fc69cf3a626/Utils/zUnionMenu.d#L47-L57).
