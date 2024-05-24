# Access Menu Objects
These Ikarus functions are intended to provide and simplify access to menu items (e.g. in the character menu).
!!! Tip
    Some menus are generated every time they are used, while others are generated once and then kept. For example, a character menu is only available after it was opened for the first time, after that it is kept in memory. Depending on what you actually want to do, it can make sense to introduce changes in the menu scripts.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
MEM_InitAll();
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L3681)

## Functions

### `MEM_GetMenuByString`
!!! function "`MEM_GetMenuByString`"
    ```dae
    func int MEM_GetMenuByString(var string menuName)
    ```

    **Parameters**

    - `#!dae var string menuName`  
        Name of the Gothic menu e.g. `MENU_STATUS`

    **Return value**

    The function returns the address of the menu if a menu with this name exists, null otherwise.

### `MEM_GetMenuItemByString`
!!! function "`MEM_GetMenuItemByString`"
    ```dae
    func int MEM_GetMenuItemByString(var string menuItemName)
    ```

    **Parameters**

    - `#!dae var string menuItemName`  
        Name of the Gothic menu item e.g. `MENU_ITEM_PLAYERGUILD_TITLE`

    **Return value**

    The function returns the address of the menu item if a menu item with this name exists, null otherwise.
