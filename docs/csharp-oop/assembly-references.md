---
layout: default
title: Assembly References
parent: C# OOP
nav_order: 6
---

# Assembly References

To use types defined within class library assemblies, your project must contain a reference to the assembly. 

This is a two step process:

1. Copy the .dll assembly file to the `bin/Debug` directory of your project.
2. Add a reference to the .dll assembly file in Visual Studio.

## Add a Reference To a Project

1. To add a reference to a project, right-click on the **References** node in Solution Explorer and choose **Add Reference...** in the context menu.

    [![Add Reference](../images/assembly-references/add-reference.png "Add Reference"){: .large }](../images/assembly-references/add-reference.png)

2. The **Reference Manager** dialog window will appear. Click the **Browse..** button.

    [![Reference Manager](../images/assembly-references/reference-manager.png "Reference Manager"){: .large }](../images/assembly-references/reference-manager.png)

3. Navigate to the `bin/Debug` directory within your project and select the .dll assembly file.

    [![Locate the Assembly File](../images/assembly-references/locate-assembly.png "Locate the Assembly File"){: .large}](../images/assembly-references/locate-assembly.png)

4. Click the **OK** button to add the reference.

    [![Confirm the Addition of the Reference](../images/assembly-references/confirm-the-add.png "Confirm the Addition of the Reference"){: .large}](../images/assembly-references/confirm-the-add.png)

    You will now be able to see the reference as a node underneath **References** node in Solution Explorer.

    [![Reference List](../images/assembly-references/reference-list.png "Reference List"){: .large}](../images/assembly-references/reference-list.png)

    Once the assembly has been added to the project, you can now access the types within it.