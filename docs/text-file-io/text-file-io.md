---
layout: default
title: Text File IO
nav_order: 9
---

# Text File IO
{: .no_toc }

## Table of Contents
{: .no_toc .text-delta }

1. TOC
{:toc}

Variables and collections provide temporary storage for data in your applications while your program is executing.  When your program terminates, this data is lost. Files are used for long-term storage of data. The data is retained after your terminates. Computers store files on secondary storage devices, such as flash memory or a hard disk.

## Data Hierarchy

Computers process data using a combination of 0s and 1s. The smallest data item a computer supports is a **bit** (or binary digit). A bit can store a value of 0 or 1. A computer can retrieve the value of a bit, set the value of a bit or negate the value of a bit (from 1 to 0 or 0 to 1).

Processing bit data can be awkward, so it is preferable to use decimal digits, letters and special symbols. These are referred to as **characters**.  Since computers can only process 0s and 1s, every character in a computer's character set is represented by a pattern of 0s and 1s. **Bytes** are composed of eight bits. When you create programs and data items with characters, your computer processes the characters as a pattern of bits.

A **field** is a group of characters that convey a meaning.  For example, the characters "Kenny Omega" represents a person's name. A **record** is made up of related fields. A **file** is a group of related records.

### File

```text
Kenny Omega,200,1983-10-16
Chris Jericho,227,1970-11-9
Laura Dennis,125,1985-9-3
```

### Record

```text
Kenny Omega,200,1983-10-16
```

### Field

```text
Kenny Omega
```

### Character

```text
K
```

### Byte

```text
01001011 (represents the character 'K')
```

## Streams

In C# all files are considered a sequential stream of bytes. All files end with an **end-of-file marker** or at a specific byte number (determined by the data structure). When a file is opened, an object is created and a stream is associated with the object.

There are many file-processing class in the .NET Framework, most of which are in the `System.IO` namespace.

* `StreamReader` - Used for text input from a file.
* `StreamWriter` - Used for text output to a file.
* `FileStream` - Used for both input from and output to a file.

## File and Directory Classes

The `File` and `Directory` classes contain methods to access file and directory information from the file system.

The `File` class is a static class used to determine information about files. The information can be used to open files for reading and writing.

* **AppendText** - Returns a StreamWriter that appends text to an existing file or creates a file if one does not exist.
* **Copy** - Copies a file to a new file.
* **Create** - Creates a file and returns its associated FileStream.
* **CreateText** - Creates a text file and returns its associated StreamWriter.
* **Delete** - Deletes the specified file.
* **Exists** - Returns true if the specified file exists and false otherwise.
* **GetCreationTime** - Returns a DateTime object representing when the file was created.
* **GetLastAccessTime** - Returns a DateTime object representing when the file was last accessed.
* **GetLastWriteTime** - Returns a DateTime object representing when the file was last modified.
* **Move** - Moves the specified file to a specified location.
* **Open** - Returns a FileStream associated with the specified file and equipped with the specified read/write permissions.
* **OpenRead** - Returns a read-only FileStream associated with the specified file.
* **OpenText** - Returns a StreamReader associated with the specified file.
* **OpenWrite** - Returns a write FileStream associated with the specified file.

The `Directory` class is a static class used for working with directories.

* **CreateDirectory** - Creates a directory and returns its associated DirectoryInfo object.
* **Delete** - Deletes the specified directory.
* **Exists** - Returns true if the specified directory exists and false otherwise.
* **GetDirectories** - Returns a string array containing the names of the subdirectories in
the specified directory.
* **GetFiles** - Returns a string array containing the names of the files in the specified directory.
* **GetCreationTime** - Returns a DateTime object representing when the directory was created.
* **GetLastAccessTime** - Returns a DateTime object representing when the directory was last accessed.
* **GetLastWriteTime** - Returns a DateTime object representing when items were last written to the directory.
* **Move** - Moves the specified directory to a specified location.

### Demonstrating File and Directory Classes

```csharp
string filepath;

Console.Write("Enter a file path: ");
filepath = Console.ReadLine();

if (File.Exists(filepath))
{
    Console.WriteLine("Created: {0}", File.GetCreationTime(filepath));
    Console.WriteLine("Last Modified: {0}", File.GetLastWriteTime(filepath));
    Console.WriteLine("Last Accessed: {0}", File.GetLastAccessTime(filepath));
    Console.WriteLine("Size: {0}", new FileInfo(filepath).Length);
}
else if (Directory.Exists(filepath))
{
    string[] subDirectories = Directory.GetDirectories(filepath);
    string[] files = Directory.GetFiles(filepath);

    Console.WriteLine("Absolute path: {0}", new DirectoryInfo(filepath).FullName);
    Console.WriteLine("Last Modified: {0}", Directory.GetLastWriteTime(filepath));
    Console.WriteLine("Last Accessed: {0}", Directory.GetLastAccessTime(filepath));
    Console.WriteLine("Number of sub-directories: {0}", subDirectories.Length);
    Console.WriteLine("Number of files: {0}", files.Length);
}
else
{
    Console.WriteLine("File path not found.");
}
```

## Writing Data to a Text File

Creating the structure of a data file is up to you. The concept of a _record_ does not exist in C#. This means you must structure files to meet the requirements of the application you are developing.

The following examples use the class `Student`.

```csharp
public class Student
{
    public enum FieldIndex
    {
        IdentificationNumber,
        FirstName,
        LastName,
        GradePointAverage
    }

    public int IdentificationNumber
    {
        get;
        private set;
    }

    public string FirstName
    {
        get;
        set;
    }

    public string LastName
    {
        get;
        set;
    }

    public string FullName
    {
        get { return FirstName + " " + LastName; }
    }

    public double GradePointAverage
    {
        get;
        set;
    }

    public Student()
    {
        // https://github.com/bchavez/Bogus
        Faker faker = new Faker();

        IdentificationNumber = faker.Random.Int(1000, 999999);
        FirstName = faker.Person.FirstName;
        LastName = faker.Person.LastName;
        GradePointAverage = System.Math.Round(faker.Random.Double(0, 4.5), 2);
    }

    public Student(int identificationNumber, string firstName, string lastName, double gradePointAverage)
    {
        IdentificationNumber = identificationNumber;
        FirstName = firstName;
        LastName = lastName;
        GradePointAverage = gradePointAverage;
    }

    public override string ToString()
    {
        return string.Format("{0,7} {1,-25} {2,-5}", 
                                IdentificationNumber, 
                                FullName, 
                                GradePointAverage);
    }
}
```

### Demonstrating Writing Data

```csharp
string filepath;
filepath = "students.dat";

List<Student> students = new List<Student>();

// A Student is initialized with random values using Bogus
// https://github.com/bchavez/Bogus
for (int i = 0; i < 35; i++)
    students.Add(new Student());

// Create a FileStream which opens (or creates) the file for writing only
FileStream fileStream;
fileStream = new FileStream(filepath, FileMode.OpenOrCreate, FileAccess.Write);

// Creates a StreamWriter used to write text to the FileStream
StreamWriter fileWriter;
fileWriter = new StreamWriter(fileStream);

Console.WriteLine("Writing to {0}...", filepath);

try
{
    foreach (Student student in students)
    {
        // Writes data to the file stream
        fileWriter.WriteLine("{0},{1},{2},{3}",
                                student.IdentificationNumber,
                                student.FirstName,
                                student.LastName,
                                student.GradePointAverage);
    }

    Console.WriteLine("Write complete.");
}
// IOException occurs when there is an I/O error
catch (IOException)
{
    Console.WriteLine("There was an error writing to {0}.", filepath);
}
// FormatException occurs when an invalid string format is used
catch (FormatException)
{
    Console.WriteLine("Invalid format.");
}

// Close the StreamWriter and the underlying stream
fileWriter.Close();   
```

It is best practice to use the `FileAccess` enumeration when opening a file to control user access.
{: .alert .alert-best-practices}

## Reading Data from a Text File

To read data from a text file accurately, you must understand the structure of the file. This could require you to either read the documentation of the application or to examine the structure of the file yourself.

The following example reads a file with the following structure and data:

Record structure: `account_id,first_name,last_name,balance`

```text
100,Chris,Jericho,1000.54
200,James,Hetfield,2000.38
300,Donna,Summers,3000.12
400,Jack,Sparrow,4000.92
```

This data file is structured as a comma-delimited file. A comma-delimited file separates each field with a comma with every record spanning a single line.
{: .alert .alert-note }

```csharp
string filepath = "students.dat";

// Creates a FileStream which opens the file with read only access
FileStream fileStream;
fileStream = new FileStream(filepath, FileMode.Open, FileAccess.Read);

// Creates a StreamReader which reads text from a FileStream
StreamReader fileReader;
fileReader = new StreamReader(fileStream);

// Creates a collection to store the data read from the file
List<Student> students = new List<Student>();

Console.WriteLine("Reading from {0}...", filepath);

try
{
    Student student;

    // Loop while there is more data to read
    while (fileReader.Peek() != -1)
    {
        // Read a record (line) from the file
        string record = fileReader.ReadLine();

        char[] delimiters = { ',' };

        // Each field is stored as an element in the array
        string[] fields = record.Split(delimiters);

        // Array index indicated with an inner Enumeration in the Student class
        int identificationNumber = Int32.Parse(fields[((int)Student.FieldIndex.IdentificationNumber)]);
        string firstName = fields[((int)Student.FieldIndex.FirstName)];
        string lastName = fields[((int)Student.FieldIndex.LastName)];
        double gradePointAverage = double.Parse(fields[(int)Student.FieldIndex.GradePointAverage]);
        
        // Create an instance of the data object using the data (fields) read in from the file
        student = new Student(identificationNumber, firstName, lastName, gradePointAverage);

        // Add the data object to the collection
        students.Add(student);                    
    }

    Console.WriteLine("Reading complete.");
}
// IOException occurs when there is an I/O error
catch (IOException)
{
    Console.WriteLine("There was an error reading from {0}.", filepath);
}

// Closes the StreamReader and the underlying stream
fileReader.Close();

// Print each data object in the collection
foreach (Student s in students)
    Console.WriteLine(s);
```