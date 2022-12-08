---
layout: default
title: Namespaces
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

The .NET Framework is made up of hundreds of classes, enumerations, delegates and other types. You could imagine that the Framework could be a very confusing thing to use if it wasn't organized in a logical manner.

Think of the Framework like library in your neighborhood. A library is filled with books and other resources. To keep it simple, we can say a book represents a class.  Now imagine the library had 5000 books. Without proper organization, it would be difficult to find the book you are looking for. We would also have to consider that some books may make reference to other books in the library. Also, imagine the librarian having to manage the catalogue with additions and changes.

When developing applications (or anything really), it is very important to be organized. It is the most efficient way to complete any programming project. The .NET Framework is organized by using **Namespaces**.

Namespaces serve two purposes:

1. Organizes related classes (and other types).
2. Defines a scope for classes (preventing **Name Collisions**) and methods.

## Declaring Namespaces

When you create any class, enumeration, or other type, you will declare it within a namespace.

```csharp
namespace Education
{
    public class Student
    {

    }
}
```

In the sample code above, the `Student` class is declared within the `Education` Namespace.

## Fully Qualified Class Identifiers

When you declare a class, or any other type, the actual identifier for the class includes the namespace. This is referred to as the **Fully Qualified** name of the class. For the `Student` class above, the fully qualified name would be `Education.Student`. In order to use the class in another code context, you'd have to fully qualify the identifier.

```csharp
Education.Student student;
student = new Education.Student();
```

This works for classes in the .NET Framework **Application Programming Interface (API)**. In a later topic you will be introduced to the `Console` class. The `Console` class is declared within the `System` namespace.  It's fully qualified name would be `System.Console`.

## Naming Conventions

Namespace identifiers must follow these naming conventions:

* Identifiers must start with a letter or underscore (_).
* Use Pascal-casing (Example: `ThisIsPascalCasing`).
* The identifier is descriptive of the types and other Namespaces within it.
* Use of acronyms is accepted.

## Nested Namespaces

A namespace can be declared within another namespace. This allows you to define a hierarchy of types.

```csharp
namespace Education
{
    namespace Grades
    {
        public class Grade
        {

        }
    }    
}
```

```csharp
namespace Education
{
    namespace Assessments
    {
        public class Exercises
        {

        }
    }    
}
```

In the two samples above, a namespace called `Education` is declared. The `Education` namespace has two sub-namespaces called `Grades` and `Assessments`.

The above examples can be simplified to:

```csharp
namespace Education.Grades
{
    public class Grade
    {

    }   
}
```

```csharp
namespace Education.Assessments
{
    public class Exercises
    {

    }  
}
```

## `using` Directive

The `using` directive allows you to access types without having to fully qualify them.

The following code example declares a class within a deeply nested namespace.

```csharp
namespace Animalia.Chordata.Carnivora.Feliformia.Felidae.Felinae.Felis
{
    public class Cat
    {

    }
}
```

Using the fully qualified name would look like:

```csharp
Animalia.Chordata.Carnivora.Feliformia.Felidae.Felinae.Felis.Cat pet;
pet = new Animalia.Chordata.Carnivora.Feliformia.Felidae.Felinae.Felis.Cat();
```

The `using` statement is coded at the beginning of the code and indicates namespaces you wish to use types from.

```csharp
using Animalia.Chordata.Carnivora.Feliformia.Felidae.Felinae.Felis;

namespace Module1.Namespaces
{
    public class Program
    {
        static void Main(string[] args)
        {
            Cat pet;
            pet = new Cat();
        }
    }
}
```

Namespaces are like packages in Java. Using statements are like `import` statements in Java.
{: .alert .alert-note}

Unlike Java, `using` statements cannot reference a type. The following `using` statement would cause a syntax error in C#.<br />`using Animalia.Chordata.Carnivora.Feliformia.Felidae.Felinae.Felis.Cat;`
{: .alert .alert-error}

## Name Collision

A **Name Collision** happens when you are using an identifier that is be resolved in one or more ways.

Consider the following two classes:

```csharp
namespace ADEV.MusicStore
{
    public class Resource
    {

    }
}
```

```csharp
namespace TaskManagement
{
    public class Resource
    {

    }
}
```

We have two classes with the same identifier `Resource`. Let's say we need to use both these namespaces in a program.

```csharp
using ADEV.MusicStore;
using TaskManagement;

namespace RRC.ADEV.CourseNotes.Module1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Resource thing;
        }
    }
}
```

The statement `Resource thing;` would cause a [syntax error](https://docs.microsoft.com/en-us/dotnet/csharp/misc/cs0104?f1url=%3FappId%3Droslyn%26k%3Dk(CS0104)){: target="_blank"}, because Visual Studio will not know which `Resource` you are referring to. But because the type was declared within a namespace, we can avoid the naming conflict by using the namespace.

```csharp
TaskManagement.Resource thing;
```

It is not acceptable practice to change the name of a class (or other type) just to avoid a naming collision because you don't want to deal with namespaces.
{: .alert .alert-error}

## Further Reading

* [Namespaces](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/types/namespaces){: target="_blank"}
* [Names of Namespaces](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-namespaces){: target="_blank"}
* [using Directive](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-directive){: target="_blank"}