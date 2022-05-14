---
layout: default
title: Static Classes
parent: C# OOP
nav_order: 4
---

# Static Classes
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Up to this point, classes have been considered non-static classes. These classes were used to create instances of the type.

Static classes are like non-static classes, except you cannot create instances of the type.

## Declaring a Static Class

To declare a static class, you will use the `static` keyword.

```csharp
public static class Math
{

}
```

## Declaring Static Class Members

Static classes cannot contain instance members, only static members or constants.

```csharp
public static class Math
{
    public const double PI = 3.1415;

    public static int Minimum(int a, int b)
    {
        
    }
}
```

## Using Static Classes

To reference members of a static class, you must use the class identifier with dot notation.

```csharp
class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(Math.PI);

        Console.WriteLine(Math.Minimum(3, 5));
    }
}
```

## Class Diagram

In a UML Class Diagram, static classes will be indicated by the `<<static>>` notation. Static class members will be underlined.

<div class="uml">
<pre class="class-name">
&lt;&lt;static&gt;&gt;
ClassName
</pre>
<pre>
<u>+ field : Type = value</u>
</pre>
<pre>
<u>+ Method() : returnType</u>
</pre>
</div>

## Further Reading

- [Static Classes and Static Class Members](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/static-classes-and-static-class-members){: target="_blank"}