---
title: "Exercises: Unit Testing"
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

Work on these exercises in the IntelliJ `car-exercises` 
project in `java-web-dev-projects/unit-testing/exercises`. You will update your `CarTest.java` file by adding 
more test cases.

## `testGasTankAfterDriving()`

Add a test for the third TODO, "gasTankLevel is accurate after driving within tank range".

1. Your test must use the `Car` method `drive()` 

   ```java
      test_car.drive(50);
   ```

1. With a value of `50` miles passed into `drive()`, we expect 
   `test_car` to have a `gasTankLevel` of `9`.

   ```java
      assertEquals(9, test_car.getGasTankLevel(), .001);
   ```

{{% expand "Check your solution" %}}

```java
@Test
public void testGasTankAfterDriving() {
   test_car.drive(50);
   assertEquals(9, test_car.getGasTankLevel(),.001);
}
```

{{% /expand %}}

## `testGasTankAfterExceedingTankRange()`

Add a test for the fourth TODO, "gasTankLevel is accurate after attempting to drive past tank range".

1. You're on your own for this one. You'll need to simulate the `Car`
   traveling farther than it's `gasTankLevel` allows.

{{% expand "Check your solution" %}}

```java
@Test
public void testGasTankAfterExceedingTankRange() {
   test_car.drive(501);
   assertEquals(test_car.getGasTankLevel(), 0, .001);
}
```

{{% /expand %}}

## `testGasOverfillException()`

The test for our last TODO is a little different. We are going to 
perform an action on our car object, and we are expecting the object 
to throw an error. In this case, we are going to attempt to add gas 
to our car that exceeds the gas tank size.

1. First, we'll add some code to our test to tell JUnit
   to expect an exception. 

   ```java
      //TODO: can't have more gas than tank size, expect an exception
      @Test()
      public void testGasOverfillException() {
         assertthrows(IllegalArgumentException.class, () -> );
      }
   ```

   This lets JUnit know that this test should pass if an 
   `IllegalArgumentException` is thrown at any point during this test.

1. Update the `Car` class to include an `addGas()` method.

   ```java
      public void addGas(double gas) {
        this.setGasTankLevel(gas + this.getGasTankLevel());
      }
   ```

1. Back in `CarTest`, implement the new `addGas()` method and what should happen if the exception is thrown after the `->` syntax using this code: `test_car.addGas(5), "Shouldn't get here, car cannot have more gas in tank than the size of the tank"`. The string will be displayed if the test fails. 

1. Run the test. It should fail! In the output is an unexpected 
   exception. This test was expecting an `IllegalArgumentException`, 
   but it got an `AssertionError` exception. This caused the test 
   to fail.

1. We need to refactor `Car` to throw an exception when too much
   gas is added to the tank. Find the `setGasTankLevel` method and
   modify it:

   ```java
      public void setGasTankLevel(double gasTankLevel) {
         if (gasTankLevel > this.getGasTankSize()) {
            throw new IllegalArgumentException("Can't exceed tank size");
         }
        this.gasTankLevel = gasTankLevel;
      }
   ```

1. Now, run the test - it should pass!

{{% expand "Check your solution" %}}

```java
@Test
public void testGasOverfillException() {
   assertThrows(IllegalArgumentException.class, () -> test_car.addGas(5), "Shouldn't get here, car cannot have more gas in tank than the size of the tank"
   );
}
```

{{% /expand %}}