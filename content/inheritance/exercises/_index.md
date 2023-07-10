---
title: "Exercises: Inheritance"
date: 2021-10-01T09:28:27-05:00
weight: 2
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Work on these exercises within IntelliJ using the `java-web-dev-projects` project you already created. Add a new package called `technology` to your `exercises` directory.

1. **Class design:** Create a new class called `Computer`. Before you add any more code, know that you will need to add two additional classes: `Laptop` and `SmartPhone`.

Before you start coding anything inside these classes, diagram how the three classes are going to be related to each other. 
Remember to add properties and methods to your diagram!

1. For a parent class add `3 properties`, `2 methods`, and a `constructor`.
2. For a child class add *at least* `1 additional property` and `1 additional method`.

2. **Class implementation:** Implement your design and test it in a `Program.java` class.
   
- Try to add three `JUnit tests` per class!

3. **Abstract class design:** Consider the group of classes that you designed. Suppose you had a web program that used these classes, and you needed to assign a unique ID to every object created from one of these classes within the application. Therefore, each such class should have an `Id` property, and no two objects created from any of the classes may have the same value for `Id`. Create an abstract class, `AbstractEntity`, that contains the behavior for assigning and accessing such a unique ID for each class that extends it. Add this class to your program above, and add `AbstractEntity` to the class hierarchy in the correct place.

