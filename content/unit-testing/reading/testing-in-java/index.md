---
title: "Testing in Java"
date: 2023-06-28T13:58:37-05:00
draft: false
weight: 1
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: Colin Brock # update any time edits are made after review
lastEditorGitHub: ColinBrock # update any time edits are made after review
lastMod: 2023-11-28 # UPDATE ANY TIME CHANGES ARE MADE
---


You already recognize the importance of testing your code. 
**Automated testing** in Java, like any language, ensures that 
your code works as expected, every time it runs. Tests also 
function as documentation, giving an observer instructions 
on how to properly execute your classes and methods.

This course covers **unit testing** in Java with a test runner called
**JUnit**. Unit testing breaks down the codebase into its smallest
building blocks, which are individual statements and methods. 

{{% notice green "Tip" "rocket" %}}

   If you're not yet familiar with the benefits of automated testing,
   you can familiarize yourself [here](https://education.launchcode.org/intro-to-web-dev-curriculum/unit-testing/reading/why-test/index.html).

{{% /notice %}}

## Why We Test

### Refactoring

Because they work on the most basic functionality of your code, 
unit tests safeguard against bugs introduced in **refactoring**. 
Refactoring refers to the process of rewriting code without adding new features. 

Imagine this common workflow: 

1. You practice TDD, writing your tests to stipulate your class's code. 

1. You write your code to pass your tests. 

1. Later, a stakeholder in your project's use requests that you refactor your code using 
   different syntax.

The features will be the same, but the implementation changes. 
Unit tests help in this scenario in that changes to implementation
should not require changes to outcome. Thus, if your tests continue
to pass after the refactor, you can move on, knowing you have not 
inadvertently introduced a bug. When you write tests once, they provide a code 
lifetime's worth of benefits. 

### Documentation

Unit tests are the most enlightened form of documentation. Again, 
because they address the most fundamental tasks of your classes,
unit tests serve as live-code use-cases. You may also have an 
external documentation directory with examples of how to run your
project, or perhaps you have been writing comments within your code
to best communicate with your teammates about your changes. Both of
these are great choices and should be done when possible. However, they 
also require more forethought to maintain. Each time you update
your code, you might not remember to update the documentation and 
comments. With unit testing, however, you have a more obvious reminder
that a change has been made if a test fails.

## Testing Best Practices

Below are some best practices to keep in mind when writing unit tests, in any language.

1. The AAAs

   The AAAs of unit testing refers to the pattern to follow when 
   writing your unit tests. 

   1. Arrange the variables your test requires
   1. Act on the methods your test requires
   1. Assert the anticipated comparison of the expected and actual values

1. Deterministic

   Every, single, solitary time a test is run, it should produce the same outcome. 
   A test that passes only most of the time is a worthless test.

1. Relevant

   Tests, as they are written, should be grouped by related class and function.

1. Meaningful

   There is no need to test trivial code. For example, unless they contain additional 
   functionality, there is no need to write tests for getters and setters. Your IntelliJ 
   IDE offers code completion for these anyway.

## Check Your Understanding

{{% notice green "Question" "rocket" %}}

   True or False: Comments are the best tool to make your code readable.

{{% /notice %}}

<!-- False, comments are helpful but can be used in tandem with other forms of documentation, including unit tests -->

{{% notice green "Question" "rocket" %}}

   Unit tests are a form of:

   1. Manual testing
   1. Automated testing
   1. Integration testing
   1. Documentation testing

{{% /notice %}}

<!-- Automated testing -->