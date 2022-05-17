---
layout: default
title: Simple Data Binding
parent: Data Binding
nav_order: 2
---

# Simple Data Binding
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

**Simple Data Binding** is the ability of a Control to bind to a single data element. 

![Simple Data Binding](../images/simple-data-binding/simple-data-binding.png){: .large }

This type of Data Binding is typical for Controls like [TextBox]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/textbox/) and [Label]({{ site.url }}{{ site.baseurl }}/docs/windows-forms-apps/label/) that only display a single value.

![Simple Data Binding TextBox Example](../images/simple-data-binding/textbox-data-binding.png){: .large }

There are a few ways to setup a simple data bind. The recommended steps are:

1. Instantiate a `BindingSource` object.
2. Instantiate a `Binding` object.
3. Add the `Binding` object to the Control's `DataBindings` collection.

## BindingSource Class

The `BindingSource` object simplifies data binding. The `BindingSource` is an intermediary object between the data source and the Control. The `BindingSource` is bound to the data source and the Control is bound to the `BindingSource`. The advantage of `BindingSource` is that it provides change notification currency management and other data binding services.

## Binding Class

The `Binding` object provides access to binding to connects the target Control's property to the property of the data source.

![Binding Class](https://docs.microsoft.com/en-us/dotnet/media/databindingmostbasic.png){: .large }

## Simple Binding To A Single Object

![Simple Data Binding Example](../images/simple-data-binding/simple-bind-complete.png){: .large }

```csharp
public partial class SimpleBindExampleForm : Form
{
    private Response response;
    private BindingSource bindingSource;

    public SimpleBindExampleForm()
    {
        InitializeComponent();
        
        // Initialize fields
        this.response = new Response();
        this.response.Message = "Hello World";

        this.bindingSource = new BindingSource();
        this.bindingSource.DataSource = response;

        // Event subscriptions
        this.Load += SimpleBindExampleForm_Load;
    }

    private void SimpleBindExampleForm_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        Binding messageBind = new Binding("Text", bindingSource, "Message");

        this.txtMessage.DataBindings.Add(messageBind);
    }
}
```

Output:

![Simple Data Binding Example](../images/simple-data-binding/simple-bind-single-object-output.png){: .large }



## Simple Binding To A Collection



## Formatting



## Further Reading

* [Binding Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.data.binding){: target="_blank" }
* [BindingSource Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.bindingsource){: target="_blank" }