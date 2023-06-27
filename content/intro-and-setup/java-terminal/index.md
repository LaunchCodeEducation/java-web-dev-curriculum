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

## Mac Users

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

We'll discuss the syntax of this program soon, but you can likely predict
that this program has an expected output of "Hello, World". To test this hypothesis,
open a terminal window and navigate to the parent directory of your new file. Run:

```console
   java HelloWorld.java
```

You should see your greeting printed! 

Recall from the walk-through on the [previous page]({{< relref "../setup/">}}), Java needs to be compiled before executing. Java version 17 has
the capability to compile single-file Java programs without explicitly running a command to compile. If our 
`Hello, World` program were more complex and contained another file, we would need to first run 
`javac HelloWorld.java`, to compile, followed by `java HelloWorld.java`.

## Windows Users

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

We'll discuss the syntax of this program soon, but you can likely trust your gut
that this program has an expected output of "Hello, World". 

{{% notice orange "Warning" "rocket" %}}
   Whenever using the terminal in this course, use Git Bash as opposed to Windows Command Prompt.
{{% /notice %}}

To test this hypothesis, open a terminal window and navigate to the parent directory of your new file.
In a separate window, navigate to the `bin` folder in the Java Development Kit to get the file path by going to `Program Files\Java` and opening the folder for JDK 17. Copy the file path.

Run the following command, replacing the `{filepath}` with the file path to your JDK that you just copied:

```console
   set PATH=%PATH%;{filepath}
```

This command sets a path in our system for `java` so that we can compile and run Java programs. 
To make use of the new `java` command, you may have to restart your terminal window by closing it and opening a new one.

Make sure that you are in your project's directory.

```console
   java HelloWorld.java
```

You should see your greeting printed! 

Recall from the walk-through on the [previous page]({{< relref "../setup/">}}), Java needs to be be compiled before executing. Java version 17 has 
the capability to compile single-file Java programs without explicitly running a command to compile. If our 
`Hello, World` program were more complex and contained another file, we would need to first run 
`javac HelloWorld.java`, to compile, followed by `java HelloWorld.java`.

{{% notice blue "Note" "rocket" %}}
   These steps change the path in just that directory.
   While this is sufficient to get us through the rest of the course, you may want change the system path for your whole system.
   Check out these [instructions](https://www.java.com/en/download/help/path.xml) to change the path globally.
{{% /notice %}}