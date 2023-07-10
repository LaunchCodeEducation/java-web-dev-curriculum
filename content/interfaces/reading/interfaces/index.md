---
title: "Interfaces"
date: 2023-06-15T14:01:05-05:00
draft: false
weight: 2
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

An **interface** is a formal construction within Java. Interfaces allow us to create a set of behaviors that a class must fulfill. A Java interface may contain:

   1. Constants (that is, `static final` fields)
   1. Method signatures
   1. Static methods
   1. Default methods

## Creating an Interface

### Method Signatures

One really useful aspect of using an interface is the ability to specify **method signatures**. A method signature includes the name, parameters, and return type of a method, but no body.

As part of our cat application, let’s create a method signature, `eat`, as part of an interface, `Feedable`.

{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
public interface Feedable
{

   void eat();

}
```
{{% /notice %}}

In the code above, notice the following:

1. That we need to use the `interface` keyword to define our interface, `Feedable`.
1. `eat` only has a signature. We are NOT allowed to provide a body for methods defined in interfaces.
1. `eat` also does not have an access modifier. Interface members are always `public`, and while we may use the `public` modifier, it’s unnecessary. An interface method may NOT have an access modifier that is more restrictive than `public`.
1. The `Feedable` interface itself is declared `public`, which means any other class may use it. We may also leave off `public`, making the interface package-`private`, or usable only within the same package.
1. The name is indicative of the behavior that the interface is intended to describe. While this is only a convention, most interfaces have names that are adjectives. Whatever you do, use meaningful names!

### Static Methods

A static method in an interface can contain code in the body. However, a static method cannot contain any references to instance properties in other classes. This means that our static methods should only deal with universal behaviors that are NOT dependent on instance properties, but may be dependent on constants.

### Default Methods

A **default method** has a body and is a fully-formed method. It is preceded with the default keyword, and it may be overridden by classes implementing the interface.

```java{linenos=table,hl_lines=[],linenostart=1}
public interface MyInterface {

    void someMethod();

    default void someOtherMethod() {
        // ...code goes here...
    }

}
```

The intended purpose of default methods is to allow programmers to add a method to an interface that has already been released, while not forcing those already using the interface to add new code to their classes. _You should avoid using default methods in all situations other than the one described here._

## Implementing an Interface

The purpose of an interface is to define a contract of behaviors that classes uphold. In doing so, we say that they “_implement_ the interface”. The syntax for implementation is similar to that for inheritance. Here’s how we can use the `Feedable` interface in defining our `Cat` class.

{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
public class Cat implements Feedable
{

   @Override
   public void eat()
   {
      // method implementation
   }

   // ...rest of the class definition...

}
```
{{% /notice %}}

Since we’ve declared that `Cat` implements `Feedable`, we have to provide an implementation for the `eat` method, with the signature as specified in the interface definition. Note that we use `@Override`, just as we do when overriding an inherited method in a subclass. Like that situation, using `@Override` when implementing methods defined in an interface will enable the compiler to check that your method signature does indeed match that of the interface.

{{% notice blue "Note" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
public class MyClass extends MySubclass implements MyInterface
{
   // ...code...
}
```
{{% /notice %}}

As with classes, interfaces define a type that can be used when declaring fields, parameters, and local variables. This allows us to relax the requirements on our code elsewhere, thus making it more extensible and adaptable. If an application is extensible, it is easier for programmers for new capabilities to be added later on. For example, here’s how we might modify our `CatOwner` class:

```java{linenos=table,hl_lines=[],linenostart=1}
public class CatOwner
{
    private Feedable pet;

    public CatOwner(Feedable pet) {
        this.pet = pet;
    }

    public  void feedTheCat() {

        // ...code to prepare the cat's meal...

        pet.eat();
    }
}
```

Note that we’ve declared the property `pet` to be of type `Feedable`. This class assumes that the only behavior of `pet` that we’ll need within the class is the ability to `eat`. But if that’s all we need, then we should relax the requirements on the `pet` property as much as possible. In fact, there’s nothing specific about cats in this class, so we might make our code a step more abstract and flexible by doing the following:

```java{linenos=table,hl_lines=[],linenostart=1}
public class PetOwner
{
    private Feedable pet;

    public PetOwner(Feedable pet) {
        this.pet = pet;
    }

    public void feedThePet() {

        // ...code to prepare the pet's meal...

        pet.eat();
    }
}

public class CatOwner extends PetOwner
{
    // code that requires Cat-specific behavior
}
```

We’ve created a `PetOwner` class that encapsulates the behavior for any pet (any `Feedable`, actually), and have `CatOwner` extend `PetOwner`. This allows other classes to extend `PetOwner` to make, say, a `DogOwner` that knows how to play fetch with their pet, or a `HorseOwner` that knows how to ride their pet. It also reduces the dependency of the `feedThePet` method on the specific type of pet, since it doesn’t need to care.

To use this new class design, we can revise the sample code from above as follows:

```java{linenos=table,hl_lines=[],linenostart=1}
HouseCat suki = new HouseCat("Suki", 12);
CatOwner Annie = new CatOwner(suki);

Annie.feedThePet();
```

While the code usage here remains unchanged except for changing the method name from `feedTheCat` to the more generic `feedThePet`, the opportunities for using the classes we’ve built are much wider since the defined classes are no longer dependent on the specific `Cat` class. Also notice that we’ve used the object `suki` in a polymorphic way, creating it as a `HouseCat`, but using it as a `Feedable` within the `CatOwner` class.

{{% notice blue "Note" "rocket" %}} 
 Like inheritance, interfaces enable polymorphic usage of objects. We can create an object and then use it in different contexts based on the interfaces that it implements.
{{% /notice %}}

_Interfaces may not be created like objects are, with_ `new`. You may implement an interface, or declare variables and parameters as interface types. You can not, however, create an instance of an interface.

## Benefits of Using Interfaces

Once you get used to interfaces, you’ll begin to think more abstractly about which _behaviors_ your code requires rather than which _classes_ your code requires. This means you’ll be able to “code to interfaces” (an OOP principle) instead of coding to classes, and your code will become more flexible and extensible.

Here are a few benefits of using interfaces:

   1. You can only extend one class, but you may implement many interfaces.

   1. You can extend a class and implement an interface at the same time.

   1. By declaring variables and parameters as interface types, you make your code useful for a much wider variety of situations.

   1. When you declare properties and return types to be interface types, you decouple code using your classes from the actual class types you use. This means that you are free to change the specific implementation of your classes without affecting those using them.

Remember that you don’t need to start creating interfaces to use their power! As we will cover later in the chapter, when working with collections, we can declare variables and parameters to be interface types if we only need to use specific behaviors such as ordering or iteration.

## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 
Choose the appropriate option to fill in the blanks.

A class can extend _______ class(s) and implement ________ interface(s).

   1. one, one
   1. one, more than one
   1. more than one, one
   1. more than one, more than one
<!-- ans: one, more than one -->
{{% /notice %}}

{{% notice green  "Question" "rocket" %}} 
 True/False: An interface can contain a static variable, a final variable, and a static final variable.
<!-- ans: False -->
{{% /notice %}}


{{% notice green  "Question" "rocket" %}} 
 What keywords are missing from the following interface?
```java{linenos=table,hl_lines=[],linenostart=1}
public Temperature {

   double final ABSOLUTE_ZERO = -273.15;

   double convertTemp();
}
```
   1. `class`
   1. `interface`  
   1. `static`
   1. `private`
<!-- ans: interface, static, private -->
{{% /notice %}}
