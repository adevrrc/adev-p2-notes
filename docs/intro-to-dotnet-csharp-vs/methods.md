---
layout: default
title: Methods
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 7
---

# Methods
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

C# methods work the same way they do in Java.

## Program Methods

If you are writing a method within a `Program` class:

```csharp
namespace ADEV.Module1.Methods
{
    internal class Program
    {
        static void Main(string[] args)
        {

        }

        static bool IsValidName(string name)
        {
            return name != null && name.Length > 1;
        }
    }
}
```

Like Java, C# Console programs execute from a `static` context. All methods within the `Program` class must be declared as `static`.
{: .alert .alert-warning}

It is common for C# beginners to declare and define methods outside of the `class` block. If you are getting syntax errors declaring methods, double-check you've declared the method within the class block and not within the namespace or `Main` method block.
{: .alert .alert-error}

To invoke the method:

```csharp
static void Main(string[] args)
{
    string studentName = "Kenny";

    Console.WriteLine(IsValidName(studentName))
}
```

Because the `IsValidName()` method is within the same class, dot-notation is not required.

## Methods For Objects

Check out the [Classes]({{ site.url }}{{ site.baseurl }}/docs/intro-to-dotnet-csharp-vs/classes/) section of these notes.