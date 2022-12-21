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

## sender Parameter

As mentioned previously, the `sender` parameter references the object that raised the event. This can be used in the event handler method to determine which object called the event handler method and/or to use the object within the event handler method implementation.

```csharp
static void Student_AverageBelowFail(object sender, EventArgs e)
{
    Console.WriteLine("ALERT! {0}'s test average is below the standard.", ((Student)sender).Name);
}
```

The `sender` parameter is declared as `object` because it could be any type of object that uses this event handler method. This is an excellent example of using **polymorphism**. When you have a polymorphic reference, you are limited to accessing only members of the declared type. It is very typical for you to cast `sender` to a more specific type.

## e Parameter

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

## do !InvokeEventHandlerMethods

You learned in the previous level of programming, the various reasons to avoid duplicating your code. When you begin developing applications where handling events is required, there will be situations where you'll need to execute a sequence of code in two or more events. 

You should always avoid writing statements that directly invoke event handler methods. Event handler methods are intended to be invoked by events. The sample code below, shows an example of what you should not do:

```csharp
static void Student_AverageBelowFail(object sender, EventArgs e)
{
    Console.WriteLine("ALERT! {0}'s test average is below the standard.", ((Student)sender).Name);
}

static void Course_Completed(object sender, EventArgs e)
{
    // ** Avoid doing this **
    Student_AverageBelowFail(sender, e);
}
```

Although this will "work" in some cases, there are many cases where this will lead to defects, typically caused by the objects referenced by `sender` and `e`. It's not worth creating this habit and there are more elegant ways to accomplish the same task.

### Reuse Event Handler Method

When you need to handle two or more events where the implementation of how they are handled is exactly the same, code a single handler method and use it to subscribe to all the events. It doesn't even matter if the events are from different objects.

```csharp
static void Main(string[] args)
{
    student.AverageBelowFail += Student_BelowAverage;
    course.Completed += Student_BlowAverage;
}

static void Student_BelowAverage(object sender, EventArgs e)
{
    Console.WriteLine("ALERT! Your test average is below the standard.");
}
```

### Use a Class Method

When you need to handle two or more events where the implementation contains the same sequence of code, but the entire implementation is not exactly the same, put the similar sequence of code in a method within the class and invoke it from the event handlers.

```csharp
static void Main(string[] args)
{
    student.AverageBelowFail += Student_BelowAverageFail;
    course.Completed += Course_Completed;
}

static void Student_BelowAverage(object sender, EventArgs e)
{
    Console.WriteLine(GetBelowAverageMessage());
}

static void Course_Completed(object sender, EventArgs e)
{
    Course course = Course(sender);
    Console.WriteLine("The {0} is completed!", course.Name)
    Console.WriteLine(GetBelowAverageMessage());
}

static string GetBelowAverageMessage()
{
    return "ALERT! Your test average is below the standard.";
}
```

## Documentation

* [Event Handler Methods]({{ site.url}}{{ site.baseurl }}/docs/appendixes/documentation-samples/#event-handler-methods)

## Further Reading

* [Handle and Raise Events](https://docs.microsoft.com/en-us/dotnet/standard/events/){: target="_blank" }