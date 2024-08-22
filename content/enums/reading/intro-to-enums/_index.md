---
title: "Introduction to Enums"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 1
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Sally Steuterman # to be set by the page reviewer
reviewerGitHub:  gildedgardenia # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Many statically-typed programming languages provide a feature called
**enumeration types**, or **enum types** for short. Enum types are special
classes that should have only one of a set of fixed values, such as days of the
week.

Imagine that we wanted to add a field to `Event` to specify which day of the
week an event takes place. You might start by creating a new field:

```java
@NotBlank
private String dayOfWeek;
```

As defined here, a user could submit any of the following values representing
Wednesday:

1. `"Wednesday"`
2. `"wednesday"`
3. `"Wed"`
4. `"WED"`
5. `"W"`

Accepting data like this leads to many complications. For example, searching
for all events taking place on Wednesday would need to account for all of these
variations. And what happens if a user misspells "Wednesday"?

When filling out forms on the web, you are used to seeing `select` elements
used to represent fields like this.

![Select tag with days of the week](pictures/weekdaySelect.png?classes=border)

Select tag with days of the week.

Limiting the values that the user can select drastically reduces complexity and
ensures that our application data remains clean and standardized. Enum types
are one way to model fields like this.

## Creating an Enum Type

Let's see how we can create an enum type, or enum class.

{{% notice blue Note "rocket" %}}
Recall that a class defines a new *data type*. Thus, the term "data type" can be used in place of "class." We'll typically call enum classes "enum types" since this is what most Java developers do.
{{% /notice %}}

The simplest enum type that we can define to represent days of the week looks
like this:

```java {linenos=true}
public enum Day {

   SUNDAY,
   MONDAY,
   TUESDAY,
   WEDNESDAY,
   THURSDAY,
   FRIDAY,
   SATURDAY

}
```

Using the `enum` keyword specifies that this class should be an enum type. In
other words, it should only be able to take on one of a fixed set of values.
Within the body of the class, we list the valid values (`SUNDAY`, `MONDAY`,
etc.). These values are in all-caps because they are *constants*. In fact, the
class above is very similar to this static class:

```java {linenos=true}
public class DayStatic {

   public static final int SUNDAY = 0;
   public static final int MONDAY = 1;
   public static final int TUESDAY = 2;
   public static final int WEDNESDAY = 3;
   public static final int THURSDAY = 4;
   public static final int FRIDAY = 5;
   public static final int SATURDAY = 6;

}
```

To refer to Thursday, you can use the value `DayStatic.THURSDAY`. Recall our
`switch` [example from earlier](#switch-statements).

```java {linenos=true}
import java.util.Scanner;

public class DayPrinter {
   public static void main(String[] args) {
      Scanner in = new Scanner(System.in);
      System.out.println("Enter an integer: ");
      int dayNum = in.nextInt();

      String day;
      switch (dayNum) {
         case 0:
            day = "Sunday";
            break;
         case 1:
            day = "Monday";
            break;
         case 2:
            day = "Tuesday";
            break;
         case 3:
            day = "Wednesday";
            break;
         case 4:
            day = "Thursday";
            break;
         case 5:
            day = "Friday";
            break;
         case 6:
            day = "Saturday";
            break;
         default:
            // in this example, this block runs if none of the above blocks match
            day = "Int does not correspond to a day of the week";
      }
      System.out.println(day);
   }
}
```

This code can be refactored using `DayStatic`:

```java {linenos=true}
import java.util.Scanner;

public class DayPrinter {
   public static void main(String[] args) {
      Scanner in = new Scanner(System.in);
      System.out.println("Enter an integer: ");
      int dayNum = in.nextInt();

      String day;
      switch (dayNum) {
         case DayStatic.SUNDAY:
            day = "Sunday";
            break;
         case DayStatic.MONDAY:
            day = "Monday";
            break;
         case DayStatic.TUESDAY:
            day = "Tuesday";
            break;
         case DayStatic.WEDNESDAY:
            day = "Wednesday";
            break;
         case DayStatic.THURSDAY:
            day = "Thursday";
            break;
         case DayStatic.FRIDAY:
            day = "Friday";
            break;
         case DayStatic.SATURDAY:
            day = "Saturday";
            break;
         default:
            // in this example, this block runs if none of the above blocks match
            day = "Int does not correspond to a day of the week";
      }
      System.out.println(day);
   }
}
```

In essence, this code represents days of the week as fixed integer values, one
for each day. Enum types are essentially a more robust version of this
approach.

Let's revisit our `Day` enum type:

```java {linenos=true}
public enum Day {

   SUNDAY,
   MONDAY,
   TUESDAY,
   WEDNESDAY,
   THURSDAY,
   FRIDAY,
   SATURDAY

}
```

We can declare a variable of type `Day` and it will only be allowed to take
on one of the 7 defined values.

```java
// This works
Day workWeekStart = Day.MONDAY;

// This does not, throwing a compiler error
Day workWeekEnd = "Friday";
```

Enums are important because they provide *type safety* in situations where we
want to restrict possible values. In other words, they eliminate the
possibility of bad, or dirty, values.

## Enum Examples

The world is filled with examples ripe for representation by enums. Here are a
few from both the real world and the world of programming.

{{% notice blue Example "rocket" %}}
Months of the year.

```java {linenos=true}
public enum Month {

   JANUARY,
   FEBRUARY,
   MARCH,
   APRIL,
   MAY,
   JUNE,
   JULY,
   AUGUST,
   SEPTEMBER,
   OCTOBER,
   NOVEMBER,
   DECEMBER

}
```
{{% /notice %}}

{{% notice blue Example "rocket" %}}
Given a model type like our `Event` class, enums can represent categories that model objects can fall into.

```java {linenos=true}
public enum EventCategory {

   CONFERENCE,
   MEETUP,
   WORKSHOP,
   SOCIAL

}
```
{{% /notice %}}

{{% notice blue Example "rocket" %}}
A common use of enums in programming is to set the log level of an application. The **log level** represents the types of log messages that should be displayed as the application runs.

You might only want to see critical error messages when running an application on a production server, but you may want to see many more messages, such as warnings and informational messages, when developing the application locally.

```java
public enum LogLevel {

   DEBUG,
   INFO,
   WARNING,
   ERROR

}
```

An application can change the way it logs messages by changing the log level.
{{% /notice %}}

{{% notice blue Example "note" %}}
An enum that you have [already encountered]({{% relref "../../../controllers-and-routing/reading/simple-controllers/_index.md" %}}) is `RequestMapping`, which we have used to specify which HTTP methods a controller method can respond to. This enum has values `RequestMapping.GET`, `RequestMapping.POST`, `RequestMapping.DELETE`, and so on.
{{% /notice %}}

## Adding Properties to Enums

It can sometimes be useful to add properties and methods to enum types, in
order to associate data and behaviors with each value.

Let's consider the example of our `Day` enum from above. We can associate a
user-friendly display name (such as "`Saturday`" for `Day.SATURDAY`), along
with a boolean representing its status as a weekday, just as you would in any
other class.

Let's include the relevant fields, getters, and a constructor. Note that the
fields will be `final` since they should never change value. This also means
that they don't need setters.

```java {linenos=true}
private final String displayName;
private final boolean weekday;

public Day(String displayName, boolean weekday) {
   this.displayName = displayName;
   this.weekday = weekday;
}

public String getDisplayName() {
   return this.displayName;
}

public boolean isWeekday() {
   return this.weekday;
}
```

To specify the values of `displayName` and `weekday` for each enum value,
we call the constructor when listing the values. The full class then looks like
this:

```java {linenos=true}
public enum Day {

   SUNDAY("Sunday", false),
   MONDAY("Monday", true),
   TUESDAY("Tuesday", true),
   WEDNESDAY("Wednesday", true),
   THURSDAY("Thursday", true),
   FRIDAY("Friday", true),
   SATURDAY("Saturday", false);

   private final String displayName;
   private final boolean weekday;

   public Day(String displayName, boolean weekday) {
      this.displayName = displayName;
      this.weekday = weekday;
   }

   public String getDisplayName() {
      return this.displayName;
   }

   public boolean isWeekday() {
      return this.weekday;
   }

}
```

{{% notice blue Note "rocket" %}}
Notice that we now have to add a semi-colon after our list of enum values.
{{% /notice %}}

## Check Your Understanding

{{% notice green Question "rocket" %}}
We mentioned above that all classes define a data type. Is the inverse of this statement true? In other words, do all data types correspond to a class? (*Hint:* Try to think of a data type that is NOT a class.)

1. Yes, everything in Java is a class.
1. No, there are data types that do not correspond to a class. (Be sure to provide an example.)

<!-- Solution: No, primitive data types are not classes. -->
{{% /notice %}}

{{% notice green Question "rocket" %}}
Which of the following would NOT be a good choice for an enum type?

1. States in the US
1. Shoe sizes (using the American scale)
1. Price of a gallon of milk
1. Sections in a bookstore

<!-- Solution: 3. Price of a gallon of milk -->
{{% /notice %}}
