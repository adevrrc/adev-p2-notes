---
layout: default
title: Properties
parent: C# OOP
nav_order: 2
---

# Properties
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

In the previous level of programming, you learned that:

* fields define the attributes of objects of the type.
* fields are declared with `private` access, following the Object-Oriented Programming principle of **Encapsulation**.
* reading, writing and computing field values (_object state_) happens in **accessor** and **mutator** methods.

```csharp
public class Employee
{
    private int identificationNumber;

    public int GetIdentificationNumber()
    {
        return this.identificationNumber;
    }

    public void SetIdentificationNumber(int identificationNumber)
    {
        this.identificationNumber = identificationNumber;
    }
}
```

A C# property is a class member that provides a mechanism to read, write or compute the value of a private field. In many cases, properties eliminate the need for accessor and mutator methods.

## Declaring and Defining Properties

A property is defined using `get` and `set` accessors:

```csharp
public class Employee
{
    private int identificationNumber;

    public int IdentificationNumber
    {
        get
        {
            return this.identificationNumber;
        }

        set
        {
            this.identificationNumber = value;
        }
    }
}
```

### `get` Accessor

To access an object's state, a property must include a `get` accessor. A `get` accessor can include any type of statements, but must have a `return`.

```csharp
get
{
    return this.identificationNumber;
}
```

### `set` Accessor

To modify an object's state, a property must include a `set` accessor. A `set` accessor can include any type or number of statements. Like an mutator method, to update the state, the field of the class will be assigned a new value. Because properties are not methods, there is no parameter to store the value to assign to the field. Rather, the keyword `value` is used to store the value assigned to the property.

```csharp
set
{
    this.identificationNumber = value;
}
```

### Expression Body Definition

The implementation of a property's accessor is often a single-line expression. When the accessor implementation is a single-line expression, the accessor can be defined using a `=>` symbol followed by the expression to assign or retrieve from the property.

```csharp
public class Employee
{
    private int identificationNumber;

    public int IdentificationNumber
    {
        get => this.identificationNumber;
        set => this.identificationNumber = value;
    }
}
```

The `return` keyword is not used with an Expression Body Definition.
{: .alert .alert-note}

### Read-only Properties

Properties can be defined with one or two accessors:

1. Read and Write: Access to both accessors.
2. Read-only: Only access to the `get` accessor.
3. Write-only: Only access to the `set` accessor.

In the examples above, you seen how properties can be defined with both `get` and `set` accessors. If one of the accessors is not required, it can be omitted. 

```csharp
public class Employee
{
    private string name;

    public string Name
    {
        get => this.name;
    }
}
```

This example defines the `Name` property as a _read-only_ property. The property is considered read-only because without the `set` accessor a new state cannot be written to the object. Defining the property this way, the class itself won't be able to `set` the property.

The C# language contains the keyword `readonly`, which has a different meaning than the _read-only_ described above. You won't use `readonly` in this course.
{: .alert .alert-error}

If an accessor is only required within the class, the `private` accessor modifier can be used.

```csharp
public class Employee
{
    private string name;

    public string Name
    {
        get => this.name;
        private set => this.name = value;
    }
}
```

This example also defines the `Name` property as read-only, but the class itself will be able to set the property.

It is very rare for a property to be _write-only_.
{: .alert .alert-note}

## Using Properties

Using properties is like using a public field. Assigning a value to the property invokes the `set` accessor. Using the property in all other expressions will invoke the `get` accessor.

```csharp
class Program
{
    static void Main(string[] args)
    {
        Employee employee;

        employee = new Employee();

        // Invokes the set accessor
        employee.IdentificationNumber = 5;

        // Invokes the get accessor
        Console.WriteLine(employee.IdentificationNumber);
    }
}
```

## Auto-Implemented Properties

When the implementation of a property is only to assign a value or retrieve a value from a field without any additional logic, the property can be _auto-implemented_. An auto-implemented property's accessors will not have a block. Also, a field (called a **Backing Field**) is automatically created for the class. When the class is compiled, a backing field and implementation is created for the property.

```csharp
public class Employee
{
    public string Name
    {
        get;
        set;
    }
}
```

When a property is auto-implemented, you will not have access to the generated backing field. This includes in the class the property is declared within.
{: .alert .alert-warning}

If you are required to declare a field within the class, you will not be able to auto-implement the associated property.
{: .alert .alert-error}

The previous example is equivalent to:

```csharp
public class Employee
{
    private string name;

    public string Name
    {
        get
        {
            return this.name;
        }

        set
        {
            this.name = value;
        }
    }
}
```

## UML Diagram

* [UML Diagram Sample]({{ site.url}}{{ site.baseurl }}/docs/appendixes/uml-diagram-samples/#property)

## Further Reading

* [Properties](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/properties){: target="_blank"}
* [Using Properties](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/using-properties){: target="_blank"}