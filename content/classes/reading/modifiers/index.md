---
title: "Modifiers in Java"
date: 2023-01-23T13:36:52-06:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Access Modifiers

For fields in classes, the **access level** determines who can get or set
the value of the field. For methods, the **access level** determines who can
call the method. The access level of a class member is determined by an
**access modifier**.

We’ve encountered access modifiers so far in our code. In our examples, you frequently see the keyword, `public`. `public` makes the field or method to be accessible by anyone working with our code. Another common access modifier is `private`, which restricts access to fields or methods so they can only be used within the class. Two additional access modifiers are available in Java, though they are used much less often than `public` and `private`.

{{% notice blue Example "rocket" %}}
Let's take another look at our `HelloWorld` class from the last section,
but with one small change.

```java{linenos=table}
public class HelloWorld {

   String message = "Hello World";

   void sayHello() {
      System.out.println(message);
   }

}
```

In this `HelloWorld` class, we omit the `public` access modifier in lines 3 and 5. Doing this implicitly gives the message field and the `sayHello` method **default access**.
{{% /notice %}}

We should avoid giving everything default access when creating classes in Java and instead think carefully about what level of access each field and method should have.

The table below details whether or not information can be accessed at different levels based on the access modifier. For example, a field with the `private` access modifier can be accessed within the class, but cannot be accessed outside the class at the world-level. In Java, world-level is the level of the whole application and contains all of the packages and classes. While we will discuss later how to decide which access modifier to use for different scenarios, you should save this table now as reference for those conversations.

| Modifier   | Class | Package | World |
|------------|-------|---------|-------|
| `public`   | Yes   | Yes     | Yes   |
| `protected`| Yes   | Yes     | No    |
| (no modifier, aka *package-private* or *default*) | Yes | Yes | No |
| `private`  | Yes   | No      | No    |

{{% notice blue Note "rocket" %}}
If you would like to learn more about access modifiers, you should check out the [Oracle documentation](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html) on the subject.
{{% /notice %}}

Let's take a look at our `HelloWorld` class again and add some access
modifiers.

{{% notice blue Example "rocket" %}}
```java
public class HelloWorld {

   private String message = "Hello World";

   public void sayHello() {
      System.out.println(message);
   }

}
```
{{% /notice %}}

Since `message` only needs to be used by `sayHello`, we declare it to be `private`. Since we want `sayHello` to be usable by anybody else, we declare it to be `public`.

{{% notice blue Note "rocket" %}}
In Java, you should always use the most restrictive access modifier possible. Minimizing access to class members allows code to be refactored more easily in the future, and hides details of how you implement your classes from others.

This makes your code more modular and modifiable. Each public member that you expose is another field or property that can be referenced directly elsewhere in any program using your class. Thus, changing any such field in your code could potentially break any code referencing such members. The fewer public members, the more you can change your code without breaking stuff elsewhere.
{{% /notice %}}

{{% notice blue Note "rocket" %}}
If you want to learn more about controlling access to members of a class, check out this information from [Oracle](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html).
{{% /notice %}}

### Check Your Understanding

{{% notice green Question "rocket" %}}
For this question, refer to the code block below.

```java
public class Greeting {

   String name = "Jess";

   public void sayHello() {
      System.out.println("Hello " + this.name + "!");
   }
}
```

What access modifier would you give `name`?

1. no access modifier
1. `public`
1. `private`
1. `protected`
{{% /notice %}}
