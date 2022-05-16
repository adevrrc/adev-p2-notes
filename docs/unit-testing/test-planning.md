---
layout: default
title: Test Planning
parent: Unit Testing
nav_order: 2
---

# Test Planning
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

The first step to successfully testing software is to have a plan. A detailed **test plan** outlines testing objectives, resources and processes for testing software. In a very big and complex project, a test plan can be a very lengthy as it typically outlines the group's overall test strategy.

## Unit Test Plan

A **unit test plan** is a plan based on the design specifications of a class or program. A typical unit test plan includes a table outlining the following data:

- The class you are testing.
- A list of all the units within the class.
    - Test number.
    - Description of the outcome/requirement.
    - Test data needed to test the outcome/requirement.
    - The expected result (usually a value).

[Check out a sample test plan]({{ site.url}}{{ site.baseurl }}/docs/unit-testing/sample-test-plan/)

The Microsoft Excel is a great way to create a test plan.
{: .alert .alert-note }

## Test Order

The order that you choose to complete your tests help find defects and prevent false results. Your plan and ultimately your test code should follow this order:

1. Constructors
2. Property Accessors
3. Methods

Constructors should be tested first because for all other tests a constructor will need to be invoked. To ensure the integrity of your other tests, you'll want to make sure your constructors are working as expected.

Properties are completed next because in many instances the methods of a class will use the properties.

## Determining Unit Outcomes

The first step to determining unit outcomes is to read all the requirements of the class to have an overall understanding of its purpose. It is difficult to understand the context of unit when you don't understand how it relates to everything else.

For each unit, read the requirement and list each **outcome**. An outcome is a result of invoking a unit. A unit will always have at least one outcome. In many instances, a unit will have more than one outcome.

If you have access to the source code, it can help to read the code of the unit to help you determine outcomes.
{: .alert .alert-note}

The following examples outline **test cases** for a class called `Person`. A test case defines what must be done to test a unit for a specific outcome. Test cases directly relate to unit tests. You'll create one unit test for each test case.

The `Person` class represents a person. A `Person` has two attributes: name and an amount of money.

## Constructor

The purpose of every constructor is to set the initial state of an instance of the class.

The `Person` class contains the following constructor:

```text
+ Person(name : string, amountOfMoney : name)
```

The requirement of the method is:

Initializes an instance of the `Person` class with the specified name and amount of money.

Exceptions:

- **ArgumentNullException** - Thrown when the `name` is `null`.
- **ArgumentException** - Thrown when the `name` does not contain at least 1 character.
- **ArgumentOutOfRangeException** - Thrown when the `amountOfMoney` is a negative numeric value.

```csharp
public Person(string name, decimal amountOfMoney)
{
    if(name == null)
        throw new ArgumentNullException("name", "The argument must reference a string object.");

    if (name.Length == 0)
        throw new ArgumentException("name", "The argument must contain at least 1 character.");

    if (amountOfMoney < 0)
        throw new ArgumentOutOfRangeException("amountOfMoney", "The argument must be zero or greater.");

    this.name = name;
    this.amountOfMoney = amountOfMoney;
}
```

### Constructor Test Cases
{: .no_toc}

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when name is null | Parameter name: null, Parameter amountOfMoney: 500 | ArgumentNullException, Parameter: name, Message: The argument must reference a string object. |
| 2 | Exception when the name has no characters | Parameter name: "", Parameter amountOfMoney: 500 | ArgumentException, Parameter: name, Message: The argument must contain at least 1 character. |
| 3 | Exception when the amount of money is a negative | Parameter name: "Kenny", Parameter amountOfMoney: -100 | ArgumentOutOfRangeException, Parameter: amountOfMoney, Message: The argument must be zero or greater. |
| 4 | Initialize the name | Parameter name: "Kenny", Parameter amountOfMoney: 500 | "Kenny" |
| 5 | Initialize the amount of money to zero | Parameter name: "Kenny", Parameter amountOfMoney: 0 | 0 |
| 6 | Initialize the amount of money to positive value | Parameter name: "Kenny", Parameter amountOfMoney: 500 | 500 |

## Property

The `Person` class contains the following property:

```text
+ <<Property>> AmountOfMoney : decimal
```

The requirement of the method is:

Gets and sets the amount of money the person has.

Exceptions:

- **ArgumentOutOfRangeException** - Thrown when the `value` is a negative numeric value.

```csharp
public decimal AmountOfMoney
{
    get
    {
        return this.amountOfMoney;
    }

    set
    {
        if(value < 0)
            throw new ArgumentOutOfRangeException("value", "The value must be zero or greater.");

        this.amountOfMoney = value;              
    }
}
```

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the value is a negative value | Value: -1 | ArgumentOutOfRangeException, Parameter: value, Message: The value must be zero or greater., State is not updated. |
| 3 | Sets the amount of money to zero | Initial amount of money: 100, Value: 0 | 0 |
| 4 | Sets the amount of money to positive value | Initial amount of money: 0, Value: 100 | 100 |
| 5 | Gets the amount of money | Initial amount of money: 100 | 100 |

## Method

The `Person` class contains the following method:

```text
+ SubtractMoney(amount : decimal) : void
```

The requirement of the method is:

Subtracts the specified amount of money from the amount of money the Person has.

Exceptions:

- **ArgumentOutOfRangeException** - Thrown when `amount` is less than zero or exceeds the amount of money the Person has.

```csharp
public void SubtractMoney(decimal amount)
{
    if (amount < 0)
    {
        throw new ArgumentOutOfRangeException("amount", "The argument cannot be less than zero.");
    }

    if (amount > this.amountOfMoney)
    {
        throw new ArgumentOutOfRangeException("amount", "The argument cannot not exceed the amount of money the Person has.");
    }

    this.amountOfMoney -= amount;               
}
```

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the amount is a negative value | Initial amount of money: 0, Parameter amount: -1 | ArgumentOutOfRangeException, Parameter: amount, Message: The argument cannot be less than zero. |
| 2 | Exception when the amount is greater than the amount of money | Initial amount of money: 100, Parameter amount: 500 | ArgumentOutOfRangeException, Parameter: amount, Message: The argument cannot not exceed the amount of money the Person has. |
| 3 | Subtract no money | Initial amount of money: 100, Parameter amount: 0 | Amount of money state: 100 |
| 4 | Subtract money | Initial amount of money: 100, Parameter amount: 60 | Amount of money state: 40 |

## Other Considerations

- Selections that use the `<=` or `>=` operators, would equate to two test cases.