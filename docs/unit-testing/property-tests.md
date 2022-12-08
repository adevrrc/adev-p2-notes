---
layout: default
title: Property Tests
parent: Writing Unit Tests
grand_parent: Unit Testing
nav_order: 2
---

# Property Tests
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Example 1 - Set Accessor Exception

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the value is a negative value | Value: -1 | ArgumentOutOfRangeException, Parameter: value, Message: The value must be zero or greater., State is not updated. |

**Testing Goal**: Set the property to an invalid value.

```csharp
[TestMethod]
public void SetAmountOfMoney_NegativeAmount_Exception()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 100;

    Person person = new Person(name, amountOfMoney);

    // Act & Assert
    ArgumentOutOfRangeException exception = Assert.ThrowsException<ArgumentOutOfRangeException>(() => person.AmountOfMoney = -1);

    // Assert exception state
    Assert.AreEqual("value", exception.ParamName);
    Assert.AreEqual("The value must be zero or greater.", GetExceptionMessage(exception.Message));

    // Reflection
    PrivateObject target = new PrivateObject(person);

    // Obtain object state
    decimal actual = (decimal)target.GetField("amountOfMoney");

    // Assert
    Assert.AreEqual(amountOfMoney, actual);
}
```

**Notes**:

* The `Assert.ThrowsException()` method is used since an exception is expected to occur and the state of the exception is verified.
* In most cases, when an exception is thrown in a `set` accessor, the state should not change to the invalid value. The final `Assert` statement verifies this.

## Example 2 - Set Accessor Valid Value

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 3 | Sets the amount of money to zero | Initial amount of money: 100, Value: 0 | 0 |

**Testing Goal**: Sets the property to a valid value and verifies the state changed.

```csharp
[TestMethod]
public void SetAmountOfMoney_ZeroAmount_UpdateState()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 100;

    Person person = new Person(name, amountOfMoney);

    decimal expected = 0;

    // Act
    person.AmountOfMoney = expected;

    // Reflection
    PrivateObject target = new PrivateObject(person);

    // Obtain object state
    decimal actual = (decimal)target.GetField("amountOfMoney");

    // Assert
    Assert.AreEqual(expected, actual);
}
```

**Notes**:

* When testing a modification in state, the value you choose to change the state should be different than the initial value.
* The variable `expected` is a recommended practice as it makes the `Assert` statement clearer.
* Due to the result of the unit changing the state, accessing the `private` field is required to verify the test.

## Example 3 - Get Accessor

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 4 | Gets the amount of money | Initial amount of money: 100 | 100 |

**Testing Goal**: Initialize the object and obtain its state.

```csharp
[TestMethod]
public void GetAmountOfMoney_ReturnsState()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 100;
    
    Person person = new Person(name, amountOfMoney);

    // Act
    decimal actual = person.AmountOfMoney;

    // Assert
    Assert.AreEqual(amountOfMoney, actual);
}
```

**Notes**:

* `PrivateObject` should not be used in this test as no `private` member is accessed.

## Auto-Implemented Property Tests

When a property is auto-implemented, it will not have a field you can access. When you are in this situation, you will use the `GetProperty()` method of the `PrivateObject` class.

```csharp
public abstract class Shape
{
    public double XCoordinate { get; set; }
}

public class Circle : Shape
{
    
}
```

```csharp
[TestMethod]
public void SetXCoordinate_ModifyState()
{
    // Arrange
    string color = "Black";
    double radius = 77.7;
    double xCoordinate = 123.4;

    Circle circle = new Circle(color, radius);

    // Act
    circle.XCoordinate = xCoordinate;

    PrivateObject target;
    target = new PrivateObject(circle);

    double actual = (double)target.GetProperty("XCoordinate");

    // Assert
    Assert.AreEqual(xCoordinate, actual);
}
```