# Daedalus Script Language

ZenGin engine uses its own script language called Daedalus. The language is used to define the game logic, dialogues, AI, missions, and other game-related content.

Daedalus synatx is a mix of `C` and `C++`. The script language is not case-sensitive and whitespace is ignored.

## Identifiers and Keywords

Identifier are names for variables, constants, instances, prototypes, classes and functions. An identifier is a sequence of letters and ciphers. The first sign must be a letter. Thereafter, are allowed: letters, ciphers `0` to `9` and underscores. The length of identifiers is not restricted.

Keywords are:

    var  const  if  else  class  prototype  instance  return  null  nofunc  int  float  string  void  func

Keywords are reserved and can not be used as identifiers.

## Commentaries

The string `/*` begins a comment, which is closed by the string `*/`. 
```dae
/* This is a comment 
    which can be spread over several lines */
```

The string `//` begins a comment, which goes until the end of the line. 
```dae
// This is a comment
```
The strings `//` and `/*` within a comment as well as `*/` after a line comment have no further meaning and are handled like other signs.

## Variables and Constants

### Data Types
| data type | default value                                                      | description                                                                   |
|-----------|--------------------------------------------------------------------|-------------------------------------------------------------------------------|
| int       | 0                                                                  | integer number type - standard 32-bit signed integer                          |
| float     | 0.0                                                                | floating point number type - standard IEEE-754 32-bit floating point number   |
| string    | ""                                                                 | string type                                                                   |
| void      | no value type                                                      | used to denote a function that returns nothing                                |
| func      | 0 :octicons-question-16:{ title="I think it should be -1 NOFUNC" instead } | function type used for setting callbacks and passing functions into functions |

!!! Note
    Notice that the classes can also be used as variable and constant types. 
    
### Variables
In daedalus, variable values are saved in save game files.

The declaration of a variable is initiated by the keyword `var`.
```dae
var int x1;
var int x2, x3, x4;
```

!!! Danger
    The assignment is not allowed alongside with declarations. The assignment must be done in a separate statement.

```dae
// Correct:
var int x1;
x1 = 42;

// Wrong:
var int x2 = 42;
```

#### Variable Arrays
Arrays are declared by adding square brackets with the size after the name.
```dae
var int x[10];

x[0] = 42;
```

The first element of an array has the index 0. 

!!! Danger 
    It is not possible to access array `x[i]` with a variable index i, but only with a constant value.

### Constants
Constants have predefined values, that can be changed, but won't be saved in save game files and will be reset to the default value after loading a save game.

The declaration of a constant by the keyword `const`.
```dae
const int max_level = 100;

max_level = 200; // allowed but not recommended (value will be lost)
```

#### Constant Arrays
Constants can also be arrays, but all elements must be defined at the time of declaration.
```dae
const int values[3] = {
    1, 
    2, 
    3
};
```

### Global, Local
Variables and constants can be declared globally or locally.

If a variable is declared outside a function, it is global, and can be accessed from anywhere in the script. If a variable is declared inside a function, it is local, and can only be accessed from within the function.
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

## Operators
An operator "calculates" the resulting value from one or two values. The following operators are available in Daedalus:
```
    Calculation: 
      +   Addition
      -   Subtraction
      *   Multiplication
      /   Division
      %   Euclidean division (Modulo)
    
    Comparison: 
      <   smaller than
      <=  smaller or equal to
      >   greater than
      >=  greater or equal to
      ==  Equality
      !=  Inequality
    
    Boolean:
      !   not
      &&  and
      ||  or
    
    
    Bitwise:
      &   and
      |   or
    
    Sign:
      +   positive
      -   negative
``` 

!!! Danger
    The operators work only with integer values.

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

In functions, which return a value, a return assignment is used.

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

!!! Warning
    Arrays are not allowed as parameter transfers.

### Function calls
Functions are called as usual in C++. Also with their identifier as well as a mandatory parameter bracket.

```dae
func void bar()
{
    foo(42, "Hello World");
};
```

## Classes
Classes usually mirror classes/structs on the engine side. They are defined by the keyword `class` and can contain variables;
```dae
class Foo {
    var int i1;
    var string s1;
    var func f1;
};
```

### Prototypes
Prototypes are templates for classes. They can be used to create instances with predefined values. The prototype definition is initiated by the keyword `prototype`.

```dae
prototype FooProtoType (Foo)
{
    i1 = 42;
    s1 = "Hello World";
};
```

### Instances
Instances can be created from classes or prototypes.
```dae
instance FooInstance (Foo)
{
    i1 = 42;
    s1 = "Hello World";
};
```


```dae
instance FooInstance (FooProtoType)
{
    i1 = 100;
};
```    

!!! Note
    The instance definition can be used to overwrite the default values of the prototype.


[^1]: The inspiration was taken form text written by Piranha Bytes. Its translation can be found on [Gothic MDK website](https://mdk.gothicarchive.org/docs/skripte/gothic_skriptsprache.htm).