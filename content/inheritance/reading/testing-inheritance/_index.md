---
title: "Testing Inheritance"
date: 2021-10-01T09:28:27-05:00
weight: 6
draft: false
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Not sure you get the whole inheritance idea? Still not sure which fields and methods get inherited and 
which are overridden? Looking to *test* your understanding? (wink)

<!-- TODO: Add link to Unit testing chapter below -->
Knowing what we know now about [unit-testing](unit-testing) and [inheritance]({{< relref "../../_index.md" >}}), we can test that our 
subclasses extend their base classes.

We can add a `test` folder to our `inheritance` package and write some code to ensure that 
`HouseCat` inherits what we expect it to.

```java
@Test
public void inheritsSuperInFirstConstructor() {
   HouseCat keyboardCat = new HouseCat("Keyboard Cat", 7);
   assertEquals(7, keyboardCat.getWeight(), .001);
}
```

Here, we're testing that one of our `HouseCat` constructors will call the `Cat` constructor
and appropriately assign the `HouseCat` object's `weight` property. Remember, we don't need
to write unit tests for getters or setters unless they do something extra in addition to getting
or setting. The purpose of this test, though, is less to test getting `keyboardCat.weight` 
and more to validate that the subclass constructor has inherited the base class constructor.

It's a good practice to test your subclasses to verify the items that they inherit or override.

## Check Your Understanding

**Question:**

{{% notice green Question "rocket" %}}
Fill in the blank to test that the default constructor of `Cat` is called when the second 
constructor on `HouseCat` is used.

Second `HouseCat` constructor:

```java
public HouseCat(String aName) {
  name = aName;
}
```

```java
@Test
public void inheritsDefaultCatInSecondConstructor() {
   HouseCat keyboardCat = new HouseCat("Keyboard Cat");
   <insert assertion method here>
}
```

1. assertEquals(13, keyboardCat.getWeight());

1. assertNotNull(keyboardCat.getWeight());

1. assertEquals(13, keyboardCat.getWeight(), .001);

1. assertNotNull(keyboardCat.weight);
{{% /notice %}}

{{% notice green Question "rocket" %}}
What additional assert method can we add to this test to properly verify that `HouseCat`
inherits `eat()`?

```java
@Test
public void isNotInitiallyTired() {
   HouseCat keyboardCat = new HouseCat("Keyboard Cat");
   assertFalse(keyboardCat.isHungry());
   assertFalse(keyboardCat.isTired());
   keyboardCat.eat();
}
```


1. assertFalse(keyboardCat.isTired());

1. assertTrue(keyboardCat.isTired());

1. assertTrue(keyboardCat.isHungry());

1. assertFalse(keyboardCat.tired);
{{% /notice %}}
