---
layout: default
title: Server Explorer
nav_order: 2
parent: ADO.NET
---

# Server Explorer
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Visual Studio includes tools to interact with a database. You can connect, query, and modify the data in a database using the **Server Explorer** panel.

![Server Explorer Panel](../images/server-explorer/server-explorer.png){: .large }

To open the Server Explorer panel, go to **View > Server Explorer** on the Visual Studio Menu Strip. The keyboard shortcut is <kbd>Ctrl+W, L</kbd>.

## Adding a Connection

To add a connection to a database in Visual Studio, click the **Connect to database** button the Toolbar of the Server Explorer panel.

![Server Explorer - Add Connection](../images/server-explorer/add-a-connection.png){: .large }

The first time you add a connection, the following dialog window will appear.

![Change Data Source](../images/server-explorer/change-data-source.png){: .large }

Choose the type of data source you will be connecting to, then click **OK**.

The **Add Connection** dialog will appear. Click the **Browse...** button, then navigate to the database file you want to connect to.

![Add Connection](../images/server-explorer/add-connection.png){: .large }

Databases in this course will not require authentication. You can leave the User name as "Admin" and the Password "Blank".
{: .alert .alert-note}

You can click the **Test Connection** button after locating the file. If this is successful, you know you've setup the connection properly.
{: .alert .alert-note}

When a database connection is added, a new database node will appear under **Data Connections**.

![Data Connections](../images/server-explorer/database-node.png){: .large }

If you expand the database node, it will reveal a **Tables** node.  If you expand the Tables node, it will reveal nodes for each table in the database. If you expand the Table nodes, it will reveal the columns that make up the table.

## View Database Data

To retrieve the data within a database table, right-click a Table node and choose **Retrieve Data**.  This will perform an SQL SELECT query to retrieve all rows in that table.

![Retrieve Data](../images/server-explorer/retrieve-data.png){: .large }

This will open a tab in the editor portion of Visual Studio. You will see a DataGridView contain all the records from the table.

![Database Table Rows](../images/server-explorer/datatable-rows.png){: .large }

## Modify Database Data

You may want to edit the data in your database to setup certain tests within your application during the testing phase. This can be accomplished by interacting with the DataGridView control that appears after retrieving the data from a table.

The DataGridView works very similar to Excel. Click any cell and type to edit the record. Click the bottom row to add records.

When adding new records, DO NOT populate the ID column. This is an AutoNumber column.
{: .alert .alert-error}

## Closing the Connection

It is recommended that you close the connection to the database before closing Visual Studio. You can close the connection by right-clicking the Database node and choosing **Close connection**.

![Close Connection](../images/server-explorer/close-connection.png){: .large }