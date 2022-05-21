---
layout: default
title: Simple Data Binding
parent: Data Binding
nav_order: 1
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

There are a few ways to setup a simple data bind. Assuming that your Form is designed and the data source is initialized, the recommended steps are:

1. Instantiate a `BindingSource` object and initialize its `DataSource` property to the data source.
2. Instantiate a `Binding` object.
3. Add the `Binding` object to the Control's `DataBindings` collection.

## BindingSource Class

The `BindingSource` object simplifies data binding. The `BindingSource` is an intermediary object between the data source and the Control. The `BindingSource` is bound to the data source and the Control is bound to the `BindingSource`. The advantage of `BindingSource` is that it provides change notification currency management and other data binding services.

![BindingSource](../images/simple-data-binding/bindingsource.png){: .large }

## Binding Class

The `Binding` object provides access to binding that connects the target Control's property to the property of the data source. The `Binding` object requires three pieces of information to successfully data bind:

1. The identifier of the Control's property being data bound.
2. The data source (always a reference to the `BindingSource`).
3. The identifier of the object's property within the data source.

![Binding Class](../images/simple-data-binding/binding-object.png){: .large }

## Single Object Data Source

![Simple Data Binding Example](../images/simple-data-binding/single-object-data-source.png){: .large }

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

        // Step 1
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
        // Step 2
        Binding messageBind = new Binding("Text", bindingSource, "Message");

        // Step 3
        this.txtMessage.DataBindings.Add(messageBind);
    }
}
```

Output:

![Simple Data Binding Example Output](../images/simple-data-binding/simple-bind-single-object-output.png){: .large }

Once the simple data binding is setup you can see that the `Text` property of the `TextBox` is data bound as the data "Hello World" appears in the `TextBox`. In the code above, the `Text` property of the `TextBox` is never assigned. The `Binding` object handles updating the `Text` property.

If the user was to change the `Text` within the `TextBox`, the `Message` property of the `Response` object would update. 

It's the `BindingSource` that facilitates the two-way communication between the Control and the data source.
{: .alert .alert-note }

## BindingList&lt;T&gt; Collection

The `BindingList` collection works the same as the `List` type, but supports two-way data-binding communication.

## Collection Data Source

More often then not, the data you are working with will be stored in a collection. When the data source is a collection, the Controls will represent the data from the object referenced by the `Current` property of the `BindingSource`.

![Simple Data Binding To Collection Example](../images/simple-data-binding/collection-data-source.png){: .large }

```csharp
public partial class SimpleBindToCollectionForm : Form
{
    protected BindingSource bindingSource;
    private BindingList<Response> responses;

    public SimpleBindToCollectionForm()
    {
        InitializeComponent();

        // Initialize fields
        this.responses = new BindingList<Response>();

        // Populate the collection
        this.responses.Add(new Response() { Message = "Message 1", WasViewed = true });
        this.responses.Add(new Response() { Message = "Message 2" });
        this.responses.Add(new Response() { Message = "Message 3", WasViewed = true });
        this.responses.Add(new Response() { Message = "Message 4" });

        // Step 1
        this.bindingSource = new BindingSource();
        this.bindingSource.DataSource = this.responses;

        // Event subscriptions
        this.Load += SimpleBindToCollectionForm_Load;
    }

    private void SimpleBindToCollectionForm_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        // Step 2 & 3
        this.lblDateCreated.DataBindings.Add("Text", this.bindingSource, "DateCreated");
        this.chkWasViewed.DataBindings.Add("Checked", this.bindingSource, "WasViewed");
        this.lblMessage.DataBindings.Add("Text", this.bindingSource, "Message");
    }
}
```

Output:

![Simple Data Binding To Collection Example Output](../images/simple-data-binding/simple-bind-to-collection-output.png){: .large }

Once the simple data binding is setup you can see that the Controls are representing the data of the first `Response` object in the data source (collection). The `Current` property of the `BindingSource` will always reference the first element of a collection when you data bind the data source to the `BindingSource`.

### Updating Current

The above example is simple enough to setup, but is not very useful to the user as they will only see the state of the first `Response` object. To make this Form more useful, we can add functionality to allow the user to see the other `Response` objects in the data source. This is accomplished by causing the `BindingSource` to update its `Current` property.

```csharp
public partial class SimpleBindToCollectionWithNavigationForm : SimpleBindToCollectionForm
{
    public SimpleBindToCollectionWithNavigationForm()
    {
        InitializeComponent();

        this.btnFirst.Click += BtnFirst_Click;
        this.btnPrevious.Click += BtnPrevious_Click;
        this.btnNext.Click += BtnNext_Click;
        this.btnLast.Click += BtnLast_Click;
    }

    private void BtnLast_Click(object sender, EventArgs e)
    {
        this.bindingSource.MoveLast();
    }

    private void BtnNext_Click(object sender, EventArgs e)
    {
        this.bindingSource.MoveNext();
    }

    private void BtnPrevious_Click(object sender, EventArgs e)
    {
        this.bindingSource.MovePrevious();
    }

    private void BtnFirst_Click(object sender, EventArgs e)
    {
        this.bindingSource.MoveFirst();
    }
}
```

Output:

![Simple Data Binding To Collection Example Output](../images/simple-data-binding/simple-bind-to-collection-output-next-button.png){: .large }

After clicking the **Next** Button, you can see that the Controls reflect the data of the second `Response` object in the data source. The `MovePrevious()`, `MoveNext()`, `MoveFirst()`, and `MoveLast()` methods of the `BindingSource` class, update which object in the data source `Current` references.

![Simple Data Binding To Collection Example](../images/simple-data-binding/collection-data-source-current.png){: .large }


## When Data Binding Doesn't Make Sense

When you data bind you are creating a one-to-one relationship between a data source object's property and a Control's property. What if the data source is not an object with properties? Maybe the data source is an `int`, `decimal` or `string`.

Data binding doesn't work or make sense for every situation.

The previous Form needs to be updated to include a Control that specifies how many `Response` objects are within the data source and which one is currently being viewed.  The format of the output is `"{record_number of {number_of_records}"`.  There is no data source object that has a property that contains this data. Also, it would be pointless to create a class with a property just for the purpose of data binding. In situations like this, we will just have to manually update the state of the Control. 

The other consideration will be that the Control will need to be updated anytime the `Current` property of the `BindingSource` is updated. This is accomplished by handling the `CurrentChanged` event of the `BindingSource` instance.

```csharp
public partial class SimpleBindToCollectionWithUpdateUIForm : SimpleBindToCollectionWithNavigationForm
{
    public SimpleBindToCollectionWithUpdateUIForm()
    {
        InitializeComponent();

        // Event subscription
        this.Load += SimpleBindToCollectionWithUpdateUIForm_Load;
    }

    private void BindingSource_CurrentChanged(object sender, EventArgs e)
    {
        UpdateUI();
    }

    private void SimpleBindToCollectionWithUpdateUIForm_Load(object sender, EventArgs e)
    {
        BindData();

        this.bindingSource.CurrentChanged += BindingSource_CurrentChanged;

        UpdateUI();
    }

    private void UpdateUI()
    {
        // Update ToolStripStatusLabel
        this.tsslRecordInformation.Text =
                        String.Format("{0} of {1}", this.bindingSource.Position + 1, this.bindingSource.Count);
    }
}
```

It is recommended to handle events like `BindingSource.CurrentChanged` after setting up the data binding, as the event will likely be raised for each element in the data source.
{: .alert .alert-best-practices }

The above example uses two `BindingSource` properties: 

* `Position` - Gets or sets the index of the current item in the underlying list.
* `Count` - Gets the total number of items in the underlying list, taking the current Filter value into consideration.

## Formatting

By default, the data stored within the data source will be the value used when data binding. You will not have access to this value to apply a format, as the Control is always synced with the data source. To apply a format, you need to set this up when initializing the `Binding` object.

Two things need to be initialized:

1. The `Binding` object must have formatting enabled (default has formatting disabled).
2. Set how the data will be formatted.

```csharp
private void BindData()
{
    Binding dateBind = new Binding("Text", this.bindingSource, "DateCreated");

    dateBind.FormattingEnabled = true;

    dateBind.FormatString = "MM-dd-yy";

    this.lblDateCreated.DataBindings.Add(dateBind);
}
```

Formatting is accomplished by setting the `FormattingEnabled` and `FormatString` properties. The `FormatString` you use must be compatible with the data type involved in the data bind.

## Data Bind With No Data

It is always recommended to setup the data binding for all Controls on the Form at the beginning of its life span. In certain situations, you may find that you do not have the data you need at the time of setting up the data binding.  For instance, the Controls may need to start off not showing any data. Then once the data exists, the Controls are updated. In this case, you can data bind to a "type" rather than an instance of an object containing data.

**Example**

```csharp
BindingSource source = new BindingSource();  
this.bindingSource.DataSource = typeof(Student);
```

When setting up the `BindingSource` in this way, your controls will be bound to an empty `IBindingList<T>` collection, where the generic of the collection is the type specified in the parentheses of the `typeof` part of the statement.  The example above would create the internal list as a collection that can store `Student` type objects.

When an instance of the data source object is instantiated, the `DataSource` property of the `BindingSource` can be updated.  This will update all controls bound to the `BindingSource` to show the data from `Current`.

```csharp
Student student = new Student("Jon", "Moxley", 10003);  
this.bindingSource.DataSource = student;
```

The above example will create a new internal list, where the first (and only) item in the list is the object referenced by the variable `student`.

## Clear Data Bound Controls

You may have a situation where Controls are data bound, they are displaying data, and at some point want the Controls to now show any data.  To do this, you can clear the `BindingSource` object's internal list:

```csharp
this.bindingSource.List.Clear();
```

Any Controls bound to the `BindingSource` will no longer show any data.

### Redefining a BindingSource's DataSource Property

In rare situations, after redefining a `BindingSource` object's `DataSource` property, the Controls bound to the `BindingSource` may not update. To force the `BindingSource` to read the data from the data source to populate the bound Controls, you will need to invoke the `ResetBindings(bool)` method of the `BindingSource`.

```csharp
this.bindingSource.ResetBinding(true);
```

## Further Reading

* [Binding Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.data.binding){: target="_blank" }
* [BindingSource Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.bindingsource){: target="_blank" }
* [BindingList Documentation](https://docs.microsoft.com/en-us/dotnet/api/system.componentmodel.bindinglist-1){: target="_blank" }