---
layout: default
title: ToolStrip Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# ToolStrip Class

Represents a container for Windows toolbar objects.

## Usage

A ToolStrip, often called "Toolbar", is a menu item typically docked at the top of an application beneath a MenuStrip. The purpose of a ToolStrip is to include a way to initiate commonly used tasks in the application.

A ToolStrip can contain many types of objects. The most common of which is the `ToolStripButton`. A ToolStrip button is rendered as an icon only button.

## Notable ToolStrip Class Members

### Properties

* **Dock** - Gets or sets which ToolStripItem borders are docked to its parent control and determines how a ToolStripItem is resized with its parent.

## Notable ToolStripItem Class Members

### Properties

* **Enabled** - Gets or sets a value indicating whether the parent control of the ToolStripItem is enabled.
* **Image** - Gets or sets the image that is displayed on a ToolStripItem.
* **Text** - Gets or sets the text that is to be displayed on the item.

### Events

* **Click** - Occurs when the ToolStripItem is clicked.

## Further Reading

* [ToolStrip Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstrip){: target="_blank"}
* [ToolStripButton Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstripbutton){: target="_blank"}