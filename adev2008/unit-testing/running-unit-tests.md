---
layout: default
title: Running Unit Tests
parent: Unit Testing
nav_order: 3
---

# Running Unit Tests
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Test Explorer

The **Test Explorer** is a panel within Visual Studio. It is used to run unit tests. The Test Explorer is not usually visible by default. To open the panel, go to **View > Test Explorer** on the menu strip or use the keyboard shortcut <kbd>Ctrl + E, T</kbd>. While you are unit testing, you may want to pin the Test Explorer panel so it is always visible.

![Blank Test Explorer](../images/running-tests/blank-test-explorer.png){: .large }

Like the Solution Explorer, the Test Explorer is populated with nodes. The first node represents a test project. All the namespaces within the test project will be child nodes of the test project. Test class nodes are child nodes of the namespace nodes. Unit test nodes are child nodes of test class nodes.
{: .d-block }

![Populated Test Explorer](../images/running-tests/populated-test-explorer.png){: .large .inline }

Test Explorer Hierarchy

- Project
    - Namespace
        - Unit Test Class
            - Unit Test Method

If the Test Explorer is not populating with your Unit Test Class or Unit Test Methods, ensure you have used the `TestClass` and `TestMethod` attributes. Also, the test class must build. Syntax errors may prevent the Test Explorer from populating.
{: .alert .alert-warning .d-inline-block}

## Running Tests

It is recommended that after completing a unit test method you will run it. To run a unit test, right-click the unit test method node in the Test Explorer and choose **Run** from the context menu.

![Run Unit Test](../images/running-tests/run-unit-test.png){: .large }

You can execute all tests or a grouping of tests. It is recommended to execute tests individually. When a test fails, you will want to fix the defect until the test passes before moving on with your testing.

## Test Results

After running a test, the icons next to the Project, Namespace, Class, and Method will show you the result of tests in that grouping.

![Test Explorer Icons](https://docs.microsoft.com/en-us/visualstudio/test/media/testex-hierarchy-icons.png?view=vs-2022){: .large }

If you select a unit test node in the Test Explorer, the **Test Detail Summary** panel will populate information about the results of the test. It is important to read this information carefully when a test fails. It is this information that will help you figure out why the test if failing.

![Test Detail Summary](../images/running-tests/test-detail-summary.png){: .large }

## Tests That Fail

A unit test method results in a Failed status when an exception occurs during the execution of the unit test method. Exceptions will occur in two cases:

1. The `Assert` method used to evaluate the result of the test throws an `AssertFailedException`.
2. An unexpected exception of any other type is thrown.

You should not handle exceptions you are not intentionally throwing in your test just to make the test pass. An exception is telling you something is wrong.
{: .alert .alert-error }

When a unit test method fails, it doesn't necessarily mean the unit you are testing has a defect. If you wrote a statement in your unit test that is causing an exception, it will cause the unit test method to fail.

To avoid making unnecessary changes to your code, follow these steps:

1. Read the test details carefully. In most cases, you can figure out where the problem is from this information.
2. If the test details are not helping, read through you unit test method code looking for an error. This may require you to trace the code.
3. If the unit test code looks good, read through the unit's code that you are testing. This may require you to trace the code.

If you are not able to solve a failed test, reach out to your instructor for assistance.
{: .alert .alert-best-practices }

## Tests That Pass

A unit test method that completes successfully will result an a Passed status.

![Test Passed](../images/running-tests/test-passed.png){: .large }

Writing a unit test method and getting a Passed status after running it is a great feeling. You want to also be mindful that a Passed status does not necessarily mean the unit doesn't have a defect.

Consider the following unit test method:

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

Remember that the only criteria for producing a Passed status is for the unit test method to complete successfully. The unit test method above contains no code and will result in a Passed status.

![Poor Test Passed Status](../images/running-tests/test-passed-no-code.png){: .large }