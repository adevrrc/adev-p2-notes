---
layout: default
title: Coding Conventions and Standards
parent: Intro to .NET, C# & VS
nav_order: 6
---

# Coding Conventions and Standards
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

All programmers are required to follow standards. A standard is an accepted way of doing something. Although programming standards do not need to be followed in order for your source code to produce its expected results, there are many reasons why you should follow programming standards.

Standards ensure that the development of source code in a specific language is done in the same way by everyone. This makes working with other's code much easier, since it is written in a way that is already familiar to you. The problem with standards is they are not consistent. Standards can vary between organizations, organizational departments, and supervisors in an organization, schools, programs and instructors.

In this course, instructors have developed a general set of standards that all students will be expected to follow.

## Layout

* Use default code editor settings (smart indenting, four-character indent, tabs saved as spaces).
* Write one statement per line.
* Write one declaration per line.
* Add one blank line between method and property definitions.

## Identifier Guidelines

* Namespace:
* Classes and Other User-defined types:
* Fields and Variables:
* Methods and Other Class Members:
* Parameters:

## Documentation

All documentation must be XML style documentation.

### Class
{: .no_toc}

```csharp
/// <summary>
/// Represents a Person.
/// </summary>
```

Documentation blocks are always written on the line before the item they are documenting. Do not include a line space between the documentation and what is being documented.

```csharp
/// <summary>
/// Represents a Person.
/// </summary>
public class Person
```

### Methods
{: .no_toc}

All methods (excluding _main_) of a class must be preceded by XML style documentation. The documentation must contain the following in this exact format:

* Method Description/Purpose.
* List of parameters and descriptions of their use in the method (if the method has parameters defined).
* Description of what value the method returns, and it's purpose (if the method returns a value).

```csharp
/// <summary>
/// Subtracts the specified amount from the Person's amount of money.
/// </summary>
/// <param name="amount">The amount of money to be subtracted.</param>
public void SubtractMoney(decimal amount)
{

}

/// <summary>
/// Returns the String representation of a Person.
/// </summary>
/// <returns>The String representation of a Person.</returns>
public override string ToString()
{

}
```

## Code Commenting

Comments are a way of annotating your source code in plain English that assists others in determining what a statement or set of statements is doing.

**Documentation vs. Comments** <br />Although documentation is written using comment syntax, the purpose of documentation and comments are very different. Comments are written for someone reading the source code. Documentation is written and published for other developers using the code.
{: .alert .alert-warning}

### Single Line Comment
{: .no_toc}

Use single line comments (//) to explain a single statement if it is complex. These comments always precede the line of code they are describing.

```csharp
// Calculates the amount of tax charged to the customer.
tax = purchaseAmount * TaxRate;
```

* Leave one blank line after the "//".
* Capitalize the first character of the comment.
* Must be free of spelling mistakes.

Comments are less formal than documentation, meaning that some grammar rules are not always followed.

### Block Comment

{: .no_toc}

Use a block comment (/&#42;...&#42;/) when the comment is too long to fit on a single line. These comments always precede the line(s) of code they are describing.

```csharp
/*
Calculates the amount of tax charged to the customer.
The tax rate based on store location.
*/
tax = purchaseAmount * TaxRate;
```

Many programmers use single line comment syntax when commenting over multiple lines. The following is  acceptable practice:

```csharp
// Calculates the amount of tax charged to the customer.
// The tax rate based on store location.
tax = purchaseAmount * TaxRate;
```

No matter what type of comment you choose, they should always be preceded by a blank line (in most cases), as this makes reading the comments much easier.

## Identifier Conventions

All identifiers (names) must be descriptive. Reading the name should give the reader an idea of what data is for. The following are naming conventions specific to each identifier type:

### Class Identifiers
{: .no_toc}

Must have the first letter of each word capitalized. The naming convention is called **pascal-case**.

```csharp
public class HelloWorld
{
}
```

### Variable Identifiers
{: .no_toc}

The first word in the identifier is always lowercase, all subsequent words have the first letter in uppercase. This convention is called **camel-case**.

```cs
int countOfItemsInCustomerTable;
```

### Method Identifiers
{: .no_toc}

All method, properties and event class member identifiers start with a uppercase letter, all subsequent words have the first letter in uppercase.

```cs
public static int GetCustomerCount();
```

### Constants
{: .no_toc}

The first letter of the identifier is uppercase, all subsequent words have the first letter in uppercase.

```cs
const double TaxRate = 4.5;
```

## Block Style

In C#, blocks of code are represented by the braces '{' and '}'. The standard in this course is to always start the block below the construct the block is for.

```cs
public static void Main(string[] args)
{

}
```

## Indenting Code

Not all statements start in the first character position of a line. Code is indented, or moved to the right, so related items can be kept together. Indenting code helps improve readability, as it is easy to see what code belongs to what block. The rules for indenting are:

### Classes
{: .no_toc}

Class declarations are always made in the first character position (not indented at all). The opening curly brace of a class block is coded in the first character position on the next line. All code in the class block is indented one tab (typically 4 spaces or 1 tab). The closing curly brace of a class is always on a line by itself in the first character position.

### Methods
{: .no_toc}

Method declarations are always indented inside the class they belong to. The opening curly brace is on the next line, directly under the first character of the line above. The code inside the method block is indented. The closing curly brace of a class is always on a line by itself and must align with the opening curly brace of the method block.

### All Other Blocks
{: .no_toc}

Opening brace is on the next line, directly under the first character of the line above. All code in that block is indented to the right. The closing curly brace of a class is always on a line by itself and must align with the opening curly brace of the block.

```csharp
public class HelloWorld
{
    public static void Main(string[] args)
    {
        int radius = 4;

        if (radius == 4)
        {
            // statements within the block would go here
        }
    }
}
```

## Whitespace

### Operators
{: .no_toc}

One space is included before and after an operator, except when the operator is a unary operator.

```csharp
// Correct
sum = sum + 5;

// Incorrect
sum=sum+5;

// Correct
sum++;

// Incorrect
sum ++;

// Correct
multiplier = (sum > 10) ? 3 : 8;

// Incorrect
multiplier=(sum>10)?3:8;
```

### Line Spacing
{: .no_toc}

The use of whitespace (blank lines) also helps improve readability. The standards for whitespace are as follows:

* If the class has `using` statements, there are no blank lines between each `using` statement.

* A blank line (line 2 in the example below) must be placed before the documentation for the class if there are import statements.

* There are no blank lines between a class or method and its documentation.

* Leave a blank line (line 15 in the example below) before the documentation of a method, expect if it's the first method in the class.

```csharp
using System;

/// <summary>
/// Class documentation.
/// </summary>
public class ClassName
{
    /// <summary>
    /// Method documentation.
    /// </summary>
    public void FirstMethod()
    {

    }

    /// <summary>
    /// Method documentation.
    /// </summary>
    public void SecondMethod()
    {

    }
}
```

There is no blank line after the opening curly brace of any block. If there are multiple closing curly braces in consecutive lines (lines 8 - 10), there are no blank lines between the closing braces.

```csharp
if(expression)
{
    for(expression)
    {
        if(expression)
        {

        }
    }
}
```

When commenting, make sure there is a blank line (line 5) before the comment. The blank line is not included when the comment is the first line of a block.

```csharp
public static void Main(string[] args)
{
    // Comment for statement
    statement

    /*
    comment for statement
    */
    statement
}
```

When commenting, do not place any blank lines between the comment and the line of code it's describing.

```csharp
// comment for statement

statement

/*
comment for statement
*/

statement
```

Include a blank line (line 4) after local variable declaration statements.

```csharp
public static void Main(string[] args)
{
    int localVariable;

    // method statements here
}
```

## Further Reading

* [Capitalization Conventions](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/capitalization-conventions){: target="_blank"}
* [General Naming Conventions](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/general-naming-conventions){: target="_blank"}
* [Names of Assemblies and DLLs](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-assemblies-and-dlls){: target="_blank"}
* [Names of Namespaces](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-namespaces){: target="_blank"}
* [Names of Classes, Structs and Interfaces](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-classes-structs-and-interfaces){: target="_blank"}
* [Names of Type Members](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/names-of-type-members){: target="_blank"}
* [Naming Parameters](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/naming-parameters){: target="_blank"}
