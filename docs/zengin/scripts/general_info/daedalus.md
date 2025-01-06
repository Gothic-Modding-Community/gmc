---
title: Daedalus language
---
# Daedalus Script Language overview

ZenGin engine uses its own script language called Daedalus. The language is used to define the game logic, dialogues, AI, missions, and other game-related content.

## Syntax Description

Daedalus synatx is a mix of C and C++, designed to be easy to use. The script language is not case-sensitive and whitespace is ignored. 

The script is composed of tokens, which are [identifiers](#indentifiers), [keywords](#keywords), [literals](#literals), [operators](#operators), and other separators. The length of identifiers is not restricted.

### Indentifiers

Identifier are names for variables, constants, instances, prototypes, classes and functions. An identifier is a sequence of letters and ciphers. The first sign must be a letter. Thereafter are allowed: letters, ciphers 0 to 9 and underscores.

### Keywords

Keywords are:

    var  const  if  else  class  prototype  instance  return  null  nofunc  int  float  string  void  func

Keywords are reserved and can not be used as identifiers.

### Literals

Literals are strings `"Hello"` and constant values `453`, `1.5`.

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

The commentary concept was adopted from C++.

## Constants and Variables

### Elementary Types
Elementary types, which can be used in the script, are:

    float
    int
    string
    
No additional types can be defined. 

### Other Types
Classes are also a type, therefore they can be used as a type for variables.

### Declaration
A declaration is a statement, which declares a variable or a constant. 

The declaration of a variable is initiated by the keyword `var`.
```dae
// vardecl:
var type indentifier [,identifier]opt [...]opt;

var int x1, x2, x3;
```

The declaration of a constant by the keyword `const`.
```dae
// constdecl:
const type identifier = expression;

const int MAX_ATTRIBUTES = 10;
```

### Arrays
Additionally, `int` and `string` arrays can be formed:

```dae
VAR INT attribute[MAX_ATTRIBUTES];

VAR STRING names[MAX_NAMES];
```
The first element begins with the index zero.

!!! Warning
    Only one-dimensional arrays can be created. The single elements of the fields (arrays) are addressed as usual in C++, but for this only constants can be used as index:

### Assignment    
An assignment is a statement, which assigns a value to a variable. The assignment is initiated by the equal sign `=`.
```dae
// assignment:
identifier = expression; // simple assignment

// Example:
var int x1;
x1 = 40;	
x1 = x1 / 2;
x1 = x1* 3;	
```    

!!! Danger
    The assignment is not allowed alongside with declarations. The assignment must be done in a separate statement.

    ```dae
    // wrong:
    var int x1 = 40;
    
    // correct:
    var int x1;
    x1 = 40;
    ```

### Global, Local

There exist two different frameworks for variables and constants:

One variable or constant declared outside any block is available globally: After their declaration it is available in the entire following script part.
A variable/constant declared inside a block is local in reference to the block most outside. 
```dae
// Examples:

var int count;

func void test()
{ 
    var int x; 
    var int y; 
}
```    

The variables x and y in the example above, have the same local framework: the function `test()`.


## Operators

An operator "calculates" the resulting value from one or two values. A relational operator as well as a boolean operator delivers the integer value 1, if the expression is true, otherwise 0. Bit-Operators manipulate variables on bit level. The operator precedence was adopted from C++.
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

## Expressions

Expressions are formed by the operators presented above, as is common in C. Here just some examples of expressions are shown.

```dae
    Comparison expressions:
      x1 < x2
      x1 == x2
    
    Boolean expressions:
      x1 && x2
      x1 || x2
      (x0)
    
    Bitwise Manipulations:
      x1 | 5;
      x1 & 4;

```
!!! Note
    A numerical value counts as true, when it does not equal zero.

## Statement Blocks
A statement block is a sequence of statements, which are enclosed by curly brackets. The block is a statement itself. The block is used in functions, if-statements and class declarations.

```dae
// statement-block:
{
    var int x1;
    x1 = 42;
    // [...]
};
```

!!! Danger
    Notice the semicolon at the end of the statement block, which is mandatory.
    
## Functions

### Definition

Function definitions are initiated by the keyword func.
```dae
// func-def:
func type identifier ( vardecl1opt , ... , vardecl8opt ) statement-block

// Example:

func int UsingShield(var int x1, var string s1)
{
// [...]
};
```   

### Parameter transfer

The length of the parameter list is unlimited, but should be kept as short as possible for memory capacity reasons. Parameters are transfered call-by-value, that said, they don't return a value. Arrays are not allowed as parameter transfers.
Function Calls

### Function calls
Functions are called as usual in C++. Also with their identifier as well as a mandatory parameter bracket.

```dae
// func-call:
UsingShield(21, 37);
```

## Classes, Prototypes and Instances
### Classes
The Engine Class declarations describe exactly the data structure of the engine. That means, they are not arbitrarily extendable in the script, but they are directly linked with the engine. However, user-defined classes can be created.
```dae
// classdecl:
class  classname  (base-classname)opt  declaration-block

// Example class:
class Object()
{
    var int x;
    var int y;
    var int z;
};
  
// Example class with inheritance:
class Creature(Object)
{
    var string  name;
    var int     hitpoints;
    var int     hp_max;
};
```    

The attributes receive default values:

- Variables of type `int` receive the value `0`
- Strings receive the empty string `""`
- Pointertypes reference `NULL`. 

### Prototypes
With the keyword `prototype` it is possible to create so-called prototypes, which are derived from classes. 

The prototype is a template of a class, which can be used to create instances with predefined values. 
```dae
// prototype-def:
prototype class-identifier  identifier  statement-block

// Example:
prototype CreatureProtoType (Creature)
{
    name = "A creature";
    hitpoints = 100;
    hp_max = 100;
};
```

### Instances
Instances can be created from classes or prototypes.
```
// instance-def:
instance class-identifier  identifier  statement-block

instance instance-identifier prototype-identifier statement-block
```    

The statement-block of an instance definition serves the definition of the variables, which belong to a class. Non defined attributes or actions keep their default value.
```dae
class Item(Object)
{
    var int damage;
    var int attack;
    var string description;
    var func use;
};
    
prototype ShieldProtoType (Item)
{
    damage = 0;
    attack = 0;
    descriptions = "";
    use = UsingSchild();
};

instance WoodShield1 (ShieldProtoType)
{
    description = "A quite miserable wooden shield";
};
```    

## Control flows
### if statement

The if-statement was adopted from C++. Only the limited possibilities of expressions have to be respected. Other than that, a statement-block is always expected.
```dae
// if-statement:
if (a > 0)
{
    // do something
}
else if (a < 0)
{
    // do something else
}
else
{
    // do something completely different
};
```

### return statement

In functions, which return a value, a return assignment is used like in C++:

```dae
// return-statement:
func int test()
{
    return 42;
};
```

[^1]: The inspiration was taken form text written by Piranha Bytes. Its translation can be found on [Gothic MDK website](https://mdk.gothicarchive.org/docs/skripte/gothic_skriptsprache.htm).