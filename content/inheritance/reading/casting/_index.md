---
title: "Casting"
date: 2021-10-01T09:28:27-05:00
weight: 5
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

When one class extends another, as `HouseCat` extends `Cat`, a field or local variable of the type of the base class may hold an object that is of the type of the child class.

In other words, this is allowed:

```java
Cat suki = new HouseCat("Suki", 8);
```

This is acceptable because a `HouseCat` *is a* `Cat`. Furthermore, when we call methods on such an object, the compiler is smart enough to determine which method it should call. For example, the following call to `noise()` will call the version defined in `HouseCat`:

```java
// Calls HouseCat's noise() method
suki.noise(); // Hello, my name is Suki!
```

This only works for methods that are declared in the base class, however. If we have a `HouseCat` object stored in a `Cat` variable or field, then it is *not* allowed to call methods that are only part of `HouseCat`.

```java
// Results in a compiler error, since Cat doesn't have such a method
suki.isSatisfied();
```

Here, `isSatistfied()` is defined in `HouseCat`, and there is not a corresponding overridden method in `Cat`. If we were *really, really* sure that we had a `Cat` that was actually a `HouseCat`, we could call such a method by first casting:

```java
// As long as suki really is a HouseCat, this works
((HouseCat) suki).isSatisfied();
```

The danger here is that if `suki` is in fact not a `HouseCat` (it was declared only as a `Cat`, after all), then we’ll experience a runtime exception. A **runtime exception** is an error that occurs upon running the program and is not found by the compiler beforehand. These are dangerous, and situations where they might come up should be avoided. So you should only cast an object to another type when you are very sure that it’s safe to do so.

Storing objects of one type (e.g. `HouseCat`) in a variable or field of another “compatible” type (e.g. `Cat`) is an example of **polymorphism**. Polymorphism is another one of the pillars of OOP, and we’ll have more to say about it in a future lesson.

## References

-  [Polymorphism (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/polymorphism.html)

## Check Your Understanding

For this `question-1`, refer to the code block below.

```java
public class Message {
   private boolean friendly = true;
   private String language;
   private String text;

   public Message(String aLanguage, String aText) {
      language = aLanguage;
      text = aText;
   }

   public boolean getFriendly() {
      return friendly;
   }

   public String getLanguage() {
      return language;
   }

   public String getText() {
      return text;
   }
}

public class Greeting extends Message {
   private boolean waving;

   public Greeting(String aLanguage, String aText) {
      super(aLanguage, aText);
   }

   public void wave() {
      waving = true;
   }
}
```

{{% notice green Question-1 "rocket" %}}
Which of the following does not contain an error:

A. 

```java
Message hello = new Greeting("English", "Hello Coder!");
((Greeting) hello).wave();
```

B. 

```java
Message hello = new Greeting("English", "Hello Coder!");
hello.wave();
```

C. 

```java
Greeting hello = new Message("English", "Hello Coder!");
hello.wave();
```

D. 

```java
Greeting hello = new Greeting("English", "Hello Coder!");
((Mess) hello).wave();
```
{{% /notice %}}

{{% notice green Question "rocket" %}}
Polymorphism refers to:

1. One object inheriting another
      
1. An abstract class with many classes extending from it

1. The practice of storing an object of one type in a variable of another type

1. Shapeshifting
{{% /notice %}}