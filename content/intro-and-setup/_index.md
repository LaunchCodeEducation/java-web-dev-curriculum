---
title: "Chapter 1: Introduction and Setup"
date: 2021-10-01T09:28:27-05:00
weight: 1
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

[Java Development Kit]: #java-development-kit
[JDK]: #java-development-kit
[javac]: #java-development-kit
[Java Virtual Machine]: #java-development-kit
[JVM]: #java-development-kit
[compiling-java]: #compiling-java
[bytecode]: #compiling-java
[terminal-java]: #terminal-java

For the entirety of this course, we will be coding in Java. Besides installing Java on your machine, you must also add some support technologies to 
allow you to run and edit Java code.

## Java Development Kit

Installing Java means downloading a package of software called the **Java Development Kit**,
or **JDK**, for short. The JDK contains software the tools needed to develop and
run Java code, namely the Java compiler, **javac**, and the 
**Java Virtual Machine (JVM)**. 

While the compiler is responsible for processing Java code into machine-readable
code, the JVM allows us to run that code on any computer. These tools 
together, downloaded as the JDK, give us the means to write, compile, and run Java
on our machines.

A step-by-step walk-through of the process:

1. We write code in Java,
2. The code is passed through the compiler program,
3. The compiler translates Java into **bytecode**, a language readable by the JVM.
4. In the JVM, bytecode is translated to machine code,
5. Your computer then reads and executes the machine code.

The JVM gives Java more flexibility than other compiled programming languages because
it will translate bytecode into the appropriate machine code, depending on the 
operating environment.

### Install the JDK

Open a terminal window on your machine and enter the following command:

```bash
java -version
```

<!-- TODO: Link to correct location in the below link. We may also need to update to a different version. -->
If the response returns a major version 17, you can move on to the section below, [terminal-java](#terminal-java).

If you do not have Java 17, or the command does not work, you can download 
it [here](https://www.oracle.com/java/technologies/downloads/#java17). 

![Screenshot of different Java installation options on Oracle's website](pictures/installJava.png?classes=border)

Be sure to select your Operating System from the tab options.

The figure above shows options for downloading Java 17.

- **Mac users**: we recommend the `.dmg` option
- **Windows users**: we recommend the `.exe` option

To install, you must first select *Accept License Agreement*. 

Make note of the location where the Java JDK has been installed on your computer. 

- **Mac users**: This should be `/Library/Java/JavaVirtualMachines`.

- **Windows users**: This should be in the C: Drive under `Program Files`

Once you have completed the installation steps, move onto the next section.
