# Interfaces In The Wild

The first situations where you'll want to use interfaces involve
applying pre-defined interfaces and classes that are part of Java. Here
are a few examples.

## Comparable\<T\>

**Purpose**: A class implements `Comparable<T>` in order to allow
comparison\-\--in a "greater than" and "less than" sense\-\--to another
instance of the class. This is a "parameterized" interface, which means
that you need to specify the class that it will be comparing. For
example, `Comparable<Job>` would compare `Job` objects.

**Important Methods**: `compareTo(T)`

[Comparable\<T\> Documentation
\<https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/lang/Comparable.html\>]{.title-ref}\_\_

## Comparator\<T\>

**Purpose**: Compares two objects of a given class. To allow comparisons
and ordering based on the different fields, you can create several
different `Comparator` classes. The class for the compared objects does
NOT implement the interface itself.

**Important Methods**: `compare(T, T)`

[Comparator\<T\> Documentation
\<https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/util/Comparator.html\>]{.title-ref}\_\_

This interface can be used to determine, given two objects of the given
type, which one is "greater" than the other. It is also used by
collections such as `an ArrayList <array-list>`{.interpreted-text
role="ref"} to sort its contents with the
`sort <arraylistsort>`{.interpreted-text role="ref"} method.

::: admonition
Note

For more on the differences between `Comparator` and `Comparable`, see
[this
article](https://www.javatpoint.com/difference-between-comparable-and-comparator).
:::

## Iterable\<T\>

**Purpose**: Enables iteration over a collection of objects using a
for-each loop

**Important Methods**: `iterator()`

[Iterable\<T\> Documentation
\<http://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html\>]{.title-ref}\_\_

This interface is implemented by the `ArrayList<T>` class, which we've
been using throughout this course.

::: admonition
Example

``` {.java linenos=""}
Iterable<String> collection = new ArrayList<>();

// Add items to the collection

for (String item : collection) {
   // do something with each item
}
```
:::

## List\<E\>

**Purpose**: Enables access to objects in a collection by index. In
other words, it enables ordered collections.

**Important Methods**: `add(int, T)`, `get(int)`, `indexOf(T)`

[List\<T\> Documentation
\<https://docs.oracle.com/en/java/javase/15/docs/api/java.base/java/util/List.html\>]{.title-ref}\_\_

This interface is also implemented by the `ArrayList<T>` class, which
we've been using throughout this course. In fact, `List<T>` extends
`Iterable<T>`. *An interface may extend another interface*, in the same
way that classes may extend each other.

::: admonition
Example

``` {.java linenos=""}
List<String> collection = new ArrayList<>();

// Add items to the collection

// Get the first item
String firstItem = collection.get(0);
```
:::

## Map\<K, V\>

**Purpose**: Represents a collection of key/value pairs.

**Important Methods**: `get(K)`, `containsKey(K)`, `put(K, V)`

[Map\<K, V\> Documentation
\<http://docs.oracle.com/javase/8/docs/api/java/util/Map.html\>]{.title-ref}\_\_

This interface is implemented by the `HashMap<K, V>` class, which we've
been using throughout this course.

::: admonition
Example

``` {.java linenos=""}
Map<String, String> collection = new HashMap<>();

// Add items to the collection

// Get item with key "hello"
String hello = collection.get("hello");
```
:::

## Check Your Understanding

::: admonition
Question

True or False

An interface can extend another interface.
:::
