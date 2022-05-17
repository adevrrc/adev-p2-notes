---
layout: default
title: ComboBox Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# ComboBox Class

Represents a Windows combo box control

## Usage

A ComboBox is a text box combined with a list box. A ComboBox allows a user to select items in a list or enter a new value. A ComboBox contains a collection of objects, accessed by its `Items` property.

### DropDownStyle

A ComboBox has three different styles.

#### DropDown (default)

The DropDown style allows a user to select an item from a list or enter a new value. The list is displayed when the user clicks the drop-down button. A common use for this style is a search input, where the list displays the search history.

![ComboBox DropDown Style](../images/combobox/combobox-dropdown.png){:.img-responsive}

#### Simple

The Simple style is almost the same as the DropDown, except the list is always displayed.

![ComboBox Simple Style](../images/combobox/combobox-simple.png){:.img-responsive}

#### DropDownList

The DropDownList style works like the DropDown style in the sense that the user has to click the drop-down button to expose the list, but the user cannot enter a new value.

![ComboBox DropDownList Style](../images/combobox/combobox-dropdownlist.png){:.img-responsive}

### Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **DataSource** - Gets or sets the data source for this ComboBox.
* **DropDownStyle** - Gets or sets a value specifying the style of the combo box.
* **Items** - Gets an object representing the collection of the items contained in this ComboBox.
* **SelectedIndex** - Gets or sets the index specifying the currently selected item.
* **SelectedItem** - Gets or sets currently selected item in the ComboBox.
* **SelectedValue** - Gets or sets the value of the member property specified by the ValueMember property.
* **Text** - Gets or sets the text associated with this control.

### Events

* **SelectedIndexChanged** - Occurs when the SelectedIndex property has changed.
* **SelectedValueChanged** - Occurs when the SelectedValue property changes.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.combobox){: target="_blank"}