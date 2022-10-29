# Extern binding
The `extern` binding allows you to secure your code against overriding or undefined symbol. Keyword `extern` before declaration means that if object of the same name exists, source object should be used. If not, a new one will be created.
```dae 
extern instance PC_Hero(C_Npc) 
{
  // TODO
};
```
