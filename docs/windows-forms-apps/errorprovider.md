---
layout: default
title: ErrorProvider Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# ErrorProvider Class

Provides a user interface for indicating that a control on a form has an error associated with it.

## Usage

An ErrorProvider is not a visual control on a Form, rather a component of the Form providing a "service". An `ErrorProvider` is used to display an icon beside a control to indicate the control has an error. When a user hovers over the icon, a Tool Tip appears showing the error description.

![Error Provider Icon](../images/errorprovider/errorprovider.png){:.large}

Because an ErrorProvider provides the functionality to the Form, you almost always only require one instance of `ErrorProvider` per Form.

When you add an `ErrorProvider` to a Form, you will not visually see an item on the form because it is not a visual component. You will the instance of `ErrorProvider` listed in the component panel before the form designer.

## Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **BlinkStyle** - Sets or sets a value indicating when the error icon flashes.

### Methods

* **GetError(Control)** - Returns the current error description string for the specified control.
* **SetError(Control, String)** - Sets the error description string for the specified control.
* **SetIconPadding(Control, Int32)** - Sets the amount of extra space to leave between the specified control and the error icon.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.errorprovider){: target="_blank"}
