---
layout: default
title: Math
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 4
---

# Math
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Arithmetic Operators

In C#, you can expect to use all the same arithmetic operators you used in Java:

* Binary: `+` (Addition), `-` (Subtraction), `*` (Multiplication), `/` (Division), `%` (Reminder)
* Unary: `++` (Increment), `--` (Decrement)

## Math Class

The `System.Math` class is used for common mathematical functions not easily done with the arithmetic operators.

```csharp
double radius = 4.5;
double area = Math.PI * Math.Pow(radius, 2);

Console.WriteLine("Area: {0}", area);
```

Output:

```text
Area: 63.6172512351933
```

It's also recommended to familiarize yourself with the `Math` class members for the programming language you are working with.
{: .alert .alert-best-practices}

## Further Reading

* [Arithmetic Operators](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/arithmetic-operators){: target="_blank"}
* [Math Class Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.math){: target="_blank"}