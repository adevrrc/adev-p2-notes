---
layout: default
title: Form Class
parent: Winform Control Classes
grand_parent: Windows Forms Apps
---

# Form Class

Represents a window or dialog box that makes up an application's user interface.

## Usage

Forms make up the "windows" in a Windows application. A Form is a container control that contains other controls.

### Showing Forms

Forms can be shown in three ways:

1. The normal way.
2. As a modal form.
3. As a child Form within an MDI parent Form.

#### Normal

The most basic way to show an instance of a Form.

```csharp
form.Show();
```

If the Form is the startup Form instance in the application, the application will continue to execute as long as this instance is still in memory (not closed).

If a `Form` instance (`formA`) is shown from code within another Form class (`formB`), each form can gain focus, but the Form instance (`formA`) is taken out of member (destroyed) when the instance of the Form class (`formB`) is removed from memory.

#### Modal

Forms can be shown as a modal dialog box.  Modal forms are typically created and shown from another Form instance. A modal dialog box, must close before another Form instance can gain focus. The About Form of an application is an example of a modal dialog box.

To open a form as a modal form:

```csharp
form.ShowDialog();
```

#### MDI Parent and Child Forms

A Form can be set to be an MDI container.  **MDI** stands for **Multiple-Document Interface**.  An MDI Form's purpose is to contain other Form instances.

To set a `Form` as an MDI container, the Form's `IsMdiContainer` property is set to `true`. A `Form` instance set as an MDI container is shown and closed like any other non-modal Form.

To open a `Form` within the MDI container, also referred to as a child Form, the `Form` instance must have a reference to a `Form` instance (parent Form) that is an MDI container.

```csharp
form.MdiParent = parentForm;
```

Not setting the `IsMdiContainer` property to an instance of a `Form` that is an MDI container will still allow you to show the `Form`, but it will not be a part of the MDI container.
{: .alert .alert-warning}

Showing and closing a child Form is done like any non-modal Form:

```csharp
form.Show();
form.Close();
```

The `MdiChildren` property of a `Form` is a reference to a collection contain all the `Form` instances shown within the MDI container.

#### Setting Focus to a Child Form

To set focus to a child Form:

```csharp
form.Activate();
```

### Events

After a form is constructed or closed, a series of events are raised.

#### Load Event

The `Load` event occurs before the form is shown for the first time. This event can be used to prepare the data that is used on the form. It can also be used to set the form's control's initial state.

The `Load` event is too early to perform some form tasks, as the form is not been displayed on the screen yet.
{: .alert .alert-note}

#### Shown Event

The `Shown` event occurs after the form is first displayed. This event can be used to perform tasks that were too early to do during the `Load` event.

#### FormClosing Event

When a Form is closed (using the UI close button or `Close()` method) the `FormClosing` event is raised before the form is removed from the screen. This is event is used for last second tasks before the form actually closes. An example would be to display a `MessageBox` to ask the user to save changes. During the `FormClosing` event, you can cancel the closing of the form by using the event's `FormClosingEventArgs` parameter. Cancelling the close will prevent the `FormClosed` event from taking place.

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