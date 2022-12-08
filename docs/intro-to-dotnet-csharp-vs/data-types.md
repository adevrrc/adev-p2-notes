---
layout: default
title: Data Types
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 2
---

# Data Types
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Value Types

All the data types you are familiar with exist in C#:

* byte, char, double, float, int, long, short

### Boolean Type

The boolean type exists in C#, but uses a different keyword than Java:

```csharp
bool isDone;
```

### Decimal Type

C# also includes a floating-point type used for currency values. It is more accurate than using the `double` type.

```csharp
decimal paymentAmount = 34.23M;
```

Like Java, a floating-point literal (Ex. `34.23`) is considered a `double` type. A `float` literal is expressed by succeeding the literal value with an 'F' (Ex. `34.23F`) and a `decimal` literal with an 'M' (Ex. `34.23M`).
{: .alert .alert-note}

## Reference Types

### Object Type

Like Java, the `object` type is the base type for all types (just written without the capital 'O'). How the `object` type differs, is how it is the base type for all reference types and value types.

```csharp
object widget;
```

### String Type

In Java, the String type is referenced using the `String` class name. In C#, the String type is written as `string`, which is the alias to the `System.String` .NET type in the [Common Type System (CTS)](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/types/#the-common-type-system){: target="_blank"}.

```csharp
string firstName = "Chris";`
```

For the most part, you will not see any difference between the Java `String` and the C# `string`, other than some of its method identifiers.

It is best practice to be familiar with the members of the `string` type for any programming language you are developing with.
{: .alert .alert-best-practices}

## Further Reading

* [Integral Numeric Types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/integral-numeric-types){: target="_blank"}
* [Floating-point Numeric Types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/floating-point-numeric-types){: target="_blank"}
* [Built-in Numeric Conversions](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/numeric-conversions){: target="_blank"}
* [Boolean Type](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/bool){: target="_blank"}
* [Character Type](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/char){: target="_blank"}
* [String Interpolation](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/interpolated){: target="_blank"}
* [String Verbatim Token](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/tokens/verbatim){: target="_blank"}