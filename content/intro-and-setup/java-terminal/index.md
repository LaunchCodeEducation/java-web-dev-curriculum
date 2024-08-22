---
title: "Java in the Terminal"
date: 2021-10-01T09:28:27-05:00
weight: 2
draft: false
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Let's write a simple "Hello, World" program and watch the JDK in action. 

In the future, we'll be doing most of our Java coding with the IntelliJ IDE. 
IntelliJ contains many features to help us write Java properly and easily, 
including its own compiler. For now though, we'll use a simpler text editor 
so we can demonstrate what we get with the JDK.

In the text editor of your choice, create and save a file called 
`HelloWorld.java` and include the code below:

```java {linenos=table}
   public class HelloWorld {

      public static void main(String[] args) {

         System.out.println("Hello, World");
      }

   }
```

{{% notice green "Tip" "rocket" %}} 
 If you are not able to save a file with a `.java` extension using a text editor, try the following:
   1. Open a terminal. Use terminal commands to find the directory you wish to save your new file in.
   1. Use the following commands to create your `.java` file:
      `touch HelloWorld.java`
   1. Return to your text editor and open the file you just created.  
   1. Paste in the `HelloWorld` code from the textbook and save the document.
   1. You should now be able to run the program in the terminal by following the rest of the instructions.
{{% /notice %}}

We'll discuss the syntax of this program soon, but you can likely predict
that this program has an expected output of "Hello, World". To test this hypothesis,
open a terminal window and navigate to the parent directory of your new file. Run:

```console
   java HelloWorld.java
```

You should see your greeting printed! 

{{% notice orange "Warning" "rocket" %}}
   Whenever using the terminal in this course, use Git Bash as opposed to Windows Command Prompt.
{{% /notice %}}

Recall from the walk-through on the [previous page]({{< relref "../setup/index.md">}}), Java needs to be compiled before executing. Java version 17 has
the capability to compile single-file Java programs without explicitly running a command to compile. If our 
`Hello, World` program were more complex and contained another file, we would need to first run 
`javac HelloWorld.java`, to compile, followed by `java HelloWorld.java`.
