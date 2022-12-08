---
layout: default
title: About Form
parent: Windows Forms Apps
nav_order: 5
---

#  About Form

## Creating An About Form

The About Box is a Visual Studio source code template of a Form designed and implemented for an application's About dialog window.

[![Visual Studio's About Box Template](../images/about-form/about-box-template.png "Visual Studio's About Box Template"){:.large}](../images/about-form/about-box-template.png)

The implementation in the About Box template extracts information from the application's assembly information and displays it on the form.

An About Box must be opened as a modal window. It is not opened as a modal window, its implementation may not function correctly.

[![Example About Window](../images/about-form/completed-about-form.png "Example About Window"){:.large}](../images/about-form/completed-about-form.png)

## Editing Assembly Information

To edit assembly information for an application:

1. Right-click the project in Solution Explorer and choose "Properties" (the very last menu item) from the context menu. This will open a tab in the editor panel of Visual Studio.

    [![Project Properties](../images/about-form/properties-menu-item.png "Project Properties"){:.large}](../images/about-form/properties-menu-item.png)

2. Select the "Application" from the items along the left-hand side of the window (if it is not already selected).

    [![Application Properties](../images/about-form/application-tab.png "Application Properties"){:.large}](../images/about-form/application-tab.png)

3. Click the "Assembly Information..." button. This will open a dialog window.

    [![Assembly Information Button](../images/about-form/assembly-information-button.png "Assembly Information Button"){:.large}](../images/about-form/assembly-information-button.png)

4. Modify the fields on the Assembly Information form.

    [![Assembly Information Window](../images/about-form/assembly-information-window.png "Assembly Information Window"){:.large}](../images/about-form/assembly-information-window.png)