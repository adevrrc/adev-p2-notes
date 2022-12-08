---
layout: default
title: ADO.NET
nav_order: 11
has_children: true
---

# ADO.NET
{: .no_toc }

The section will help you answer the following questions:

- How can I use a database to store, retrieve and update data in my application?
- Is there a library of functionality that can make working with data in a database easier?
- How can an application run more efficiently using multi-threading?

## Learning Objectives
{: .no_toc }

- Write a .NET application that retrieves and updates data in a database.
- Explain the role of data sets and providers.
- Understand the work flow of an application that uses ADO.NET.
- Develop an application that combines ADO.NET and Data Binding.
- Understand the role of threads in an application.

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

**ADO.NET** is an API for data access. It provides access, editing, and updating functionality to a variety of data sources through a common set of components. ADO.NET is the common way to work with data stored in a [relational database system](https://en.wikipedia.org/wiki/Relational_DBMS){: target="_blank"}.

ADO stands for **ActiveX Data Object**. The technology was developed by Microsoft long before .NET. ADO.NET is a re-invented ADO.
{: .alert .alert-note }

## Architecture

ADO.NET is divided into to distinct parts: **consumers** and **providers**. Consumers are applications that need to access data. Providers are components that provide the data to the consumer.

## DataSet

A **DataSet** is a data structure that stores related data in the form of tables. You can think of a DataSet like an in-memory database. A DataSet can store multiple [DataTables](#datatable). Like a database, the tables are defined by columns. And the data is stored in rows. The most important thing to note about a DataSet is that it is not linked to the data source. Which means changes made to the DataSet are not automatically applied to the data source and vice versa.

[DataTables](#datatable) are accessible by _index_ or _key_, where the _key_ is the name given to the table when it was created.

```csharp
Console.WriteLine(dataset.Tables[0].TableName);

Console.WriteLine(dataset.Table["Students"].HasChanges());
```

### Notable Members

#### Properties

* **Tables** - Gets the collection of tables contained in the DataSet.

#### Methods

* **HasChanges()** - Gets a value indicating whether the DataSet has changes, including new, deleted, or modified rows.

## DataTable

A **DataTable** represents one table of data.

### Notable Members

#### Properties

* **Columns** - Gets the collection of columns that belong to this table.
* **Rows** - Gets the collection of rows that belong to this table.
* **TableName** - Gets or sets the name of the DataTable.

#### Methods

* **NewRow()** - Creates a new [DataRow](#datarow) with the same schema as the table.
* **RejectChanges()** - Rolls back all changes that have been made to the table since it was loaded, or the last time AcceptChanges() was called.

## DataRow

A **DataRow** represents a row of data in a [DataTable](#datatable). The data within the DataRow can be accessed by _index_ or _key_, where the _key_ is the name of the column in the database.

```csharp
Console.WriteLine(datarow[0]);

Console.WriteLine(datarow["first_name"]);
```

### Notable Members

#### Properties

* **RowState** - Gets the current state of the row with regard to its relationship to the DataRowCollection.

## Provider Classes

The .NET Framework contains classes for working with many different providers:

| Provider | API Prefix | Data source |
|:---------|:----------:|:------------|
| ODBC | Odbc | Data sources with an ODBC interface. Normally these are older database types. |
| OLE DB | OleDb | Data sources that expose an OLE DB interface. (Examples: Microsoft Access and Excel) |
| Microsoft SQL | Sql | For interacting with Microsoft SQL databases. |
| Oracle | Oracle | For interacting with Oracle databases. |

The classes discussed below are explained in general. Depending on the provider, you will need to use the proper prefix for the type.

Examples:

* OracleConnection
* OracleDataAdapter

## Connection

A connection object is used to connect to a database. 

### Notable Members

#### Properties

* **ConnectionString** - Gets or sets the string used to open a database.
* **State** - Gets the current state of the connection.

#### Methods

* **Close()** - Closes the connection to the data source.
* **Open()** - Opens a database connection with the property settings specified by the ConnectionString.

An exception will be generated when opening a connection if the `ConnectionString` is invalid.
{: .alert .alert-error}

## Command

A command object is used to represent a SQL statement to execute against the data source.

### Notable Members

#### Properties

* **CommandText** - Gets or sets the SQL statement or stored procedure to execute at the data source.
* **Connection** - Gets or sets the [Connection](#connection] used by this instance of the Command.

A Command must have a reference to a [Connection](#connection] in order for it to be executed.
{: .alert .alert-warning}

## DataAdapter

A DataAdapter represents a set of data [Commands](#command) and a database connection used to fill a [DataSet](#dataset) and update the data source. 

### Notable Members

#### Properties

* **SelectCommand** - Gets or sets an SQL statement or stored procedure used to select records in the data source.
* **DeleteCommand** - Gets or sets an SQL statement or stored procedure for deleting records from the data set.
* **InsertCommand** - Gets or sets an SQL statement or stored procedure used to insert new records into the data source.
* **UpdateCommand** - Gets or sets an SQL statement or stored procedure used to update records in the data source.

#### Methods

* **Fill(DataSet, string)** - Adds or refreshes rows in the [DataSet](#dataset) to match those in the data source using the [DataSet](#dataset) and [DataTable](#datatable) names.
* **Update(DataSet, string)** - Updates the values in the database by executing the respective INSERT, UPDATE, or DELETE statements for each inserted, updated, or deleted row in the [DataSet](#dataset) with the specified [DataTable](#datatable) name.

A DataAdapter must have an initialized `SelectCommand` to `Fill()` a [DataSet](#dataset). The other three [Commands](#command) must be initialized to do an `Update()`.

## CommandBuilder

The CommandBuilder automatically generates single-table commands used to reconcile changes made to a `DataSet` with the associated database. When a command builder is initialized with a `DataAdapter` whose `SelectCommand` is defined, the `CommandBuilder` can create Commands for Insert, Update and Delete based on the `SelectCommand` schema.

### Notable Members

#### Properties

* DataAdapter - Gets or sets an DataAdapter object for which SQL statements are automatically generated.

#### Methods

* **GetDeleteCommand()** - Gets the automatically generated [Command](#command) object required to perform deletions at the data source.
* **GetInsertCommand()** - Gets the automatically generated [Command](#command) object required to perform insertions at the data source.
* **GetUpdateCommand()** - Gets the automatically generated [Command](#command) object required to perform updates at the data source.


## Further Reading

* [ADO.NET](https://en.wikipedia.org/wiki/ADO.NET){: target="_blank"}
* [OLE DB](https://en.wikipedia.org/wiki/OLE_DB){: target="_blank"}
* [DataSet](https://docs.microsoft.com/en-us/dotnet/api/system.data.dataset){: target="_blank"}
* [DataTable](https://docs.microsoft.com/en-us/dotnet/api/system.data.datatable){: target="_blank"}
* [DataRow](https://docs.microsoft.com/en-us/dotnet/api/system.data.datarow){: target="_blank"}
* [OleDbConnection](https://docs.microsoft.com/en-us/dotnet/api/system.data.oledb.oledbconnection){: target="_blank"}
* [OleDbCommand](https://docs.microsoft.com/en-us/dotnet/api/system.data.oledb.oledbcommand){: target="_blank"}
* [OleDbDataAdapter](https://docs.microsoft.com/en-us/dotnet/api/system.data.oledb.oledbdataadapter){: target="_blank"}
* [OleDbCommandBuilder](https://docs.microsoft.com/en-us/dotnet/api/system.data.oledb.oledbcommandbuilder){: target="_blank"}