---
layout: default
title: Messagebox Class
parent: Windows Forms Apps
nav_order: 6
---

# Messagebox Class

Represents a message box.

## Usage

A MessageBox is a built-in class used for displaying a modal dialog window. A message box can be used to quickly display information and/or allow a user to make a decision. The dialog window can be customized by using one of many `Show()` methods.

![Parts of a message box](https://docs.microsoft.com/en-us/dotnet/desktop/wpf/windows/media/how-to-open-message-box/diagram.png?view=netdesktop-6.0){: target="_blank"}

1. A title bar with caption.
2. A close button.
3. Icon.
4. Message displayed to the user.
5. Response buttons.

### Displaying a Message Box

To show a message box, you will use the `MessageBox` class by invoking one of the `Show()` methods (there are over 20 overloaded versions of the `Show()` method).  The `Show()` method allows you to configure the message box message, caption, icon and buttons.

```csharp
string message = "Do you wish to continue?";
string caption = "Course Withdrawal";
MessageBoxButtons buttons = MessageBoxButtons.YesNoCancel;
MessageBoxIcon icon = MessageBoxIcon.Warning;
DialogResult result;

result = MessageBox.Show(message, caption, buttons, icon, MessageBoxDefaultButton.Button3);
```

The code above would produce the following message box:

![Sample MessageBox](../images/messagebox-class/messagebox.png){:.large}

### Handle a Message Box Response

The `Show()` methods return a [DialogResult](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.dialogresult){: target="_blank" } value indicating the button the user clicked on to close the dialog window.

```csharp
result = MessageBox.Show(message, caption, buttons, icon, MessageBoxDefaultButton.Button3);

switch(result)
{
    case DialogResult.Cancel
        // User pressed Cancel
        break;
    case DialogResult.Yes:
        // User pressed Yes
        break;
    case DialogResult.No:
        // user pressed No
        break;
}
```

## Notable Class Members

### Methods

* **Show()** - Displays a message box.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.messagebox){: target="_blank"}
