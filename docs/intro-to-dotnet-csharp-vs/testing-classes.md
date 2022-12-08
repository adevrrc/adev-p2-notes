---
layout: default
title: Testing Classes
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 9
---

# Testing Classes

The test programs will be written in the following format:

*   Each test case is written in a separate method in the program class. These methods are called a _unit test method_.  Your test class will have one unit test method per test in the test plan.
*   Each unit test method will only test one outcome.
*   Each unit test method will only be invoked in the main method.

## Method Identifiers

Test method identifiers will generally follow this format:

_MethodBeingTestedIdentifier_DataUsedInTheTest_TheOutcomeBeingTested_

Example:

```csharp
static void SetMilesDriven_MilesDrivenBelowZero_StateNotUpdated()
{

}
```

### Constructors

```csharp
static void Constructor_Model_Initialize()
{

}
```

If the class has more than one constructor method, you can append a number to the end of the word "Constructor".

```csharp
static void Constructor2_Model_Initialize()
{

}
```

### Accessor Method

```csharp
public static void GetMilesDriven_ReturnsState()
{

}
```

### Mutator Method

```csharp
static void SetMilesDriven_GreaterThanZero_StateUpdated()
{

}
```

Unit test methods do not require documentation.
{: .alert .alert-note}

## Writing Unit Test Methods

The implementation of a unit test method follows a general pattern:

* Setup
* Invoke
* Verify

### Setup

In the setup portion of the unit test, data required for the test is stored in variables. The number of variables will typically depend on how many arguments needed for methods invoked in the test. This section is also used to create an instance of the class you are testing, except when the test is for the constructor.

### Invoke

To test any method, the method you are testing **must** be invoked.

### Verify

The last part of the unit test is to verify the outcome you are testing worked as expected. You will output the expected value along with the value that resulted out of executing the method you are testing.

The examples below include comments where each of the three parts of the test start.

```csharp
static void Constructor1_Model_Initialize()
{
    // Setup
    String model = "Honda Ridgeline";
    int milesDriven = 10000;
    double gallonsOfGas = 40.2;
    
    // Invoke
    Automobile target = new Automobile(model, milesDriven, gallonsOfGas);

    // Verify
    String expected = "Honda Ridgeline";
    String actual = target.getModel();

    Console.WriteLine("Expected: {0}\nActual: {1}\n", expected, actual);
}

static void SetModel_Model_StateUpdated()
{
    // Setup
    String model = "Honda Ridgeline";
    int milesDriven = 10000;
    double gallonsOfGas = 40.2;   
    
    Automobile target = new Automobile(model, milesDriven, gallonsOfGas);

    // Invoke   
    target.setModel("Ford Focus");

    // Verify
    String expected = "Ford Focus";
    String actual = target.getModel();

    Console.WriteLine("Expected: {0}\nActual: {1}\n", expected, actual);
}
```

You'll notice in the examples above that when you are testing the constructor method, creating the instance of the class is the **Invoke** portion of the test. When testing all other methods, invoking the constructor method to create the object is part of the **Setup**.
{: .alert .alert-note}

## Test Program Format

For each method you are testing, the test program will print a heading indicating the method being tested.

**Example**

```csharp
GetAge() : int
```

Leave one blank line before printing the method being tested, except for the first method.
{: .alert .alert-warning}

### Unit Test Output

Each unit test will output the following information:

1. The test number and description of the test.
2. The expected result.
3. The actual result.

**Format**

```text
Test #{test number} - Description of the test.
Expected: {expected value}
Actual: {actual value}
```

**Example**

```text
Test #1 - Returns the current state of age.
Expected: 34
Actual: 34
```

Below is an output example of testing a method that has more than one outcome. Ensure to leave one blank line between unit test method output.

```text
Person(String, int)
Test #1 - Initializes the name.
Expected: Kenny
Actual: Kenny

Test #2 - Initializes the age.
Expected: 34
Actual: 34
```

## Executing Tests

To execute the tests, you will run the test program.  It is recommended that you execute your tests after writing each test. Don't wait until you write all the tests to execute the tests.

### Test Results

Each unit test method will print the expected an actual values of the test. If the values are the same, the test is considered to have a status of **pass**. If the values are not the same, the test status is considered a **fail**.

**Failed Tests**

When a test fails, it is recommended that you deal with the failed test before moving on with the remainder of the testing.

Perform these steps when your unit test method has a fail status:

1. Trace your unit test method's implementation.

    A failed test does not necessarily mean the code you are testing has a defect. A mistake in your unit test code can cause the test to appear as a fail.

2. Trace the code you are testing.

    After you are assured the unit test was written correctly, trace the code you are testing to find the defect.

**What do I do if I can't get the test to pass?**

It is recommended that you seek advice from your instructor before making major changes to your code.

Sample
------

```csharp
/*
 * Name: Chris Jericho
 * Program: Business Information Technology
 * Course: ADEV-2008 Programming 2
 * Created: 2021-01-01
 * Updated: 2021-01-01
 */

using System;
using Module1.Demo.Library;

namespace Module1TestingDemonstration
{
    /// <summary>
    /// A test program for the Fan class.
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            int testNumber = 0;

            // Unit Tests
            // Fan(FanColor, double, decimal)
            Console.WriteLine("Testing method Fan(FanColor, double, decimal)\n");

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor1_Color_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor1_Radius_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor1_Price_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor1_Speed_Initialize();

            testNumber = 0;

            // Fan(FanColor, double)
            Console.WriteLine("Testing method Fan(FanColor, double)\n");

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor2_Color_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor2_Radius_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor2_Price_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor2_Speed_Initialize();

            testNumber = 0;

            // Fan(double)
            Console.WriteLine("Testing method Fan(double)\n");

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor3_Color_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor3_Radius_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor3_Price_Initialize();

            Console.WriteLine("Test {0}", ++testNumber);
            Constructor3_Speed_Initialize();

            testNumber = 0;

            // Fan.MAXIMUM_SPEED
            Console.WriteLine("Testing class constant MAXIMUM_SPEED\n");

            Console.WriteLine("Test {0}", ++testNumber);
            Maximum_Speed_Initialize();

            testNumber = 0;

            // SetFanSpeed(FanSpeed)
            Console.WriteLine("Testing method SetFanSpeed(FanSpeed)\n");

            Console.WriteLine("Test {0}", ++testNumber);
            SetFanSpeed_Medium_ModifyState();

            testNumber = 0;

            // IsOn()
            Console.WriteLine("Testing method IsOn()\n");

            Console.WriteLine("Test {0}", ++testNumber);
            IsOn_False();

            Console.WriteLine("Test {0}", ++testNumber);
            IsOn_True();

            testNumber = 0;

            // IncreasedSpeed()
            Console.WriteLine("Testing method IncreaseSpeed()\n");

            Console.WriteLine("Test {0}", ++testNumber);
            IncreaseSpeed_NotAtMaximumSpeed_StateUpdated();

            Console.WriteLine("Test {0}", ++testNumber);
            IncreaseSpeed_AtMaximumSpeed_StateNotUpdated();

            testNumber = 0;

            // DecreaseSpeed()
            Console.WriteLine("Testing method DecreaseSpeed()\n");

            Console.WriteLine("Test {0}", ++testNumber);
            DecreaseSpeed_NotAtMinimumSpeed_StateUpdated();

            Console.WriteLine("Test {0}", ++testNumber);
            DecreaseSpeed_AtMinimumSpeed_StateNotUpdated();

            testNumber = 0;

            // ToString()
            Console.WriteLine("Testing method ToString()\n");

            Console.WriteLine("Test {0}", ++testNumber);
            ToString_Returns();

            Console.Write("Press any key to continue...");
            Console.ReadKey();
        }

        // Fan(FanColor, double, decimal)

        static void Constructor1_Color_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;
            decimal price = 15.99M;

            Fan target = new Fan(color, radius, price);

            FanColor expected = FanColor.Red;

            FanColor actual = target.GetFanColor();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor1_Radius_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;
            decimal price = 15.99M;

            Fan target = new Fan(color, radius, price);

            double expected = 5;

            double actual = target.GetRadius();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor1_Price_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;
            decimal price = 15.99M;

            Fan target = new Fan(color, radius, price);

            decimal expected = 15.99M;

            decimal actual = target.GetPrice();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor1_Speed_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;
            decimal price = 15.99M;

            Fan target = new Fan(color, radius, price);

            FanSpeed expected = FanSpeed.Off;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        // Fan(FanColor, double)

        static void Constructor2_Color_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;

            Fan target = new Fan(color, radius);

            FanColor expected = FanColor.Red;

            FanColor actual = target.GetFanColor();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor2_Radius_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;

            Fan target = new Fan(color, radius);

            double expected = 5;

            double actual = target.GetRadius();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor2_Price_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;

            Fan target = new Fan(color, radius);

            decimal expected = 0;

            decimal actual = target.GetPrice();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor2_Speed_Initialize()
        {
            FanColor color = FanColor.Red;
            double radius = 5;

            Fan target = new Fan(color, radius);

            FanSpeed expected = FanSpeed.Off;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        // Fan(double)

        static void Constructor3_Color_Initialize()
        {
            double radius = 5;

            Fan target = new Fan(radius);

            FanColor expected = FanColor.White;

            FanColor actual = target.GetFanColor();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor3_Radius_Initialize()
        {
            double radius = 5;

            Fan target = new Fan(radius);

            double expected = 5;

            double actual = target.GetRadius();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor3_Price_Initialize()
        {
            double radius = 5;

            Fan target = new Fan(radius);

            decimal expected = 0;

            decimal actual = target.GetPrice();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor3_Speed_Initialize()
        {
            double radius = 5;

            Fan target = new Fan(radius);

            FanSpeed expected = FanSpeed.Off;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        // Fan()

        static void Constructor_Color_Initialize()
        {
            Fan target = new Fan();

            FanColor expected = FanColor.White;

            FanColor actual = target.GetFanColor();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor4_Radius_Initialize()
        {
            Fan target = new Fan();

            double expected = 0;

            double actual = target.GetRadius();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor4_Price_Initialize()
        {
            Fan target = new Fan();

            decimal expected = 0;

            decimal actual = target.GetPrice();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Constructor4_Speed_Initialize()
        {
            Fan target = new Fan();

            FanSpeed expected = FanSpeed.Off;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void Maximum_Speed_Initialize()
        {
            int expected = 3;

            int actual = Fan.MAXIMUM_SPEED;

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void SetFanSpeed_Medium_ModifyState()
        {
            Fan target = new Fan();

            target.SetFanSpeed(FanSpeed.Medium);

            FanSpeed expected = FanSpeed.Medium;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void IsOn_False()
        {
            Fan target = new Fan();

            bool expected = false;

            bool actual = target.IsOn();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void IsOn_True()
        {
            Fan target = new Fan();

            target.SetFanSpeed(FanSpeed.Medium);

            bool expected = true;

            bool actual = target.IsOn();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void IncreaseSpeed_NotAtMaximumSpeed_StateUpdated()
        {
            Fan target = new Fan();

            target.IncreaseSpeed();

            FanSpeed expected = FanSpeed.Slow;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void IncreaseSpeed_AtMaximumSpeed_StateNotUpdated()
        {
            Fan target = new Fan();

            target.SetFanSpeed(FanSpeed.Fast);

            target.IncreaseSpeed();

            FanSpeed expected = FanSpeed.Fast;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void DecreaseSpeed_NotAtMinimumSpeed_StateUpdated()
        {
            Fan target = new Fan();

            target.SetFanSpeed(FanSpeed.Medium);

            target.DecreaseSpeed();

            FanSpeed expected = FanSpeed.Slow;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void DecreaseSpeed_AtMinimumSpeed_StateNotUpdated()
        {
            Fan target = new Fan();

            target.DecreaseSpeed();

            FanSpeed expected = FanSpeed.Off;

            FanSpeed actual = target.GetFanSpeed();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }

        static void ToString_Returns()
        {
            FanColor color = FanColor.Red;
            double radius = 5;
            decimal price = 15.99M;

            Fan target = new Fan(color, radius, price);

            String expected = "Color: Red, Radius: 5, Speed: Off, Price: $15.99";

            String actual = target.ToString();

            Console.WriteLine("Expected: {0}", expected);
            Console.WriteLine("Actual: {0}\n", actual);
        }
    }
}
```