---
title: "Customizing Fields"
date: 2023-06-14T16:06:05-05:00
draft: false
weight: 1
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Customizing Fields

A **final field** is one that cannot be changed once it is initialized. This means slightly different things for primitive and class types. We create final fields by declaring them with the final keyword.

We cannot change the value of a **final primitive field** (`final int`, `final double`, etc.) after it is initialized.

Similarly, we cannot assign a new object to a **final object field** (`final String`, `final Double`, `final ClassName`, etc.) after initialization. However, we can change the values within the object itself.

Here are some examples to illustrate. Each class would normally be in its own file, but we present them side-by-side for convenience. Additionally, we declare each field `public` to minimize the example code and more clearly demonstrate where compiler errors would occur.

   {{% notice blue "Example" "rocket" %}} 
   ```java
   public class FortyTwo {

      public int intValue = 42;

   }

   public class FinalFields {

      public final int intValue = 42;
      public final double doubleValue;
      public final FortyTwo objectValue = new FortyTwo();

      public static void main(String[] args) {

         FinalFields demo = new FinalFields();

         // This would result in a compiler error
         demo.intValue = 6;

         // This is allowed since we haven't initialized doubleValue yet
         demo.doubleValue = 42.0;

         // However, this would result in a compiler error
         demo.doubleValue = 6.0;

         // This would result in a compiler error, since we're trying to
         // give objectValue a different object value
         demo.objectValue = new FortyTwo();

         // However, this is allowed since we're changing a field
         // inside the final object, and not changing which object
         // objectValue refers to
         demo.objectValue.intValue = 6;
      }
   }
   ```
   {{% /notice %}}

Final fields help to prevent accidentally (or intentionally) changing the value of a field after it is initialized. As such, final fields may NOT have setters.

### Static Fields

A **static field** is one that is shared by all instances of the class, and it is declared with the `static` keyword.

For example, in our `Temperature` class there is no reason for each `Temperature` object to hold its own copy of the double `absoluteZeroFahrenheit`. That value remains constant from class to class and object to object. Because of this, we make it a `static` field.

Previous examples used the `static` keyword with both fields and methods, but since this discussion is focused on data, let’s focus on static fields for now.

{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
public class Temperature {

   private double fahrenheit;

   private static double absoluteZeroFahrenheit = -459.67;

   public double getFahrenheit() {
      return fahrenheit;
   }

   public void setFahrenheit(double aFahrenheit) {

      if (aFahrenheit < absoluteZeroFahrenheit) {
         throw new IllegalArgumentException("Value is below absolute zero");
      }

      fahrenheit = aFahrenheit;
   }

   /* rest of the class... */

}
```
{{% /notice %}}

There are multiple ways to refer to a static field.

{{% notice blue "Example" "rocket" %}} 
 Within a class:
```java{linenos=table,hl_lines=[],linenostart=1}
// Use a static field the same way as a normal, non-static field
System.out.println("Absolute zero in F is: " + absoluteZeroFahrenheit);

// We can also be more explicit
System.out.println("Absolute zero in F is: " + this.absoluteZeroFahrenheit);
```

Outside of a class:
```java{linenos=table,hl_lines=[],linenostart=6}
// If the static field is public, we can do this
System.out.println("Absolute zero in F is: " + Temperature.absoluteZeroFahrenheit);

// Or if we have an object named "temp" of type Temperature
System.out.println("Absolute zero in F is: " + temp.absoluteZeroFahrenheit);
```

{{% /notice %}}

When accessing a field from outside of its class, line 7 shows the preferred technique. The syntax makes it explicit that the field is `static`. Line 10 does not make this point clear.


{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
public class Student {

   private static int nextStudentId = 1;
   private String name;
   private final int studentId;
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

   /* getters and setters omitted */

}
```
{{% /notice %}}

In line 3, we add a static integer field that will keep track of the next student ID to be assigned to a student. Then, our new constructor (line 21) takes only a name as a parameter and assigns the student the next available ID. This works because static fields are shared across all objects created from the `Student` class, so it functions as a counter of sorts for the number of `Student` objects created.

## Constants

Unlike some other languages, Java doesn’t have a special keyword to declare a constant, or unchanging, variable. However, we can achieve the same result using a combination of `static` and `final`.

```java{linenos=table,hl_lines=[],linenostart=1}
public class Constants {
   public static final double PI = 3.14159;
   public static final String FIRST_PRESIDENT = "George Washington";
}
```

Throughout the rest of this course, when we say constant we will mean a `static` `final` variable.

Three things to note from this example:

1. We use a different naming convention for constants than for other variables. Constants should be in ALL CAPS, with an underscore to separate words.

1. There is no strong reason to make constants `private`, since restricting access would force us to re-declare the same values in different classes. We’ll generally make our constants `public`.

1. We must declare and initialize a constant at the same time. If we do not declare and initialize the constant in the same statement, we cannot assign it a value later. The constant’s value remains empty.

A good use of a constant can be seen in our `Temperature` class. Since absolute zero will never change, we can ensure that nobody ever alters it (intentionally or by mistake) by adding `final` to make it a constant.


```java {linenos=table,hl_lines=[],linenostart=1}
public class Temperature {

   private double fahrenheit;

   public static final double ABSOLUTE_ZERO_FAHRENHEIT = -459.67;

   /* rest of the class... */

}
```


## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 Assume that we define a `Pet` class that uses the fields `name`, `age`, `mass`, and `species`.

Assuming you do not give your pet away, which of these fields should be declared `final`? (There may be more than one).

1. `name`
1. `age`
1. `mass`
1. `species`
<!-- ans: name, species -->
Should any of the fields be declared static?

1. Yes
1. No
<!-- ans: no -->
{{% /notice %}}

{{% notice green  "Question" "rocket" %}} 
 Assume we define several fields in a `Circle` class. Which of the following is the BEST choice to be declared `static`?

   1. `radius`
   1. `area`
   1. `pi`
   1. `circumference`

{{% /notice %}}

{{% notice green  "Question" "rocket" %}} 
 Which of the following is the BEST syntax for defining a variable to hold the (constant) speed of light in a vacuum?

   1. `public static final int SPEED_OF_LIGHT = 299792458;`
   1. `private static final int SPEED_OF_LIGHT = 299792458;`
   1. `public static final int SPEED_OF_LIGHT;`
   1. `private static final int SPEED_OF_LIGHT;`

<!-- ans:  `public static final int SPEED_OF_LIGHT = 299792458;` -->
{{% /notice %}}