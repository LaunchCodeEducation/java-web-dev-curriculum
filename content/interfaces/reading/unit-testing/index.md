---
title: "Unit Testing and Interfaces"
date: 2023-06-15T14:01:05-05:00
draft: false
weight: 5
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---
After all that we have learned about interfaces, you are probably wondering, _how do I write my unit tests with interfaces?_

<!-- TODO: link back to 7.6 -->
The best practices to [testing interfaces](TODO) are very similar to those of testing inheritance. You want to focus on testing the contract that the interface is supposed to be upholding as opposed to the interface itself.

{{% notice blue "Example" "rocket" %}} 
We have a `Temperature` interface, a `Celsius` class, and a `Fahrenheit` class.

```java{linenos=table,hl_lines=[],linenostart=1}
public interface Temperature {
   double static final ABS_ZERO = -273.15;

   double convertTemp();
}

public class Celsius implements Temperature {

   private double currentTemp;

   @Overrides
   public double convertTemp() {
      return this.currentTemp * 9 / 5 + 32;
   }
}

public class Fahrenheit implements Temperature {

   private double currentTemp;

   @Overrides
   public double convertTemp() {
      return (this.currentTemp - 32) * 5 / 9;
   }
}
```
In this situation, we can test the contract that the interface is supposed to be upholding, but not the interface itself. We may choose to test that `ABS_ZERO` is `-273.15` for both `Fahrenheit` and `Celsius`. We may also want to test that the `convertTemp` function works as expected, however, since `convertTemp` has a different method body depending on whether it is in `Fahrenheit` or `Celsius`, we cannot define the as expected behavior with a test on our interface, `Temperature`.
{{% /notice %}}


## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 True/False: You should test the interface itself.
 <!-- ans: false -->
{{% /notice %}}