---
layout: default
title: Workflow
nav_order: 1
parent: ADO.NET
---

# Workflow
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Database File Storage

The database file can be stored anywhere on your file system, but it is recommended that you store the file in the **bin\Debug** directory of your application project. If you prefer, it can be stored in a sub-directory. For example, **bin\Debug\data**.

Ensure that you are using a relative file path to any external resources. Using an absolute path will only work in the development environment and not on any other machine.

## Database Connection

To connect to a database a connection string is required. The basic format of a connection string is:

```
Provider={provider};Data Source={database_file_path};
```

For Microsoft Access databases using the Office Access Connectivity Engine (ACE), the provider is `Microsoft.ACE.OLEDB.12.0`.

**Example**: `Provider=Microsoft.ACE.OLEDB.12.0;Data Source={database_file_path};`

File paths that contain spaces will need to be within double quotes.
{: .alert .alert-warning }

The Office Access Connectivity Engine is likely already installed on your computer and is the 64-bit version. For your application to work with the ACE engine, the application will need to be configured to execute as 64-bit (the default is 32-bit).

To set your project to compile as 64-bit:

1. Right-click the **Project node** in the **Solution Explorer**.
2. Choose **Properties** from the context menu.
3. Click the **Build** tab on the left hand side of the properties window.
4. Change the **Platform target** from "Any PC" to "x64".
5. Save the project and close the properties window.

![Project Properties Panel](../images/workflow/project_properties_panel.png){: .large }

If you are experiencing exceptions connecting to the database, ensure you've set the project as 64-bit.
{: .alert .alert-error }

## SQL SELECT Query

The `CommandText` of the `SelectCommand` must be a valid SQL `SELECT` statement. If you are unfamiliar with the SQL `SELECT` statement, check out these guides:

* [SQL SELECT Statement](https://www.w3schools.com/sql/sql_select.asp){: target="_blank"}
* [SQL WHERE Clause](https://www.w3schools.com/sql/sql_where.asp){: target="_blank"}

## Retrieving Data

The goal of retrieving the data from a data source is to query the data and temporarily store it in your application to be used by the user. All or part of the data from the data source can be retrieved, depending on the needs of the application and user input.

Retrieving data in this course will require a [Connection]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#connection), [Command]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#command), [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter), and [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset). The work flow is as follows:

[![Retrieve Data Flowchart](../images/workflow/retrieve-data.png){: .large }](../images/workflow/retrieve-data.png){: .no-underline target="_blank" }

### Results
{: .no_toc}

If the update is performed without exception, the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset) will be populated with a single [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable). The [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) will contain zero or more rows.

A query may return no rows if the table does not contain data or the conditions (WHERE clause) does not result in any rows returned.
{: .alert .alert-warning}

If an exception occurs, here are some common causes:

* The Connection's `ConnectionString` is invalid or contains inaccurate information.
* The Connection was not opened before the [DataAdapter's]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) attempt to Fill the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset).
* The `SelectCommand` object's `CommandText` is not valid SQL. This could be a result of poor SQL syntax or incorrectly referencing tables and columns.

## Setup DataAdapter

Before the [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) can be used to update the data source, the `InsertCommand`, `UpdateCommand`, and `DeleteCommand` properties must reference [Command]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#command) object containing SQL for the specific operation they represent.

Unlike the `SelectCommand`, you do not need to initialize the `InsertCommand`, `UpdateCommand`, and `DeleteCommand` properties yourself. The [CommandBuilder]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#commandbuilder) object can generate INSERT, UPDATE, and DELETE [Commands]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#command) by using the `SelectCommand` of a [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter).

## Data Modification

The data within a [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset) is modified in two ways:

1. Code
2. Data bound controls

## DataRow's RowState Property

The key to understanding how a data source is updated is to understand the [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow)'s `RowState` property. The `RowSate` is declared as type `System.Data.DataRowState`. The possible states are:

| DataRowState | Description |
|----------|-------------|
| Added | The row has been added to a DataRowCollection. |
| Delete | The row was deleted using the Delete() method of the DataRow. |
| Detached | The row has been created but is not part of any DataRowCollection. A DataRow is in this state immediately after it has been created and before it is added to a collection, or if it has been removed from a collection. |
| Modified | The row has been modified. |
| Unchanged | The row has not been changed. |

The `RowState` is evaluated for each [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) in the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) being updated. The value of the `RowState` will determine if the [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataapter) will ignore the [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) or use its data for one of the update [Commands]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#command).

* **Added** - [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataapter) executes `InsertCommand`.
* **Delete** - [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataapter) executes `DeleteCommand`.
* **Modified** - [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataapter) executes `UpdateCommand`.
* **Unchanged** - [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataapter) ignores the [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow).

## Updating Data Source

When the application makes changes to the data in a [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset), those changes are not applied to the data source automatically. The [DataAdapter's]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datadapter) responsibility to update the data. This should make sense, considering it is the object that contains the `InsertCommand`, `UpdateCommand`, and `DeleteCommand`.

[![Update Data Flowchart](../images/workflow/update-data.png){: .large }](../images/workflow/update-data.png){: .no-underline target="_blank" }

### Results
{: .no_toc}

If the update is performed without exception, the data source will be update with the changes from [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset). The `RowState` of each updated [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) will be set to `Unchanged`.

If an exception occurs, here are some common causes:

* The Connection's `ConnectionString` is invalid or contains inaccurate information.
* The Connection is not opened before the [DataAdapter's]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) attempt to `Update` the data source.
* `InsertCommand`, `UpdateCommand`, or `DeleteCommand` not set.
* The specified _tableName_ does not exist in the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset).

## Closing the Connection

When the data is no longer needed, typically when the Form using the data is closed, you will want to `Close()` the connection to the data source to ensure the resource is released.

## Updating Row ID

### AutoNumber Type

In most modern databases, there is a special column type that generates an automatically incremented numeric counter.  In the Microsoft Access database, this type is called [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"}. Columns of the [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} type are typically used for the primary key of the table, as it will generate a unique value for each new row inserted in the table.  And that is the most important thing to remember while reading this part of the lesson. The unique value is **only** generated by the database when a row is inserted into the table.

### Inserting Rows into a DataTable

As you learned earlier in this topic, data is queried from a database to populate a [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) (in a [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset)). Your application works with the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable). Then at some point, the changes made to the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) are applied to the database.

This means that when new data is generated in your application, a new [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) will be added to the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable).

A [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) does not have an [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} type of column. This means that when you create a new [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow), you will not populate the column which represents the [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} column in the database.

Let's say you were working with data from a table called _Contacts_, which contained data about your friends and colleagues. The SQL to query this table might look like this:

```sql
SELECT ID, FirstName, LastName, PhoneNumber FROM Contacts
```

The _ID_ column is an [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} type.

#### Populate DataSet

When the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset) is populated, the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset) will contain one [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable). The following table is a visual example of rows, columns and data in the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable):

| ID | FirstName | LastName | PhoneNumber |
|:--:|-----------|----------|-------------|
| 1  | Kenny     | Omega    | 2042321111  |
| 2  | Maxwell   | Friedman | 2044202222  |
| 3  | Joey      | Janela   | 2045883333  |


#### Adding a New Row

As mentioned above, after adding a row to the DataTable, the row will not have a value populated for the [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} column.  The last row in the table below shows how that would look.

| ID   | FirstName | LastName   | PhoneNumber |
|:----:|-----------|------------|-------------|
| 1    | Kenny     | Omega      | 2042321111  |
| 2    | Maxwell   | Friedman   | 2044202222  |
| 3    | Joey      | Janela     | 2045883333  |
|      | Cody      | Rhodes     | 2049876543  |

#### Updating the DataSet

When the [DataSet]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataset) is updated, the new row (`RowState`: `Added`) will be attempted to be inserted into the database and the [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} column in the database will generate the next numerical incremented value. But the [DataTable]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datatable) will not receive that value and will remain blank.

#### The Problem

The potential problem is that if this [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) was to be edited, and it's `RowState` changed (to `Modified` or `Deleted`), an exception would occur when the [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) performs an update. The reason is because of the missing ID value.

The [DataAdapter's]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) `UpdateCommand` and `DeleteCommand` will all end with:

```sql
WHERE ID = ?
```

The question mark is substituted with the primary key value from the [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow). As you can see from the table above, that value doesn't exist.  This means the SQL statement will have a syntax error and an exception will occur.

#### The Solution

The solution to the problem is to query the database right after a row is inserted into the database to capture the last [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} value generated by the database.

First, you need to know when a row is inserted. You can accomplish this by handling the `RowUpdated` event of the [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter). After an `Update()` is invoked, if a DataRow is updated, it will raise this event. When the `StatementType` is an `Insert`, you'll execute a special SQL command on the database that returns the last [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"} generated by the database.

Handle the `RowUpdated` event of the [DataAdapter]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#dataadapter) object.

```csharp
dataAdapter.RowUpdated += new OleDbRowUpdatedEventHandler(dataAdapter_RowUpdated);
```

The implementation of the `RowUpdated` event handler method.

```csharp
void dataAdapter_RowUpdated(object sender, OleDbRowUpdatedEventArgs e)
{
    // When the update is an Insert (new record)
    if (e.StatementType == StatementType.Insert)
    {
        // Creates a new command
        // @@IDENTITY - a database value that returns the last-inserted identity 
        // (AutoNumber) value from the last statement
        OleDbCommand cmd = new OleDbCommand("SELECT @@IDENTITY", databaseConnection);
  
        // Assigns the ID value of the new row in the database to the DataColumn "ID" 
        // of the new
        // DataRow in the DataTable
        // ***
        // ExecuteScalar - Executes the command and returns the value of first column 
        // of the first row returned
        // e.Row - reference to the DataRow being updated from the DataTable.
        // e.Row["ID"] - reference to the "ID" DataColumn in the DataRow.
        e.Row["ID"] = (int)cmd.ExecuteScalar();
    }
}
```

After this code is executed, the _ID_ DataColumn of the [DataRow]({{ site.url }}{{ site.baseurl }}/docs/adonet/adonet/#datarow) will be populated with the generated [AutoNumber](https://en.wikipedia.org/wiki/AutoNumber){: target="_blank"}.