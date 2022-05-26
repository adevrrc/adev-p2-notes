---
layout: default
title: Complex Data Binding
parent: Data Binding
nav_order: 2
---

# Complex Data Binding
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

**Complex Data Binding** is the ability of a Control to bind to a collection of data elements. A Control that can do complex data binding will have a `DataSource` property.

Examples of Controls that can do complex data binding:

* [ListBox]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/listBox/)
* [ComboBox]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/combobox/)
* [DataGridView]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/datagridview/)

Assuming that your Form is designed and the data source is initialized, the steps for setting up complex data binding are:

1. Instantiate a `BindingSource` object and initialize its `DataSource` property to the data source.
2. Set the `DataSource` of the Control to the `BindingSource`.

[![Complex Data Binding ListBox Example](../images/complex-data-binding/complex-data-binding.png "Complex Data Binding ListBox Example"){: .large }](../images/complex-data-binding/complex-data-binding.png)

```csharp
public partial class ComplexBindExampleForm : Form
{
    private BindingSource bindingSource;
    private BindingList<Response> responses;

    public ComplexBindExampleForm()
    {
        InitializeComponent();

        // Initialize fields
        this.responses = new BindingList<Response>();

        this.bindingSource = new BindingSource();
        this.bindingSource.DataSource = this.responses;

        // Event subscriptions
        this.Load += ComplexBindExampleForm_Load;
        this.btnNew.Click += BtnNew_Click;
    }

    private void ComplexBindExampleForm_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        this.lstResponses.DataSource = this.bindingSource;
    }

    private void BtnNew_Click(object sender, EventArgs e)
    {
        Response response = new Response();
        response.Message = "[Default Message]";
        this.responses.Add(response);
    }
}
```

Output:

[![Complex Data Binding ListBox Example Output](../images/complex-data-binding/listbox-complex-data-binding-output.png "Complex Data Binding ListBox Example Output"){: .large }](../images/complex-data-binding/listbox-complex-data-binding-output.png)

When the Form is initialized, the data source (`BindingList`) contains no elements. In the `Click` event handler of the **New** button, a new `Response` object is added to the data source. The changes to the data within the data source are reflected in the Control.


## DisplayMember

For Controls like `ComboBox` and `ListBox`, you can customize how the Control will render data bound objects. Again, by default, the objects will be represented by the `string` returned by the object's `ToString()` method.  Setting the `DisplayMember` property of the Control to the identifier of a data source object's property, will use the value of the specified property to render the object in the Control.

```csharp
public partial class ComboBoxDataBindingForm : Form
{
    private BindingSource bindingSource;
    private BindingList<Response> responses;

    public ComboBoxDataBindingForm()
    {
        InitializeComponent();

        // Initialize fields
        this.responses = new BindingList<Response>();

        this.bindingSource = new BindingSource();
        this.bindingSource.DataSource = this.responses;

        // Event subscriptions
        this.Load += ComplexBindExampleForm_Load;
        this.btnNew.Click += BtnNew_Click;
    }

    private void ComplexBindExampleForm_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        this.cboResponses.DataSource = this.bindingSource;

        this.cboResponses.DisplayMember = "Message";
    }
}
```

[![ComboBox DisplayMember](../images/complex-data-binding/display-member.png "ComboBox DisplayMember"){: .large }](../images/complex-data-binding/display-member.png)

## ValueMember

The `ComboBox` and `ListBox` Controls are often used as an input. Selecting an item in the Control can result in a value. The value can be obtained through the Controls `SelectedValue` property. By default, the `SelectedValue` property will return the `string` returned by the selected object's `ToString()` method.

Like the `DisplayMember`, you can customize what the `SelectedValue` returns by setting the Control's `ValueMember`. Setting the `ValueMember` property of the Control to the identifier of an data source object's property, will use the value of the specified property as the Control's `SelectedValue`.

```csharp
private void BindData()
{
    this.cboResponses.DataSource = this.bindingSource;

    this.cboResponses.DisplayMember = "Message";
    this.cboResponses.ValueMember = "WasViewed";
}
```

## Updating Current

You saw in a previous topic that `Current` of the `BindingSource` can be updated using methods of the `BindingSource` object. When a Control is part of a complex data bind, selecting an item in the Control will update `Current`.

When there are combinations of simple bound controls and complex bound controls on a Form and they are bound to the same `BindingSource`, updating `Current` will affect all controls.