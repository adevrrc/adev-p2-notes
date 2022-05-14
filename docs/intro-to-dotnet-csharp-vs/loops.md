---
layout: default
title: Loops
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 6
---

# Loops
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Loops allow you to repeat one or more statements.

## For Loop

```csharp
const int Number = 10;

// Prints the first twenty multiples of the number
for(int i = 0; i < 20; i++)
{
    Console.Write("{0} ", i * Number);
}
```

Output:

```text
0 10 20 30 40 50 60 70 80 90 100 110 110 120 130 140 150 160 170 180 190
```

## Do While Loop

```csharp
int grade = -1;
int sum = 0;
int numberOfGrades = 0;

do
{
    Console.Write("Enter a grade (-1 to exit): ");

    string input = Console.ReadLine();

    grade = Int32.Parse(input);

    if (grade != -1)
    {
        sum += grade;
        numberOfGrades++;
    }

} while (grade != -1);

double average = (double)sum / numberOfGrades;

Console.WriteLine("The average grade is {0}.", Math.Round(average));
```

Output:

```text
Enter a grade (-1 to exit): 12
Enter a grade (-1 to exit): 23
Enter a grade (-1 to exit): 90
Enter a grade (-1 to exit): 89
Enter a grade (-1 to exit): 45
Enter a grade (-1 to exit): 78
Enter a grade (-1 to exit): 56
Enter a grade (-1 to exit): -1
The average grade is 56.
```

## While Loop

```csharp

```

Output:

```text

```

## ForEach Loop

```csharp
int[] grades = {98, 34, 78, 45, 85};
string letterGrade = "";

foreach(int grade in grades)
{
    if(grade >= 90)
    {
        letterGrade = "A+";
    }
    else if (grade >= 80)
    {
        letterGrade = "A";
    }
    else if (grade >= 75)
    {
        letterGrade = "B+";
    }
    else if (grade >= 60)
    {
        letterGrade = "B";
    }
    else if (grade >= 65)
    {
        letterGrade = "C+";
    }
    else if (grade >= 60)
    {
        letterGrade = "C";
    }
    else if (grade >= 50)
    {
        letterGrade = "D";
    }
    else
    {
        letterGrade = "F";
    }

    Console.WriteLine(letterGrade);
}
```

Output:

```text
A+
F
B+
F
A
```

## Further Reading

- [Iteration Statements](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/statements/iteration-statements){: target="_blank"}