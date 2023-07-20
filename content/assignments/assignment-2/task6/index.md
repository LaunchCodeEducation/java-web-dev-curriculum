---
title: "Task 6: Refactor to DRY the Support Classes"
date: 2023-06-05T10:20:54-05:00
draft: false
weight: 6
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-06-26T10:20:54-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

Review the code in the Employer, Location, CoreCompetency, and PositionType classes. What similarities do you see?

There is a fair amount of repetition between the classes. As a good coder, anytime you find yourself adding identical code in multiple locations you should consider how to streamline the process.

 > DRY = “Don’t Repeat Yourself”.

## Create a Base Class
Let’s move all of the repeated code into a separate class. We will then have `Employer`, `Location`, `CoreCompetency`, and `PositionType` inherit this common code.

1. Create a new class called `JobField` in the package `org.launchcode.techjobs.oo`.
1. Consider the following questions to help you decide what code to put in the `JobField` class:
   1. What fields do ALL FOUR of the classes have in common?
   1. Which constructors are the same in ALL FOUR classes?
   1. What getters and setters do ALL of the classes share?
   1. Which custom methods are identical in ALL of the classes?

1. In `JobField`, declare each of the common fields.
1. Code the constructors.
1. Use _Generate_ to create the appropriate getters and setters.
1. Add in the custom methods.
1. Finally, to prevent the creation of a `JobField` object, make this class abstract.

## Extend JobField into Employer
Now that you have the common code located in the `JobField` file, we can modify the other classes to reference this shared code. Let’s begin with Employer.

Modify line 5 to _extend_ the `JobField` class into `Employer`.

   ```java{linenos=table,hl_lines=[],linenostart=5}
   public class Employer extends JobField {

      //Code not displayed.

   }
   ```
1. Next, remove any code in `Employer` that matches code from `JobField` (e.g. the `id`, `value`, and `nextId` fields are shared).
1. Remove any of the getters and setters that are the same.
1. Remove any of the custom methods that are identical.
1. The empty constructor is shared, but not the second. Replace the two constructors with the following:
   ```java{linenos=table,hl_lines=[],linenostart=7}
   public Employer(String value) {
   super(value);
   }
   ```
   The `extends` and `super` keywords link the `JobField` and `Employer` classes.

1. Rerun your unit tests to verify your refactored code.

## Finish DRYing Your Code
Repeat the process above for the `Location`, `CoreCompetency`, and `PositionType` classes.

Rerun your unit tests to verify that your classes and methods still work.

{{% notice green "Tip" "rocket" %}} 
 You know you need to do this, but here is the reminder anyway. `Save`, `commit`, and `push` your work to GitHub.
{{% /notice %}}

[Next]({{< relref "../../../assignments/techjobs-oo/task7/index.md" >}})