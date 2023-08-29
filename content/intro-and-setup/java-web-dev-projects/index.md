---
title: "Java Web Dev Projects"
date: 2021-10-01T09:28:27-05:00
weight: 5
draft: false
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-08-29 # UPDATE ANY TIME CHANGES ARE MADE
---

## Initial Setup

The steps here will walk you through setting up the repository that you’ll
use to study example code, work on studios, and complete your first
assignment of this unit.

1. Create a *Fork* of [LaunchCodeEducation/java-web-dev-projects](https://github.com/LaunchCodeEducation/java-web-dev-projects).
   Do not clone and create a local version of this repo just yet.

1. Open IntelliJ.

   {{% notice blue "Note" "rocket" %}}
   If the app opens up to an existing project, simply close that window to
   return to the welcome screen.
   
   If you prefer to have IntelliJ NOT open your most recent project:
   
   1. **Mac users**: Select
      *IntelliJ > Preferences > Appearance & Behavior > System Settings* and
      un-check *Reopen projects on startup*.
   1. **Windows users**: Use *File > Settings > Appearance & Behavior > System
      Settings*.

   {{% /notice %}}

1. The *Welcome to IntelliJ* dialog looks different now. It includes a list of
   your most recent projects. However, we have the same three options in the
   upper-right corner. Select *Get from VCS*.

1. Select the *GitHub* option on the left side of the next window. Click
   *Log In via GitHub* or *Use token* and follow the on-screen prompts.

   {{% notice blue "Note" "rocket" %}}
   To work with a remote repository in IntelliJ, you need to configure the
   program to access your GitHub account. We recommend authenticating your
   account using a **token**. This takes only one brief extra step, and will
   prevent you from having to update IntelliJ settings whenever you change
   your GitHub password.
   {{% /notice %}}

1. Now return to the *Repository URL* tab. From the URL dropdown options,
   select your fork of `java-web-dev-projects`, along with an appropriate
   destination directory (like the folder where you’ve stored other projects
   for this class).

   When ready, click the *Clone* button!

1. If you're asked about other settings for your project. Select the *Next*
   button every time to accept the default options.
1. When your project is ready, you'll see a page that looks like the image
   below. Click on Load, if you are prompted to load the Gradle Build Scripts.
   
   ![Screenshot of IntelliJ window of your fork of `java-web-dev-projects`]
   (figures/IntelliJWindow.png?classes=border)

1. You should see the file structure of the project you have just set up.  If
   you do not, click on the folder icon in the upper left corner.

1. Navigate down *datatypes/datatype-examples/src/main/java/org.launchcode*
   and double-click on the *HelloMethods* file.  This will open it in the
   workspace to the right.

1. To run the *HelloMethods* program, click on the green arrow next to the class
   definition and select *Run 'HelloMethods.main()'* from the dropdown menu.

   After a few seconds, you should see a new window appear with your program's
   output.
   
   {{% notice blue "Note" "rocket" %}}
   You may have a message saying the Project JDK is not defined. Click on
   'Setup SDK' and select the Java 17 version.
   {{% /notice %}}

With that, you’re ready to go!

## Troubleshooting

### ClassNotFoundException

After setting up the project, if you experience `java.lang.ClassNotFoundException`
when you run the code, follow these steps:

1. Select *File > Close Project*. If you have any other IntelliJ projects open,
   close them as well.

1. You should see the IntelliJ startup window. Click the gear icon next to
   `java-web-dev-projects` and select *Remove from Recent Projects*.

1. From the same startup window, select
   *File --> New --> Project from Existing Sources*.

1. When prompted, select the `java-web-dev-projects` folder and click *Open*.
1. In the next panel, select the *Create project from existing sources* radio
   button. Click *Next*.

1. Follow the steps that IntelliJ guides you through, accepting all defaults.
   Each time you are prompted to overwrite IntelliJ settings files, confirm
   that you want to do so.
1. Eventually the project will open, and you can successfully run your code!