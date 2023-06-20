---
title: "Inheritance in Java"
date: 2021-10-01T09:28:27-05:00
weight: 2
draft: false
---

Let's examine an inheritance relationship between two classes, `Cat` and `HouseCat`. `HouseCat` is a class that inherits from `Cat`. When defined, `HouseCat` thus receives the data and behaviors of `Cat`. These inherited traits are things like fields, properties, and methods. Any fields and non-constructor methods in `Cat` are available to each instance of `HouseCat`.

When we speak about an inheritance relationship, we say that a `HouseCat` *is a* `Cat`, or *extends* `Cat`. Indeed, in order to define a class that inherits from another, we use the `extends` keyword.

```java
public class Cat {
   // ...code for the Cat class...
}

public class HouseCat extends Cat {
   // ...code for the HouseCat class...
}
```

We say that `HouseCat` is a **subclass**, **derived class**, or **child class** of `Cat`, and we say that `Cat` is the **superclass**, **base class**, or **parent class** of `HouseCat`.

In Java, a class may extend only one class. Classes may extend each other in turn, however. This creates hierarchies of classes. We often visualize these by drawing each class as a box, with an arrow pointing from the subclass to the base class.

{{< rawhtml >}}
   <img src="pictures/inheritance-basic.png" alt="Basic inheritance diagram" width=40% />
{{< /rawhtml >}}

{{% notice blue Note "rocket" %}}
In the above image, class `B` is an extension of class `A`.

The shaded portion of these boxes can include additional information about each class. We'll learn about what we might put here in a little bit.
{{% /notice %}}

Inheritance is an essential mechanism for sharing data and behavior between related classes. Using it effectively creates organized code with groups of classes that have increasingly specialized behavior.

When this happens, we can visualize the inheritance structure with a slightly more complex diagram.

{{< rawhtml >}}
   <img src="pictures/inheritance-tree.png?classes=border.png" alt="Inheritance tree with many nodes" width=50% />
{{< /rawhtml >}}

You can see that classes `B`, `C`, and `D` all extend class `A`. And class `E` extends class `D` which itself extends class `A`. So class `E` involves an even greater specialization of behavior than class `D`.

Fields and non-constructor methods are directly available to instances of the subclass, subject to any access modifiers. In general, this means that `private` and package-private members of a base class are not accessible to a subclass. The exception to this is that package-private members are accessible to subclasses *within the same package*.

<!-- TODO: Add link below to access modifiers in Java -->
{{% notice blue Note "rocket" %}}
If anything in the last paragraph was fuzzy, this is a good time to review access modifiers in Java.
{{% /notice %}}

## Check Your Understanding

{{% notice green Question "rocket" %}}
Which of the following is NOT a term for one class that extends another:

1. subclass
    
1. derived class

1. extension class

1. child class
{{% /notice %}}

{{% notice green Question "rocket" %}}
A class, `Greeting`, extends another class, `Message`. By convention, how would we represent the relationship between these classes in a diagram?

a. two boxes with an arrow pointing from `Greeting` to `Message`
    
b. two boxes with an arrow pointing from `Message` to `Greeting`

c. two boxes with `Greeting` positioned inside of `Message`

d. two boxes with `Greeting` positioned directly beneath `Message`
{{% /notice %}}
