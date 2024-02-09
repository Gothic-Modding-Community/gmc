---
title: Locals
description: LeGo package adding true local variables and final clause
---
# Locals
Daedalus doesn't offer any local variables, which can quickly lead to problems with recursive functions. The Locals package allows variables to be saved temporarily on a pseudo-stack.
Locals is a very specific package. People who work normally with Daedalus will probably never need it.
There is also the `final` function, which can be used to emulate something similar to the `final` clause in Java.

## Dependencies

- [StringBuilder](string_builder.md)

## Initialization
N/A

## Implementation
[:material-github: Locals.d on GitHub](https://github.com/Lehona/LeGo/blob/dev/Locals.d)

## Functions

### `Locals`
All that has to be done to enable the `Locals` is to write this function at the beginning of the function that should receive "real" local variables.
```dae
func void locals()
```

### `Final`
It is hard to explain how to use it, but very easy to understand once you've seen an example.
```dae
func int Final()
```

??? abstract "Example"
    With `final()` it is very easy to emulate Java's `final` clause, i.e. a block of code can be specified, which is executed after this function is exited, regardless of when or where the function is exited.
    ```dae
    func void testFinal()
    {
        if (final())
        {
            MEM_InfoBox("Final was called.");
        };
        MEM_InfoBox("This will appear before Final");
    };
    ```
    Few lines of code say more than a thousand words.
