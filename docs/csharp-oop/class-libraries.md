---
layout: default
title: Class Libraries
parent: C# OOP
nav_order: 1
---

# Class Libraries
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

A **Class Library** is a project that contains types and methods used by applications. The compiled result of a class library is a **Dynamic Link Library (DLL)**.

## Creating a New Project

Creating a Class Library project follows the [same steps as a Console Application]({{ site.url }}{{ site.baseurl }}/docs/intro-to-dotnet-csharp-vs/console-application-project/#create-a-new-project), except that you will choose a different project template.

When you get to the **Create a new project** window, the project type you want to choose is called "Class Library (.NET Framework)". You can use the search to filter the list.

[![Create Class Library Project](../images/class-libraries/create-class-library-project.png Create Class Library Project""){: .large }](../images/class-libraries/create-class-library-project.png)

## Solution File Structure

If you navigate to the location you created the project to, you’ll find the solution directory for the project you created.

[![Save Directory](../images/class-libraries/save-directory.png "Save Directory"){: .large }](../images/class-libraries/save-directory.png)

At this point you may have more than one Visual Studio solution stored in this location. Read the directories careful to determine the one you are looking for.
{: .alert .alert-warning}

### Solution Directory
{: .no_toc }

[![Solution Directory](../images/class-libraries/solution-directory.png "Solution Directory"){: .large }](../images/class-libraries/solution-directory.png)

The solution directory contains:

* **Project Directory** - You will see one directory for each project in the solution. New solutions will only contain one project and thus will have one project directory.
* **Solution File (.sln)** - A file that ends with the file extension .sln. The .sln file contains information the Visual Studio environment needs to find and load the solution's associated projects and resources.

### Project Directory
{: .no_toc }

[![Project Directory](../images/class-libraries/project-directory.png "Project Directory"){: .large }](../images/class-libraries/project-directory.png)

The project directory contains:

* **bin Directory** - Contains binary files. These are the application or library assemblies generated during a successful project build.
* **obj Directory** - Contains compiled binary files that haven't been linked yet and will later be combined to produce the assembly file stored in the _bin_ directory.
* **Properties Directory** - Contains information about the project. This information can viewable and editable in Visual Studio.
* **MS Build File (.csproj) File** - The MSBuild file for the Visual Studio project.
* **Class1.cs** - This file contains a class called `Class1` and is created by default because of the project template that was chosen when creating the project.

`Class1` is not an appropriate name for a class. You should rename this file and the class identifier within it.
{: .alert .alert-error}

## Visual Studio Solution Explorer

[![Solution Explorer](../images/class-libraries/solution-explorer.png "Solution Explorer"){: .large }](../images/class-libraries/solution-explorer.png)

When the newly created class library project is loaded into Visual Studio, the Solution Explorer will contain the following:

* **Properties** - This node can be ignored.
* **References** - This node contains the project references to other class libraries.
* **Class1.cs** - The source code file _Class1.cs_ that contains the `Class1` class.

## Building the Project

[Building (Compile) a Project]({{ site.url }}{{ site.baseurl }}/docs/intro-to-dotnet-csharp-vs/visual-studio-ide/#building-compiling-a-project) was discussed in a previous topic.

On a successful build of a Console Application Project, the following files will be generated in the **bin\Debug** directory within the Project directory.

[![Debug Directory](../images/class-libraries/debug-directory.png "Debug Directory"){: .large }](../images/class-libraries/debug-directory.png)

The files you see in the screenshot above are:

* **Dynamic Link Library File (.dll)** - The assembly file, which is the compiled version of your project.
* **Program Database File (.pdb)** - The program database file that contains debugging information about the library. You can ignore this file.

## Further Reading

* [The .NET Framework Assembly](https://docs.microsoft.com/en-us/troubleshoot/windows-client/deployment/dynamic-link-library#the-net-framework-assembly){: site="_blank"}