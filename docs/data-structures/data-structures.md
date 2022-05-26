---
layout: default
title: Data Structures
nav_order: 7
---

# Data Structures

The section will help you answer the following questions:

* What is a data structure?
* What are the commonly used data structures?
* How do data structures differ from one another?

## Learning Objectives

* Learn array basics.
* Understand the difference between standard and generic collections.
* Explore collection types: List, Dictionary, SortedList, Stack, Queue.

**Data Structures** are a means of organizing and storing data such that we can perform operations on the data efficiently. There are many types of data structures, each of which are used for a specific task.

## Arrays

An **array** is a data structure of fixed size that store items of a single type. Arrays are indexed, which allows elements to be randomly accessed.

```csharp
double[] grades;
grades = new double[35];

Student[] students = new Student[45];

grades[0] = 97;

students[14] = new Student();

double[] temperatures = new double[] { 14.5, 18.6, 23.1, 34.7 };

string[] letterGrades = { "F", "D", "C", "C+", "B", "B+", "A", "A+" };

foreach(double temperature in temperatures)
{
    Console.WriteLine(temperature);
}
```

Inserting and deleting elements is not possible because arrays are a fixed size. However, you can create a new array with more or less elements, using the elements of the original array.
{: .alert .alert-warning }

The `System.Array` class defines methods for working with arrays.
{: .alert .alert-note }

## Collections

**Collections** are data structures used to manage groups of related object. Although arrays can store references to objects, collections provide a more flexible way to work with groups of objects. Collections can grow and shrink dynamically.

### Standard vs. Generic

If the collection contains elements of a single type, you can use one of the **Generic** collection types. These types are found within the `System.Collections.Generic` namespace. Generic collections are type safe, only allowing the declared type to be added to it. When you retrieve an element, you won't have to determine the type or convert it.

Microsoft recommends you avoid using standard collections. They recommend using the generic equivalent.
{: .alert .alert-note }

## List&lt;T&gt;

Represents a strongly typed list of objects that can be accessed by index. Provides methods to search, sort, and manipulate lists.

```csharp
List<string> names = new List<string>();

List<int> numbers = new List<int> { 1, 2, 3 };

names.Add("Kenny");
names.Add("Matt");
names.Add("Nick");

Console.WriteLine(names[0]); // Kenny

foreach(string name in names)
{
    Console.WriteLine(name);
}

// Kenny
// Matt
// Nick

names.Remove("Matt");

Console.WriteLine(names.Count); // 2

names.Clear();
```

## Dictionary<TKey, TValue>

Represents a collection of key/value pairs that are organized based on the key.

```csharp
Dictionary<string, int> spells = new Dictionary<string, int>();

spells.Add("Smite", 1);
spells.Add("Shadow Word: Pain", 2);
spells.Add("Mind Blast", 5);

Console.WriteLine(spells.Count); // 3

Console.WriteLine(spells.ContainsKey("Smite")); // true

Console.WriteLine("Spell level: {0}", spells["Mind Blast"]); // Spell level: 5

foreach (string key in spells.Keys)
{
    Console.WriteLine("{0} is level {1}.", key, spells[key]);
}

// Smite is level 1.
// Shadow Word: Pain is level 2.
// Mind Blast is level 5.

spells.Remove("Smite");

spells.Clear();
```

## SortedList<TKey, TValue>

Represents a collection of key/value pairs that are sorted by key based on the associated `IComparer<T>` implementation. The `SortedList` will sort elements by key. Keys are sorted based on how objects of that type are sorted. Each time an element is added to the `SortedList`, the elements will be reordered.

```csharp
SortedList<string, decimal> menuItems = new SortedList<string, decimal>();

menuItems.Add("Pizza", 15);
menuItems.Add("Hot Dog", 2);
menuItems.Add("Noodles", 5);

Console.WriteLine(menuItems.Count); // 3

Console.WriteLine(menuItems.ContainsKey("Noodles")); // true

Console.WriteLine("Hot dog price: {0:C}", menuItems["Hot Dog"]); // Hot dog price: $2.00

for(int i = 0; i < menuItems.Count; i++)
{
    Console.WriteLine("{0} is {1:C}", menuItems.Keys[i], menuItems.Values[i]);
}

// Hot Dog is $2.00
// Noodles is $5.00
// Pizza is $15.00

menuItems.Remove("Pizza");
menuItems.Clear();
```

An `ArgumentException` is thrown when you attempt to add a duplicate key.
{: .alert .alert-error }

## Stack&lt;T&gt;

Represents a last in, first out (LIFO) collection of objects.  Stacks have two key operations:

1. **Push** - Inserts an element onto the top of the stack.
2. **Pop** - Removes the topmost element and returns it.

```csharp
Stack<string> friends = new Stack<string>();

friends.Push("Kenny");
friends.Push("Matt");
friends.Push("Nick");

string friend = friends.Pop();

Console.WriteLine(friend); // Nick

Console.WriteLine(friends.Count); // 2

Console.WriteLine(friends.Peek()); // Matt

friends.Clear();
```

## Queue&lt;T&gt;

Represents a first in, first out (FIFO) collection of objects. Queues have two key operations:

1. **Enqueue** - Inserts an element onto the end of the queue.
2. **Dequeue** - Removes the element at the beginning of the queue and returns it.

```csharp
Queue<string> enemies = new Queue<string>();

enemies.Enqueue("Kenny");
enemies.Enqueue("Matt");
enemies.Enqueue("Nick");

string enemy = enemies.Dequeue();

Console.WriteLine(enemy); // Kenny

Console.WriteLine(enemies.Count); // 2

Console.WriteLine(enemies.Peek()); // Matt

enemies.Clear();
```

## Further Reading

* [Collections](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/collections){: target="_blank" }
* [List](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1){: target="_blank" }
* [Dictionary](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.dictionary-2){: target="_blank" }
* [SortedList](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.sortedlist-2){: target="_blank" }
* [Stack](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.stack-1){: target="_blank" }
* [Queue](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.queue-1){: target="_blank" }