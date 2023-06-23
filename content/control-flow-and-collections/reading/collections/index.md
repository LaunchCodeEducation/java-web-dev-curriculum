---
title: "Collections"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 3
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Data Structures

A **data structure** lets us hold on to lots of data in a single place. It 
is a programming construct to aggregate lots of values into one value. Many 
types of data structures exist in various languages. A few examples are 
lists, dictionaries, arrays, tuples, etc. 

## Java Collections Framework

Java provides powerful and flexible structures to store data, known as
**collections**. The **Java collections framework** refers to the various interfaces
the language provides for implementing collection types. 

Here, we'll discuss a collection called `ArrayList` and compare it to the 
`Array` class. We'll then introduce a third collection type called `HashMap`. 
These three collection types will be sufficient for our basic Java needs. 
For more, refer to the official Java documentation on [collections](http://docs.oracle.com/javase/8/docs/api/java/util/Collections.html).

## Gradebook, Three Ways

We’ll explore collections in Java by looking at different versions of
the same program. The program functions as a gradebook, allowing a
user (a professor or teacher) to enter the class roster for a course,
along with each student’s grade. It then prints the class roster along
with the average grade. In each variation of this program, the grading
system could be anything numeric, such as a 0.0-4.0 point scale, or a
0-100 percentage scale.

A test run of the program might yield the following:

```console
   Enter your students (or ENTER to finish):
   Chris
   Jesse
   Sally

   Grade for Chris: 3.0
   Grade for Jesse: 4.0
   Grade for Sally: 3.5

   Class roster:
   Chris (3.0)
   Jesse (4.0)
   Sally (3.5)

   Average grade: 3.5
```

We’ll look at the gradebook using an `Arraylist` first. 

{{% notice blue "Note" "rocket" %}}
   To run the code as you learn about different collections, navigate to the `control-flow-and-collections` directory in `java-web-dev-projects`. Within this directory, you will find a `chapter-example` directory with a working IntelliJ project inside. The `student-example` project has three classes that show how each of the three collections we are covering in this chapter can be used to make a gradebook application.
{{% /notice %}}
