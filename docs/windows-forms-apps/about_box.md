---
title: About Box
layout: default
---
About Box
=========

The About Box is a Visual Studio source code template of a Form designed and implemented for an application's About dialog window.

![Visual Studio's About Box Template](images/about_box_template.png){:.img-responsive}

The implementation in the About Box template extracts information from the application's assembly information and displays it on the form.

An About Box must be opened as a modal window. It is not opened as a modal window, its implementation may not function correctly.

![Example About Window](images/completed_about_form.png){:.img-responsive}

Editing Assembly Information
----------------------------

To edit assembly information for an application:

{:.instructions}
1. Right-click the project in Solution Explorer and choose "Properties" (the very last menu item) from the context menu. This will open a tab in the editor panel of Visual Studio.

    ![Project Properties](images/properties_menu_item.png){:.img-responsive}

2. Select the "Application" from the items along the left-hand side of the window (if it is not already selected).

    ![Application Properties](images/application_tab.png){:.img-responsive}

3. Click the "Assembly Information..." button. This will open a dialog window.

    ![Assembly Information Button](images/assembly_information_button.png){:.img-responsive}

4. Modify the fields on the Assembly Information form.

    ![Assembly Information Window](images/assembly_information_window.png){:.img-responsive}