---
layout: default
title: Event Class Members
parent: Events
nav_order: 2
---

# Event Class Members
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Windows Forms Applications are graphical user interface applications built for the Windows desktop. Before you can learn about developing Windows Forms Applications, you must understand events and how to handle them.

Events are a mechanism for object to notify other objects that something interesting happened to it. These events are typically used to notify that the object's state has changed or an action was performed.

Events are a special multicast delegates. An event can reference one or more methods. The class that contains the event is referred to as the _publisher_.

Classes that need to respond to an object's event will subscribe to the object's event. These classes are referred to as _subscribers_.

Microsoft has a standard pattern for setting up events in a publisher class.  It requires three steps:

1. Declare the event.
2. Declare and define an "On" method for the event.
3. Raise the event in the class.

## Declaring an Event

Events are members of a class. They are typically declared as `public`, as the intention of the event is to be accessible outside of the class.

```csharp
public class Student
{
    public event EventHandler AverageBelowFail;
}
```

The `EventHandler` type is a delegate. All events in the .NET class library are based on this delegate.  It is declared as:

```csharp
public delegate void EventHandler(object sender, EventArgs e);
```

The `EventHandler` delegate has two parameters. The parameters represent:

1. A reference to the object that raised the event.
2. An empty `EventArgs` object.

The `object sender` and `EventArgs e` parameters will be discussed in a later topic.
{: .alert .alert-future-lesson }

Although events can be based on any delegate type, it is recommended that you base your events on the .NET pattern by using `EventHandler`.
{: .alert .alert-best-practices }

The `event` keyword is used when declaring the event. The `event` keyword prevents the delegate from being invoked outside of the class the event is declared in.

## The On Method

The second part of the pattern is to define a method to raise the event. The method identifier is prefixed with the word "On", followed by the name of the event.

```csharp
protected virtual void OnAverageBelowFail()
{
    if(AverageBelowFail != null)
    {
        AverageBelowFail(this, EventArgs.Empty);
    }
}
```

In the sample code above, the delegate invokes the methods it references. Since the `EventHandler` delegate has two parameters, to invoke the delegate, you must provide two arguments:

You may be thinking at this point that this method is rather pointless, since the `AverageBelowFail(this, EventArgs.Empty);` statement can be coded at any point in the class. The advantage of using the "On" method is that when the class is a base class, the derived class will still be able to raise the event. Remember that events can only be invoked in the class they are declared in. The "On" method is inherited and can be called in the derived class. Also, the derived class could override this behavior if needed.

## Raise the Event

Raising the event simply means causing the delegate to invoke the methods it references. When following Microsoft's recommended pattern, this means invoking the "On" method. Raising the event can happen in any method or property accessor.

```csharp
public class Student
{
    public void AddTestMark(double mark)
    {
        if (mark < 0 || mark > 1)
            throw new ArgumentOutOfRangeException("mark", "The mark must be a value of zero or greater.");

        this.NumberOfTests++;
        this.SumOfTests += mark;

        double testAverage = this.SumOfTests / this.NumberOfTests;

        if (this.NumberOfTests > 3 && testAverage < .65)
        {
            OnAverageBelowFail();
        }
    }
}
```

## Documentation

* [Events]({{ site.url}}{{ site.baseurl }}/docs/appendixes/documentation-samples/#events)

## UML Diagram

* [UML Diagram Sample]({{ site.url}}{{ site.baseurl }}/docs/appendixes/uml-diagram-samples/#event)

## Further Reading

* [Events](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/events/){: target="_blank" }
* [`event` Keyword](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/event){: target="_blank" }
* [Publishing Events](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/events/how-to-publish-events-that-conform-to-net-framework-guidelines){: target="_blank" }
* [Raising Events](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/events/how-to-raise-base-class-events-in-derived-classes){: target="_blank" }