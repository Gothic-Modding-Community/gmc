# Namespaces
zParserExtender also implements namespaces. Namespaces ensure that all symbols inside the namespace are unique.

## Defining a namespace
To define a namespace the new keyword `namespace` is used.

=== "Regular scripts"
    ```dae
    namespace zTestNamespace
    {
        var int var01;
        func void func01() { };
    };
    ```
=== "Injectable scripts"
    ```dae
    META
    {
        Namespace = zTestNamespace;
    };
    
    var int var01;
    func void func01() { };
    ```

## Namespace nesting

Namespaces can be nested for finer control. In case of injection, the namespace defined in META is applied to all code inside the script.

To go deeper into the namespaces you use the namespace operator `:`. This code shows function with the same name within three different namespaces. The call in `GameInit` is made from the global namespace.
```dae
namespace zTestNamespace01
{
    func void func01() { };
};

namespace zTestNamespace02
{
    func void func01() { };
};

namespace zTestNamespace03
{
    namespace zTestNamespace04
    {
      func void func01() { };
    };
};

func event GameInit()
{
    // In this case, the reference is from global namespace to zTestNamespace
    zTestNamespace01:func01();
    zTestNamespace02:func01();
    zTestNamespace03:zTestNamespace04:func01();
};
```

## Namespace traversal

To go up a namespace tree you use the namespace operator `:` without specifying a namespace. Number of operators determines how many levels you go up.

```dae title="Exiting nested namespaces"
func void func01()
{
    Hlp_MessageBox("#1");
};

namespace zTestNamespace01
{
    func void func01()
    {
        Hlp_MessageBox("#2");
    };

    namespace zTestNamespace02
    {
        func void func01()
        {
            Hlp_MessageBox("#3");
        };
    
        namespace zTestNamespace03
        {
            func void func01()
            {
                Hlp_MessageBox("#4");
            };
        
            func event GameInit()
            {
                :::func01(); // Calls the function 3 levels up
                ::func01();  // Calls the function 2 levels up
                :func01();   // Calls the function 1 level up
                func01();    // Calls the function from the current namespace
            };
        };
    };
};
```

## Optional namespace specification

There are three cases where the namespace prefix is optional

=== "Shares the same namespace"
    ```dae
    namespace zTestNamespace01
    {
        func void func01()
        {
            Hlp_MessageBox("#1");
        };
 
        func event GameInit()
        {
            // Function call from the current namespace
            func01();
        };
    };
    ```
=== "If the funciton is in higher level namespace"
    ```dae
    func void func01()
    {
        Hlp_MessageBox("#1");
    };
  
    namespace zTestNamespace01
    {
        func void func01()
        {
           Hlp_MessageBox("#2");
        };
    
        namespace zTestNamespace02
        {
          func event GameInit()
          {
              // Function call from the global namespace
              func01();
            };
        };
    };
    ```
=== "If `using` is specified in the META block"
    ```dae
    META
    {
        using = zTestNamespace01;
    };
 
    namespace zTestNamespace01
    {
        func void func01()
        {
           Hlp_MessageBox("#1");
        };
    };
 
    func event GameInit()
    {
        // Calls the function with the namespace specified in the META block
        func01();
    };
    ```

## Global namespace and Daedalus hooking

Namespace can not only be defined to an existing symbol but also to define new ones. Next code example shows how to implement a hook to a global instance.

```dae
namespace zTestNamespace01
{
    const string Var01 = "New instance name";

    // Hooking the global instance
    instance :ItAr_Pir_L_Addon(C_Item)
    {
        ItAr_Pir_L_Addon_Old();
        name = Var01;
    };
};
```
To hook an object, both signature and namespace has to match. It is syntactically allowed to hook an instance from a different space. Specify explicitly to which namespace the object will belong. This means that to hook instance `ItAr_Pir_L_Addon` from the namespace `zTestNamespace01` to a global namespace, you have to refer to the global namespace using the namespace operator `:`. Since the function will be defined globally (as every symbol in ZenGin), it will be a part of the `zTestNamespace01` which means that all functions will be local to this namespace.
