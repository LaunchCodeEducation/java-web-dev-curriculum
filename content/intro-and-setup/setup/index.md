---
title: "Setup for Java"
date: 2021-10-01T09:28:27-05:00
weight: 1
draft: false
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-08-29 # UPDATE ANY TIME CHANGES ARE MADE
---

For the entirety of this course, we will be coding in Java. Besides installing Java on your machine, you must also add some support technologies to 
allow you to run and edit Java code.

## Java Development Kit

Installing Java means downloading a package of software called the **Java Development Kit**,
or **JDK**, for short. The JDK contains the software tools needed to develop and
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

If the response returns a major version 17, you can move on to the next page, [Java in the Terminal]({{< relref "../java-terminal/" >}}).

If you do not have Java 17, or the command does not work, you can download 
it [here](https://www.oracle.com/java/technologies/downloads/#java17). 

![Screenshot of different Java installation options on Oracle's website](figures/installJava.png?classes=border)

Be sure to select your Operating System from the tab options.

The figure above shows options for downloading Java 17.

- **Mac users**: we recommend the `.dmg` option.  The ARM64 option is preferred if you have a recent Mac with an Apple Silicon processor (M1, M2, M...), otherwise choose the x64 option for Macs with an Intel processor.
- **Windows users**: we recommend the `.exe` option

To install, you must first select *Accept License Agreement*. 

Make note of the location where the Java JDK has been installed on your computer. 

- **Mac users**: This should be `/Library/Java/JavaVirtualMachines`.

- **Windows users**: This should be in the C: Drive under `Program Files`

Once you have completed the installation steps, move onto the next section.
