---
layout: default
title: Writing Unit Tests
parent: Unit Testing
has_children: true
nav_order: 4
has_toc: false
---

# Writing Unit Tests
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

After creating the test plan, you are now ready to start developing your unit tests.

## Unit Test Classes

Declaring a unit test class is similar to declaring a regular class, but it includes the `[TestClass]` attribute. The use of the `[TestClass]` attribute is what differentiates a test class from just a regular class.

```csharp
namespace ADEV.UnitTesting
{
    [TestClass]
    public class PersonTests
    {

    }
}
```

If your unit test class is missing the `[TestClass]` attribute, the Test Explorer will not recognize the class as containing unit tests.
{: .alert .alert-error }

### Naming Convention

Unit test class identifiers are named by using the class name of the class you are testing followed by the word "Tests". The test class above is testing a class named `Person`, because the test class identifier is `PersonTests`.

## Unit Test Methods

You will code unit test methods within a class with the `[TestClass]` attribute. As a general guideline, you will write one unit test method per test case in your test plan.

Unit test methods are declared and defined like other methods. The use of the `[TestMethod]` attribute denotes the method is a unit test method. 

```csharp
namespace ADEV.UnitTesting
{
    [TestClass]
    public class PersonTests
    {
        [TestMethod]
        public void TestMethod1()
        {

        }
    }
}
```

If your unit test method is missing the `[TestMethod]` attribute, the Test Explorer will not recognize the method as a unit tests method.
{: .alert .alert-error }

### Naming Convention

Unit test method identifiers will follow this general naming format: `UnitDescription_Data_Result`

Example:

```csharp
namespace ADEV.UnitTesting
{
    [TestClass]
    public class PersonTests
    {
        [TestMethod]
        public void Constructor_NameNull_Exception()
        {

        }
    }
}
```

## AAA Pattern

The **AAA (Arrange, Act, Assert) pattern** is a common pattern for writing unit test methods.

* The **Arrange** part of the unit test defines test data and initializes an object used for the test.
* The **Act** part of the test invokes the unit being tested under the conditions of the test case.
* The **Assert** part of the test verifies that the unit being tested behaved as expected.

## Assert Class

The `Assert` class contains a collection of methods to determine the result of a test. If the condition being tested is not met, an `AssertFailedException` is thrown.

### Common Assert Class Method
{: .no_toc }

* **AreEqual(Object, Object)** - Tests whether the specified objects are equal and throws an exception if the two objects are not equal.
* **AreNotEqual(Object, Object)** - Tests whether the specified values are unequal and throws an exception if the two values are equal. 
* **IsTrue(Boolean)** - Tests whether the specified condition is `true` and throws an exception if the condition is `false`.
* **IsFalse(Boolean)** - Tests whether the specified condition is `false` and throws an exception if the condition is `true`.
* **ThrowsException&lt;T&gt;()** - Tests whether the code specified by the delegate action throws exact given exception of type `T` (and not of derived type) and throws `AssertFailedException` if code does not throws exception or throws exception of type other than `T`. This method returns a reference to the exception the exception if one is thrown.

All `Assert` methods will throw an `AssertFailedException` when the condition is not met. The result of the test is a fail.
{: .alert .alert-note}

## Reflection

Many of the tests you will develop will involve verifying the state of an object. State is stored in `private` fields in the class. To verify test cases where the result deals with object state, you will need to use a concept called **Reflection**.  Reflection is the ability to retrieve data that is normally not accessible at run-time.

In the testing you did prior to this topic, you would have normally called an accessor method to verify changes to state. This is no longer satisfactory, as one of your unit testing goals is to isolate the unit your are testing. This means you do not want to invoke other units of the class while testing a specific unit.

## PrivateObject Class

The `PrivateObject` class represents a `public` "version" of an object. The class contains methods to accesses `private` fields, methods, and properties.

To gain access to an object's `private` members, construct an instance of `PrivateObject`, initializing it with a reference to the object you wish access its `private` members.

```csharp
Person person = new Person(name, amountOfMoney);

PrivateObject target = new PrivateObject(person);
```

Use the following methods of the `PrivateObject` class:

* **GetField(String) : Object** - Returns the value of the specified field.
* **SetField(String, Object) : void** - Sets the specified field to the specified value.
* **Invoke(String, Object[]) : Object** - Invokes the specified method. The `Object[]` represents the arguments. Returns the result of the method.

```csharp
PrivateObject target = new PrivateObject(person);

decimal actual = (decimal)target.GetField("amountOfMoney");
```

## PrivateType Class

The `PrivateType` class is used like `PrivateObject`, but is used for Static Classes.

The `PrivateType` class is also used when gaining access to `base` class members.
{: .alert .alert-future-lesson }

## Best Practices For Writing Tests

Before you really dive into developing your unit tests, keep the following best practices in mind:

1. A unit test should only test a single outcome. Do not combine multiple outcomes into a single test method.
2. A unit is tested in isolation of other units in the class (with the exception of the constructor).
2. Always test constructor methods first.
3. Complete all the tests for a unit before moving onto another unit.
4. Group tests in your test class by unit, not by test type.
5. Keep the code in your unit test method simple.
6. Try to order your tests in order of dependency (when known or possible).
7. No unit is too insignificant to test.

## Test Method Examples

The following unit test method examples will follow the [sample test plan]({{ site.url }}{{ site.baseurl }}/docs/unit-testing/sample-test-plan). Not every test case will be demonstrated here, as some of the test cases will produce similar unit test method implementation.

* [Constructor Tests]({{ site.url }}{{ site.baseurl }}/docs/unit-testing/constructor-tests)
* [Property Tests]({{ site.url }}{{ site.baseurl }}/docs/unit-testing/property-tests)
* [Method Tests]({{ site.url }}{{ site.baseurl }}/docs/unit-testing/method-tests)
* [Accessing Base Class Fields]({{ site.url }}{{ site.baseurl }}/docs/unit-testing/accessing-base-class-fields)

## Further Reading

* [Assert Class](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.testtools.unittesting.assert?view=visualstudiosdk-2022){: target="_blank" }
* [PrivateObject Class](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.testtools.unittesting.privateobject?view=visualstudiosdk-2022){: target="_blank" }
* [PrivateType Class](https://docs.microsoft.com/en-us/dotnet/api/microsoft.visualstudio.testtools.unittesting.privatetype?view=visualstudiosdk-2022){: target="_blank" }