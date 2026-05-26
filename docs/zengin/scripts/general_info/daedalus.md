# Daedalus Scripting Language

ZenGin engine uses its own script language called Daedalus[^1]. The language is used to define some of the game logic, dialogues, AI, quests, NPC AI, sounds, menus and other game-related content.

Daedalus has a `C`-like syntax and is case insensitive.

## Identifiers and Keywords

Identifiers are names for variables, constants, instances, prototypes, classes and functions.

Keywords are:  

- var
- const
- if
- else
- class
- prototype
- instance
- func
- return
- int
- float
- string
- void
- null
- nofunc

> ⚠️ See [Pitfalls](pitfalls.md#identifiers-and-keywords)
## Comments

Daedalus supports single line and multiline comments.

### Multiline comments
```dae
/* This is a multi
   line  comment
*/
```

### Single line comments
```dae
// This is a single line comment
```

!!! Note
    There is a special usecase for single line comments. A single line comment on the same line as the `AI_Output` function will be parsed as the output.  
    ```dae
    AI_Output(self, hero, "Info_Diego_Gamestart_11_00"); //I'm Diego.
	AI_Output(hero, self, "Info_Diego_Gamestart_15_01"); //I'm... 
    ```
## Variables and Constants

> ⚠️ See [Pitfalls](pitfalls.md#variables)

### Data Types
| Data type | Default value | Description                                                                    |
|-----------|---------------|--------------------------------------------------------------------------------|
| int       | `0`           | Integer — standard 32-bit signed integer                                       |
| float     | `0.0`         | Floating-point — IEEE-754 32-bit (single precision)                            |
| string    | `""`          | String                                                                         |
| void      | *n/a*         | No value type; used to denote a function that returns nothing                  |
| func      | `-1` (NOFUNC) | Function type — used for setting callbacks and passing functions as arguments  |

!!! Note
    User-defined classes can also be used as variable and constant types.

### Variables
Variables are named identifiers that hold a value of a certain type.

**Persistence.** Variables persist across save/load cycles.

Variables are declared using the `var` keyword:
```dae
var int x1;
var int x2, x3, x4;
```

#### Variable Arrays
Arrays are declared by appending square brackets with the size after the name:
```dae
var int x[10];

x[0] = 42;
```

Array indexing starts at `0`.
### Constants
Constants must be initialized with a value. They can be reassigned at runtime, but any changes are lost when a save game is loaded — their value resets to the original declaration.

**Persistence.** Constants retain their declared value across save/load cycles; runtime changes do not persist.

Constants are declared using the `const` keyword:
```dae
const int max_level = 100;

max_level = 200; // allowed but not recommended (value resets on load)
```

#### Constant Arrays
Arrays can also be defined as constants, in which case all elements must be specified at the time of declaration:
```dae
const int values[3] = {
    1,
    2,
    3
};
```

## Scoping
Daedalus does not really support scoping. But it is useful to think about scopes as concepts in Daedalus.

If a variable is declared outside a function, it is in the global, and can be accessed from anywhere in the scripts. If a variable is declared inside a function, it is in the local scope, and can only be accessed from within the function.
```dae
var int global;

func void test_1()
{
    var int local;
    global = 42;
};

func void test_2()
{
    local = 42; // Error: `local` is not defined
};
```

!!! Note
    Traditional C style scoping is not what is happening here. The `local` variable inside the `test_1` function is really a global symbol `test_1.local`, which can be used with extensions, that allow you to manipulate symbols sing their name as a string literal.

## Operators
Daedalus supports a wide range of unary and binary operators. The operators are listed below grouped by category.

### Unary (Prefix) Operators
| Operator | Description                                          |
|----------|------------------------------------------------------|
| `+`      | Positive (identity — returns the value unchanged)     |
| `-`      | Negation (negates the sign of the operand)            |
| `!`      | Logical NOT (inverts a boolean condition)             |
| `~`      | Bitwise NOT          |

### Binary (Infix) Operators — Arithmetic
| Operator | Description               |
|----------|---------------------------|
| `+`      | Addition                  |
| `-`      | Subtraction               |
| `*`      | Multiplication            |
| `/`      | Division                  |
| `%`      | Modulo (remainder)        |

### Binary (Infix) Operators — Comparison
| Operator | Description                    |
|----------|--------------------------------|
| `<`      | Less than                      |
| `<=`     | Less than or equal to          |
| `>`      | Greater than                   |
| `>=`     | Greater than or equal to       |
| `==`     | Equality                       |
| `!=`     | Inequality                     |

### Binary (Infix) Operators — Logical
| Operator | Description                          |
|----------|--------------------------------------|
| `||`   | Logical OR (short-circuit evaluation) |
| `&&`    | Logical AND (short-circuit evaluation)|

### Binary (Infix) Operators — Bitwise
| Operator | Description           |
|----------|-----------------------|
| `|`     | Bitwise OR            |
| `&`      | Bitwise AND           |
| `<<`     | Bitwise left shift    |
| `>>`     | Bitwise right shift   |

### Compound Assignment Operators
| Operator | Equivalent To          | Description                           |
|----------|------------------------|---------------------------------------|
| `=`      | —                      | Simple assignment                     |
| `+=`     | `x = x + y`            | Add and assign                        |
| `-=`     | `x = x - y`            | Subtract and assign                   |
| `*=`     | `x = x * y`            | Multiply and assign                   |
| `/=`     | `x = x / y`            | Divide and assign                     |
| `<<=`    | `x = x << y`           | Left shift and assign                 |
| `>>=`    | `x = x >> y`           | Right shift and assign                |
| `&=`     | `x = x & y`            | Bitwise AND and assign                |
| `|=`    | `x = x \| y`           | Bitwise OR and assign                 |

### Precedence
Operator precedence is the same as it is in `C`.

> ⚠️ See [Pitfalls](pitfalls.md#operators)

## Control Flow

### if statement
The if-statement is similar to C/C++.
```dae
func void example_if_statement(var int a)
{
    if (a < 5)
    {
        // ..
    }
    else if (a == 5)
    {
        // ..
    }
    else
    {
        // ..
    };
};
```

### return statement

A `return` statement ends a function and sends a value back to the code that called it.

```dae
func int example_return_statement()
{
    return 42;
};
```
## Functions

### Definition

Function definitions are initiated by the keyword `func`, followed by the return type, the function name, and the parameter list. The function body is enclosed by curly brackets.
```dae
func type name ( var type param1, ... )
{
    // some code
};
```

!!! Example
    The following example shows a void `foo` function definition with two parameters.
    ```dae
    func void foo(var int integer_parameter, var string str_parameter)
    {
        // some code
    };
    ```

### Parameters
The length of the parameter list is unlimited, but should be kept as short as possible for memory capacity reasons.

### Function calls
Functions are called by writing the function identifier followed by the argument list in parentheses `()`.

```dae
func void bar()
{
    foo(42, "Hello World");
};
```

### Return
ZenGin compiler does not do any control flow analysis, this means it cannot detect mistakes, where the data stack would become corrupted.

> ⚠️ See [Pitfalls](pitfalls.md#functions)

## Classes
Classes usually mirror classes/structs on the engine side. They are defined by the keyword `class` and can contain member variables.
```dae
class Foo {
    var int i1;
    var string s1;
    var func f1;
};
```

### Prototypes
Prototypes are reusable templates of instances. They can be used to create instances with predefined values. The prototype definition is initiated by the keyword `prototype`. The type of the prototype (or its parent) is defined in the parenheses `()`.

```dae
prototype FooProtoType (Foo)
{
    i1 = 42;
    s1 = "Hello World";
};
```

### Instances
Instances represent engine instances of classes. An instance's parent can be a class or a prototype. This construct is used to define various objects (items, NPCs, dialogues).

When an instance is created from a **class**, all members must be explicitly assigned a value. Any member that is not set in the instance body is initialized with the class's default value (e.g. `0` for `int`, `""` for `string`, etc.).

```dae
instance FooInstance (Foo)
{
    i1 = 42;
    s1 = "Hello World";
};
```

When an instance is created from a **prototype**, the instance inherits all values from the prototype and can override any of them. Members that are not explicitly set in the instance body are inherited from the prototype as-is.

```dae
instance FooInstance (FooProtoType)
{
    i1 = 100; // overridden from prototype (was 42)
    // s1 is inherited from prototype ("Hello World")
};
```
[^1]: The inspiration was taken form text written by Piranha Bytes. Its translation can be found on [Gothic MDK website](https://mdk.gothicarchive.org/docs/skripte/gothic_skriptsprache.htm).
