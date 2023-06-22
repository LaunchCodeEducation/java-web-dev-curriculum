---
title: "Exercises: Control Flow and Collections"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

<!-- TODO: Add link to Chapter 1 -->

Work on these exercises in the IntelliJ `java-web-dev-exercises` project,
creating a new class for each item. You may call these classes whatever you
like, but remember to use the proper Java naming conventions.

## Array Practice

1. Create and initialize an array with the following values in a single line: `1, 1, 2, 3, 5, 8`.

   {{% expand "Check your solution" %}}
   {{% /expand %}}

1. Loop through the array and print out each value, then modify the loop to only print the odd numbers.
   <!-- TODO: Add link to Chapter 2 -->
1. For this exercise, use the string "I would not, could not, in a box. I
   would not, could not with a fox. I will not eat them in a house. I will not
   eat them with a mouse." Use the `split` method to divide the string at
   each space and store the individual words in an array. If you need to review
   the method syntax, look back at the string methods table.

   {{% expand "Check your solution" %}}
   {{% /expand %}}

1. Print the array of words to verify that your code works. The syntax is:

   ```java
      System.out.println(Arrays.toString(arrayName));
   ```

1. Repeat steps 3 and 4, but change the delimiter to split the string into separate sentences.

   {{% expand "Check your solution" %}}
   {{% /expand %}}

{{% notice blue "Note" "rocket" %}}
   Some characters, like a period `"."`, have special meanings when used with
   the `split` method. They cannot be used as-is for the deliminator.

   To use these characters as the deliminator, we must *escape* their special
   meanings. Instead of `.split(".")`, we need to use `.split("\\.")`.
{{% /notice %}}

## ArrayList Practice

1. Write a static method to find the sum of all the even numbers in an
   ArrayList. Within `main`, create a list with at least 10 integers and call
   your method on the list.

   {{% expand "Check your solution" %}}
   {{% /expand %}}

1. Write a static method to print out each word in a list that has exactly 5
   letters.
1. Modify your code to prompt the user to enter the word length for the search.

   {{% expand "Check your solution" %}}
   {{% /expand %}}

1. BONUS: Instead of creating our own list of words, what if we want to use the
   string from the *Array Practice* section? Search "Java convert String to
   ArrayList" online to see how to split a string into the more flexible
   `ArrayList` collection.

## HashMap Practice

Make a program similar to `GradebookHashMap` that does the following:

1. It takes in student names and ID numbers (as integers) instead of names and
   grades.
1. The keys should be the IDs and the values should be the names.
1. Modify the roster printing code accordingly.

{{% expand "Check your solution" %}}
{{% /expand %}}