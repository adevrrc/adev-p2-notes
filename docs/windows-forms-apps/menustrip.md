---
layout: default
title: MenuStrip Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# MenuStrip Class

Provides a menu system for a form.

## Usage

A `MenuStrip` is a container control for building a textual menu, normally docked to the top of a `Form`. A `MenuStrip` manages a collection of `ToolStripMenuItem`, `ToolStripTextBox` and `ToolStripComboBox` items.

A `MenuStrip` will contain most, if not all, the tasks the application can perform.

When you add a `MenuStrip` to a Form, you will visually see an item on the form that allows you to build the menu visually. The reference to the `MenuStrip` instance is in the component panel below the form designer.

### Adding Menu Items

Items are added to a `MenuStrip` using form designer. Simply click the text area where you see the placeholder text "Type Here". Then type in the text for the menu item.

[![Adding a Menu Item By Typing Text](../images/menustrip/menustrip-type-here.png "Adding a Menu Item By Typing Text"){:.large}](../images/menustrip/menustrip-type-here.png)

Each menu item you add is a control on the form and will require a `Name` prefixed with "mnu".

Items can also be added using the drop-down control in form designer.

[![Adding a Menu Item By Using the Drop-Down](../images/menustrip/menustrip-add-dropdown.png "Adding a Menu Item By Using the Drop-Down"){:.large}](../images/menustrip/menustrip-add-dropdown.png)

### Menu Access Key

Menu access keys allow you to access menu items with a keyboard only. The user will press the <kbd>Alt</kbd> in combination with the predefined access key.

To define an access key for a menu item, add an ampersand (&) before a letter in the text value.

For more information, see [How to: Create Access Keys for Windows Forms Controls](https://docs.microsoft.com/en-us/dotnet/framework/winforms/controls/how-to-create-access-keys-for-windows-forms-controls){: target="_blank"}.

### Separator Bar

A separator bar represents a line used to group related items in a menu strip.  In the image below, the separator bar is the gray line between the "Open" and "Exit" menu items.

[![Menu Item With Ellipsis](../images/menustrip/menustrip-item-ellipsis.png "Menu Item With Ellipsis"){:.large}](../images/menustrip/menustrip-item-ellipsis.png)

You can add a separator bar in design view by choosing it from the drop-down list or by typing a hyphen (-) in the "Type Here" input area.  By doing this, an instance of the [ToolStripSeparator](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstripseparator){: target="_blank"} class is added to the form.

## Standards

It is important to design your Windows applications in a way that Windows users expect to use an application. As it pertains to menu strips, here are some design standards:

### Menu Items

* "File" is always the first menu item.
* "Exit" is always the last menu item under File.
* "Help" is always the last menu item.
* "About" is always the last menu item under Help.

Although this is not always followed in every case, it is a majority of the time and users expect to find these items in those places.

### Keyboard Shortcuts

Some users prefer to work with the keyboard to perform some of their tasks. Keyboard shortcuts allow a user to perform an action within an application. Keyboard shortcuts are typically assigned to menu items.

There are also standards to keyboard shortcuts that Windows users expect to use. Here are some to consider:

* Save: <kbd>Ctrl + S</kbd>
* Copy: <kbd>Ctrl + C</kbd>
* Help: <kbd>F1</kbd>
* Exit: <kbd>Alt + F4</kbd>

### Accessor Keys

There are also standards for accessor keys. For example, using <kbd>Alt + F</kbd> to open the File menu. Always try to follow the standard of other Windows Applications.

### Menu Items That Open Dialog Windows

Menu items that open a modal dialog window will always include a "..." (ellipsis) at the end of their text. This is a visual cue to the user that they should expect a modal window to appear.

[![Menu Item With Ellipsis](../images/menustrip/menustrip-item-ellipsis.png "Menu Item With Ellipsis"){:.large}](../images/menustrip/menustrip-item-ellipsis.png)

### Menu Merging

Menu merging takes place when a `Form` with a `MenuStrip` control is opened as a child form within an MDI container `Form`. The `MenuStrip` of the child form is merged with the `MenuStrip` of its parent form.

For more information about menu merging, check out [this section of the Form class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/form/#menu-merging).

## Notable MenuStrip Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **Items** - Gets all the items that belong to a ToolStrip.

## Notable ToolStripMenuItem Class Members

### Properties

* **Image** - Gets or sets the image that is displayed on a `ToolStripItem`.
* **ShortcutKeys** - Gets or sets the shortcut keys associated with the `ToolStripMenuItem`.
* **Text** - Gets or sets the text that is to be displayed on the item.

### Events

* **Click** - Occurs when the `ToolStripItem` is clicked.

## Further Reading

* [MenuStrip Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.menustrip){: target="_blank"}
* [ToolStripMenuItem Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.toolstripmenuitem){: target="_blank"}
