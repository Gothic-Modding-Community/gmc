# Test-else statements

The test-else bind statement can be used to define sections of code to be compiled. If the code is within the boundaries of the inactive test-else branch, it will not be compiled. This operator can take values as input that are converted to logical values. For example, if an object is passed as an argument, the parser will check for its existence. If it is an engine tag, it will return the result of matching the current engine with the tag:

Valid values:

 - instance name - `PC_HERO`, `ItMi_Gold`, ...
 - engine tag - `G1`, `G1A`, `G2`, `G2A`
 - Steam Overlay activity - `Steam`

The result can be combined from several arguments. Round brackets `()` ca be used to specify priority and expressions support the logical negation operator `!`, logical AND `&&` and OR `||`.


The operator can be used anywhere in the script file. It is syntactically similar to `if else` statement, but curly braces `{}` can be omitted for single-line operations. For example:
```c++ title="SteamActivated constant is set only when Steam is active"
  test Steam var const SteamActivated = 1;
```

```c++ title="Example of a logical expression with an else branch"
  test SteamActivated && G2A 
  {
    // TODO
  }
  else 
  {
    // TODO
  }
```


