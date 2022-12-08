---
layout: default
title: Debugging
parent: Windows Forms Apps
nav_order: 7
---

# Debugging
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Debugger Tool

<iframe width="560" height="315" src="https://www.youtube.com/embed/_YoKJwSzZOg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Debug Class

The `Debug` class contains a set of methods to help you debug your code.  Although the Debugger is a great and powerful tool, it can be cumbersome to use for quick checks.

The Debug class is a static class in the System.Diagnostics namespace. The most useful method in the Debug class is `WriteLine(object)`. When the `WriteLine` method is invoked, it will generate output in the Output Panel of Visual Studio while your application is running in Debug mode.

**Example**

In this example, I am going to add a statement to the `Load` event of my form, as it appears while running the code in the handler is not executing.

```csharp
private void Form_Load(object sender, EventArgs e)  
{  
    Debug.WriteLine("In the Load event handler.");  
}
```

When I run my application to test, if I see the message above show up in the Output panel, it tells me that the method as executed. If I don't see the message in the Output panel, it tells me that the method is not executing.

I can output anything with the WriteLine method, like the value of variables and expressions.

```csharp
Debug.WriteLine(firstNumber);  
Debug.WriteLine(secondNumber);  
Debug.WriteLine("Sum: {0}", firstNumber + secondNumber);
```

You can code a Debug statement anywhere in your code. The great thing is, if you deploy your application, these statements will be ignored as they only work in Visual Studio's debug mode.

### Output Panel

The output panel typically displays automatically when you run an application in Visual Studio.  If the panel does not appear, you can open it by going to the View menu item in the main menu of Visual Studio.

[![Output Panel](../images/debugging/output-panel.png "Output Panel"){:.large}](../images/debugging/output-panel.png)