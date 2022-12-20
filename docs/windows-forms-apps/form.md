---
layout: default
title: Form Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# Form Class

Represents a window or dialog box that makes up an application's user interface.

## Usage

Forms make up the "windows" in a Windows application. A form is a container control that contains other controls.

### Showing A Form

Forms can be shown in two ways:

1. As a non-modal form.
2. As a modal form.

#### Non-Modal

The most basic way to show an instance of a form.

```csharp
form.Show();
```

If the form is the startup `Form` instance in the application, the application will continue to execute as long as this instance is still open (hasn't been closed).

If a `Form` instance (`formA`) is opened within the code of another `Form` instance (`formB`), each form can gain focus, but the `Form` instance (`formA`) is automatically closed when the instance of the `Form` class (`formB`) is closed.

#### Modal

Forms can be shown as a _Modal Dialog Window_.  Modal windows are typically created and shown from another `Form` instance. A modal dialog window, must close before another `Form` instance can gain focus. The About Form of an application is an example of a modal dialog window.

To open a form as a modal form:

```csharp
form.ShowDialog();
```

### Closing A Form

A `Form` instance is closed in three ways:

1. The user can use close button in the top-right corner of the form (if it is visible).
2. Programmatically by invoking a method.
3. The form's parent form is closed.

Forms are closed programmatically by using the object's `Close()` method. Closing a form will dispose of all resources created within the object.

## Single-Document Interface

A _Single-document Interface_ (SDI) is a graphical user interface, typically made up of single window (`Form` instance). SDI applications can contain more windows, but the windows are independent of each other. 

## Multiple-Document Interface

A _Multiple-document Interface_ (MDI) is a graphical user interface where one or more windows (`Form` instances) are contained within a parent window.

By default, a `Form` instance is not set to be an MDI container. To set a `Form` as an MDI container, the form's `IsMdiContainer` property is set to `true`. An MDI container `Form` is shown and closed like any other non-modal form.

MDI container windows are almost always the first document to be opened in the application. This windows is the parent window for all other windows in the application.

### Child Forms

To open a `Form` within the MDI container, also referred to as a _Child Form_, the `MdiParent` property of the form must be set to reference a `Form` instance that is set as an MDI container.

```csharp
form.MdiParent = parentForm;
```

Not setting the `MdiParent` property to an instance of a `Form` that is an MDI container will still allow you to show the `Form`, but it will not be contained within the MDI container.
{: .alert .alert-warning}

Showing and closing a child form is done like any non-modal form:

```csharp
form.Show();
form.Close();
```

The MDI container form contains references to each child form shown within it. The `MdiChildren` property of a form is a reference to a collection containing all the `Form` instances shown within the MDI container.

When closing an MDI container form, all of the child forms will be closed.
{: .alert .alert-note}

#### Activating

An MDI container has the potential to contain many child forms. The active form is the child form which has focus. The user can activate any form by clicking it with their cursor. In certain situations, you may be required to programmatically activate a form. This can be accomplished by invoking its `Activate()` method.

```csharp
form.Activate();
```

#### Menu Merging

When a child form contains a `MenuStrip`, the items from the menu can be merged with the menu of the parent form (MDI Container). Merging can happen manually or automatically. To automatically menu merge, the following must happen:

* The parent form must be an MDI container.
* The parent form's `MainMenuStrip` property must be set.
* The child form must be contained within an MDI container.

The `MainMenuStrip` property of a `Form` defaults to `null`. When you add a menu to a form using Form Designer, the `MainMenuStrip` property is set to the instance of the `MenuStrip`. In some cases, like when removing the menu after adding it, this property can be set back to `null`. This will prevent menu merging from happening.
{: .alert .alert-warning}

There are several ways menu items can be merged to a parent form's menu. The type of merge is defined by the value of the `ToolStripMenuItem` instances' `MergeAction` property. For some merge action types, the value of the items `Text` property must match the `Text` property of the menu item in the parent form.

For example, let's say a child form contains a `MenuStrip` which needs to merge items as sub-items under "File" in the parent form.  To do this, the child form menu would need to contain a menu item with the `Text` "File".

"File" and "&File" are not considered to be equal, and would not allow menu merging to work properly.
{: .alert .alert-warning}

### Events

When a form is initialized or closed, a series of events are raised.

#### Load Event

The `Load` event occurs before the form is shown for the first time. This event can be used to prepare the data that is used on the form. It can also be used to set the form's control's initial state.

The `Load` event is too early to perform some form tasks, as the form is not been displayed on the screen yet. For example, closing a form during the `Load` event will often cause an `InvalidOperationException`. In these types of cases, perform these tasks in the constructor of the form class.
{: .alert .alert-note}

#### Shown Event

The `Shown` event occurs after the form is first displayed. This event can be used to perform tasks that were too early to do during the `Load` event.

#### FormClosing Event

When a form is closed (using the UI close button or `Close()` method) the `FormClosing` event is raised before the form is removed from the screen. This is event is used for last second tasks before the form actually closes. An example would be to display a `MessageBox` to ask the user to save changes. During the `FormClosing` event, you can cancel the closing of the form by using the event's `FormClosingEventArgs` parameter. Cancelling the close will prevent the `FormClosed` event from taking place.

#### FormClosed Event

The `FormClosed` event occurs after the form is closed and removed from the screen. This event can be used to dispose of resources, like file streams.

## Notable Class Members

Inherits members from the [Control Class]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/control/).

### Properties

* **AcceptButton** - Gets or sets the button on the form that is clicked when the user presses the ENTER key.
* **CancelButton** - Gets or sets the button control that is clicked when the user presses the ESC key.
* **Controls** - Gets the collection of controls contained within the control.
* **FormBorderStyle** - Gets or sets the border style of the form.
* **Height** - Gets or sets the height of the control.
* **IsMdiChild** - Gets a value indicating whether the form is a multiple-document interface (MDI) child form.
* **IsMdiContainer** - Gets or sets a value indicating whether the form is a container for multiple-document interface (MDI) child forms.
* **MainMenuStrip** - Gets or sets the primary menu container for the form.
* **MaximizeBox** - Gets or sets a value indicating whether the Maximize button is displayed in the caption bar of the form.
* **MdiChildren** - Gets an array of forms that represent the multiple-document interface (MDI) child forms that are parented to this form.
* **MdiParent** - Gets or sets the current multiple-document interface (MDI) parent form of this form.
* **MinimizeBox** - Gets or sets a value indicating whether the Minimize button is displayed in the caption bar of the form.
* **ShowIcon** - Gets or sets a value indicating whether an icon is displayed in the caption bar of the form.
* **StartPosition** - Gets or sets the starting position of the form at run time.
* **Text** - Gets or sets the text associated with this control.
* **WindowState** - Gets or sets a value that indicates whether form is minimized, maximized, or normal.

### Methods

* **Activate()** - Activates the form and gives it focus.
* **Close()** - Closes the form.
* **Show()** - Displays the control to the user.
* **ShowDialog()** - Shows the form as a modal dialog box.

### Events

* **FormClosed** - Occurs after the form is closed.
* **FormClosing** - Occurs before the form is closed.
* **Load** - Occurs before a form is displayed for the first time.
* **Shown** - Occurs whenever the form is first displayed.

## Further Reading

* [MSDN Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.form){: target="_blank"}