---
title: "Classes for Java"
date: 2023-01-23T13:36:52-06:00
draft: false
weight: 1
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Classes for Java

In previous programming studies, we have come across **classes** and
**objects**. Classes and objects in Java are similar to classes and objects in
other languages.

### A Minimal Class and Object

Classes may contain **fields** and **methods**. Fields contain our data for the
class and methods define actions a class can take. We say that fields and
methods are **members** of a class.

{{% notice blue Example "rocket" %}}
Let's create a class called `HelloWorld` with one field, `message`, and one method, `sayHello()`.
`message` will be a string and have a value of `"Hello World"`.
`sayHello()` will not return a specific value and instead print out the value of `message`.

```java
public class HelloWorld {

   public String message = "Hello World";

   public void sayHello() {
      System.out.println(message);
   }

}
```
{{% /notice %}}

The only field in the `HelloWorld` class is the string `message`, while the
only method is `sayHello`, which prints the value of the `message` field
and doesn’t return anything.

{{% notice blue Note "rocket" %}}
There is no `main` method, which is required to run a Java program.
Without it, we have to do some additional work to get our program to run!
{{% /notice %}}

To execute `sayHello`, we’ll need to create an **instance** of the
class `HelloWorld`. We refer to an object created from a particular class as
an instance of that class.

Here’s how this might look with our `HelloWorld` class:

{{% notice blue Example "rocket" %}}
```java
public class HelloWorldRunner {

   public static void main(String[] args) {
         HelloWorld hello = new HelloWorld();
         hello.sayHello();
   }
}
```
{{% /notice %}}

In order to call the `sayHello` method of `HelloWorld`, we must first have an instance of `HelloWorld`, which we create using the syntax `new HelloWorld()`. As with built-in classes, classes that we create define their own types. So the object `hello` is a variable of type `HelloWorld`.

We introduced this `HelloWorld` class as a means of illustrating the simplest representation of some basic concepts in Java. The goal of the next few lessons is to build up the machinery to create a wide variety of interesting classes that can be used to create complex programs and elegantly solve difficult problems.

### The `this` Keyword

In `HelloWorld` above, we could have written `sayHello` this way, with the same net effect:

```java

public void sayHello() {
    System.out.println(this.message);
}
```

In this context, inside of the class, we can refer to fields (and methods) that belong to the class using the special object, `this` Whenever you use `this`, it *always* refers to the object that the given code is currently within. In other words, `this` will always be an instance of the given class. Since it is not legal to create code outside of a class in Java, `this` nearly always makes sense to us (there’s one exception, that we’ll encounter soon).

You are allowed to create local variables (variables declared within a method) with the same name as a field of the given class. In this case, in order to refer to the field, we *must* use `this`.

{{% notice red Warning "rocket" %}}
When a local variable has the same name as a field, we say that the local variable **shadows** the field. Errors caused by shadowing can be tricky to spot, so it’s best to avoid doing this in your code.
{{% /notice %}}

{{% notice blue Note "rocket" %}}
If you want to learn more about this subject, check out the Oracle Documentation on [using the this keyword](https://docs.oracle.com/javase/tutorial/java/javaOO/thiskey.html).
{{% /notice %}}

### Check Your Understanding

{{% notice green Question "rocket" %}}
The following code block contains several bugs. Mark all of the lines that contain a bug in the code.

```java {linenos=table}
public class Greeting {

   public String name = "Jess"

   public void sayHello() {
      System.out.println("Hello " + here.name + "!");

    }
}

a. line 7
b. line 3
c. line 6
d. line 1
```
{{% /notice %}}