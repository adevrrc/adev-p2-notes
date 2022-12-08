---
layout: default
title: Windows Forms Application Project
parent: Windows Forms Apps
nav_order: 1
---

# Windows Forms Application Project
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## What is a Windows Forms Application?

A **Windows Forms Application** is an executable program with a **Graphical User Interface (GUI)**. A GUI (_GOO-ee_) is a type of user interface that allows a user to interact with a computer application using graphics to represent input and outputs. In contrast, a **Command-line Interface (CLI)** is a text-based interface that uses text navigation and commands. The goal of a GUI is to enhance a users efficiency with using a program.

Windows Forms Applications, also known as _Winform apps_, are event-driven applications. Winform programs rely on user interaction to dictate the execution of the program.

Winform apps only execute on the Windows platform.
{: .alert .alert-warning }

Winform is one way to develop GUI apps in .NET. **Windows Presentation Foundation (WPF)** and **Universal Windows Platform (UWP)** are other project types used to develope rich graphical applications. WPF and UWP will not be covered in this course.
{: .alert .alert-note }

## Creating a Winform Project

Creating a Windows Forms Application project follows the [same steps as a Console Application]({{ site.url }}{{ site.baseurl }}/docs/intro-to-dotnet-csharp-vs/console-application-project/#create-a-new-project), except that you will choose a different project template.

When you get to the **Create a new project** window, the project type you want to choose is called "Windows Forms App (.NET Framework)". You can use the search to filter the list.

[![Create Class Library Project](../images/wfa-projects/create-new-project.png "Create Class Library Project"){: .large }](../images/wfa-projects/create-new-project.png)

### Solution Directory
{: .no_toc }

[![Solution Directory](../images/wfa-projects/solution-directory.png "Solution Directory"){: .large }](../images/wfa-projects/solution-directory.png)

The solution directory contains:

* **Project Directory** - You will see one directory for each project in the solution. New solutions will only contain one project and thus will have one project directory.
* **Solution File (.sln)** - A file that ends with the file extension .sln. The .sln file contains information the Visual Studio environment needs to find and load the solution's associated projects and resources.

### Project Directory
{: .no_toc }

[![Project Directory](../images/wfa-projects/project-directory.png "Project Directory"){: .large }](../images/wfa-projects/project-directory.png)

The project directory contains:

* **bin Directory** - Contains binary files. These are the application or library assemblies generated during a successful project build.
* **obj Directory** - Contains compiled binary files that haven't been linked yet and will later be combined to produce the assembly file stored in the _bin_ directory.
* **Properties Directory** - Contains information about the project. This information can viewable and editable in Visual Studio.
* **MS Build File (.csproj) File** - The MSBuild file for the Visual Studio project.
* **App.config** - An XML file that can be used to store settings for you application.
* **Form1.cs** - This file contains a class called `Form1` and is created by default because of the project template that was chosen when creating the project.
* **Form1.Designer.cs** - The file also contains part of the `Form1` class. This file is used by Visual Studio when designing the form.
* **Program.cs** - This file contains the `Program` class.

`Form1` is not an appropriate name for a class. You should rename this file and the class identifier within it.
{: .alert .alert-error}

## Visual Studio Solution Explorer

[![Solution Explorer](../images/wfa-projects/solution-explorer.png "Solution Explorer"){: .large }](../images/wfa-projects/solution-explorer.png)

When the newly created class library project is loaded into Visual Studio, the Solution Explorer will contain the following:

* **Properties** - Represents the Properties directory within the project. This node can be ignored.
* **References** - This node contains the project references to other class libraries.
* **App.config** - The application configuration file.
* **Form1.cs** - The source code file _Form1.cs_ that contains the `Form1` class.

## Building the Project

[Building (Compile) a Project]({{ site.url }}{{ site.baseurl }}/docs/intro-to-dotnet-csharp-vs/visual-studio-ide/#building-compiling-a-project) was discussed in a previous topic.

On a successful build of a Windows Forms Application Project, the following files will be generated in the **bin\Debug** directory within the Project directory.

[![Debug Directory](../images/wfa-projects/debug-directory.png "Debug Directory"){: .large }](../images/wfa-projects/debug-directory.png)

The files you see in the screenshot above are:

- **Executable Assembly File (.exe)** - The assembly file, which is the compiled version of your project.
- **Application Configuration File (.config)** - This is a copy of the `App.config` file.
- **Program Database File (.pdb)** - The program database file that contains debugging information about the program. You can ignore this file.

## Developing the Program

### Program Class

Like a console application, a Windows Forms Application begins at the `Main()` method. The `Main()` method is already developed for you in the `Program` class.

```csharp
internal static class Program
{
    /// <summary>
    /// The main entry point for the application.
    /// </summary>
    [STAThread]
    static void Main()
    {
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new Form1());
    }
}
```

The `Application.Run(new Form1());` statement begins the application by making the specified `Form` instance visible.

The `Program` class is part of the Windows Forms Application project template and is already completed. You will not add any additional code to this class.
{: .alert .alert-error }

If you were to execute a new Windows Forms Application without writing any code, this is what you would get:

[![New Windows Form App](../images/wfa-projects/blank-form.png "New Windows Form App"){: .large }](../images/wfa-projects/blank-form.png)

A Winform application will execute while the `Form` instance passed to the `Run(Form)` method is open. When you create a new project, the `Form` object is an instance of the `Form1` class.

Because a Winform application is event-driven, the functionality of the program is developed within `Form` classes.

The Windows Forms Application project template creates one `Form` class called `Form1`. The first thing you need to do is rename this class. The standard for `Form` class identifiers is the same as other classes, except the identifier will always end with "Form". To rename the class, right-click the **Form1.cs** node in the Solution Explorer, and choose **Rename** from the context menu. Enter a new file name in the following format: _ClassName.cs_. For example, if the purpose of the form was to display a "Hello world" message, the file could be called _HelloWorldForm.cs_. After editing the file name, a dialog window will appear asking you whether you want to update all references to the class. Click the **Yes** button to update the references.

[![Update References Dialog](../images/wfa-projects/update-references-dialog.png "Update References Dialog"){: .large }](../images/wfa-projects/update-references-dialog.png)

Form class identifiers should always end with the word "Form".
{: .alert .alert-note }

## Adding Additional Forms

To add a `Form` to your WFA project, right-click the project node in Solution Explorer and choose **Add > New Item...**. In the **Add New Item** dialog window, select the **Windows Forms** in the category list on the left. This will filter the template list. Choose the **Form (Windows Forms)** template, name the file name and click the **Add** button.

[![Add New Form](../images/wfa-projects/add-new-item.png "Add New Form"){: .large }](../images/wfa-projects/add-new-item.png)