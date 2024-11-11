---
title: Daedalus script language
---
# The Script language "DAEDALUS" 

## Introduction

The script language designed by us will be referred to as DAEDALUS in the following text. The game programme as such, that interprets the script code, will be regularly referred to as "C++"-Code.

This chapter describes the script language DAEDALUS. During the design we were primarily inspired by the programming language "C", the script language "[QuakeC](https://en.wikipedia.org/wiki/QuakeC)" and to some extent Pascal. But DAEDALUS deviates from these in a few areas.

Application of DAEDALUS

- Dialogues / Informations
- NPC-AI
- Missions
- Text-Pool
- NPCs (Prototypes and Instances)
- Items (Prototypes and Instances)
- Implementations of Concept-Rules
- "Event-Programmes" (Realisation of complex logical riddles)
- Declaration of Sound-Resources
- Declaration of Graphic-Resources (also with Ani information)

## Syntax Description

There are five kinds of so called tokens: identifier, keywords, literals, operators and other separators. A script is composed of these tokens. Spaces, line breaks, commentaries etc. are ignored. The length of identifiers is non-restricted.

Identifier are names for variables, constants, instances, prototypes, classes and functions. An identifier is a sequence of letters and ciphers. The first sign must be a letter. Thereafter are allowed: letters, ciphers 0 to 9 and underscores.

Keywords are:

    class       const       else        float      func         if
    instance    int         other       prototype  return       self
    string      this        var         void       while
    

Literals are strings ("Hello") and constant values (453). Operators will be introduced further below.

In this reference I describe the script language formally in dependence on the book "The C++ Programming Language" by Bjarne Stroustrup. Syntactical identifiers will be represented in italics.

The script language is not case-sensitive (different than in C).

But we recommend the following conventions for the naming of identifiers: ("dng" be the acronym for a module "dungeon.D")

    Function: Dng_MoveLift();
    Variable: dng_buttonsPressed;
    Constant: DNG_NUM_TRIES; 

## Commentaries

The string /* begins a comment, which is closed by the string */. The string // begins a comment, which goes until the end of the line. Tthe strings // and /* within a comment as well as */ after a line comment have no further meaning and are handled like other signs.

The commentary concept was adopted from C++.
## Statements

Statements are declarations, commands or as well a statement block:

    statement
      vardecl
      constdecl
    assignment	
      if-statement
      return-statement
    statement-block
    

    Example: 
    statement:        door_open();
    statement-list:   door_open();  opened = TRUE;
    statement-block:  { door_open(); opened = TRUE; }
    

## Expressions

### Operators

An operator "calculates" the resulting value from one or two values. A relational operator as well as a boolean operator delivers the integer value 1, if the expression is true, otherwise 0. Bit-Operators manipulate variables on bit level. The operator precedence was adopted from C++.

    operator:
      calc-op
      cmp-op
      bool-op
      bit-op
    
    a) Operators
    
    calc-op: 
      +   Addition
      -   Subtraction
      *   Multiplication
      /   Division
      %   Euclidean division (Modulo)
    
    
    c) Relational Operators
    
    cmp-op: 
      <   smaller than
      <=  smaller or equal to
      >   greater than
      >=  greater or equal to
      ==  Equality
      !=  Inequality
    
    d) Boolean Operators
    
    bool-op:
      !   not
      &&  and
      ||  or
    
    
    e) Bitwise Operators
    
    bit-op:
      &   and
      |   or
    
    f) Signs
    
    sign:
      +   positive
      -   negative
    

### Expressions

Expressions are formed by the operators presented above, as is common in C. Here just some examples of expressions are shown.

    expression:
      literal
      calc-expressoin
      cmp-expression
      bool-expression
      bit-expression
    
    a) Expression
    
    expression:
      -x1 + x2
      x1 * (x2 + x3)
      (x2 % 2) * x3
    
    b) Compares
    
    cmp- expression: 
      x1 < x2
      x1 == x2
    
    c) Boolean Expressions
    
    bool- expression:
      x1 && x2
      x1 || x2
      (x0)
    
    A numerical value counts as true, when it does not equal zero.
    
    d) Bitwise Manipulations
    
    bit- expression:
      x1 | 5;
      x1 & 4;
    

## Types, Variables and Constants

Two kinds of types exist: elementary types and classes. Additional types can not be defined, as is common in C/C++. Classes have a direct correspondent in the C-Code of the engine. Variables of a class are the so called instances.

### Elementary Types

    float
    int
    string
    

Correspond to the types in C/C++

Additionally, int- and string-arrays can be formed:

```dae
VAR INT attribute[MAX_ATTRIBUTES];

VAR STRING names[MAX_NAMES];
```  

Only one-dimensional arrays can be created. The single elements of the fields (arrays) are addressed as usual in C++, but for this only constants can be used as index:
```dae
attribute[1] = 0;
```
    

The first element begins with the index zero.

### C++ and DAEDALUS

Functions, variables and constants, which have to be accessed both in the C++-Code as well as in DAEDALUS, are declared at least in DAEDALUS. This is served by the keyword external. Variables and constants are also additionally defined, that means values are assigned to them.
Variables and Constants

### Variables and Constants

A variable declaration must be initiated by the keyword var. This applies to every single declaration, not, like in PASCAL, for a whole block. But lists of variables are possible (as in C):
```dae
// vardecl:
var  type  identifier [,identifier]opt  [...]opt;

// Examples:

// correct:
var int value1, value2, value3;
var string question, answer;
var int value;

// wrong:
int value;
```    

A constant definition must be initiated by the keyword const:
```dae
// constsdef:
const type  identifier = expression;


// Example:
const type identifier[x] = { expression, expression, expression };
```    

### Framework: global, local

There exist two different frameworks for variables and constants:

One variable or constant declared outside of each block is available globally: After their declaration it is available in the entire following script part.
A variable/constant declared inside a block is local in reference to the block most outside. 
```dae
// Examples:

var int count;

func void test()
{ var int x; var int y; }
```    

The variable count is available globally in the script. The variables x and y - as in C/C++ - have the same local framework: the function `test()`.
## Assignments
```dae
// assignment:
identifier = expression; // simple assignment

// Example:
var int x1;
x1 = 40;	
x1 = x1 / 2;
x1 = x1* 3;	
```    

## Functions

### Definition

Function definitions are initiated by the keyword func.
```dae
// func-def:
func type identifier ( vardecl1opt , ... , vardecl8opt ) statement-block

// Example:

func int UsingShield(var int x1, var string s1)
{
[...]
};
```   

### Parameter transfer

The length of the parameter list is unlimited, but should be kept as short as possible for memory capacity reasons. Parameters are transfered call-by-value, that said, they don't return a value. Arrays are not allowed as parameter transfers.
Function Calls

### Function calls

Functions are called as usual in C++. Also with their identifier as well as a mandatory parameter bracket.
## Classes, Design Patterns and Instances
### Classes

The Class declarations describe exactly the data structure of the engine. That means, they are not arbitrarily extendable in the script, but they are directly linked with the engine.
```dae
// classdecl:
class  classname  (base-classname)opt  declaration-block

// Example:

class Creature (Vob)
{
  // attributes
  var string  name;
  var int     hitpoints;
  var int     hp_max;
  // actions
  var funcref birth;
  var funcref death;
};
```    

The attributes receive default values:

- Variables of type `int` receive the value `0`
- Strings receive the empty string `""`
- Pointertypes reference `NULL`. 

### Prototypes

With the keyword prototype it is possible to create so-called prototypes, which have different default values:
```dae
// prototype-def:
prototype class-identifier  identifier  statement-block

// Example:
prototype CreatureProtoType (Creature)
{
  // attributes
  name = "A creature";
  hitpoints = 100;
  hp_max = 100;
  // actions
  birth = BirthCreature();
  death = DeathCreature();
};
```
    

One can see a prototype as a "derived" class, in which ONLY the default values were changed. Or as an instance of the class, that only serves as a pattern for additional instances. The definition of the default values happens in the statement-block.

There is a separation between class declarations, which mirror the exact structure of the engine-internal class, and the class definition (prototype).

### Instances

Instances of classes or prototypes act as their concrete representations. The instance of a class material is a specific material with all its characteristics.
```
// instance-def:
instance class-identifier  identifier  statement-block

instance instance-identifier prototype-identifier statement-block
```    

The statement-block of an instance definition serves the definition of the variables, which belong to a class. Non defined attributes or actions keep their default value. But all additional assignments are allowed, insofar they make sense in any way.

```dae
// Small (fictitous) example for Item/Shield/WoodShield

class Item(Vob)
{
  // attributes
  var int damage;
  var int attack;
  var string description;
  // actions
  var funcref use;
};
    

prototype ShieldProtoType (Item)
{
  damage = 0;
  attack = 0;
  descriptions = "";
  // actions
  use = UsingSchild();
};

instance WoodShield1 (ShieldProtoType)
{
  // attributes
  description = "A quite miserable wooden shield";
};
```    

## Control flows
### Branching: if-then-else

The if-statement was adopted from C++. Only the limited possibilities of expressions have to be respected. Other than that, a statement-block is always expected.
```dae
// if-statement:
if ( expression ) statement-block
if ( expression ) statement-block else statement-block

// wrong:   
if (x<4) SoundPlay(ID_sound_roar);

// correct:  
if (x<4) { SoundPlay(ID_sound_roar); };
```  

### Function value return: return

In functions, which return a value, a return assignment is used like in C++:

```dae
// return-statement:

return ( expression );
```    

## Dynamic Variables

Some variables are set dynamically with a function call and then they refer to, e.g. in a dialogue on the instance of the NPC (self) and his dialogue partner (other). Furthermore there will be Build-In-Functions, that allow an access to other VOBs.

To support this concept several global variables are declared and dynamically set in the course of the game, such that these functions can be requested. The variables, at the moment, are the following:

```dae
VAR C_NPC self;
VAR C_NPC other;
VAR C_NPC victim;
VAR C_NPC hero;
VAR C_NPC item;
```   

## Important Differences to C++

Here just some pitfalls should be shown in short which result from the differences to C++. Where C++ also allows for single assignments, in DAEDALUS there must be an assignment block. This affects if-statements.

```dae
// Example:

if (x<4) { SoundPlay(); };
```

[^1]: The original text was written by Piranha Bytes and published in the Gothic MDK documentation.
[^2]: Translation was done by [Flosha](https://github.com/floshin) and published on [Gothic MDK website](https://mdk.gothicarchive.org/docs/skripte/gothic_skriptsprache.htm).