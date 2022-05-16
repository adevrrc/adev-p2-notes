---
layout: default
title: Delegates
parent: Events
nav_order: 1
---

# Delegates
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

**Delegates** are special types of .NET classes whose instances store references to methods. Delegates allow you to pass methods as arguments to other methods. The delegate object can be passed to code which can call the referenced method, without the code knowing at compile time which method it will call.

## Declaring Delegates

The declaration of a delegate looks more like a method than a class, but has no body.

```csharp
namespace ADEV.Events
{
    /// <summary>
    /// Represents the method that will handle an instructor action.
    /// </summary>
    public delegate void InstructorAction();
}
```

Every delegate has a **signature**. A signature includes the identifier, number of parameters and parameter types. Unlike methods, the return type of the delegate is part of the signature.

When you declare a delegate type, you are specifying the types of methods the delegate can represent. A delegate instance can only reference a method that matches the delegate signature.

Delegates would be coded in their own code file. The example above would be coded in a file called **InstructorAction.cs**.
{: .alert .alert-note }

```csharp
internal class Program
{
    static void Main(string[] args)
    {

    }

    static void AlertStudent()
    {
        
    }

    static void DisplayStudentGrades(int[] grades)
    {

    }
}
```

In the `Program` class above, the `AlertStudent()` method signature matches that of the delegate `InstructorAction()`. Therefore, a instance of the delegate could reference the `AlertStudent()` method. The `DisplayStudentGrades(int[])` method does not have a matching signature and would not be able to be referenced by a delegate of the `InstructorAction()` type.

## Creating Delegate Instances

Creating a delegate instance is similar to creating other objects. The delegate constructor always takes one argument, which is the identifier of the method you want the delegate to reference.

```csharp
internal class Program
{
    static void Main(string[] args)
    {
        InstructorAction alertStudentAction;
        alertStudentAction = new InstructorAction(AlertStudent);
    }

    static void AlertStudent()
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

The syntax can be simplified to:

```csharp
class Program
{
    static void Main(string[] args)
    {
        InstructorAction alertStudentAction = AlertStudent;
    }

    static void AlertStudent()
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

## Using Delegates

To use the delegate, you simply use the variable as if it was the method that it references.

```csharp
class Program
{
    static void Main(string[] args)
    {
        InstructorAction alertStudentAction = AlertStudent;

        // Invoke the method
        alertStudentAction();
    }

    static void AlertStudent()
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

Output:

```text
ALERT! Your test average is below the standard.
```

The example above demonstrates how you would invoke the method a delegate references. But seems rather pointless, considering the method is in the same class. The benefit of delegates is in passing the method to another piece of code.

```csharp
public class Student
{
    public void AddTestMark(double mark, InstructorAction action)
    {
        if (mark < 0 || mark > 1)
            throw new ArgumentOutOfRangeException("mark", "The mark must be a value of zero or greater.");

        this.NumberOfTests++;
        this.SumOfTests += mark;

        double testAverage = this.SumOfTests / this.NumberOfTests;

        if (action != null && this.NumberOfTests > 3 && testAverage < .65)
        {
            action();

            // or
            // action.Invoke();
        }
    }
}
```

```csharp
class Program
{
    static void Main(string[] args)
    {
        InstructorAction alertStudentAction = AlertStudent;

        Student student = new Student();

        student.AddTestMark(.11, alertStudentAction);
        student.AddTestMark(.52, alertStudentAction);
        student.AddTestMark(.33, alertStudentAction);
        student.AddTestMark(.64, alertStudentAction);
    }

    static void AlertStudent()
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

Output:

```text
ALERT! Your test average is below the standard.
```

## Multicast Delegate

If delegates weren't cool enough, they can actually reference more than one method. This is called a **multicast delegate**. When the delegate is used, all the methods it references are called one after another.

```csharp
class Program
{
    static void Main(string[] args)
    {
        InstructorAction alertStudentAction += AlertStudent;

        // Adds a second method to the delegate
        alertStudentAction += AlertGuardian;

        Student student = new Student();

        student.AddTestMark(.11, alertStudentAction);
        student.AddTestMark(.52, alertStudentAction);
        student.AddTestMark(.33, alertStudentAction);
        student.AddTestMark(.64, alertStudentAction);
    }

    static void AlertStudent()
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }

    static void AlertGuardian()
    {
        Console.WriteLine("ALERT! Your dependant's test average is below the standard.");
    }
}
```

Output:

```text
ALERT! Your test average is below the standard.
ALERT! Your dependant's test average is below the standard.
```

The `+=` operator adds a method to the delegates **invocation list**. The `-=` operator removes a method from the delegates invocation list.

## Documentation

- [Delegate]({{ site.url}}{{ site.baseurl }}/docs/appendixes/documentation-samples/#delegate)