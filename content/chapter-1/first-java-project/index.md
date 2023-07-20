---
title: "Your First Java Project"
date: 2021-10-01T09:28:27-05:00
weight: 4
draft: false
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Following the "Hello, World" trend, let's create a new IntelliJ project.

1. Create a new folder to hold your Java practice files. Since you will be
   creating lots of small projects as you move through this course, we
   suggest that you also add sub-folders with names corresponding to the
   related chapters and projects. Something like
   `java-practice/chapter-name/project-name`.
1. Select the *New Project* option from the welcome screen.
1. Clicking *New Project* opens a window with a series of project settings to
   select. This window is called the *new project wizard*.

   1. Name your project.  In this example, we named our project `HelloWorld`.
   1. Select the *Location* to save your project.  The reading suggested using a folder to store all of your Java projects.  This example is using the Desktop.
   1. Choose *Java* from the *Language* options.
   1. For the *Build System*, select *Maven*.  We will discuss build systems more in a later lesson.
   1. For *JDK*, you'll want to use version *17* that you have downloaded. 
      If *17* is not already selected in the SDK window, click *New* on the right and find the JDK you have just downloaded.
   1. Check the *Add sample code* option for this project.  This will allow you to run Java in the terminal.
   1. Select *Create* to create your new Java project.

1. You should now see your new Java Project. Below is the view of your new project.
   The section on the left is the project's **file tree**.
   
   1. Click on the item labeled *Project* with an icon that looks like a file folder on the left of the project window.  This will list the files in your file tree.  
   1. Explore your file tree until you find your `Main.java` file.  
      Clicking the triangle next to the project name, `HelloWorld`, displays the `src` file, 
      followed by the base package we created, and finally our ``Main.java`` file. 
   1. `Main.java` is also opened on the right in this initial project view. 
   
   In line 1, `package org.example`, establishes a *package*, which Java uses to help
   organize and encapsulate our code. This is a default setting.  
   You can update this in the *New Project Wizard* under the *Advanced Settings* drop down menu.
   For this project, the default setting is all we need.

1. In line 3, you should see the `Main` class.  We'll dive into the use of a `main` function and `Main` class later. At this point, let's just get right to printing our greeting. Somewhere in your project you should see the following command:

   ```java
      System.out.println("Hello, world!");
   ```
   Before we run this program, let's guess what the output will be.
   Ok sure, we haven't gone over this exact syntax yet, but you can take a guess at what this line will do.

1. To run your program in IntelliJ, you have several options.
   You can click on any of the green triangles to the left of the class and function names or choose *Run* from your top menu bar.

   {{% notice blue "Note" "rocket" %}}
   If you are having trouble running your program, try selecting the Main project from the *Configuations* menu.
   This is located between the green hammer and the green *Run* triangle on the top left of your menu.
   {{% /notice %}}

1. Once run, IntelliJ will generate a third panel in your view, with your program's output at the bottom of the screen.

This is just the start of your relationship with IntelliJ. Now that we know the fundamentals,
let's return to Java basics so we can start writing more code.

## Check Your Understanding

{{% notice green "Question" "rocket" %}}
   Given the code below, which line is responsible for printing a message?

   ```java {linenos=table}
      public class HelloWorld {

         public static void main(String[] args) {
            System.out.println("Hello, World");
         }

      }
   ```

   1. line 1
   1. line 3
   1. line 4

{{% /notice %}}

{{% notice green "Question" "rocket" %}}
   In the sourcecode above, which line is responsible for defining the class?

   1. line 1
   1. line 3
   1. line 4
{{% /notice %}}