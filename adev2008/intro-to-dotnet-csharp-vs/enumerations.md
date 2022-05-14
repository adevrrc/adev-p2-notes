---
layout: default
title: Enumerations
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 10
---

# Enumerations

An **Enumeration** is a set of named constants. This user-defined type is very useful when a built-in type does not meet the value requirements for your needs. Enumerations are used frequently in the .NET Framework.

## Declaring

Declaring an enumeration is similar in syntax to a class, except you will use the `enum` keyword.

```csharp
public enum Suit
```

## Defining

Defining an enumeration is simply a list of names that make up the _enum members_.

```csharp
namespace TableTopGame
{
    public enum Suit
    {
        Hearts,
        Diamonds,
        Spades,
        Clubs
    }
}
```

The enum member's type is `int` by default. If no value is assigned to the enum member, the first enum member's value would be zero, with each other member's value incrementing by one.

Enumerations can also be defined with specific values for the enum members.

```csharp
namespace Weather
{
    public enum Direction
    {
        North = 34,
        South = 43,
        East = 12,
        West = 21
    }
}
```

In this course, each enumeration you define will be coded within its own file. Like you did in the previous level of programming, you will name the file using the identifier of what it contains. For example, for the `Direction` enumeration defined above, you would code this in a file called _Direction.cs_.
{: .alert .alert-best-practices}

## Documentation

Documentation is required for each enumeration and all of the enumeration members. Check out [a sample of how an enumeration is documented](/adev2008/appendixes/documentation-samples.html#enumeration).

## Enumeration Values

You can use an enum member in your code, by specifying the enumeration the enum member is within, and using dot-notation to specify the enum member.

```csharp
Direction direction;

// Syntax: Enumeration.EnumMember
direction = Direction.North;

Console.WriteLine("Wind is gusting {0}.", direction);
```

Output:

```text
Wind is gusting North.
```

Because an enumeration underlying type is integral, you can type cast an enumeration value to use its associated integral value.

```csharp
int value = (int)direction;

Console.WriteLine(value);
```

Output:

```text
34
```

## `Enum` Class

All enumerations derive from the base class `Enum`. The abstract class `Enum` provides a number of methods for working with enumerations.

The following example demonstrates the `IsDefined` method of the `Enum` class, that returns `true` when the specified value is defined within the specified enumeration type; otherwise it returns `false`.

```
direction = (Direction)999;

Console.WriteLine(Enum.IsDefined(typeof(Direction), direction));
```

Output:

```text
False
```

The `typeof()` operator is used to retrieve a `System.Type` instance of the specified type. This gives you the ability to store the type of an object as an object. If you'd like to know more about the `typeof()` operator, check out [Type Testing and Cast](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/type-testing-and-cast#typeof-operator){: target="_blank"}.
{: .alert .alert-note}

## Further Reading

- [Enumeration Type](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/enum){: target="_blank"}
- [Enum Class](https://docs.microsoft.com/en-us/dotnet/api/system.enum){: target="_blank"}