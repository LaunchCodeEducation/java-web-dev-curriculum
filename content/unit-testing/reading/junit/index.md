---
title: "JUnit"
date: 2023-06-28T13:58:37-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: Colin Brock # update any time edits are made after review
lastEditorGitHub: ColinBrock # update any time edits are made after review
lastMod: 2023-11-28 # UPDATE ANY TIME CHANGES ARE MADE
---

JUnit is a library that provides the classes, methods, and assertions
for writing and executing unit tests in Java. In this course, 
we use JUnit 5.

## Java Annotations

On the topic of unit testing, the annotation `@Test` is used to 
indicate that a `public void` method should be treated as a test case.

In Java, **annotations** are formalized bits of information about a program. They operate
somewhere between actual code syntax and a comment on the code. Annotations do not 
directly affect the code they annotate, but they do supply information to the compiler.
Annotations are indicated with an `@` symbol. We will provide an example in the 
walkthrough below.

## Testing Setup

Whenever you have set up a new project in IntelliJ, you may have noticed that in addition to `main`, there is a `test` directory. Before you start adding tests, you need to check that JUnit is already set up and ready to go.

1. Open up `build.gradle`.
1. Within `dependencies`, if JUnit is already configured, you will see something similar to the following:

   ```java
   testImplementation(platform("org.junit:junit-bom:5.9.1"))
   testImplementation("org.junit.jupiter:junit-jupiter")
   ```

1. If you don't see anything in `dependencies`, right-click directly on `dependencies`. In the resulting menu, select *Generate*, then `Add Dependency`.
1. At the bottom of the IntelliJ screen, search for `org.junit.jupiter:junit-jupiter`. Select "JUnit Jupiter Aggregator" and click *Add*.

   {{% notice blue "Note" "rocket" %}}
   There are a lot of different versions of JUnit as people contribute their own code. Make sure that you have selected "JUnit Jupiter Aggregator".
   {{% /notice %}}

1. You may need to wait a moment for IntelliJ to reload with JUnit added to your project. Now you are ready to test!

We call external libraries, like JUnit, **dependencies**. A dependency is a 
separately developed program or piece of code that another program or piece of code 
uses to carry it out its function. Our Java tests will *depend* on JUnit code. In 
the future, as you build your own Java projects, you will likely use different dependencies.

### `main/Car` and `test/CarTest`

Within `unit-testing/chapter-example`, open the `car-example` project in IntelliJ.
Inside, you'll see a `main` directory and `test`
directory. Open the `Car` class within `main` and  look around. Here, we
provide a class `Car` with basic information about a make, model, gas level,
and mileage as well as getters, setters, and a few other methods. 

In the same directory, you'll find a `Main` class with a main method that prints the
`make` and `model` of a given `Car` object. Run this class to verify it works.
Now, open `test/CarTest`. It's empty, save for a few TODOs. Let's tackle the
first TODO to make a new empty test. Starting with an empty test lets us
validate that we can use JUnit in our current environment.

## `@Test`

Create the following empty test underneath the first TODO. As usual,
be sure write this code rather than copy/paste it:

```java {linenos=table}
   //TODO: add emptyTest so we can configure our runtime environment
   @Test
   public void emptyTest() {
      assertEquals(10,10,.001);
   }
```

Once written, you likely need to add these import statements at the top of your file:

```java {linenos=table}
   import org.junit.jupiter.api.Test;
   import static org.junit.jupiter.api.Assertions.*;
```

{{% notice blue "Note" "rocket" %}}
   In some cases, IntelliJ may sense which testing library and method you want to 
   use and add the import statements as you type. If this is the case, just make sure they
   are the correct paths. Aren't IDEs wonderful?
{{% /notice %}}

As we mention above, `@Test` annotates the method to signal it as a test case. We need 
to add the appropriate import statement in order to take advantage of this annotation. 

Our empty test is aptly named `emptyTest()`, a description of its role. This test does 
not follow the AAA rule from our testing best practices, as it jumps straight to 
asserting. Nor is it relevant, for that matter. 

Again, the IDE comes in handy, inserting the names of each of our parameters, 
"expected:", "actual:", and "delta:". This empty test is simply asserting an 
expected value of `10` to equal an actual value of `10`, 
with an accepted `.001` variance. 

{{% notice blue "Note" "rocket" %}}
   The third argument, called `delta`, is the amount of allowed difference between the 
   expected and actual values. If the difference between the two values is within 
   that range, then the test still passes. 
   This argument is optional for some comparisons and required for others. One 
   scenario in which it is required is when comparing doubles. 

   Why is it required? Well, that's kind of a long story. Some number types are 
   [floating-point numbers](https://en.wikipedia.org/wiki/Floating-point_arithmetic). 
   Due to the nature of their storage, these types carry with them a certain 
   degree of 
   [inaccuracy](https://en.wikipedia.org/wiki/Floating-point_arithmetic#Accuracy_problems). 
   In brief, the `delta` argument ensures we can still reasonably compare two doubles.
{{% /notice %}}

Of course, `10` equals `10`. But let's run it so 
we know our test runner works. Click the green arrow to the left of 
`public class CarTest` to run the test. Once run, you'll see a new output panel with a 
green check mark indicating the test passed and a message stating the test passed. We 
now know how the test runner behaves when a test passes and begin the real work of unit 
testing the `Car` class.

Under your second TODO, write a test to verify that the constructor sets the 
`gasTankLevel` property.

```java {linenos=table}
   //TODO: constructor sets gasTankLevel properly
   @Test
   public void testInitialGasTank() {
      Car test_car = new Car("Toyota", "Prius", 10, 50);
      assertEquals(10, test_car.getGasTankLevel(), .001);
   }
```

Here, we give the test a descriptive name, `testInitialGasTank()`, initialize a new 
`Car` object, and test that the constructor correctly handles the `gasTankLevel` property.
Run `CarTest` to see that both tests pass. 

{{% notice green "Tip" "rocket" %}}
   If you want to run only one test, click the green arrow next to the test method's name.
{{% /notice %}}

## `@BeforeEach`

`@BeforeEach` is another annotation we can use to help in test cases. The `@BeforeEach`
annotation can be used to set up some data or a condition that you want to have for 
every test in a given class. In the case of `CarTest`, it would be nice to not need to
create a new `Car` instance for each test we write. 

In your `testInitialGasTank()` method, remove the line initiating `test_car`. 
Above your first test, add the following `@BeforeEach` method:

```java {linenos=table}
   Car test_car;

   @BeforeEach
   public void createCarObject() {
      test_car = new Car("Toyota", "Prius", 10, 50);
   }
```

Did IntelliJ prompt you to import `@BeforeEach`? Did it import the annotation as you were 
writing the method? If not, add it:

```java
   import org.junit.jupiter.api.BeforeEach;
```

Now, run the test file and ensure your test still passes.

## `@AfterEach`

`@AfterEach`, conversely, defines a set of conditions to be met after each test in a 
suite is run. 

{{% notice blue "Note" "rocket" %}}
   A good or frequent use case for `@AfterEach` would be if you needed to test
   some code that requires access to a database. Here, you could open the database 
   connection with a `@BeforeEach` method and close the connection in an `@AfterEach` method.
{{% /notice %}}

## Common Assertion Methods

In addition to the very commonly used `assertEquals()` method
you see above, here are a few other methods you should have in 
your unit testing playbook.

| Assertion | Description |
|-----------|-------------|
| `assertEquals(expected, actual, optional_delta)` | Asserts that two values, expected and actual, are equal to each other (optionally, within a given range of difference) |
| `assertFalse(condition)` | Asserts that a given condition is false |
| `assertTrue(condition)` | Asserts that a given condition is true |
| `assertNotNull(object)` | Asserts that a given object is not null |

## Check Your Understanding 

{{% notice green "Question" "rocket" %}}
   Write another version of `testInitialGasTank()` using `assertFalse()`, comparing the value to `0`.
{{% /notice %}}

<!-- assertFalse(test_car.getGasTankLevel() == 0); -->

{{% notice green "Question" "rocket" %}}
   Write another version of `testInitialGasTank()` using `assertTrue()`.
{{% /notice %}}

<!-- assertTrue(test_car.getGasTankLevel() == 10); -->
