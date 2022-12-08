---
layout: default
title: Console I/O
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 3
---

# Console Input/Output
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Input / Output Streams

In C# a stream is an abstract representation of a device on which input and output operations can be performed.

The devices which we can stream to and from are things like the operating system’s standard output (console), standard input (keyboard), and the file system.

You can think of a stream as a source or a destinations for a potentially unlimited sequence of bytes.

The `System.Console` class is a class that represents the standard input, output and error streams for console applications. The Console class is used for all input and output to the console.

## Output Text To the Console

In Java, to output text to the console you needed to reference the standard output stream by using `System.out`. In C#, you can accomplish the same by using the `Console` class.

```csharp
Console.Out
```

The `Out` class member returns a reference to a `TextWriter` object. The `TextWriter` class has two method for outputting text to a stream:

* `Write()`
* `WriteLine()`

`Write()` is equivalent to Java's `java.io.PrintStream.print()` method and `WriteLine()` is equivalent to Java's `java.io.PrintStream.println()`.

```csharp
Console.Out.Write("This will output without a line break. ");
Console.Out.WriteLine("This will output with a line break.");
```

Output:

```text
This will output without a line break. This will output with a line break.
```

These output operations can be simplified by using the `Write()` and `WriteLine()` methods of the `Console` class.

```csharp
string name = "Chris";

Console.Write("Hello, ");
Console.WriteLine(name + "!");
Console.WriteLine("Today is going to be a great day!");
```

Output:

```text
Hello, Chris!
Today is going to be a great day!
```

### Formatting Output

`Write()` and `WriteLine()` are overloaded methods, with versions that work like Java's `java.io.PrintStream.printf()` method.

```csharp
string name = "Chris";
DateTime date = DateTime.Now;
Console.WriteLine("Hello, {0}! Today is {1}, it's {2:HH:mm} now.", name, date.DayOfWeek, date);
```

Output:

```text
Hello, Chris! Today is Tuesday, it's 11:14 now.
```

The curly-braces ({}) signifies a placeholder. The integer value within the placeholder signifies an index used to reference the arguments after the string argument. Formatting strings like this is called [Composite Formatting](https://docs.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting){: target="_blank" }.

## Reading From the Console

The `Console` class can also be used for reading input from the console using the `Read()` and `ReadLine()` methods. `Read()` will read the next character from the stream and `ReadLine()` reads an entire line of data from the stream.

```csharp
Console.Write("(Y/N)? ");

char choice = Console.ReadLine()[0];

Console.WriteLine(choice);

Console.Write("Enter your full name: ");

string fullname = Console.ReadLine();

Console.WriteLine(fullname);
```

Output:

```text
(Y/N)? y
y
Enter your full name: Kenny Omega
Kenny Omega
```

The `Console.In` class member returns a `TextReader` object. Using `Console.In` is not required when you use `Console.Read()` and `Console.ReadLine()`.
{: .alert .alert-note}

## Further Reading

* [Console Class Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.console){: target="_blank"}
* [Composite Formatting](https://docs.microsoft.com/en-us/dotnet/standard/base-types/composite-formatting){: target="_blank"}