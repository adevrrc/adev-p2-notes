---
layout: default
title: ComboBox Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

ComboBox Class
==============

Represents a Windows combo box control

Usage
-----

A ComboBox is a text box combined with a list box. A ComboBox allows a user to select items in a list or enter a new value. A ComboBox contains a collection of objects, accessed by its `Items` property.

### DropDownStyle

A ComboBox has three different styles.

**DropDown (default)**

The DropDown style allows a user to select an item from a list or enter a new value. The list is displayed when the user clicks the drop-down button. A common use for this style is a search input, where the list displays the search history.

![ComboBox DropDown Style](images/combobox_dropdown.png){:.img-responsive}

**Simple**

The Simple style is almost the same as the DropDown, except the list is always displayed.

![ComboBox Simple Style](images/combobox_simple.png){:.img-responsive}

**DropDownList**

The DropDownList style works like the DropDown style in the sense that the user has to click the drop-down button to expose the list, but the user cannot enter a new value.

![ComboBox DropDownList Style](images/combobox_dropdownlist.png){:.img-responsive}

### Notable Class Members

**Properties**

*   DropDownStyle
*   DataSource
*   Items
*   SelectedIndex
*   SelectedItem
*   Text

**Events**

*   SelectedIndexChanged

<a href="https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.combobox?view=net-5.0" target="_blank">MSDN Documentation</a>

