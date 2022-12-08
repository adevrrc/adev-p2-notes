---
layout: default
title: Event Handling
parent: Events
nav_order: 3
---

# Event Handling
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

To respond to an event, a _Subscriber_ class must define an _event handler_ method. This method is used to subscribe to an object's event in a process called **event wiring**. When the event occurs, the delegate (event) will call the subscriber's method.

## Defining An Event Handler Method

An event handler method is no different than any other method except that the signature of the method must match that of the event it will be used to subscribe to. Most methods that you will subscribe to will use the `EventHandler` delegate defined as `public delegate void EventHandler(object sender, EventArgs e);`.

```csharp
class Program
{
    static void Main(string[] args)
    {
        
    }

    static void Student_AverageBelowFail(object sender, EventArgs e)
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

It is common for event handler methods to be named using the format, `Object_EventBeingHandled`.

## Subscribing To Events

Once the event handler method is declared and defined, the _Subscriber_ class can subscribe to the object's event.

```csharp
class Program
{
    static void Main(string[] args)
    {
        Student student = new Student();

        student.AverageBelowFail += Student_AverageBelowFail;
    }

    static void Student_AverageBelowFail(object sender, EventArgs e)
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

When the event is raised, the handler method will be invoked.

```csharp
class Program
{
    static void Main(string[] args)
    {
        Student student = new Student();

        student.AverageBelowFail += Student_AverageBelowFail;

        student.AddTestMark(.11);
        student.AddTestMark(.52);
        student.AddTestMark(.33);
        student.AddTestMark(.64);
    }

    static void Student_AverageBelowFail(object sender, EventArgs e)
    {
        Console.WriteLine("ALERT! Your test average is below the standard.");
    }
}
```

## `object sender` Parameter

As mentioned previously, the `sender` parameter references the object that raised the event. This can be used in the event handler method to determine which object called the event handler method and/or to use the object within the event handler method implementation.

```csharp
static void Student_AverageBelowFail(object sender, EventArgs e)
{
    Console.WriteLine("ALERT! {0}'s test average is below the standard.", ((Student)sender).Name);
}
```

The `sender` parameter is declared as `object` because it could be any type of object that uses this event handler method. This is an excellent example of using **polymorphism**. When you have a polymorphic reference, you are limited to accessing only members of the declared type. It is very typical for you to cast `sender` to a more specific type.

## `EventArgs e` Parameter

The `e` parameter references an object of `EventArgs` type which can contain data about the event that took place. This allows object's that raise events to pass data back to the event handler method. In most cases, this object will be _empty_, meaning it contains no data about the event. This is the default implementation of the `EventArgs` type.

## Custom EventArgs

In the examples above, the event was raised using an blank `EventArgs` object. When there is no data to report about an event, an `EventArgs` instance is still required because the `EventHandler` delegate requires an argument for the `EventArgs` parameter.

When your event requires data to send back to the handling method, you will need to define your own `EventArgs` type.

```csharp
public class AverageBelowFailEventArgs : EventArgs
{
    public double BelowAverageDifference
    {
        get;
    }

    public AverageBelowFailEventArgs(double belowAverageDifference)
    {
        this.BelowAverageDifference = belowAverageDifference;
    }
}
```

The `Student` class would be updated to:

```csharp
public class Student
{
    public event EventHandler<AverageBelowFailEventArgs> AverageBelowFail;

    public void AddTestMark(double mark)
    {
        if(mark < 0)
            throw new ArgumentOutOfRangeException("mark", "The mark must be a value of zero or greater.");

        this.NumberOfTests++;
        this.SumOfTests += mark;

        double testAverage = this.SumOfTests / this.NumberOfTests;

        if(this.NumberOfTest > 3 && testAverage < .65)
        {
            OnAverageBelowFail(new AverageBelowFailEventArgs(.65 - average));
        }
    }

    protected virtual void OnAverageBelowFail(AverageBelowFailEventArgs eventArgs)
    {
        if(AverageBelowFail != null)
        {
            AverageBelowFail(this, eventArgs);
        }
    }
}
```

The event handler method would include the custom `EventArgs` as the second parameter type.

```csharp
static void Student_AverageBelowFail(object sender, AverageBelowFailEventArgs e)
{
    Console.WriteLine("ALERT! Your test average is {0:P} below the standard.", e.BelowAverageDifference);
}
```

## Documentation

* [Event Handler Methods]({{ site.url}}{{ site.baseurl }}/docs/appendixes/documentation-samples/#event-handler-methods)

## Further Reading

* [Handle and Raise Events](https://docs.microsoft.com/en-us/dotnet/standard/events/){: target="_blank" }