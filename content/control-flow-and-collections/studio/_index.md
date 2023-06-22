---
title: "Studio: Counting Characters"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 3
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In this studio, you will write a program to count the number of times each
character occurs in a string and then print the results to the console.

Feel free to prompt the user for a string. However, for the sake of simplicity,
you might want to start by hard-coding some text and storing it in a variable.
For your convenience, here is a quote from the movie *Hidden Figures*:

   > If the product of two terms is zero then common sense says at least one of
   > the two terms has to be zero to start with. So if you move all the terms
   > over to one side, you can put the quadratics into a form that can be
   > factored allowing that side of the equation to equal zero. Once you’ve done
   > that, it’s pretty straightforward from there.

{{% notice green "Tip" "rocket" %}}
   Remember, you can turn a `String` object into an array of characters
   using:

   ```java
      char[] charactersInString = myString.toCharArray();
   ```
{{% /notice %}}

## Some Items to Ponder Before Starting

1. There are multiple ways to approach this task, but one way involves the
   following steps:

   a. Loop through the string one character at a time,
   b. Store and/or update the count for a given character using an appropriate
      data structure.
   c. Loop through the data structure to print the results (one character and its
      count per line).

1. Which type of data structure (`ArrayList`, `HashMap`, or `Array`)
   should you use to store character counts? Any can be made to work, but there
   is a BEST choice.
1. You’ll need to *initialize* the counts for the characters in some fashion.
   It’s probably better to do this as you go through the string instead of
   doing so before you loop through it. (*WHY?*)
   <!-- TODO: Add link to Chapter 2 studio -->
1. If you need to review how to create a new class, revisit the instructions in
   Studio: Area of a Circle.
1. Don’t forget to check out the *Bonus Missions* below.

## Sample Output

For the example string above, your output should look something like:

```console
   I: 1
   O: 1
   S: 1
   ’: 2
    : 66
   a: 20
   b: 2
   c: 7
   d: 7
   e: 32
   f: 9
   g: 2
   h: 13
   i: 11
   l: 6
   ,: 2
   m: 8
   n: 12
   .: 3
   o: 31
   p: 3
   q: 3
   r: 18
   s: 16
   t: 38
   u: 8
   v: 3
   w: 5
   y: 5
   z: 3
```

## Bonus Missions

Try these modifications on your code:

1. Prompt the user to enter the string in the command line.
1. Make the character counts case-insensitive.
1. Exclude non-alphabetic characters.

### Super Bonus

Read the string in from a file.

{{% notice blue "Note" "rocket" %}}
   This is a hard one. We won’t talk about reading from files in Java in this
   course, so be ready for a tough challenge if you accept this mission.
{{% /notice %}}