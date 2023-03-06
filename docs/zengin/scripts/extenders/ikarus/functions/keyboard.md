# Keyboard interaction
This part of Ikarus implements function that make interaction with keyboard possible.

## Initialization
The best way to initialize all Ikarus functions is to call `MEM_InitAll()` in the `Init_Global()` initialization function. 
!!! warning
    If you want to use Ikarus in Gothic 1, it is best to define your own `Init_Global()` function and call it from every world initialization function.

```dae
func void MEM_InitAll()
```

## Implementation
[:material-github: Ikarus.d on GitHub](https://github.com/Lehona/Ikarus/blob/master/Ikarus.d#L4198)

## Functions
!!! Tip
    Different players use different keys for specific actions! However, it is possible to get key assigned to the action from Gothic.ini. See [Ini access](ini_access.md#key-functions)
### `MEM_KeyState`
Returns the state of the `key`.
```dae
func int MEM_KeyState(var int key)
```
**Parameters**

- `#!dae var int key`  
    Checked key

**Return value**

The function returns actual key state.

**Key states**

- `KEY_UP` - The key is not pressed and was not pressed before. ("not pressed")
- `KEY_PRESSED` - The key is pressed and was not previously pressed. ("new pressed")
- `KEY_HOLD` - The key is pressed and was also pressed before. ("still pressed")
- `KEY_RELEASED` - The key is not pressed and was previously pressed. ("let go")

`KEY_PRESSED` or `KEY_RELEASED` will be returned if the state of the key has changed since the last query.

`KEY_UP` or `KEY_HOLD` are returned if the state has not changed.

### `MEM_InsertKeyEvent`
Makes the game think that the key was pressed.
```dae
func void MEM_InsertKeyEvent(var int key)
```
**Parameters**

- `#!dae var int key`  
    Key to be "pressed"
