---
layout: default
title: ListBox Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

ListBox Class
=============

Represents a Windows control for displaying a list of items.

Usage
-----

A ListBox control allows a user to select one or more items from a list, depending on the `SelectionMode`.

### SelectionMode

A ListBox can be set to one of four selection modes:

**None**

Setting the select mode to "None" disables the selection of an item in the list. This should be used when the ListBox is solely for displaying a list, rather than an input.

**One (default)**

The "One" selection mode allows the user to select a single item from the list.

**MultiSimple**

The "MultiSimple" selection mode allows the user to select multiple items from the list using only the mouse. The selection of an item is a toggle of either selected or deselected.

**MultiExtended**

The "MultiExtended" selection mode allows the user to select multiple items from the list, but the user will need to use the Shift and/or Ctrl keys to do so. The arrow keys can also be used with the selection keys to select/deselect more than one item.

### Notable Class Members

**Properties**

*   Items
*   SelectedIndex
*   SelectedItem
*   SelectedIndices
*   SelectedItems
*   SelectMode
 
**Methods**

*   ClearSelection
 
**Events**

*   SelectedIndexChanged

<a href="https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.listbox?view=netframework-4.8" target="_blank">MSDN Documentation</a>