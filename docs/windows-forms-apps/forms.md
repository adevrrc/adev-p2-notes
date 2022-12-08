---
layout: default
title: Forms
parent: Windows Forms Apps
nav_order: 2
---

# Forms
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

A **Form** is a class derived from the base class `System.Windows.Forms.Form`. A form represents a "window" within a GUI application. When you create a Windows Forms Application project, the project template will include one `Form` class (named `Form1`). Additional form classes can be added to the project as needed.

## Partial Class

In C#, a class can be defined over multiple source code files. This is accomplished by declaring a class using the `partial` keyword. When a class is declared as `partial` it is expected that the class is also declared within another file. When the source code is compiled, the parts of the class are combined.

In Visual Studio, Form classes are defined using two source code files.

[![Form Class Files](../images/forms/form-class-files.png "Form Class Files"){: .large }](../images/forms/form-class-files.png)

The screenshot above shows the root directory of a WFA project. The project contains a class called `HelloWorldForm`, that is a `Form` class.  The `HelloWorldForm` is defined across two files:

1. HelloWorldForm.cs
2. HelloWorldForm.Designer.cs

The **HelloWorldForm.cs** is the source code file that you will edit to add functionality to the `Form`. The **HelloWorldForm.Designer.cs** source code file, also known as the Designer File, is modified by Visual Studio based on the changes you make within the **Form Designer** tool and **Properties Panel**.

It is not recommended that you open or edit the Designer File for a `Form` class.
{: .alert .alert-warning }

There are two steps to developing a `Form` class:

1. Design the Form.
2. Develop the functionality.

## Form Design

By default, when you open a `Form` class in Visual Studio, it will open in **Form Design View**.

[![Form Design View](../images/forms/design-view.png "Form Design View"){: .large }](../images/forms/design-view.png)

The Form Design View is a visual representation of the Form class.

Designing a `Form` involves adding [Controls]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/winform-control-classes/){: target="_blank"} to the `Form` using the Form Design View, **Toolbox Panel**, and the **Properties Panel**.

If the Toolbox Panel is not visible to you, go to **View > Toolbox** in the Visual Studio menu strip. Or use the <kbd>Ctrl+W, E</kbd> keyboard shortcut.

### Adding Controls To A Form

To add a control to a `Form`:

1. Locate the Control you wish to add from the Toolbox Panel.
2. Using the left mouse button, drag and drop a [Control]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/winform-control-classes/){: target="_blank"} onto the Form in the Form Designer Panel.

[![Adding A Control To A Form](../images/forms/adding-control-to-form.gif "Adding A Control To A Form"){: .large }](../images/forms/adding-control-to-form.gif)

When you make any change to the visual representation of the form in the Form Designer, you are updating the `Form` class code. The changes are made in the class' Designer File.  Adding a [Button]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/button/) to a Form, adds the following code:

```csharp
partial class HelloWorldForm
{
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.button1 = new System.Windows.Forms.Button();

        // 
        // button1
        // 
        this.button1.Location = new System.Drawing.Point(184, 129);
        this.button1.Name = "button1";
        this.button1.Size = new System.Drawing.Size(75, 23);
        this.button1.TabIndex = 0;
        this.button1.Text = "button1";
        this.button1.UseVisualStyleBackColor = true;
        // 
        // HelloWorldForm
        // 
        this.Controls.Add(this.button1);
    }
    
    private System.Windows.Forms.Button button1;
}
```

There are four parts to these additions:

1. A field is declared for the Control.
2. An instance of the Control is created.
3. Properties of the Control are set to initialize the Control's state.
4. The Control is added to the collection of `Controls` on the Form.

If a Control is not part of the `Form.Controls` collection, it will not appear on the Form.
{: .alert .alert-note }

### Setting A Control's Initial State

After adding a Control to a Form in Form Designer, you will need to set it's initial state.  This is done in the Properties Panel.

[![Properties Panel](../images/forms/properties-panel.png "Properties Panel"){: .large }](../images/forms/properties-panel.png)

It is recommended that you get into the habit of always setting the `Name` property first. The value of the `Name` property is used as the field identifier within the class.

After setting the `Name` property, use the requirements of the application you are building to set other properties as needed. 

The last step to adding a Control to a Form is to position it on the Form. You can do this by using the cursor to drag it into position.

After changing properties and the position of the Button, this is what the Designer File looks like;

```csharp
partial class HelloWorldForm
{
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.btnDisplayMessage = new System.Windows.Forms.Button();

        // 
        // btnDisplayMessage
        // 
        this.btnDisplayMessage.Location = new System.Drawing.Point(84, 101);
        this.btnDisplayMessage.Name = "btnDisplayMessage";
        this.btnDisplayMessage.Size = new System.Drawing.Size(130, 23);
        this.btnDisplayMessage.TabIndex = 0;
        this.btnDisplayMessage.Text = "Show Message";
        this.btnDisplayMessage.UseVisualStyleBackColor = true;
        // 
        // HelloWorldForm
        // 
        this.Controls.Add(this.btnDisplayMessage);
    }

    private System.Windows.Forms.Button btnDisplayMessage;
}
```

#### Control Naming Convention

Controls will be named using a prefix. The prefix allows you to easily identify a Control in code using IntelliSense. For example, if a Button on the Form is used to display a message, the `Name` of the Button could be `btnDisplayMessage`.

[![Name Property](../images/forms/name-property.png "Name Property"){: .large }](../images/forms/name-property.png)

[List of Control Prefixes]({{ site.url }}{{ site.baseurl }}/docs/appendixes/control_prefix_cheatsheet/)

## Adding Functionality

Functionality is added to a class by editing the Form class code.

To view the class in **Code View**, select the Form node in Solution Explorer and do one of the following:

* Right-click the node and choose **View Code** from the context menu.
* Click the View Code button in the ToolString of the Solution Explorer panel.
* Press <kbd>F7</kbd> on your keyboard.

The predefined code for a new class will look like:

```csharp
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADEV.WindowsFormsApp
{
    public partial class HelloWorldForm : Form
    {
        public HelloWorldForm()
        {
            InitializeComponent();
        }
    }
}
```

As previously mentioned, the functionality of a GUI application is event-driven. To add functionality to a Form, you will need to [handle events]({{ site.url }}{{ site.baseurl }}/docs/events/event-handling/) of the Controls on the Form to satisfy the requirements of the program.

The `HelloWorldForm` class has one Button Control. The requirement of the program is to display the message "Hello World" in a modal dialog window when the Button is clicked.  Here is the code to accomplish that requirement:

```csharp
public partial class HelloWorldForm : Form
{
    public HelloWorldForm()
    {
        InitializeComponent();

        this.btnDisplayMessage.Click += BtnDisplayMessage_Click;
    }

    private void BtnDisplayMessage_Click(object sender, EventArgs e)
    {
        MessageBox.Show("Hello World");
    }
}
```

## Form Design Standards

For Windows Forms App projects where you are given a design for the Forms, the expectation is that you will create Form designs that will match the requirements you are given. The requirements will be in the Form of both a image and/or text descriptions.

The expectation of your Form designs will not require you to generate an exact pixel-to-pixel copy, but rather, a Form that has no noticeable differences between what you develop and what the requirement is.

To give you a better idea of the expectations, consider the design requirement below, and the designs completed by past students.

#### Original Design Requirement
{: .no_toc}

[![Original Design Requirement](../images/forms/requirement-form-design.png "Original Design Requirement"){: .large }](../images/forms/requirement-form-design.png)

#### Student Completed Designs
{: .no_toc}

Here is a sample of a student that followed the requirements very well.

[![Following the Requirements](../images/forms/well-done-form-design.png "Following the Requirements"){: .large }](../images/forms/well-done-form-design.png)

Here is a sample of a student that did not follow the requirements very well.

[![!Following the Requirements](../images/forms/poor-form-design.png "!Following the Requirements"){: .large }](../images/forms/poor-form-design.png)