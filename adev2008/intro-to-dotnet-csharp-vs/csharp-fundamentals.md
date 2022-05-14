---
layout: default
title: C# Fundamentals
parent: Intro to .NET, C# & VS
has_children: true
nav_order: 4
---

# C# Fundamentals

C# (pronounced "see sharp") is a modern Object-Oriented Programming language. It is one of the most popular of the programming languages supported by the .NET.

C# is a C-based language. It's syntax is influenced by other languages like C, C++, and Java. If you are comfortable developing in either of the aforementioned languages, you can already read C# code.

Here is an example of the traditional "Hello World" program written in C#:

```csharp
using System;

namespace ADEV.BIT.ADEV.RRC.Module1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World");
            Console.Write("Press any key to continue...");
            Console.ReadKey();
        }
    }
}
```

As you can see from the sample code above, C# has a very similar syntax to Java. Many of the keywords are the same. Some of the words are different, but based on context, you should have a good understanding what they represent.

More often than not, the syntax you used to develop Java code will work in C#. The following will highlight the similarities and differences from Java. 

## Further Reading

- [Tour of C#](https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/){: target="_blank"}