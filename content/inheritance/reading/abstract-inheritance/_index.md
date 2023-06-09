---
title: "Inheriting from Abstraction"
date: 2021-10-01T09:28:27-05:00
weight: 4
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## `abstract` Classes

We noted in the introduction to this section that inheritance is a way to share behaviors among classes. You’ll sometimes find yourself creating a base class as a way to share behaviors among related classes. However, in such situations, it is not always desirable for instances of the base class to be created.

For example, suppose we began coding two classes, `HouseCat` and `Tiger`. Upon writing the code, we realized that there was some common data and behaviors. For example, they both make a noise, come from the same biological family, and get hungry. In order to reduce code repetition, we combined those in `Cat` (as above).

```java
public class Cat {
   // Cat class definition
}

public class HouseCat extends Cat {
   // HouseCat class definition
}

public class Tiger extends Cat {
   // Tiger class definition
}
```

In reality, though, we might not want objects of type `Cat` to be created since such a cat couldn’t actually exist (a real cat would have a specific genus and species, for example). We could prevent objects of type `Cat` from being created, while still enabling sharing of behavior among its subclasses, by making `Cat` an **abstract class**.

Change the signature on `Cat`:

```java
public abstract class Cat {
   // Cat class definition
}
```

Now, in `Main`, if you try creating a new `Cat` object:

```java
Cat salem = new Cat(8);
```

IntelliJ has your back with a handy error message that an abstract class cannot be instantiated.

In order to use the behavior of an abstract class, *we must extend it*.

## `abstract` Methods

We have another tool that we may use here, which is an **abstract method**. An abstract method is a method in an abstract class that does not have a body. In other words, it does not have any associated code, only a signature. It must also be marked `abstract`.

In our abstract `Cat` class, it would make sense to make an abstract `noise` method since all types of cats make noise. By creating this abstract method, we force any class that extends `Cat` to provide its own implementation of that behavior.

```java
public abstract String noise();
```

Now, classes such as `HouseCat` and `Tiger`, which both extend `Cat`, *must* provide their own version of `noise()`, with the exact same method signature.

## References

- [Abstract Classes and Methods (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/abstract.html)

## Check Your Understanding

{{% notice green Question "rocket" %}}
A class derived from an abstract class must implement all of the abstract methods it inherits.

1. True

1. False
{{% /notice %}}

{{% notice green Question "rocket" %}}
When might a programmer want to make a class abstract?

1. When a class has no real data or behavior

1. When expressionism just won't cut it

1. When that class needs to be instantiated in more than one package

1. When shared behavior is desired among a group of non-abstract classes
{{% /notice %}}