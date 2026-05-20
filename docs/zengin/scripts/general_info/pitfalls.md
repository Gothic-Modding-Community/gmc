# Quirks & Pitfalls

A collection of warnings, quirks, and gotchas when working with the Daedalus scripting language.

## Identifiers and Keywords

### Non-standard identifier names
The Daedalus compiler accepts identifiers that do not start with a letter or contain non-ASCII characters — for example `const string 12AS = "Daedalus...";` or `const string 1 = "0"`. Even though this is possible, it should **not** be used. Such identifiers lead to unreadable code and may break tooling (editors, linters, generators).

### Keywords as identifiers
Even though keywords can be used as identifiers outside of their expected context (e.g., `var int instance;` where `instance` is the variable name), this should **not** be done. Keywords only have special meaning at specific syntactic positions, so the compiler accepts them elsewhere — but doing so makes code harder to read and may cause issues with tooling.

## Variables

### Variable declarations don't initialize values at runtime
Variable declaration itself does not initialize the value, it only tells the compiler that it exists in that scope (global or local). This can be a source of confusion:

```dae
func int count() {
    var int i;

    i += get_some_val();
    i += get_other_val();

    return i;
};
```

When this function is first invoked, the `count.i` variable will be zero (initialized by the compiler even before execution). Then `some_val` would be added, then `other_val` would be added and the result on the first call would be what you expect. But when this function is called for the second time, the variable `count.i` already has the previous value in it. The declaration statement `var int i` has **no runtime execution**. So the result would be double the previous one.

The correct way to write this in Daedalus would be:

```dae
func int count() {
    var int i; i = 0;

    i += get_some_val();
    i += get_other_val();

    return i;
};
```

### Avoid mixed type comma separated declarations
```dae
var int x1, var float f3, var string s3;
```
This variant is technically possible but should be avoided. It exists only as an artifact of code reuse in the ZenGin parser.

### Declaration with an initializer
Since the variable declaration only tells the compiler such symbol exists, it cannot be initialized right away. You must do an extra assignment statement.
```dae
// Correct:
var int x1;
x1 = 42;

// Wrong:
var int x2 = 42;
```

## Arrays

### Variable indices are not supported
Array elements can only be accessed with a constant index — variable indices (e.g. `x[i]`) are not supported.

### Maximum array indexable via `[]` is 255, though max size is 4096
Although the maximum array size in Daedalus is 4096 elements, the maximum indexable value via the `[]` operator is **255**.

### Constant arrays cannot be indexed with `[]`
In vanilla Daedalus, the `[]` operator cannot be used to access elements of a constant array at all — not even with a constant index. You must declare the elemnts individually as variables if you need runtime element access.

## Operators

### Floating-point expressions only work at compile time
The arithmetic and comparison operators work only with **integer** values. Floating-point expression work only in "compile time" expressions, so only in `const float` expressions.

## Functions

### Arrays cannot be passed into a function
Arrays cannot be passed as function parameters.

## Data stack issues
There are few classes of data stack issues, pitfalls and quirks in default Daedalus.

### Broken exernals
[External functions]() are engine-implemented routines callable from Daedalus code. Several ZenGin externals suffer from data stack corruption due to two primary classes of bugs:

- *Mismatched Registration:* The external's metadata incorrectly declares the number of arguments it consumes or return values it pushes. This leaves residual operands on the stack or silently consumes unowned values, corrupting subsequent operations.
- *Incomplete Control Flow:* Certain implementations fail to push a return value along specific execution paths. When Daedalus evaluates conditions or branches using these externals, the runtime stack desynchronizes from the compiler's expectations.

### Missing return values corrupt the data stack
ZenGin compiler does not do any control flow analysis, this means it cannot detect mistakes where the data stack would become corrupted.

```dae
func int some_condition() {
    if something_happened() {
        return TRUE;
    };
};
```

In this case, one branch of execution returns `TRUE`, but if `something_happened()` returns false, nothing is returned from this function. This results in a corrupted data stack.

ZenGin has a stack underflow protection (a hack, really): if a value is popped off the stack even though the stack is empty, instead of underflowing, a 0 is returned. Relying on this functionality is not good practice, since you can easily rely on the automatic zero being there while the stack can still have some values on it — and you'll be popping values that should stay there. This creates **undefined behaviour** and should be avoided at all costs.

A more reasonable implementation would be:

```dae
func int some_condition() {
    if something_happened() {
        return TRUE;
    } else {
        return FALSE;
    };
};
```

Or even better:

```dae
func int some_condition() {
    return something_happened();
};
```

!!! Note
    This is not only better, because all branches of execution return a value (there are no branches here), but it is also less code. When Daedalus is compiled, it is directly converted into bytecode - no optimisation happens. This means, shorter code, usually means it will run faster in game.

Due to this lack of control flow analysis and any rigorous checks at compile time, your scripts can compile even when there are quite serious problems. If you, for example, leave a value just as a statement, that pushes that value onto the data stack.
```dae
const int my_val = 35;

func void do_something () {
    // something
    my_val;
    // something else
};
```
whenever `do_something()` is called it leaves an extra value `my_val` on the data stack. Since there is no code that consumes this value (there could be, more on that later - but it is not a good way of doing things) it stays on the stack forever (until the engine clears the entire stack).
This is, of course, a problem and can lead to stack overflows.

### Case study for data stack overflow
