---
title: "Exercises: Control Flow and Collections"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: John Woolbright # to be set by the page reviewer
reviewerGitHub: jwoolbright23 # to be set by the page reviewer
lastEditor: Colin Brock # update any time edits are made after review
lastEditorGitHub: ColinBrock # update any time edits are made after review
lastMod: 2023-11-27 # UPDATE ANY TIME CHANGES ARE MADE
---

<!-- TODO: Add link to Chapter 1, naming conventions -->

Work on these exercises in the `java-web-dev-projects` repo,creating a new class for each item. You may call these classes whatever you
like, but remember to use the proper Java naming conventions.

1. Navigate inside `control-flow-and-collections` within `java-web-dev-projects` and create a new folder called `exercises`.
1. Create a new IntelliJ project within your new `exercises` directory called `collections-exercises`.

Now you are ready to start creating new classes and practice using different collections!

## Array Practice

1. Create and initialize an array with the following values in a single line: `1, 1, 2, 3, 5, 8`.

   {{% expand "Check your solution" %}}
   ```java
   int[] integerArray = {1, 1, 2, 3, 5, 8};
   ```
   {{% /expand %}}

1. Loop through the array and print out each value, then modify the loop to only print the odd numbers.
   <!-- TODO: Add link to Chapter 2 string methods -->
1. For this exercise, use the string "I would not, could not, in a box. I
   would not, could not with a fox. I will not eat them in a house. I will not
   eat them with a mouse." Use the `split` method to divide the string at
   each space and store the individual words in an array. If you need to review
   the method syntax, look back at the string methods table.

   {{% expand "Check your solution" %}}
   ```java
   String phrase = "I would not, could not, in a box. I would not, could not with a fox. I will not eat them in a house. I will not eat them with a mouse.";
   String[] words = phrase.split(" ");
   System.out.println(Arrays.toString(words));
   ```
   {{% /expand %}}

1. Print the array of words to verify that your code works. The syntax is:

   ```java
      System.out.println(Arrays.toString(arrayName));
   ```

1. Repeat steps 3 and 4, but change the delimiter to split the string into separate sentences.

   {{% expand "Check your solution" %}}
   ```java
   String[] sentences = phrase.split("\\.");
   System.out.println(Arrays.toString(sentences));
   ```
   {{% /expand %}}

{{% notice blue "Note" "rocket" %}}
   Some characters, like a period `"."`, have special meanings when used with
   the `split` method. They cannot be used as-is for the delimiter.

   To use these characters as the delimiter, we must *escape* their special
   meanings. Instead of `.split(".")`, we need to use `.split("\\.")`.
{{% /notice %}}

## ArrayList Practice

1. Write a static method to find the sum of all the even numbers in an
   ArrayList. Within `main`, create a list with at least 10 integers and call
   your method on the list.

   {{% expand "Check your solution" %}}
   ```java {linenos=table}
   public static int sumEven(ArrayList<Integer> arr) {
   int total = 0;
   for (int integer : arr) {
      if (integer % 2 == 0) {
         total += integer;
      }
   }
   return total;
   }
   ```
   {{% /expand %}}

1. Write a static method to print out each word in a list that has exactly 5
   letters.
1. Modify your code to prompt the user to enter the word length for the search.

   {{% expand "Check your solution" %}}
   ```java
   System.out.println("Enter a word length: ");
   int numChars = input.nextInt();
   ```
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
```java {linenos=table}
do {
   System.out.print("Student: ");
   newStudent = input.nextLine();

   if (!newStudent.equals("")) {
      System.out.print("ID: ");
      Integer newID = input.nextInt();
      classRoster.put(newID, newStudent);

      input.nextLine();
   }
} while(!newStudent.equals(""));

input.close();

System.out.println("\nClass roster:");

for (Map.Entry<Integer, String> student : classRoster.entrySet()) {
   System.out.println(student.getValue() + "'s ID: " + student.getKey());
}

System.out.println("Number of students in roster: " + classRoster.size());
```
{{% /expand %}}