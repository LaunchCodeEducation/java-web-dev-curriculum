---
title: "Task 5: Use TDD to Build The toString Method"
date: 2023-06-05T10:20:54-05:00
draft: false
weight: 5
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-06-26T10:20:54-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

To display the data for a particular `Job` object, you need to implement a custom toString method. Rather than creating this method and then testing it, you will flip that process using TDD.

## Create First Test for toString
Before writing your first test, consider how we want the method to behave:

1. When passed a `Job` object, it should return a string that contains a blank line before and after the job information.

1. The string should contain a label for each field, followed by the data stored in that field. Each field should be on its own line.

   ```bash
   ID:  _______
   Name: _______
   Employer: _______
   Location: _______
   Position Type: _______
   Core Competency: _______
   ```
1. If a field is empty, the method should add, “Data not available” after the label.

4. (Optional) If a Job object ONLY contains data for the id field, the method should return, “OOPS! This job does not seem to exist.”

In JobTest, add a new test named testToStringStartsAndEndsWithNewLine to check the first requirement. Be sure to use assertEquals to verify that these characters are correct, and to use the exact formatting demonstrated above.

{{% notice orange "Warning" "rocket" %}} 
 This test should check that the string starts and ends with a new line.  

 Be sure to use `System.lineSeparator()` to declare a new line. This is an [universal line break](https://www.geeksforgeeks.org/system-lineseparator-method-in-java-with-examples/) that works on a variety of operating systems (OS).

 You will need to use the `lineSeparator()` in the `Job` class and the `JobTests`.  
{{% /notice %}}

Woo hoo! Failure is what we want here! Now you get to fix that.

## Code toString to Pass the First Test

In the `Job` class, create a `toString` method that passes the first test. Since the test only checks if the returned string starts and ends with a blank line, make that happen.

{{% notice green "Tip" "rocket" %}} 
 Do NOT add anything beyond what is needed to make the test pass. You will add the remaining behaviors for `toString` as you code each new test.
{{% /notice %}}

## Finish the TDD for `toString`
1. Code a new test for the second required behavior, named `testToStringContainsCorrectLabelsAndData`. Then run the tests to make sure the new one fails.

1. Modify `toString` to make the new test pass. Also, make sure that your updates still pass all of the old tests.

1. Follow the same TDD process for the third requirement, creating a test named `testToStringHandlesEmptyField`.

{{% notice orange "Warning" "rocket" %}} 
 As usual, the autograding tests are very picky about capitalization and spaces, so your code should match the format shown above _exactly_.
{{% /notice %}}

Cool! Your `Job` class is now complete and operates as desired.

[Next]({{% relref "../../../assignments/techjobs-oo/task6/index.md" %}})