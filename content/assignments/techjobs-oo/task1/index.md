---
title: "Task 1: Explore the Employer Class"
date: 2023-06-05T10:20:54-05:00
draft: false
weight: 1
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-06-26T10:20:54-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

Open the `Employer` file in IntelliJ and examine the code. In addition to the two fields—`id` and `value`—the class includes the standard getters and setters as well as some custom methods like `toString` and `equals`.

You can refer to these examples as you fill in the missing pieces in the other classes, but for now let’s take a closer look at the constructors.

## Assign a Unique ID

One neat trick we can use is to automatically assign each new object a unique ID number.

{{% notice blue "Example" "rocket" %}} 
Examine the two constructors in `Employer.java`

```java{linenos=table,hl_lines=[],linenostart=1}
public class Employer {
   private int id;
   private static int nextId = 1;
   private String value;

   public Employer() {
      id = nextId;
      nextId++;
   }

   public Employer(String aValue) {
      this();
      this.value = aValue;
   }

   // Getters and setters omitted from this view.
}
```
{{% /notice %}}

1. Line 3 declares the variable `nextId`. Since it is `static`, its changing value is NOT stored within any `Employer` object.

1. The first constructor (lines 6 - 9) accepts no arguments and assigns the value of `nextId` to the id field. It then increments `nextId`. Thus, every new `Employer` object will get a different ID number.

1. The second constructor (lines 11 - 14) assigns `aValue` to the `value` field. However, it ALSO initializes `id` for the object by calling the first constructor with the `this();` statement. Including `this();` in any `Employer` constructor makes initializing id a default behavior.

[Next]({{< relref "../../../assignments/techjobs-oo/task2/index.md" >}})

