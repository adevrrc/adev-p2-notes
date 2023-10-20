---
layout: default
title: Anatomy of a Program
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 1
---

# Namespaces
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Starting a Program

A program in C# is defined with a class containing a `Main` method. The code sample below is the starting point for a console application.

```csharp
using System;

namespace ADEV.BIT.RRC
{
    internal class Program
    {
        static void Main(string args[])
        {

        }
    }
}
```

- Line 1: Using statments allow you to import modules defined within other namespaces. The `System` namespace contains the core functionality of C#, including the `Console` class.
- Line 3: Declares the namespace the module is compiled to.
- Line 5: Declares a class with the identifier `Progarm`. It is customary in C# to delcare your program class as `Program`.
- Line 7: Declares the `Main` method. The `Main` method is invoked automatically when a program is executed.

The curly braces ('{' and '}') indicate a block of code. Statements intended to be part of a class or method must be written within the appropriate block.
{: .alert .alert-note }