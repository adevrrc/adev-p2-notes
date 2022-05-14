---
layout: default
title: Console Application Project
parent: Intro to .NET, C# & VS
nav_order: 3
---

# Console Application Project
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Console Applications are applications that execute within the console. When you developed Java applications in the previous level of programming, they too were executed in the console.

In .NET, source code and other applications resources are managed within a Visual Studio Project. This is a much more structured approach to how you manually managed source code files in Java.

Visual Studio Projects are managed within a Visual Studio Solution.  Solutions can contain one or more Projects.

## Creating a New Project

The easiest way to create a new Visual Studio Project, and thus a Visual Studio Solution, is to just simply launch Visual Studio. When you launch Visual Studio a splash screen will normally appear. When the splash screen closes, the launch window appears.

## Launch Window
{: .no_toc}

![Visual Studio Launch Window](../images/console-application-project/launch-screen.png)

Click the **Create a new project** button to start configuring a new project.

## Choose Project Template Window
{: .no_toc}

The next part of the project creation process is to choose a project type. There are many templates to create starting points for certain types of projects. These templates will include assembly references, build configurations, source code files and resources.

![Choose Project Template Window](../images/console-application-project/choose-project-template-screen.png)

The project type you want to use for creating a console application in this course is called "Console App (.NET Framework)". Ensure that you are choosing the project template that is specifically for C#. In the image above, you can see that the selected project on the right has "C#" listed as one of the tags for the project template.

When choosing a project template, read carefully.<br /><br /> There is typically more than one project template called "Console App (.NET Framework)". For example, there is a project called "Console App (.NET Framework)" but is configured to work with the Visual Basic programming language, as noted by the "Visual Basic" tag. Also, there are many project templates labeled as "Console App". You want to choose the project template that ends with "(.NET Framework)".
{: .alert .alert-error}

Depending on how you installed Visual Studio, the number of project templates listed can be quite large. Use the search input to filter the list.

## Configure New Project Window
{: .no_toc}

Next, you'll need to configure the project.

![Configure Project Window](../images/console-application-project/configure-project-screen.png)

Modify the following:

- **Project Name** - Names the project directory and will be the default namespace for all project files.
- **Location** - Sets the directory where the solution/project will be saved.
- **Solution Name** - Names the solution directory. Changing the Project Name will automatically update the Solution Name, but can be changed to meet your needs.
    - Uncheck "Place solution and project in the same directory".
- **Framework** - Always use ".NET Framework 4.7.2".

Click the **Create** button to create the project.  This will create all the directories and files required for the project type you selected and launch the Visual Studio Solution.

Double check your inputs before clicking "Create". Some of these choices cannot be changed after creating the projects.
{: .alert .alert-warning}

## Solution File Structure

If you navigate to the location you created the project to, you'll find the solution directory for the project you created.

![Save Directory](../images/console-application-project/repo-directory.png)

## Solution Directory
{: .no_toc .mb-3}

![Solution Directory](../images/console-application-project/solution-directory.png)

The solution directory contains:

- **Project Directory** - You will see one directory for each project in the solution. New solutions will only contain one project and thus will have one project directory.
- **Solution File (.sln)** - A file that ends with the file extension .sln. The .sln file contains information the Visual Studio environment needs to find and load the solution's associated projects and resources.

## Project Directory
{: .no_toc .mb-3}

![Project Directory](../images/console-application-project/project-directory.png)

The project directory contains:

- **bin Directory** - Where the resulting files of a successful project build are stored.
- **obj Directory** - This directory can be ignored. We won't be using it in this course.
- **Properties Directory** - This is another directory that can be ignored.
- **MS Build File (.csproj) File** - The MSBuild file for the Visual Studio project.
- **App.config** - An XML file that can be used to store settings for you application.
- **Program.cs** - A file that ends with .cs is a C# Source Code file. This file contains a class called `Program` and is created by default because of the project template that was chosen when creating the project.

## Visual Studio Solution Explorer

![Solution Explorer](../images/console-application-project/solution-explorer.png)

When the newly created class library project is loaded into Visual Studio, the Solution Explorer will contain the following:

- **Properties** - This node can be ignored.
- **References** - This node contains the project references to other class libraries.
- **Class1.cs** - The source code file _Class1.cs_ that contains the `Class1` class.

In a future topic, you will learn how to add references to other class libraries to your VS projects.
{: .alert .alert-future-lesson}

## Building a Console Application Project

[Building (Compile) a Project](visual-studio-ide.html#building-compiling-a-project) was discussed in a previous topic.

On a successful build of a Console Application Project, the following files will be generated in the **bin\Debug** directory within the Project directory.

![Debug Directory](../images/console-application-project/debug-directory.png)

The files you see in the screenshot above are:

- **Executable Assembly File (.exe)** - The assembly file, which is the compiled version of your project.
- **Application Configuration File (.config)** - This is a copy of the `App.config` file.
- **Program Database File (.pdb)** - The program database file that contains debugging information about the program. You can ignore this file.