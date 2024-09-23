---
title: "Studio: Unit Testing"
date: 2023-06-28T13:58:37-05:00
draft: false
weight: 3
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: Colin Brock # update any time edits are made after review
lastEditorGitHub: ColinBrock # update any time edits are made after review
lastMod: 2023-11-28 # UPDATE ANY TIME CHANGES ARE MADE
---

For this studio, you will be writing unit tests to help you find 
errors in provided code.

## Getting Started

1. Locate the `balanced-brackets` project in `java-web-dev-projects/unit-testing/studio` directory.
1. Open the `balanced-brackets` project in IntelliJ.
1. Write unit tests to find the errors in `BalancedBrackets`.
   
   1. The tests you write should guide how you revise the source code. Use TDD to 
      first write tests that will work for the desired behavior of `BalancedBrackets`.
      When your tests fail, correct the class to pass your tests.
   1. The content of your tests is up to you, but you should write at least 12 tests.

   {{% notice green "Tip" "rocket" %}}
   Here's a first test to help get you started: 
   
   Assert that brackets in the correct order, `"[]"`, return true.

   ```java
   @Test
   public void onlyBracketsReturnsTrue() {
      assertTrue(BalancedBrackets.hasBalancedBrackets("[]"));
   }
   ```
   {{% /notice %}}

{{% notice blue "Note" "rocket" %}}
   `BalancedBrackets` is essentially a wrapper class for a method. And 
   because it's only method is static, we don't need to create an instance
   to test `hasBalancedBrackets()`.
{{% /notice %}}

{{% notice green "Tip" "rocket" %}}
   Discuss with your fellow students and IA how the  
   class should behave. What are some examples of input, and 
   what would the desired output be for each input?
{{% /notice %}}

## Uploading Your Work

Push your work to save your solution in your remote repository.
