---
title: "Instance and Static Methods"
date: 2023-06-14T16:06:05-05:00
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

We explored configuring data within classes with fields and properties. Now let’s turn our attention back to class _behavior_ (methods).

## Quick Method Review
<!-- TODO: Link once classes chapter is added -->
In the [last chapter], we learned that:

1. A method belongs to a class and performs an action.

1. Methods cannot stand on their own—they must be part of a class.

1. To call a method on an object, use dot notation:

```java
objectName.methodName(arguments);
```

1. Access modifiers apply to methods:

   1. `private` methods as those that are NOT useful outside of the class but contribute internally to helping the class behave as desired or expected.

   1. `public` methods contain code that other classes need to use when they implement the class containing those methods. Make methods `public` only when you expect other classes to use them, and when you are committed to maintaining those methods for other programs.

Let’s take a closer look at two different types of methods—both of which we have used in earlier examples.

## Instance Methods
As we learned in the last chapter, _instance methods_ define the behaviors that are _unique_ or _specialized_ to each class. Every object created from a class will carry a copy of these methods.

Instance methods depend on the data stored in an individual object. If two objects call the same method, the results will vary when the objects contain different data.

Let’s add a couple more instance methods to our `Student` class.

What are the behaviors that our `Student` class should have? To start, it makes sense that when a student takes a class and earns a grade, their data should be updated accordingly. Additionally, it would be nice to easily identify the grade level of a student—freshman, sophomore, junior, or senior.

The framework for these new methods is shown in the `Student` class below, but each method is missing some code. Filling in that code is left for you to do in the chapter exercises.

```java{linenos=table,hl_lines=[],linenostart=1}
public class Student {

   private static int nextStudentId = 1;
   private String name;
   private int studentId;
   private int numberOfCredits;
   private double gpa;

   public Student(String name, int studentId,
         int numberOfCredits, double gpa) {
      this.name = name;
      this.studentId = studentId;
      this.numberOfCredits = numberOfCredits;
      this.gpa = gpa;
   }

   public Student(String name, int studentId) {
      this(name, studentId, 0, 0);
   }

   public Student(String name) {
      this(name, nextStudentId);
      nextStudentId++;
   }

   public String studentInfo() {
      return (this.name + " has a GPA of: " + this.gpa);
   }

   public void addGrade(int courseCredits, double grade) {
      // Update the appropriate fields: numberOfCredits, gpa
   }

   public String getGradeLevel() {
      // Determine the grade level of the student based on numberOfCredits
   }

   /* getters and setters omitted */

}
```

{{% notice green "Tip" "rocket" %}} 
 When creating your classes, think about the behaviors that you want to make available, as well as the access level of those methods.
{{% /notice %}}

## Static Methods

We’ve already used static methods quite a bit in this course, all the way back to our first Java method:

```java
public static void main(String[] args) {}
```

Now let’s examine them in the context of what we’ve recently learned about classes.

Just like static fields, **static methods** belong to the class as a whole, and not to any of the specific instances of the class. Thus, they are sometimes also called **class methods**. A static method is essentially the opposite of an instance method, since the two cases are mutually exclusive. _Instance methods_ rely on each object’s specific data, while static methods must NOT rely on data from a specific object.

We call a static method by preceding it with the class name and using dot-notation. Here’s an example that we looked at [previously]({{< relref "../../../../../../data-types/reading/more-data-types/_index.md#static-methods" >}}).

{{% notice blue "Example" "rocket" %}} 
 `HelloMethods.java`
```java{linenos=table,hl_lines=[],linenostart=1}
public class HelloMethods {

   public static void main(String[] args) {
      String message = Message.getMessage("fr");
      System.out.println(message);
   }

}
```

 `Message.java`
```java{linenos=table,hl_lines=[],linenostart=1}
public class Message {

   public static String getMessage(String lang) {

      if (lang.equals("sp")) {
            return "¡Hola, Mundo!";
      } else if (lang.equals("fr")) {
            return "Bonjour, le monde!";
      } else {
            return "Hello, World!";
      }
   }
}
```
{{% /notice %}}

The call occurs in line 4: `Message.getMessage("fr")`. We call the static `getMessage` without needing an instance of the `Message` class. Instead, we use the name of the class itself.

{{% notice orange "Warning" "rocket" %}} 
 It is technically allowed to call a static method using an instance of a class: `myObject.someStaticMethod()`. However, best practice recommends using the class name instead: `ClassName.someStaticMethod()`. This makes it clear to other coders that you are calling a static method.
{{% /notice %}}

A method should be static when it does NOT refer to any instance fields of the containing class (it _may_ refer to static fields, however). These methods tend to be utility-like (e.g. carrying out a calculation, or using or fetching some external resource).

## Accessing Static vs Instance Fields

One common error new Java coders encounter reads something like _non-static variable cannot be referenced from a static context_. This occurs when a _static method_ tries to call an _instance variable_.

Why can’t we do this? Static methods can be called from anywhere (depending on their access modifier), and they do NOT require us to create an object for a particular class. However, these methods must be independent of any values unique to a particular object.

For example, if we have a `Circle` class, then we can define and call a static `area` method without creating a new object: `Circle.area(radius)`. Since the area of a circle is just, `PI*radius*radius`, we can pass in the argument when we call the method. The method does not depend on any value stored within a specific `Circle` object.

Now let’s assume we define a `Car` class with an instance variable for `color`. The value of this field will NOT be the same for every `Car` object we create. Thus, trying to call a static method like `Car.printColor()` results in an error. Since there is no single value for `color` that applies to every object, trying to access it from outside of the class does not work. To print the color of a `Car` object, we must call the method on that specific object: `myCar.printColor()`.

Instance fields can only be called by instance methods.

{{% notice blue "Note" "rocket" %}} 
 While static methods cannot access instance variables, an instance method CAN access a static variable. Why?
{{% /notice %}}




## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 Assume that we add two methods to a `Pet` class—`public String makeNoise()` and `public static void increaseAge()`. Which of the following statements is true?

1. The `makeNoise()` method can be accessed outside of the `Pet` class, while the `increaseAge()` method cannot.

1. Each `Pet` object carries a copy of the `makeNoise()` method but NOT a copy of the `increaseAge()` method.

1. The `increaseAge()` method can be accessed outside of the `Pet` class, while the `makeNoise()` method cannot.

1. Each `Pet` object carries a copy of the `increaseAge()` method but NOT a copy of the` makeNoise()` method.

<!-- ans: 2 -->
{{% /notice %}}
{{% notice green  "Question" "rocket" %}} 
 Explain why it IS possible for an instance method to access a static field.
{{% /notice %}}
