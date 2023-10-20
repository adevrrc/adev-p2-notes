---
layout: default
title: Anatomy of a Program
parent: C# Fundamentals
grand_parent: Intro to .NET, C# & VS
nav_order: 1
---

# Namespaces
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Starting a Program

A program in C# is defined with a class containing a `Main` method. The code sample below is the starting point for a console application.

{% highlight csharp linenos %}
using System;

namespace ADEV.BIT.RRC
{
    internal class Program
    {
        static void Main(string args[])
        {

        }
    }
}
{% endhighlight %}

- Line 1: Using statments allow you to import modules defined within other namespaces.
- Line 3: Declares the namespace the module is compiled to.