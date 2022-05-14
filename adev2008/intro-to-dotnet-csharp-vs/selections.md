---
layout: default
title: Selections
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 5
---

# Selections
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Selections allow you to add logic to your code. All of the comparison, boolean logic and equality operators are the same as Java.

## If Statements

```csharp
double grade = 77.4;
char letterGrade = 'F';

if (grade > 90)
{
    letterGrade = 'A';
}
else if (grade > 80)
{
    letterGrade = 'B';
}
else if (grade > 70)
{
    letterGrade = 'C';
}
else if (grade > 60)
{
    letterGrade = 'D';
}            

Console.WriteLine("Final grade: {0}", letterGrade);
```

Output:

```text
Final grade: C
```

## Switch Statements

```csharp
DateTime date = DateTime.Now;
string message = "";

switch (date.DayOfWeek)
{
    case DayOfWeek.Sunday:
    case DayOfWeek.Saturday:
        message = "It's the weekend!";
        break;
    case DayOfWeek.Monday:
    case DayOfWeek.Tuesday:
        message = "Is it the weekend yet?";
        break;
    case DayOfWeek.Wednesday:
        message = "It's midweek.";
        break;
    case DayOfWeek.Thursday:
    case DayOfWeek.Friday:
        message = "Almost the weekend. :)";
        break;
}

Console.WriteLine("{0}: {1}", date.DayOfWeek, message);
```

Output:

```text
Tuesday: Is it the weekend yet?
```

## Conditional Operator

```csharp
double grade = 96.2;

Console.WriteLine("You scored {0}. You {1}.", grade, grade > 50 ? "passed" : "failed");
```

Output:

```text
You scored 96.2. You passed.
```

## Further Reading

- [Comparison Operators](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/comparison-operators){: target="_blank"}
- [Boolean Logic Operators](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/boolean-logical-operators){: target="_blank"}
- [Equality Operators](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/equality-operators){: target="_blank"}
- [Selection Statements](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/statements/selection-statements){: target="_blank"}
- [Microsoft if-else if-else Lesson](https://docs.microsoft.com/en-us/learn/modules/csharp-if-elseif-else/){: target="_blank"}