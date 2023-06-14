---
title: "Special Methods"
date: 2023-06-14T16:06:05-05:00
draft: false
weight: 3
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 Given the code:

 ```java{linenos=table,hl_lines=[],linenostart=1}
 public class Pet {

   private String name;

   Pet(String name) {
      this.name = name;
   }

   public String getName() {
      return name;
   }
}

String firstPet = "Fluffy";
Pet secondPet = new Pet("Fluffy");
Pet thirdPet = new Pet("Fluffy");
```
Which of the following statements evaluates to `true`?

1. `firstPet == secondPet;`
1. `secondPet == thirdPet;`
1. `thirdPet.equals(secondPet);`
1. `thirdPet.getName().equals(firstPet);`
1. `thirdPet.equals(firstPet);`

<!-- ans: 4 -->
{{% /notice %}}

{{% notice green  "Question" "rocket" %}} 
We add the following code inside the `Pet` class:

 ```java{linenos=table,hl_lines=[],linenostart=1}
public boolean equals(Object petToCheck) {

   if (petToCheck == this) {
      return true;
   }

   if (petToCheck == null) {
      return false;
   }

   if (petToCheck.getClass() != getClass()) {
      return false;
   }

   Pet thePet = (Pet) petToCheck;
   return thePet.getName() == getName();
}
```
Which of the following statements evaluated to `false` before, but now evaluates to `true`?

1. `firstPet == secondPet;`
1. `secondPet == thirdPet;`
1. `thirdPet.equals(secondPet);`
1. `thirdPet.getName().equals(firstPet);`
1. `thirdPet.equals(firstPet);`

<!-- ans: 3-->
{{% /notice %}}