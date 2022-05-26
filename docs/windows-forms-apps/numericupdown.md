---
layout: default
title: NumericUpDown Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# NumericUpDown Class

Represents a Windows up-down control (spin box) that displays numeric values.

## Usage

A `NumericUpDown` control is an input control used for a single numeric value. It can be incremented or decremented by clicking the up or down buttons on the control. A value can also be entered in the text area of the control.

## Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **DecimalPlaces** - Gets or sets the number of decimal places to display in the spin box (also known as an up-down control). This property doesn't affect the Value property.
* **Increment** - Gets or sets the value to increment or decrement the spin box (also known as an up-down control) when the up or down buttons are clicked.
* **Maximum** - Gets or sets the maximum value for the spin box (also known as an up-down control).
* **Minimum** - Gets or sets the minimum allowed value for the spin box (also known as an up-down control).
* **TextAlign** - Gets or sets the alignment of the text in the spin box (also known as an up-down control).
* **ThousandsSeparator** - Gets or sets a value indicating whether a thousands separator is displayed in the spin box (also known as an up-down control) when appropriate.
* **Value** - Gets or sets the value assigned to the spin box (also known as an up-down control).

### Events

* **ValueChanged** - Occurs when the `Value` property has been changed in some way.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.numericupdown){: target="_blank"}
