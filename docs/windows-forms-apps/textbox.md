---
layout: default
title: TextBox Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# TextBox Class

Represents a Windows text box control.

## Usage

A TextBox control is an input control allowing a user to enter text in an application. A TextBox is a single-line input. You can update the state of the control to allow for multi-line input.

## Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **DataBindings** - Gets the data bindings for the control.
* **Size** - Gets or sets the height and width of the control.
* **Text** - Gets or sets the text associated with this control.
* **TextAlign** - Gets or sets how text is aligned in a TextBox control.

### Methods

* **Clear()** - Clears all text from the text box control.
* **DeselectAll()** - Specifies that the value of the SelectionLength property is zero so that no characters are selected in the control.
* **SelectAll()** - Selects all text in the text box.

### Events

* **Enter** - Occurs when the control is entered.
* **Leave** - Occurs when the input focus leaves the control.
* **TextChanged** - Occurs when the Text property value changes.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.textbox){: target="_blank"}
