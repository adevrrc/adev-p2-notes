---
layout: default
title: Accessing Base Class Fields
parent: Writing Unit Tests
grand_parent: Unit Testing
nav_order: 4
---

# Accessing Base Class Fields

Derived classes inherit the attributes of its base class. If you coded the base class, part of your testing will include verifying that an object's entire state is set.

Consider the following class hierarchy:

```csharp
public abstract class Shape
{
    private string color;
}

public class Circle : Shape
{
    private double radius;
}
```

Part of testing the `Circle` class would be verifying the `color` state is correct.

```csharp
[TestMethod]
public void Constructor_Color_Initialized()
{
    // Arrange
    string color = "Black";
    double radius = 77.7;

    // Act
    Circle circle = new Circle(color, radius);

    PrivateObject target;
    target = new PrivateObject(circle, new PrivateType(typeof(Shape)));

    string actual = (string)target.GetField("color");

    // Assert
    Assert.AreEqual(color, actual);
}
```

**Notes**:

* Uses an overloaded version of the `PrivateObject` constructor. The second argument is a `PrivateType` instance to the base class `Shape`.