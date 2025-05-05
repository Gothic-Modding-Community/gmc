# MOB functions
Functions for creating and checking items in a oCMobContainers (chests etc.).

## Functions

### `Mob_CreateItems`
!!! function "`Mob_CreateItems`"
    Creates a specified number of items in a oCMobContainer
    ```dae
    func void Mob_CreateItems(var string mobname, var int iteminstance, var int amount) 
    ```

    **Parameters**  

    - `#!dae mobname` - name of the oCMobContainer
    - `#!dae iteminstance` - instance of the item
    - `#!dae amount` - number of items to create

### `Mob_HasItems`
!!! function "`Mob_HasItems`"
    Checks if a oCMobContainer has a specified number of items
    ```dae
    func int Mob_HasItems(var string mobname, var int iteminstance) 
    ```

    **Parameters**  

    - `#!dae mobname` - name of the oCMobContainer
    - `#!dae iteminstance` - instance of the item

    **Return value**  
    The function returns number of these items in the container
