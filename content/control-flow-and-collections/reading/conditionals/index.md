---
title: "Conditionals"
date: 2023-06-22T09:45:23-05:00
draft: false
weight: 1
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Control flow statements in Java --- conditionals and loops --- are very
straightforward.

## Operators

Before we review the syntax for conditionals, let's go over the comparison and logical **operators** that we need to use in control flow statements.

### Comparison Operators

| Operator | Description |
|----------|-------------|
| `==`   | Checks if two items are equal |
| `!=`   | Checks if two items are not equal |
| `<`    | Checks if item on left is lesser than item on right |
| `<=`   | Checks if item on left is lesser than or equal to item on right |
| `>`    | Checks if item on left is greater than item on right |
| `>=`   | Checks if item on left is greater than or equal to item on right |

### Logical Operators

| Operator | Description |
|----------|-------------|
| `&&` | Combines two expressions with AND, returns true if both statements are true |
| `\|\|` | Combines two expressions with OR, returns true if at least one of the statements is true |
| `!`  | Reverses the evaluation of the operand, returns false if the result is true |

## ``if`` Statements

Let’s consider an **if statement** with no `else` clause.

In Java this pattern is simply written as:

```java {linenos=table}
   if (condition) {
      statement1
      statement2
      ...
   }
```

You can see that in Java the curly braces define a block.
Parentheses around the condition are required.

## `if else`

Adding an **else clause**, we have:

```java {linenos=table}
   if (condition) {
      statement1
      statement2
      ...
   } else {
      statement1
      statement2
      ...
   }
```

## `else if`

An **else if** construction in Java:

```java {linenos=table}
    import java.util.Scanner;

    public class ElseIf {
        public static void main(String args[]) {
            Scanner in = new Scanner(System.in);
            System.out.println("Enter a grade: ");
            int grade = in.nextInt();
            if (grade < 60) {
                System.out.println('F');
            } else if (grade < 70) {
                System.out.println('D');
            } else if (grade < 80) {
                System.out.println('C');
            } else if (grade < 90) {
                System.out.println('B');
            } else {
                System.out.println('A');
            }
        }
    }
```

## `switch` Statements

Java also supports a *switch* statement that acts something like an
`else if` statement under certain conditions, called *cases*. The
`switch` statement is  not used very often, and we generally recommend you
avoid using it. It is not as powerful as the `else if` model because the
`switch` variable can only be compared for equality with a very small class
of types.

Here is a quick example of a `switch` statement:

```java {linenos=table}
   import java.util.Scanner;

   public class DayPrinter {
      public static void main(String[] args) {
         Scanner in = new Scanner(System.in);
         System.out.println("Enter an integer: ");
         int dayNum = in.nextInt();

         String day;
         switch (dayNum) {
            case 0:
               day = "Sunday";
               break;
            case 1:
               day = "Monday";
               break;
            case 2:
               day = "Tuesday";
               break;
            case 3:
               day = "Wednesday";
               break;
            case 4:
               day = "Thursday";
               break;
            case 5:
               day = "Friday";
               break;
            case 6:
               day = "Saturday";
               break;
            default:
               // in this example, this block runs if none of the above blocks match
               day = "Int does not correspond to a day of the week";
         }
         System.out.println(day);
      }
   }
```

In the example above, here's the output if a user enters the number `4`.

```console
   Enter an integer: 4
   Thursday
```

And the output if that user enters `10`? Below:

```console
   Enter an integer: 10
   Int does not correspond to a day of the week
```

Here's how the above example looks using the `else if` construction:

```java {linenos=table}
   import java.util.Scanner;

   public class DayPrinter {
      public static void main(String[] args) {
         Scanner in = new Scanner(System.in);
         System.out.println("Enter an integer: ");
         int dayNum = in.nextInt();

         String day;
         if (dayNum == 0) {
           day = "Sunday";
         } else if (dayNum == 1){
           day = "Monday";
         } else if (dayNum == 2){
           day = "Tuesday";
         } else if (dayNum == 3){
           day = "Wednesday";
         } else if (dayNum == 4){
           day = "Thursday";
         } else if (dayNum == 5){
           day = "Friday";
         } else if (dayNum == 6){
          day = "Saturday";
         } else {
          day = "Int does not correspond to a day of the week";
         }
         System.out.println(day);
      }
   }
```

### Fallthrough

Additionally, if **break statements** are omitted from the individual
cases on accident, a behavior known as
[fallthrough](https://en.wikipedia.org/wiki/Switch_statement#Fallthrough)
is carried out. **Fallthrough** can be quite unintuitive, and is only
desirable in very specific circumstances. We will discuss `break`
statements in more detail in the upcoming loop section. For now, just
know that when used in a `switch` block, they terminate the `switch`
statement they are in, so the flow of control in your program moves to
the next statement after the switch block.

Here’s a quick example of how fallthrough works:

```java {linenos=table}
   import java.util.Scanner;

   public class DayPrinter {
      public static void main(String[] args) {

         System.out.println("Enter an integer: ");
         Scanner in = new Scanner(System.in);
         int dayNum = in.nextInt();

         String day;
         switch (dayNum) {
            case 0:
               day = "Sunday";
            case 1:
               day = "Monday";
            case 2:
               day = "Tuesday";
            case 3:
               day = "Wednesday";
            case 4:
               day = "Thursday";
            case 5:
               day = "Friday";
            case 6:
               day = "Saturday";
            default:
               // in this example, this block runs even if one of the above blocks match
               day = "Int does not correspond to a day of the week";
         }
         System.out.println(day);
      }
   }
```

This time, without the `break` statements in each `case`, if the
user enters `4`, they will see the default output:

```console
   Enter an integer: 4
   Int does not correspond to a day of the week
```

This is because after the `switch` statement matches the
`case` for `4` and assigns the value `Thursday` to the variable
`day`, it proceeds to execute every statement in every case that
follows, all the way through the `default` case. So the `String`
that ends up being printed will reflect the last executed statement in
the `switch` block.

Along similar lines, consider this variation on the code block above:

```java {linenos=table}
   import java.util.Scanner;

   public class DayPrinter {
      public static void main(String[] args) {

         System.out.println("Enter an integer: ");
         Scanner in = new Scanner(System.in);
         int dayNum = in.nextInt();

         String day;
         switch (dayNum) {
            case 0:
               day = "Sunday";
            case 1:
               day = "Monday";
            case 2:
               day = "Tuesday";
            case 3:
               day = "Wednesday";
            case 4:
               day = "Thursday";
            case 5:
               day = "Friday";
            case 6:
               day = "Saturday";
               break;
            default:
               day = "Int does not correspond to a day of the week";
         }
         System.out.println(day);
      }
   }
```

Here, we have a `break` statement in `case 6` after `day = "Saturday";`.
If the user enters `4`, the execution will fallthrough until it reaches that
`break` statement and `Saturday` is printed instead of `Thursday`.
The output:

```console
   Enter an integer: 4
   Saturday
```

## References 

* [Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)
* [The if-then and if-then-else Statements](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/if.html)
* [The switch Statement](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/switch.html)

## Check Your Understanding

{{% notice green "Question" "rocket" %}}
   When does fallthrough occur in Java?

   1. Omitting an `else` clause from a conditional.
   1. Omitting an `else` clause from switch statement.
   1. Omitting a `default` case from a `switch` statement.
   1. Omitting a `break` line from a `switch` statement.
{{% /notice %}}

<!-- Omitting a break line from a switch statement. -->

{{% notice green "Question" "rocket" %}}

   ```java {linenos=table}
   import java.util.Scanner;

   public class QuizQuestion {
      public static void main(String[] args) {

         System.out.println("Are you a space cadet? yes or no");
         Scanner in = new Scanner(System.in);
         String response = in.next();

         switch (response) {
            case "yes":
               System.out.println("Greetings cadet.");
            case "no":
               System.out.println("Greetings normie.");
            default:
               System.out.println("Are you an alien?");
         }
      }
   }
   ```

   Given the code above, what prints if the user enters `no` after the prompt?

   1. ```console 
         Greetings cadet.
      ```
   1. ```console
         Greetings normie.
      ```
   1. ```console
         Greetings normie.
         Are you an alien?
      ```
   1. ```console
         Greetings cadet.
         Greetings normie.
      ```

{{% /notice %}}

<!-- Greetings normie.
     Are you an alien? -->
