---
title: "Interfaces in the Wild"
date: 2023-06-15T14:01:05-05:00
draft: false
weight: 4
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey  # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-07-10T14:01:05-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---
The first situations where you’ll want to use interfaces involve applying pre-defined interfaces and classes that are part of Java. Here are a few examples.

## `Comparable<T>`
**Purpose**: A class implements `Comparable<T>` in order to allow comparison—in a “greater than” and “less than” sense—to another instance of the class. This is a “parameterized” interface, which means that you need to specify the class that it will be comparing. For example, `Comparable<Job>` would compare `Job` objects.

**Important Methods**: `compareTo(T)`

[Comparable Documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/Comparable.html)

## `Comparator<T>`
**Purpose**: Compares two objects of a given class. To allow comparisons and ordering based on the different fields, you can create several different `Comparator` classes. The class for the compared objects does NOT implement the interface itself.

**Important Methods**: `compare(T, T)`

[Comparator Documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Comparator.html)

This interface can be used to determine, given two objects of the given type, which one is “greater” than the other. It is also used by collections such as an [ArrayList]({{% relref "../../../control-flow-and-collections/reading/arraylist/" %}}) to sort its contents with the `sort()` method.

{{% notice blue "Note" "rocket" %}} 
 For more on the differences between Comparator and Comparable, see [this article](https://www.javatpoint.com/difference-between-comparable-and-comparator).
{{% /notice %}}

## `Iterable<T>`
**Purpose**: Enables iteration over a collection of objects using a for-each loop

**Important Methods**: `iterator()`

[Iterable Documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/Iterable.html)

This interface is implemented by the `ArrayList<T>` class, which we’ve been using throughout this course.

{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
Iterable<String> collection = new ArrayList<>();

// Add items to the collection

for (String item : collection) {
   // do something with each item
}
```
{{% /notice %}}

## `List<E>`
**Purpose**: Enables access to objects in a collection by index. In other words, it enables ordered collections.

**Important Methods**: `add(int, T)`, `get(int)`, `indexOf(T)`

[List Documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/List.html)

This interface is also implemented by the `ArrayList<T>` class, which we’ve been using throughout this course. In fact, `List<T>` extends `Iterable<T>`. _An interface may extend another interface_, in the same way that classes may extend each other.
{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
List<String> collection = new ArrayList<>();

// Add items to the collection

// Get the first item
String firstItem = collection.get(0);
```
{{% /notice %}}

## `Map<K,V>`
**Purpose**: Represents a collection of key/value pairs.

**Important Methods**: `get(K)`, `containsKey(K)`, `put(K, V)`

[Map Documentation](https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/util/Map.html)
`
This interface is implemented by the `HashMap<K, V>` class, which we’ve been using throughout this course.
{{% notice blue "Example" "rocket" %}} 
 ```java{linenos=table,hl_lines=[],linenostart=1}
Iterable<String> collection = new ArrayList<>();

// Add items to the collection

for (String item : collection) {
   // do something with each item
}
```
{{% /notice %}}

## Check Your Understanding

{{% notice green  "Question" "rocket" %}} 
 True/False: An interface can extend another interface.
 <!-- ans: true -->
{{% /notice %}}