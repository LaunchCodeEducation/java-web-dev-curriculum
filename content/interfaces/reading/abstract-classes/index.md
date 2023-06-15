---
title: "Interfaces and Abstract Classes"
date: 2023-06-15T14:01:05-05:00
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

We mentioned previously that interfaces share some characteristics with abstract classes. Recall that an abstract class is one declared with the `abstract` keyword. You may not create an object from an abstract class, and like an interface, an abstract class is allowed to contain methods that only have signatures (that is, they don’t have implementation code).

The main differences between interfaces and abstract classes are:

   1. You _implement_ an interface, while you _extend_ an abstract class. The net effect of this is that a class may implement interfaces while also extending a class. Note that while you can implement _more than one_ interface, you can only extend _one_ class.

   1. Abstract classes may contain non-constant fields, while interfaces can only contain constant fields.

   1. Interfaces may only contain implementation code inside of default or static methods. Therefore, interfaces can’t contain methods that need to be shared by class instances in the same way that abstract classes do. In particular, any method that needs to use an instance property may not be part of an interface, since interfaces don’t have instance properties. Unlike interfaces, abstract classes may have methods which are not static or default and which do have instance properties.

_We should use abstract classes to collect and specify behavior by related classes, while we should use an interface to specify related behaviors that may be common across unrelated classes._

{{% notice blue "Example" "rocket" %}} 
 Let’s go back to our `Feedable` interface. If we want to add a `Dog` class to our application, we might implement the `Feedable` interface for our `Dog` class. This makes sense as dogs are creatures that we feed. However, as dogs and cats are so different, it is unlikely that they would share many behaviors through the `Pet` class.
{{% /notice %}}

## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 Check all statements that are TRUE about the differences between interfaces and abstract classes.

   1. You extend an abstract class, but implement an interface.
   1. You can implement many interfaces and many classes.
   1. Interfaces cannot contain non-constant fields, but abstract classes can.
   1. Methods that use instance properties can be in both interfaces and abstract classes.

   ans: 1 and 3
{{% /notice %}}