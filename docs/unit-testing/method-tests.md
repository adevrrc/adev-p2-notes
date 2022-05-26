---
layout: default
title: Method Tests
parent: Writing Unit Tests
grand_parent: Unit Testing
nav_order: 3
---

# Method Tests
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Void Methods

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 3 | Add money | Initial amount of money: 100, Parameter amount: 60 | Amount of money state: 160 |

**Testing Goal**: Invoke the method and verify the object's state.

```csharp
[TestMethod]
public void AddMoney_PositiveAmount_StateUpdated()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 100;

    Person person = new Person(name, amountOfMoney);

    // Act
    person.AddMoney(60);

    decimal expected = 160;

    // Reflection
    PrivateObject target = new PrivateObject(person);

    // Obtain object state
    decimal actual = (decimal)target.GetField("amountOfMoney");

    // Assert
    Assert.AreEqual(expected, actual);
}
```

**Notes**:

* The outcome of this method is to change the state and is verified by using `PrivateObject`.

## Non-Void Methods

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Return string representation of the Person | Initial name: Kenny, Initial amount of money: 123.45M | "Kenny - $123.45" |

**Testing Goal**: Obtain the value returned from the method.

```csharp
[TestMethod]
public void ToString_ReturnsResult()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 123.45M;

    Person person = new Person(name, amountOfMoney);

    // Act
    string actual = person.ToString();

    string expected = "Kenny - $123.45";

    // Assert
    Assert.AreEqual(expected, actual);
}
```

**Notes**:

* When a method returns a value, that value is captured to verify the test.