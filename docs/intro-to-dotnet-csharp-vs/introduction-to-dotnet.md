---
layout: default
title: Introduction to .NET
parent: Intro to .NET, C# & VS
nav_order: 1
---

# Introduction to .NET
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

# What is .NET?

**.NET** (pronounced "dot net") is a free, cross-platform, open-source development platform. It is developed and maintained by Microsoft. .NET is used to develope many types of applications.

.NET supports multiple languages, including C#, F#, and Visual Basic. An application can be made up of source code from any supported language and will run natively on any compatible operating system.

.NET is a cross-platform .NET implementation mostly used for websites, servers and console applications on Windows, Linux, and Mac.

# What is the .NET Framework?

The **.NET Framework** is the original implementation of .NET. It is a framework for developing desktop apps, websites, services, and more on Windows.

The .NET Framework is not cross-platform and can only be used for developing applications for the Windows operating system.
{: .alert .alert-note}

# How Does it Work?

The two major parts of the .NET Framework are the **Common Language Runtime (CLR)** and the **.NET Framework Class Library**.

## Common Language Runtime (CLR)

The **Common Language Runtime (CLR)** manages the execution of .NET Framework applications. The CLR is very similar to how the Java Virtual Machine works in the Java architecture. The CLR provides services like garbage collection, thread management, type safety, exception handling and much more.

## .NET Framework Class Library

The **.NET Framework Class Library** is set of Application Programming Interfaces (APIs) and data types a developer can use to develop applications. The Class Library is very similar to the library of classes offered to Java developers in the JDK.

## The Architecture

[![Figure 1: .NET Framework Architecture](../images/introduction-to-dotnet/architecture.png "Figure 1: .NET Framework Architecture"){:class="medium inline"}](../images/introduction-to-dotnet/architecture.png)

As mentioned above, .NET supports multiple languages. The advantage of this is that the source code that makes up an application can be written in various languages.

When source code is compiled, it is compiled to a bytecode called **Common Intermediate Language (CIL)**. Each language compiler will generate the same type of bytecode. For example, if you were to write a simple "Hello World" program in C#, and again in Visual Basic, each of these programs would compile to the same CIL.

The CIL is stored in files called **Assemblies**. Assembly files end with the file extension .exe or .dll.

This topic will cover the .exe assembly. The .dll assembly is covered in the next topic.
{: .alert .alert-future-lesson}

During the execution of a .NET application, the CLR processes the CLI (a.k.a. managed code) from one or more assemblies to generate the machine code necessary to execute the instructions on the computers platform. This process is referred to as **Just-in-time (JIT)** compiling.

# Developing .NET Framework Apps

To develop a .NET Framework Application, you will need:

* A code editor that supports development of the .NET applications. The most common of which are [Visual Studio Community](https://visualstudio.microsoft.com/vs/community/){:target="_blank"} and [Visual Studio Code](https://code.visualstudio.com/){:target="_blank"}.
* A compiler for the .NET supported programming language of choice.

# Executing .NET Framework Apps

Whether you are a developer or not, executing programs written in .NET requires a Common Language Runtime for the platform of computer you are running. If you are using the Windows operating system, it is very likely you already have a version of the framework installed.

# Further Reading
{: .no_toc}

* [.NET Framework - Overview](https://docs.microsoft.com/en-us/dotnet/framework/get-started/overview){:target="_blank"}
* [.NET Framework - Get Started](https://docs.microsoft.com/en-us/dotnet/framework/get-started/)

**References**
{: .mt-8 }

* [Video: What is .NET?](https://dotnet.microsoft.com/en-us/learn/dotnet/what-is-dotnet){:target="_blank"}
* [Figure 1: What is the .NET Framework?](https://dotnet.microsoft.com/en-us/learn/dotnet/what-is-dotnet-framework){:target="_blank"}
