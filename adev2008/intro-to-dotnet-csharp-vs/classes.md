---
layout: default
title: Classes
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 8
---

# Classes
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

In the previous level of programming, you learned that you can define your own data types. These data types are complex, meaning they typically store more than one piece of data and contain functionality for using the data. A **Class** is the basic programming construct used for accomplishing this task.

This document is not a detailed lesson on classes. It is expected at this point in your training that you are familiar with classes, class members, and how they are implemented. This document highlights some of the differences between C# and Java.
{: .alert .alert-warning }

## Declaring a Class

Declaring a class in C# is the same as Java, with the exception of wrapping it within a namespace block.

```csharp
namespace ADEV.Education
{
    public class Student
    {

    }
}
```

## Defining a Class

Your class will include the fields and methods required for defining that type. Fields should be declared at the top of the class block, followed by constructor methods and the remaining methods below.

```csharp
namespace ADEV.Education
{
    public class Student
    {
        // Fields
        private string name;
        private int identificationNumber;

        // Methods
    }
}
```

## Overloading Constructors

In Java, you learned that you can overload methods. Due to the implementation of the methods being so similar, it is very common to invoke another version of the method so that you are not duplicating code.

When invoking constructors, you use the `this` qualifier.

In Java, the `Student` class constructors may look like this:

```java
public Student()
{
    this("");
}

public Student(string name)
{
    this(name, 99999);
}

public Student(string name, int identificationNumber)
{
    this.name = name;
    this.identificationNumber = identificationNumber;
}
```

In C#, those same methods would be implemented as:

```csharp
public Student() 
  : this("")
{
    // Invoke Student(string)
}

public Student(string name) 
  : this(name, 99999)
{
    // Invokes Student(string, int)
}

public Student(string name, int identificationNumber)
{
    this.name = name;
    this.identificationNumber = identificationNumber;
}
```

The call to another constructor method is done after the declaration of the constructor.

## Overriding Methods

In the previous programming level, you learned that when classes derive from other classes, you can override the implementation of a **base class** method in the **derived class**.  To be able to override a method in any OOP language, the base class method must be declared as **virtual** and the derived class must include a method with the same identifier and signature.

In Java, all methods are declared as virtual. To override a base class method, you simply declare a method in the derived class with the same identifier and signature.

In C#, not all methods are virtual. Also, you must specify when a method is overriding versus just creating another method with the same name and signature.

You will see in a later topic how to declare a method as virtual.
{: .alert .alert-future-lesson}

The following example will override the `ToString()` implementation inherited from the `System.Object` class.

```csharp
public override string ToString()
{
    return string.Format("{0} {1}", this.identificationNumber, this.name);
}
```

Notice how the `override` keyword is needed to override the method.

It is very common for Java programmers to leave out the `override` keyword, as it is not needed in the Java language. Omitting the `override` keyword will not give you a syntax error in C#, as its acceptable to code a method with the same identifier and signature in a derived class. The result of which effects how **polymorphism** will work for the method. If the intension of the method is to override the behavior of the base class, you must use the keyword `override`.
{: .alert .alert-error}

## Documentation

Documentation is required for each class and all of the class' members (except for private fields). Check out [a sample of how a class is documented](/adev2008/appendixes/documentation-samples.html#class).

## Further Reading

- [Introduction to Classes](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/types/classes){: target="_blank"}