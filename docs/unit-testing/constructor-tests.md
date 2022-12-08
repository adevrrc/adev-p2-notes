---
layout: default
title: Constructor Tests
parent: Writing Unit Tests
grand_parent: Unit Testing
nav_order: 1
---

# Constructor Tests
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Example 1 - Exception

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when name is null | Parameter name: null, Parameter amountOfMoney: 500 | ArgumentNullException, Parameter: name, Message: The argument must reference a string object. |

**Testing Goal**: The goal of this test is to cause the expected exception to be thrown and the exception should have the expected state.

```csharp
[TestMethod]
public void Constructor_NameNull_Exception()
{
    // Arrange
    string name = null;
    decimal amountOfMoney = 500;

    // Act & Assert
    ArgumentNullException exception = Assert.ThrowsException<ArgumentNullException>(() => new Person(name, amountOfMoney));

    // Assert exception state
    Assert.AreEqual("name", exception.ParamName);
    Assert.AreEqual("The argument must reference a string object.", GetExceptionMessage(exception.Message));
}
```

**Notes**:

* The _act_ part of the test is `new Person(name, amountOfMoney)`.
* The `Assert.ThrowsException<T>()` method generates a `AssertFailedException` if the type of exception is not thrown. If the type of exception is thrown, a reference to the exception object is returned.
* The _assert_ part of the test includes verifying the parameter and message of the exception.

## Non-Test Methods

Unit test class can also contain methods that aren't unit test methods. These methods do not have the `TestMethod` attribute.

The test above calls a method called `GetExceptionMessage` which extracts only the message from the Exception's Message property.

```csharp
/// <summary>
/// Utility method to obtain only the message from an Exception object.
/// </summary>
/// <param name="exceptionMessage">The Exception's Message state.</param>
/// <returns>The Exception's message with the parameter omitted.</returns>
/// <remarks>
/// The Exception.Message property returns the Exception's message on line 1 and
/// the parameter name on line 2. This method reads the first line and returns
/// the message.
/// </remarks>
private string GetExceptionMessage(string exceptionMessage)
{
    return new System.IO.StringReader(exceptionMessage).ReadLine();
}
```

Feel free to include this method in your test class.

## Example 2 - Initialize State

**Test Case**:

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 6 | Initialize the amount of money to positive value | Parameter name: "Kenny", Parameter amountOfMoney: 500 | 500 |

**Testing Goal**: The goal of this test is to initialize the state of the object and verify it did so correctly.

```csharp
[TestMethod]
public void Constructor_AmountOfMoney_Initialize()
{
    // Arrange
    string name = "Kenny";
    decimal amountOfMoney = 500;

    // Act
    Person person = new Person(name, amountOfMoney);

    // Reflection
    PrivateObject target = new PrivateObject(person);

    // Obtain object state
    decimal actual = (decimal)target.GetField("amountOfMoney");

    // Assert
    Assert.AreEqual(amountOfMoney, actual);
}
```

**Notes**:

* Because the state is stored in a private field, the `PrivateObject` class is used to gain access to the class' private member.
* The `GetField()` method returns an `object` type. Because fields can be any type, the method uses this polymorphic reference to the value of the field. A type cast is necessary to store the value in the `decimal` variable.