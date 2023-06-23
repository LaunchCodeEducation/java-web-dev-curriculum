---
title: "Loops"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## `for` Loop

In Java we write a definite loop (aka a **for loop**) as:

```java {linenos=table}
   public static void main(String [] args) {
      for (int i = 0; i < 10; i++ ) {
         System.out.println(i);
      }
   }
```

**Output:**

```console
   0
   1
   2
   3
   4
   5
   6
   7
   8
   9
```

{{% notice blue "Note" "question" %}}
   You may not be familiar with the expression `i++` since it is not
   found in all languages. The `++` is an increment operator that has the same
   effect as `i += 1`. In this example, since the `++` comes after
   `i`, we call it a postfix increment operator. There is also a `--`
   decrement operator in Java. For more information, see
   [Increment and Decrement Operators](https://bhivetech.blog/using-the-increment-and-decrement-operators-in-java/).
{{% /notice %}}

The Java `for` loop gives you explicit control over the starting, stopping,
and stepping of the loop variable inside the parentheses. You can think of it
this way:

```java {linenos=table}
   for (start clause; stop clause; step clause) {
      statement1
      statement2
      ...
   }
```

If you want to start at 100, stop at 0 and count backward by 5, the loop is written as:

```java {linenos=table}
   for (int i = 100; i >= 0; i -= 5) {
      System.out.println(i);
   }
```

**Output:**

```bash
   100
   95
   90
   ...
```

## `for-each` Loop

Java also provides a syntax to iterate over any sequence or collection, such as an Array: 

```java {linenos=table}
   public static void main(String [] args) {
      int nums[] = {1, 1, 2, 3, 5, 8, 13, 21};

      for (int i : nums) {
         System.out.println(i);
      }
   }
```

Here, the loop variable moves through the items in the Array of integers, `nums[]`. The syntax
here uses a colon symbol, `:`. This type of loop is known as a **for-each loop**.

{{% notice green "Tip" "rocket" %}}
   When considering this structure, it can be helpful to read the code sample above to yourself
   as "For each integer in `Array nums`...".
{{% /notice %}}

This loop version also works with a String, where we
can convert the String to an Array of characters:

```java {linenos=table}
   String msg = "Hello World";

   for (char c : msg.toCharArray()) {
      System.out.println(c);
   }
```

As you see, to iterate through a String in this way, Java requires an extra String method,
`.toCharArray()`, to convert the String to an Array of characters.

## `while` Loop

Java also supports the **while loop**, or indefinite loop.
A `while` loop in Java:

```java {linenos=table}
   public static void main(String [] args) {
      int i = 0;
      while (i < 3) {
         i++;
      }
   }
```

## `do-while` Loop

Java adds an additional, if seldom used, variation of the `while` loop
called the **do-while loop**. The `do-while` loop is very similar to
`while` except that the condition is evaluated at the end of the loop
rather than the beginning. This ensures that a loop *will be executed at
least one time*. Some programmers prefer this loop in some situations
because it avoids an additional assignment prior to the loop.

For example:

```java {linenos=table}
   public static void main(String [] args) {
      do {
         System.out.println("Hello, World");
      } while (false);
   }
```

**Output:**

```console
   Hello, World
```

Above, the message prints despite the condition never being met.

## Break Statements in Loops

There are instances where you may want to terminate a loop if a given
condition is met. In these instances, the `break` statement comes in
handy. For example, say you want to loop through an Array of integers
to search for a given value. Once that number is found, you want to quit
the loop. You can do the following:

```java {linenos=table}
   public class testBreak {

      public static void main(String [] args) {
         int[] someInts = {1, 10, 2, 3, 5, 8, 10};
         int searchTerm = 10;
         for (int oneInt : someInts) {
            if (oneInt == searchTerm) {
               System.out.println("Found it!");
               break;
            }
         }
      }
   }
```

In the code above, instead of the `for` loop iterating through all the
integers in the array, it will stop after it finds the first matching
instance. So once it finds the first `10` in the array, it prints "Found
it!" and then terminates the loop. If the `break` statement weren’t
there, the loop would continue and when it found the second `10`, it
would print "Found it!" a second time.

Note that the `break` statement terminates the innermost loop that it
is contained within. So if you have nested loops and use a `break`
statement within the innermost loop, then it will only terminate that
loop and not the outer one. If a `break` is present in the outer loop,
it --- and any other block nested within it --- is terminated when the
`break` runs.

## Continue Statements in Loops

The **continue** statement is similar to, but importantly different
from, the `break` statement. Like `break`, it interrupts the normal
flow of control of the loop. But unlike `break`, the `continue`
statement only terminates the *current iteration* of the loop. So the
loop will continue to run from the top (as long as the boolean
expression that controls the loop is still true) after a `continue`
statement. Here is an example:

```java {linenos=table}
   public class testContinue {

      public static void main(String [] args) {
         int[] someInts = {1, 10, 2, 3, 5, 8, 10};
         int searchTerm = 10;
         for (int oneInt : someInts) {
            if (oneInt == searchTerm) {
               System.out.println("Found it!");
               continue;
            }
            System.out.println("Not here");
         }
      }
   }
```

The above program will print "Not here" on every iteration of the
`for` loop *except* where the number has been found. So the output
looks like this:

```console
   Not here
   Found it!
   Not here
   Not here
   Not here
   Not here
   Found it!
```

Because of the `continue` statement, the final print statement in the
for loop is skipped. If the `continue` statement weren’t there, the
output would look like this instead (notice the extra "Not here"
printouts):

```console
   Not here
   Found it!
   Not here
   Not here
   Not here
   Not here
   Not here
   Found it!
   Not here
```

## Check Your Understanding

{{% notice green "Question" "rocket" %}}

   ```java {linenos=table}
      char[] chars = {'p', 'l', 'r', 's', 't'};

      for (<loop-statement>) {
         System.out.println(i);
      }
   ```

   What does the missing `<loop-statement>` need to be to print each item in `chars`?

   1. `char i : chars`
   1. `char i : chars[]`
   1. `char i in chars`
   1. `char i in chars[]`

{{% /notice %}}

<!-- char i : chars -->

{{% notice green "Question" "rocket" %}}

   ```java {linenos=table}
      do {
         System.out.println("Hello world!");
      } while (3 < 2);
   ```

   How many times does the message print and why?

   1. 0 --- The `while` condition is never true.
   1. 1 --- The print statement is evaluated before the conditional.
   1. infinite times --- 3 is less than 2, and the condition is never changed in the loop.

{{% /notice %}}

<!-- 1 --- The print statement is evaluated before the conditional. -->