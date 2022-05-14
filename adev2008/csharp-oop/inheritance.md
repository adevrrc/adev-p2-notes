---
layout: default
title: Inheritance
parent: C# OOP
nav_order: 3
---

# Inheritance
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

You learned in the previous level of programming that **Inheritance** enables you to create new classes that are based on another class. Inheritance allows you to reuse, extend and modify the behaviors of a class. The class that is being inherited from is called the **Base Class**. The class that is extending the base class is the **derived class**. Like Java, a class can only directly extend from one other class.

## Declaring Derived Classes

```csharp
public class Employee
{

}

public class CommissionEmployee : Employee
{

}
```

The `:` symbol is used to indicate that a class derives from another class. In the example above, the `CommissionEmployee` class inherits from the `Employee` class.

## Invoking Base Class Constructors

When you covered inheritance in the previous level of programming, you learned that a base class constructor must always be invoked by a derived class constructor. Depending how the base class is coded, you may be required to explicitly invoke a base class constructor.

```csharp
public class Employee
{
    public string Name
    {
        get; 
        private set;
    }

    public Employee(string name)
    {
        this.Name = name;
    }
}

public class CommissionEmployee : Employee
{
    public CommissionEmployee(string name) : base(name)
    {

    }
}
```

In the above example code, you can see the call to the base class constructor using the `base` keyword. This statement is coded on the same line as the declaration of the constructor, separated by the `:` symbol.

When a base class is defined with a Default Constructor or a constructor with no parameters, the call to the base class constructor can happen implicitly.
{: .alert .alert-note}

If you are receiving the "CS7036: There is no argument given that corresponds to the required formal parameter...", it is likely you are not invoking the base class constructor when you should be doing this explicitly.
{: .alert .alert-error}

## Virtual Methods and Properties

In Java, all methods are declared as _virtual_ by default. A method must be declared as `virtual` to allow it to be overridden in a derived class. In C#, methods and properties are not virtual by default. To allow a method or property to be overridden, you must declare it using the `virtual` keyword.

```csharp
public class Employee
{
    public virtual string Name
    {
        get; 
        private set;
    }

    public virtual decimal GetPay()
    {

    }
}
```

## Method and Property Overriding

To override a method or property, you must use the `override` keyword.

```csharp
public class CommissionEmployee : Employee
{
    public override string Name
    {
        get
        {

        }
    }

    public override decimal GetPay()
    {
        
    }
}
```

When you want to include the base class implementation in the derived class version of the method, you can invoke it using the `base` keyword.

```csharp
public class CommissionEmployee : Employee
{
    public override decimal GetPay()
    {
        return base.GetPay() * this.CommissionRate;
    }
}
```

Omitting the `override` keyword will not cause a syntax error, but will not result in method overriding.
{: .alert .alert-warning }

## Abstract Classes and Members

When a class is defined solely for the purposes of being a base class, you will declare the class using the `abstract` keyword.

```csharp
public abstract class Employee
{

}
```

Abstract classes cannot be instantiated on their own.
{: .alert .alert-note}

Methods and properties that cannot be implemented in the base class, are declared using the `abstract` keyword and do not have a code block.

```csharp
public abstract class Employee
{
    public abstract decimal GetPay();
}
```

Class members declared as `abstract` must be implemented in the derived concrete class.

```csharp
public class CommissionEmployee : Employee
{
    public override decimal GetPay()
    {

    }
}
```

If the `GetPay()` method was coded as a property, it would look like:

```csharp
public abstract class Employee
{
    public abstract decimal Pay
    {
        get;
    }
}

public class CommissionEmployee : Employee
{
    public override decimal Pay
    {
        get
        {

        }
    }
}
```

## Class Diagram

In a UML Class Diagram, abstract classes and members are indicated by italicizing in the text.

<div class="uml">
<pre class="class-name">
<em>Employee</em>
</pre>
<pre>
- identificationNumber : int
- name : string

+ &lt;&lt;Property&gt;&gt; IdentificationNumber : int
+ &lt;&lt;Property&gt;&gt; Name : string
</pre>
<pre>
+ Employee(identificationNumber : int, name : string)
+ Employee(identificationNumber : int)
<em>+ GetPay() : decimal</em>
</pre>
</div>

## Further Reading

- [Inheritance](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/object-oriented/inheritance){: target="_blank"}
- [Virtual](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/virtual){: target="_blank"}
- [Abstract](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/abstract){: target="_blank"}