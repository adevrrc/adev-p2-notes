---
layout: default
title: The Visual Studio IDE
parent: Intro to .NET, C# & VS
nav_order: 2
---

# The Visual Studio IDE
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Visual Studio Community

There are many code editors you can use to develop .NET applications. In this course, you will use the [Visual Studio Community](https://visualstudio.microsoft.com/vs/community/){:target="-blank"} **Integrated Development Environment (IDE)**.

For the purposes of these course notes, Visual Studio Community will simply be referred to as **Visual Studio** or **VS**.
{: .alert .alert-note}

Visual Studio is a free IDE for developing .NET applications. The install is modular, allowing you to install the things you need to develop the type of applications you want.

Visual Studio is a very complex tool and is not really intended for beginner programmers. That being said, Visual Studio is the best and most efficient IDE for developing Windows applications. Take time early in this course to practice using Visual Studio.
{: .alert .alert-warning}

### Note to Mac Users

Although there is a version of Visual Studio for Mac, you will not be able to complete this course with it. You will require a Windows OS to complete this course. You can:

* Use Boot Camp (or equivalent software) to run Windows on your Mac.

## Download

1.  Navigate to <a href="https://visualstudio.microsoft.com/vs/community/" target="-blank">https://visualstudio.microsoft.com/vs/community/</a> using a browser on your computer.

2.  Click the **Download Visual Studio** link to download the installer executable file. 

    ![Visual Studio Community Download Page](../images/visual-studio/vs-website.png "Visual Studio Community Download Page")

    Depending on your browser settings, the install file may download automatically to the default download directory.

    ![Windows Explorer Download Directory](../images/visual-studio/vs-download.png "Windows Explorer Download Directory")

## Installing

1. Run the installer by double-clicking on the installer executable file. 

2. It is very likely the installer will need to do some configuration before the install process happens.

    ![Installer Configuration](../images/visual-studio/vs-installer-configuration.png "Installer Configuration")

    Click the **Continue** button.

    When the installer application loads, you will be presented a window where you will choose the development tools you wish to install. The initial page should display **Workloads**. If not, click **Workloads**.

    [![Installation Details](../images/visual-studio/vs-install.png "Installation Details")](../images/visual-studio/vs-install.png){: target="_blank" }

3.  Check only the following item(s):

    * .NET desktop development

    You can change the directory that Visual Studio will get installed to in the bottom left corner of the window.
    {: .alert .alert-note}

4.  Click the **Install** button located in the bottom right corner.

    The installation could take more than an hour to download and install the selected tools, depending on your system and internet connection.

When the installation completes, you can close the installer.

First Launch of Visual Studio
-----------------------------

When you launch Visual Studio for the first time, you will be prompted to sign in using a Microsoft account. You must sign in, in order to unlock the IDE. It will also enable you to use services like Git.

*   If you have a Red River College account, you can sign in with your Red River College credentials.
*   If you have a Microsoft account, you can sign in with your Microsoft account.
*   If you don't have a Microsoft account, and would like to sign in, you can click the **Sign up** link.
*   If you don't wish to sign in, click the **Not now, maybe later** link.

If you do not sign in, the application will prompt you for a license. You will need to sign in to unblock yourself. For more information about signing in to Visual Studio click [here](https://docs.microsoft.com/en-us/visualstudio/ide/signing-in-to-visual-studio){: target="_blank"}.

## Configure Visual Studio


1. Launch Visual Studio Community.
2. Open Visual Studio without Code.

    ![Open Visual Studio without Code](../images/visual-studio/vs-comm-open-no-code.png "Open Visual Studio without Code")

3. Go to **Tools > Options** in the menu strip. This will open the Options dialog window.

    ![Tools > Options](../images/visual-studio/vs-comm-options.png "Tools > Options")

    ![Options Dialog Window](../images/visual-studio/vs-comm-options-dialog.png "Options Dialog Window")

### Recommended Option Changes

1. Disable line completion.

    ![Options Dialog Window](../images/visual-studio/vs-comm-options-completions.png "Options Dialog Window")

    Disabling line completions disables IntelliCode from prompting you for completion suggestions. These completion suggestions sound like they would be a great thing, but they are usually not what you want to do.  They can be very tempting to use and will most likely lead to mistakes.  Also, it is not a good learning tool.

    ![Completion Example](../images/visual-studio/vs-comm-completions-example.webp "Completion Example")

### Optional Option Changes

1. Update the color theme of the Visual Studio user interface.

    ![Color Theme](../images/visual-studio/vs-comm-options-color-theme.png "Color Theme")

2. Update the default save location for projects.

    ![Default Save Location](../images/visual-studio/vs-comm-options-save-location.png "Default Save Location")

2. Disable CodeLens.

    ![Disable CodeLens](../images/visual-studio/vs-comm-options-codelens.png "Disable CodeLens")
    
    Disabling CodeLens removes the reference count above the declaration of classes and its members.

    ![CodeLens Examples](../images/visual-studio/vs-comm-codelens-example.png "CodeLens Examples")

You may be required to close all Visual Studio Community instances in order for the option changes to be applied.
{: .alert .alert-note}

It is not recommended to make any other options changes.
{: .alert .alert-error}

## Visual Studio Extensions
{: .no_toc}

Extensions are tools that extend the functionality of Visual Studio.

![Manage Extensions](../images/visual-studio/vs-comm-manage-extensions.png "Manage Extensions")

To install an extension, you'll need to open the **Manage Extension** dialog window, search for an extension in the **Online** catalogue and click the **Download** button to download and install the extension. 

### Required Extension Install

2. Live Share

    ![Live Share Extension](../images/visual-studio/vs-comm-live-share.png "Live Share Extension")

    The Live Share extension may have be installed during your Visual Studio Community install. If there is a green check mark icon in the top right corner of the extension in the search result list, this means the extension is already installed. If you don't see the green check mark, you will need to download and install this extension.
    {: .alert .alert-note}

### Recommended Extension Install

1. Spell Checker

    ![Spell Checker Extension](../images/visual-studio/vs-comm-spell-checker.png "Spell Checker Extension")

    You may be required to close all Visual Studio Community instances in order for the option changes to be applied.
    {: .alert .alert-note}

    It is not recommended to install any other extensions.
    {: .alert .alert-error}

## The Environment

The first step to learning the Visual Studio tool is to explore the layout of the interface.

![Visual Studio Default Layout](../images/visual-studio-ide/default-layout.png)

1. **Menu Strip** - Where you can find all the functionality of Visual Studio.
2. **Toolbar** - Where you can find common Visual Studio functions.
3. **Toolbox Panel** - You will use this panel later in the course.
4. **File Editor** - Where you edit source code.
5. **Solution Explorer** - Where you manage solutions and projects.
6. **Properties Panel** - Where you can find and modify information about items selected in Visual Studio.
7. **Error List/Output Panel** - Where errors and the results of building a project are listed.

### Solution Explorer

The Solution Explorer, typically docked to the top right of the Visual Studio environment, is the most convenient way to manage your Visual Studio Solution and Projects.

![Solution Explorer](../images/console-application-project/solution-explorer.png)

The Solution Explorer displays the solution, projects, and project files and resources as a tree. Each item in the tree is a node. The root node (top item), is the Solution Node. The nodes attached to Solution Node are the Project Nodes. The nodes attached to the Project Nodes represent resources for the project they are attached to.

### Adding Source Code Files

To add a new file to a project, Right-click the Project Node and choose "Add > New Item..." from the context menu.

![Add New Item](../images/console-application-project/add-new-item.png)

This will launch the Add New Item dialog window. This window will list many templates for items you can add to the project.

![Add New Item Dialog Window](../images/console-application-project/add-new-item-dialog.png)

It is recommended that at the beginning of your training to choose the "Code File" template. This template is really just a blank file.

Don't forget to name the file at the bottom of the dialog window and ensure you keep the .cs file extension.
{: .alert .alert-warning}

### Removing Source Code Files

To remove an item from a project, Right-click the Item Node you wish to remove and choose "Delete" from the context menu.

![Delete Item](../images/console-application-project/delete-item.png)

It is common for Visual Studio beginners to delete a file using Windows File Explorer. If you do this, the file node will still show up in Visual Studio, but will be represented as a broken link.
{: .alert .alert-error}

Always manage your Visual Studio Project files and resources using Visual Studio's Solution Explorer.
{: .alert .alert-best-practices}

## Building (Compiling) a Project

In the previous level of programming, you were accustom to compiling each source code file. On a successful compilation, a **.class** file was created. In Visual Studio, source code is compiled by building the project. This will produce a single file called an **assembly**.

To build (compile) a project, right-click the **Project Node** and choose **Build** from the context menu.

![Project Build](../images/console-application-project/project-build.png)

If any of the items within the project cause an error, typically syntax related, those errors will show up in the **Error List**.

![Error List](../images/console-application-project/error-list.png)

On a successful build, the **Output Panel** will indicate a successful build.

![Output Panel](../images/console-application-project/output-panel.png)

A new version of the assembly and other files will be generated in the **bin\Debug** directory within the Project directory.

## Running a Application

There are two ways to run a application:

1. Execute the Executable Assembly (.exe) file within the **bin\Debug** directory.
2. Execute the program within Visual Studio. Go to **Debug > Start Debugging** in the Visual Studio menu strip.

Class Library Projects do not build to an Executable Assembly (.exe). Therefore, running it will not work.
{: .alert .alert-error}

## Opening An Existing Project

To open an existing project, locate the Solution File (.sln) for the solution the project is apart of. Double-clicking the solution file will launch Visual Studio and load the solution and all the solutions projects within Visual Studio.

## Further Reading

- [Visual Studio Projects and Solutions](https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio){: target="_blank"}
- [.SLN File](https://docs.microsoft.com/en-us/visualstudio/extensibility/internals/solution-dot-sln-file){: target="_blank"}
- [Solution Explorer](https://docs.microsoft.com/en-us/visualstudio/ide/use-solution-explorer){: target="_blank"}