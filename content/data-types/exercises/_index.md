---
title: "Exercises: Data Types"
date: 2023-06-14T09:27:57-05:00
draft: false
weight: 3
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: Courtney Frey # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Getting Started

<!-- TODO: Link to chapter 1 for naming conventions-->

Work on these exercises in the IntelliJ `java-web-dev-exercises` project.  Create a new class for each numbered exercise. You may name the classes whatever you like, but use proper [Java Naming Conventions]({{< relref "../intro-and-setup/naming-conventions" >}}) and make sure that the file name matches the class name.



## Creating a Package and Classes

Here is how to create a new module to store these exercises, and how to create new classes within this package:

1. Click on the folder `java-web-dev-projects` in the Project pane, then right-click (or control-click for some Mac users) and select _New_ and then select _Module_.
1. Name the package `datatypes-exercises`.
1. Open the `src` folder (directory).
1. Open the `main` module.
1. Open the `java` folder (It's a blue folder)
1. Open the `org.launchcode` package folder.  You should see a class called `Main`.
1. Right-click/Control-click on the `org.launchcode` package and select _New_ and then _Java Class_.
1. Name this what you will name your class (for example, in the 4th exercise below, you might name the class `Alice` or `Sentence`).
1. Repeat steps 7 and 8 to create new classes.

   {{% notice blue "Example" "rocket" %}} 
   You will be asked whether you want to add this file to Git. Press the “Yes” or "Add" button.
   This is similar to `git init` and will allow you to stage your work later.
   {{% /notice %}}

1. You created the new class! You can proceed to write code within it. (Don’t forget to write the `main` method!)

## The Exercises

### A. Input/Output

Write a new “Hello, World” program to prompt the user for their name and greet them by name.

1. Follow steps 7 and 8 above to create a new `HelloWorld Class` inside of your `org.launchcode` folder.

1. Add an `import` statement at the the top of the file to include `Scanner`:
   ```java
   import java.util.Scanner;
   ```
1. Declare a variable of type `Scanner` called `input`:
   ```java
   Scanner input = new Scanner(System.in);
   ```
1. Add a question to ask the user:
   ```java
   System.out.println("Hello, what is your name:");
   ```
1. Create a variable to store the user’s response using the `Scanner`’s `.nextLine()` method
   ```java
   String name = input.nextLine();
   ```
1. Use concatenation to print the greeting:
   ```java
   System.out.println("Hello " + name);
   ```
Right-click/Control-click the arrow next to your class and run the program.

{{% expand "Check your solution" %}}
```java
package org.launchcode;

import java.util.Scanner;

public class HelloWorld {
   public static void main(String[] args) {
      Scanner input = new Scanner(System.in);
      System.out.println("Hello, what is your name:");

      String name = input.nextLine();
      System.out.println("Hello " + name);
   }
}
```
{{% /expand %}}

### B. Numeric Types

Write a program to calculate the area of a rectangle and print the answer to the console. You should prompt the user for the dimensions. (What data types should the dimensions be?)

1. Follow steps 7 and 8 above to create a new Class inside of your exercises.

1. Add an `import` statement at the top of your file to use `Scanner`.

1. Add a `Scanner` object to handle the user’s input.

1. Add a print line to prompt the user for the length of the rectangle.

1. Define a variable to handle the user’s response. Now is the time to know what type the dimension will be.

   {{% notice green "Tip" "rocket" %}} 
   You’ll need to use a different Scanner method than what we used in Exercise 1 above.
   {{% /notice %}}

1. Repeat the previous two steps to ask for and store the rectangle’s width.

1. Use the length and width values to calculate the rectangle’s area.

1. Print a statement using concatenation to communicate to the user what the area of their rectangle is.

1. Run the program to verify your code.

### C. Numeric Types

Write a program that asks a user for the number of miles they have driven and the amount of gas they’ve consumed (in gallons), and print their miles-per-gallon.

{{% expand "Check your solution" %}}
```java

   import java.util.Scanner;

   public class Miles {
      public static void main(String[] args) {
         Scanner input = new Scanner(System.in);

         System.out.println("How many miles have you driven?");
         Double numMiles = input.nextDouble();

         System.out.println("How much gas did you use? In gallons.");
         Double numGallons = input.nextDouble();

         Double mpg = numMiles / numGallons;
         System.out.println("You are running on " + mpg + " mpg.");
      }
   }
```
{{% /expand %}}

### D. Strings

The first sentence of _Alice’s Adventures in Wonderland_ is below. Store this sentence in a string, and then prompt the user for a term to search for within this string. Print whether or not the search term was found. Make the search case-insensitive, so that searching for “alice”, for example, prints `true`.

   > Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, 'and what is the use of a book,' thought Alice 'without pictures or conversation?'

   {{% notice blue "Note" "rocket" %}} 
   You may want to write the string above on more than one line in your solution. Java 17 and IntelliJ gives you a few options to do so. The easiest, thanks to your IDE, is to press Enter as you type the string. IntelliJ will close the string and concatenate it with the next line to create one longer string.
   {{% /notice %}}

### E. Strings

Extend the previous exercise. Assume the user enters a word that is in the sentence. Print out its index within the string and its length. Next, remove the word from the string and print the sentence again to confirm your code. Remember that strings are _immutable_, so you will need to reassign the old sentence variable or create a new one to store the updated phrase.

{{% expand "Check your solution" %}}
```java
   Integer index = firstSentence.indexOf(searchTerm);
   Integer length = searchTerm.length();
   System.out.println("Your search term first appears at index " + index + ". Your term is " + length + " characters long.");
   String modifiedSentence = firstSentence.replace(searchTerm, "");
   System.out.println(modifiedSentence);
```
{{% /expand %}}