---
layout: default
title: Object Browser
parent: C# OOP
nav_order: 7
---

# Object Browser

The **Object Browser** is a tool in Visual Studio that allows you to examine classes in the .NET Framework class library and libraries you code yourself. You can use this tool to quickly find information about classes (or other modules) and their members.

Here is how you can use it:

You can open the Object Browser from the main menu by navigating to **View > Object Browser**.

The Object Browser has three panels:

[![Object Browser Panels](../images/object-browser/object_browser_panels_marked.png "Object Browser Panels"){: .large }](../images/object-browser/object_browser_panels_marked.png)

To find a type, use the search box at the top of the Object Browser panel. You can also expand the listed namespaces in the namespace panel.

The namespace panel will only display namespaces for assemblies that are referenced in the project.

When you have selected a type in the namespace panel, the member panel will populate with all the accessible members of that type.

[![Select Class](../images/object-browser/select_class_marked.png "Select Class"){: .large }](../images/object-browser/select_class_marked.png)

When you select a member in the members panel, the description panel will display documentation for the selected member.

[![Selected Class Member](../images/object-browser/select_class_member_marked.png "Selected Class Member"){: .large }](../images/object-browser/select_class_member_marked.png)

## Further Reading

* [Object Browser](https://docs.microsoft.com/en-us/visualstudio/ide/viewing-the-structure-of-code?view=vs-2022#BKMK_ObjectBrowser){: target="_blank"}