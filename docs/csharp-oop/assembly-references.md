---
layout: default
title: Assembly References
parent: C# OOP
nav_order: 6
---

# Assembly References

To use types defined within class library assemblies, your project must contain a reference to the assembly. 

This is a two step process:

- Copy the .dll assembly file to the `bin/Debug` directory of your project.
- Add a reference to the .dll assembly file in Visual Studio.

## Add a Reference To a Project

1. To add a reference to a project, right-click on the **References** node in Solution Explorer and choose **Add Reference...** in the context menu.

    ![Add Reference](../images/assembly-references/add-reference.png){: .medium }

2. The **Reference Manager** dialog window will appear. Click the **Browse..** button.

    ![Reference Manager](../images/assembly-references/reference-manager.png){: .medium }

3. Navigate to the `bin/Debug` directory within your project and select the .dll assembly file.

    ![Locate the Assembly File](../images/assembly-references/locate-assembly.png){: .medium}

4. Click the **OK** button to add the reference.

    ![Confirm the Addition of the Reference](../images/assembly-references/confirm-the-add.png){: .medium}

You will now be able to see the reference as a node underneath **References**.

![Reference List](../images/assembly-references/reference-list.png){: .medium}

Once the assembly has been added to the project, you can now access the types within it.