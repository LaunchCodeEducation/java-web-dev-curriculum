---
title: "Java Naming Conventions"
date: 2021-10-01T09:28:27-05:00
weight: 6
draft: false
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Java has some very straightforward naming conventions. These are
universally used by Java programmers, and differ in some cases from
conventions commonly used in other languages.

Again, these are conventions. Ignoring them will not prevent your code from running, 
as long as you are following Java’s [naming
rules](http://docs.oracle.com/javase/specs/jls/se8/html/jls-3.html#jls-3.8). Java’s 
identifier naming rules are somewhat hard to parse, so a good
rule-of-thumb is that you should use only letters, numbers, and the
underscore character `_`, and they should always start with a letter.

The naming conventions are more like guidelines than rules and are what other Java coders 
expect to see when reading your code.

| Identifier Type | Convention | Examples |
|-----------------|------------|----------|
| Package | All lowercase | `demos.javawebdevelopment`,  `org.launchcode.utilities` |
| Class | Start with an uppercase letter | `Scanner`, `System`, `Cello` | 
| Method | Start with a lower case letter, and use camelCase to represent multi-word method names | `nextInt()`, `getId()` | 
| Instance variable | Start with a lowercase letter and use camelCase | `id`, `firstName` |
| Constant | All uppercase letters, words separated by underscores | `MAX_INT` |

{{% notice blue "Note" "rocket" %}}
   Constants in Java are variables created using both `static` and
   `final` modifiers. For example: `static final Double PI = 3.14159`
{{% /notice %}}

{{% notice green "Tip" "rocket" %}}
   If you're not sure about all of these identifier types yet, that's ok. Keep
   this page in mind for future reference as you read through this book.
{{% /notice %}}

Oracle, the company that develops the Java language, provides some [more detailed naming conventions](https://www.oracle.com/java/technologies/javase/codeconventions-namingconventions.html).
(From the date on this article, you’ll note that these have been
relatively standard for a very long time!)