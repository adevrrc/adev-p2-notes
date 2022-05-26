---
layout: default
title: Label Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# Label Class

Represents a standard Windows label.

## Usage

**Labels** are an output control, typically used to provide descriptive text to other controls.

A `Label` is part of the tab order of a form, but does not receive focus.

## Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **AutoSize** - Gets or sets a value indicating whether the control is automatically resized to display its entire contents.
* **BackColor** - Gets or sets the background color for the control.
* **BorderStyle** - Gets or sets the border style for the control.
* **DataBindings** - Gets the data bindings for the control.
* **Text** - Gets or sets the text associated with this control.
* **TextAlign** - Gets or sets the alignment of text in the label.

### Events

* **TextChanged** - Occurs when the `Text` property value changes.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.label){: target="_blank"}