---
title: "A Tale of Two Cats"
date: 2021-10-01T09:28:27-05:00
weight: 3
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Let’s revisit our `Cat` and `HouseCat` friends. In `java-web-dev-exercises`, open `src/org/launchcode/java/demos/inheritance` and examine the two classes inside.

## Inheriting Fields and Properties

Notice that `Cat` has a private string field `family`, representing the biological family of all cats.

```java
private String family = "Felidae";
```

This field is not directly accessible by `HouseCat` since it is private. However, it may be read via the public getter `getFamily`.

```java
public String getFamily() {
   return family;
}
```

There is no setter for `family`, however. It may only be set within `Cat`. It makes sense that a subclass should not be able to change the biological family of a cat, since this field should rarely, if ever, change.

Methods of the base class `Cat` may be called on instances of the subclass `HouseCat` as if they were defined as part of the `HouseCat`.

Try it out. In your inheritance folder, create a `Main` class. Within that class, write an instance of `HouseCat` and call some of the methods it inherits from `Cat`.

```java
HouseCat garfield = new HouseCat("Garfield", 12);
garfield.eat();
System.out.println(garfield.isTired());   // prints true
```

The `eat` method was defined in `Cat`, but may be called on all `HouseCat` instances as well. We say: “`HouseCat` inherits the method `eat()` from `Cat`.” We know we have successfully called `eat()` on `garfield` because the printed statement indicates the cat is now tired.

## `super`

We mention above that a subclass inherits all non-constructor methods from its base class. Indeed, when extending a class, we will not be able to create new instances of our subclass `HouseCat` using any constructors provided by `Cat`.

The base class `Cat` has a constructor that takes a single parameter of type `double`.

```java
public Cat(double aWeight) {
   weight = aWeight;
}
```

But because `HouseCat` does not have such a constructor, the following code does not compile:

```java
HouseCat mittens = new HouseCat(8.4);
```

`Cat` constructors are not inherited by `HouseCat`. If we want to use a `Cat` constructor in this subclass, we must explicitly provide it.

To do so, look at the constructor included in `HouseCat`:

```java
public HouseCat(String aName, double aWeight) {
   super(aWeight);
   name = aName;
}
```

Here, the `super` keyword allows the subclass to access the constructor from the base class. This call to the base class constructor must be the first line of the subclass constructor. In the case of `HouseCat`, the subclass constructor extends the original constructor by setting an additional property, `name`.

If a base class constructor takes no arguments, then the **no-argument constructor** is implicitly called for you in the subclass. A no-argument, or **no-arg constructor**, is just as the name implies, a constructor that takes no arguments.

For example, we can add an additional constructor in `Cat`:

```java
public Cat() {
   weight = 13;
}
```

Then in `HouseCat`, we can simply define another constructor as this:

```java
public HouseCat(String aName) {
   name = aName;
}
```

Even though we don’t explicitly specify that we want to call a constructor from Cat, the no-argument constructor will be called. Now, we can initialize a new HouseCat with only a name property and the Cat no-argument constructor will still be applied. Back in Main, you can confirm that the base class constructor has been called:

```java
HouseCat spike = new HouseCat("Spike");
System.out.println(spike.getWeight()); // prints 13
```

As a consequence of this constructor syntax, we can easily expose any constructor from the base class by providing a subclass constructor with the same signature and a body that only calls the base class constructor.

```java
public HouseCat(double aWeight) {
    super(aWeight);
}
```

{{% notice red Warning "rocket" %}}
The above constructor is a bad one, and is included merly to introduce syntax and usage. We would not want to have a constructor for `HouseCat` that didn't initialize an essential field such as `name`.
{{% /notice %}}


## `@Override`

Sometimes when extending a class, we'll want to modify behavior provided by the base class. This can be done by replacing the implementation of an inherited method by a completely new method implementation. For a given method, we can do this via **method overriding**.

In our example, the `noise` method of `HouseCat` overrides the method of the same name in `Cat`. When we override it, we should use the `@Override` annotation.

Here are the methods in question.

In `Cat`:

```java
public String noise() {
   return "Meeeeeeooooowww!";
}
```

In `HouseCat`:

```java
@Override
public String noise() {
   return "Hello, my name is " + name + "!";
}
```

If we have a `HouseCat` object and call its `noise()` method, we will be using the method defined in `HouseCat`.

```java
Cat plainCat = new Cat(8.6);
HouseCat cheshireCat = new HouseCat("Cheshire", 12);

System.out.println(plainCat.noise()); // prints "Meeeeeeooooowww!"
System.out.println(cheshireCat.noise()); // prints "Hello, my name is Cheshire!"
```

Similar to other Java annotations, the `@Override` annotation is not required. However, it can prevent unintentional errors and make it clear when reading your code what you intend to do. The compiler will see the annotation and check to ensure that the signatures of the base method and the overriding method match up. If they don't, it will flag an error. This can help prevent you from inadvertently creating a method with a different signature.

When overriding a method from a base class, the method signatures must be exactly the same. The signature of a method includes the method name, access level, return type, and the type and number of input parameters.

In addition, when overriding a method, we may call the method from the base class that we are overriding by using `super`. This calls the overridden method in the base class via `super.noise()`, carrying out the original behavior if the given conditional branch is reached.

## `Object` Class

In a previous lesson, we introduced the special methods `equals` and `toString`. All classes contain default implementations of these methods that can be overridden. In fact, these default methods are part of a class called `Object`. If a class does not explicitly extend another class, then it implicitly extends `Object`. So the default implementations of `equals` and `toString` (along with a few other methods) are made available to us via inheritance.

Note that we should use the `@Override` annotation when we provide new implementations of these methods as well.

### References:
- [The @Override annotation (docs.oracle.com)](https://docs.oracle.com/en/java/javase/17/docs/api/index.html)
- [The Object Class (docs.oracle.com)](https://docs.oracle.com/en/java/javase/17/docs/api/index.html)

Check Your Understanding:

**Question 1:**
For this question, refer to the code block below.

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
```

{{% notice green Question-1 "rocket" %}}
A class called Greeting extends Message. Greeting and Message are both defined within a package called Speech. Select all of the fields and methods that are inherited by Greeting.

1. `friendly`
1. `language`
1. `text`
1. `Message`
1. `getFriendly`
1. `getLanguage`
1. `getText`
{{% /notice %}}

**Question 2:**
For this question, refer to the code block below.

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
```

{{% notice blue Question-2 "rocket" %}}
A class called Greeting extends Message. What would a constructor for Greeting need to be to call the Message constructor?

```java
A. public Greeting(String aLanguage, String aText, boolean isFriendly) {
      super(aLanguage, aText);
      friendly = isFriendly;
   }
B. public Greeting(String aLanguage, String aText) {
      super(aLanguage, aText);
   }
C. public Greeting() {
      super(aLanguage, aText);
   }
D. public Greeting(String aLanguage, String aText) {
      language = aLanguage;
      text = aText;
   }
```
{{% /notice %}}