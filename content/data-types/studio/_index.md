---
title: "Studio: Area of a Circle"
date: 2023-06-14T09:27:57-05:00
draft: false
weight: 3
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: Courtney Frey # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Colin Brock # update any time edits are made after review
lastEditorGitHub: ColinBrock # update any time edits are made after review
lastMod: 2023-11-27 # UPDATE ANY TIME CHANGES ARE MADE
---

Get cozy with Java syntax by writing a console program that calculates the area of a circle based on input from the user.

## Creating your class
Since you’re still new to Java and IntelliJ, we’ll provide some extra direction for the first studio.

1. Within the `datatypes-studio` directory create the following directory structure: `src/main/java`.
1. Create a new package named `org.launchcode` by right-clicking (or ctrl-clicking for some Mac users) on the `java` directory and selecting _New_ > _Package_. Be sure to enter `org.launchcode` as the full name, or your package won’t be created in the correct location.

{{% notice blue Note "rocket" %}}
You may have to right click on the `java` directory and mark the directory as "Sources root" in order to create a new package.
{{% /notice %}}

3. Create a new class inside the package by right-clicking/ctrl-clicking on the `org.launchcode` package/folder and selecting _New_ > _Java Class_. 
4. Name the class `Area`.  Select the option to add the file to Git when the window appears.

## A. The `Area` Class

Write a class, `Area`, that prompts the user for the radius of a circle and then calculate its area and print the result.

{{% notice green "Tip" "rocket" %}} 
 Recall that the area of a circle is A = pi * r * r where pi is 3.14 and r is the radius.

 Unlike some other languages, Java does not have an exponent operator.
{{% /notice %}}

Here’s an example of how your program should work:
```bash
Enter a radius: 
2.5
The area of a circle of radius 2.5 is: 19.625
```

Some questions to ask yourself:

1. What data type should the radius be?
1. What is the best way to get user input into a variable `radius` of that type?

{{% notice orange "Warning" "rocket" %}} 
 Be sure to create a main method to place your code within. It’s signature must be:

 ```java
 public static void main(String[] args)
```
{{% /notice %}}

## B. The `Circle` Class

Add a second Java file to your program to delegate the area calculation away from the printing task.

1. Add a new class in your `studios.areaofacircle` package called `Circle`.
1. Create a method called `getArea` inside of `Circle` that takes a `Double` `radius` as its only parameter and returns another `Double`, the result of the area calculation.
   {{% notice green "Tip" "rocket" %}} 
   ```java
   public static Double getArea(Double radius) {
   return 3.14 * radius * radius;
   }
   ```
   {{% /notice %}}
1. Back in `Area`, replace your area calculation line with a call to `Circle`.`getArea()`.

   {{% notice green "Tip" "rocket" %}} 
   Check out the HelloMethods and Message example from [Static Methods](../reading/more-data-types/#static-methods) for a reference on how to use a class from another file.
   {{% /notice %}}

Great work! Don't forget to save, `stage`, and `commit` your work up to GitHub.

## Bonus Missions
1. Add validation to your program. If the user enters a negative number? a non-numeric character? the empty string? Print an error message and quit. You’ll need to peek ahead to learn about [conditional syntax in Java](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/if.html).

1. Extend your program further by using a [while or do-while loop](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html), so that when the user enters a negative number they are re-prompted.