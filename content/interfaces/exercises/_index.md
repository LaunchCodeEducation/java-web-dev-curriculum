---
title: "Exercises: Interfaces and Polymorphism"
date: 2023-06-15T14:01:05-05:00
draft: false
weight: 2
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey  # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-07-10T14:01:05-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

## Exercises

As a new Java coder, it might take you some time to recognize the usefulness of interfaces. At first glance, these tools do not seem to provide much benefit over extending a base class, adding instance methods to a class, or overriding a method like `toString`.

To help overcome this, let’s consider a common occurrence—sorting an `ArrayList` of objects.

If the list contains `String` or numerical entries, then sorting the list is [trivial]({{% relref "../../../control-flow-and-collections/reading/arraylist/" %}}):
   ```java
   Collections.sort(arrayListName);
   ```

However, if the elements are custom objects (like `Cat`), then sorting the list becomes more complicated. This is because the objects may contain multiple fields, any of which could be used as a sorting option. For `Cat` objects, this could include `name`, `age`, or `mass`.

## Getting Started

Work on these exercises in the IntelliJ `java-web-dev-projects`. You will find the starter code in the `exercises` package of the `interfaces` directory. Go ahead and open the folder and take a quick look at the class files.

You will practice implementing interfaces by playing around with a small ice cream store. It consists of a refrigerated display `Case`, which contains a collection of ice cream `Flavor` objects and a selection of `Cone` objects.

{{% notice green "Tip" "rocket" %}} 
 Did you notice the abstract `Ingredient` class? This gets extended into `Flavor` and `Cone` to help streamline the code.
{{% /notice %}}

## 1. Sorting Flavors by Name

To display a menu for your customers, you need to sort the ice cream flavors alphabetically by their `name` field. Fortunately, the `Comparator` interface helps you solve the sorting-objects-by-field problem.

### Create a Sorting Class

1. Create an new class called `FlavorComparator` and have it implement the `Comparator` interface:

   ```java
   public class FlavorComparator implements Comparator<Flavor>
   ```
1. Notice that IntelliJ flags a couple of errors that you need to fix:
   1. Import `java.util.Comparator`. This removes the flag on `Comparator`.
   1. Hover over the line again and select _implement methods_. Choose the `compare` option.
   {{< rawhtml >}}
   <img src="../exercises/images/implement-methods.png" alt=" " width=80% />
   {{< /rawhtml >}}
   1. This adds an `@Override` method that compares two `Flavor` objects and always returns `0`.
1. Always returning `0` results in no sorting, so replace line 8 with:

```java
return o1.getName().compareTo(o2.getName());
```
This returns an integer (negative, positive, or zero) depending on whether `Flavor` object `o1` or `o2` comes first, alphabetically.

{{% expand "Check your solution" %}}
```java
public class FlavorComparator implements Comparator<Flavor> {
   @Override
   public int compare(Flavor flavor1, Flavor flavor2) {
      return flavor1.getName().compareTo(flavor2.getName());
   }
}
```
{{% /expand %}}

### Sorting the `flavors` ArrayList

In `Main`, we declare menu that contains everything in the Case as well as specific `flavors` and `cones` collections.

```java{linenos=table,hl_lines=[],linenostart=6}
public static void main(String[] args){
   Case menu = new Case();
   ArrayList<Flavor> flavors = menu.getFlavors();
   ArrayList<Cone> cones = menu.getCones();

}
```
1. To sort the flavors list, first create a new `FlavorComparator` object.
   ```java{linenos=table,hl_lines=[],linenostart=6}
   public static void main(String[] args){
      Case menu = new Case();
      ArrayList<Flavor> flavors = menu.getFlavors();
      ArrayList<Cone> cones = menu.getCones();
      Comparator comparator = new FlavorComparator();
   }
   ```
1. Next, call the sort method on `flavors` and pass the `comparator` object as the argument.

   ```java{linenos=table,hl_lines=[],linenostart=6}
   public static void main(String[] args){
      Case menu = new Case();
      ArrayList<Flavor> flavors = menu.getFlavors();
      ArrayList<Cone> cones = menu.getCones();
      Comparator comparator = new FlavorComparator();

      flavors.sort(comparator);
   }
   ```

1. Next, add some code to iterate over the flavors list and print out the flavors before and after sorting.

   ```java{linenos=table,hl_lines=[],linenostart=6}
   public static void main(String[] args){
      Case menu = new Case();
      ArrayList<Flavor> flavors = menu.getFlavors();
      ArrayList<Cone> cones = menu.getCones();
      Comparator comparator = new FlavorComparator();

      System.out.println("Before:");
      System.out.println();
      for (Flavor flavor : flavors) {
         System.out.println(flavor.getName());
      }

      flavors.sort(comparator);

      System.out.println();
      System.out.println("After:");
      System.out.println();
      for (Flavor flavor : flavors) {
         System.out.println(flavor.getName());
      }
   }
   ```

1. Running the application, shows the list before and after the sort.
   ```bash
   Before:

   Vanilla
   Chocolate
   Red Velvet
   Rocky Road
   Strawberry Sorbet

   After:

   Chocolate
   Red Velvet
   Rocky Road
   Strawberry Sorbet
   Vanilla
   ```

Note that `Main` does NOT have to implement the `Comparator` interface. This only needs to happen in the class that actually uses the `compare` method.

{{% notice green "Tip" "rocket" %}} 
 Instead of declaring and initializing the `comparator` object, we could combine steps 1 and 2 by using a single statement:
   ```java
   flavors.sort(new FlavorComparator());
   ```
{{% /notice %}}

## Sorting Cones by Cost

Now let’s sort our `cones` list by cost, from least expensive to most expensive.
1. Create the new class `ConeComparator`.

1. Follow the example above to implement the `Comparator` interface and evaluate `Cone` objects by cost.

1. In `Main`, sort the `cones` list, then print the elements to the screen to verify the results.

   ```bash
   Before:           After:

   Waffle: $1.25        Bowl: $0.05
   Sugar: $0.75         Wafer: $0.50
   Wafer: $0.50         Sugar: $0.75
   Bowl: $0.05          Waffle: $1.25
   Check your solution
   ```

{{% expand "Check your solution" %}}
```java{linenos=table,hl_lines=[],linenostart=1}
public class ConeComparator implements Comparator<Cone> {
   @Override
   public int compare(Cone cone1, Cone cone2) {
      if (cone1.getCost() - cone2.getCost() < 0){
         return -1;
      } else if (cone1.getCost() - cone2.getCost() > 0) {
         return 1;
      } else {
         return 0;
      }
   }
}
```
{{% /expand %}}

### Troubleshooting

Did you get this error?

   {{< rawhtml >}}
   <img src="../exercises/images/compare-double.png" alt=" " width=60% />
   {{< /rawhtml >}}

This happens because according to the interface, `compare` MUST return an integer value, but the `cost` fields are `double` type.

To fix this, use an `if/else if/else` block to evaluate `o1.getCost() - o2.getCost()`. Return a positive integer, negative integer, or 0 depending on the result.

## Bonus Exercises

1. Modify `FlavorComparator` to sort `Flavor` objects by the number of allergens, from highest to lowest.

1. Create a `Topping` class that extends Ingredient. Add toppings to the `Case` constructor, then choose how to sort a `toppings` array in `Main`.

## Next Steps

In these exercises, you practiced implementing existing interfaces. In the studio activity, you will design and implement your own.
