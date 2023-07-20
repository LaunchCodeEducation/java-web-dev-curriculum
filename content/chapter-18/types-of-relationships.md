# Types of Relationships

Just as data in different database tables [can have
relationships](https://education.launchcode.org/SQL/chapters/mysql-part-2/relationships.html#one-to-many-relationships)
to each other, so can classes and objects. In fact, relationships
between objects will translate into relationships between rows in a
database when using ORM.

This chapter introduces the tools needed to create meaningful
relationships using ORM. Before considering how to do this with Spring
Boot, however, let\'s consider the different types of relationships at a
conceptual level.

For the examples below, we use four classes:

-   `Event` - A class representing a coding event.
-   `EventCategory` - A class representing categories of coding events.
-   `EventDetails` - A class that encapsulates details about a single
    event, such as description, contact email, location, and so on.
-   `Tag` - A piece of metadata labeling an event. You can think of
    these as topics that an event might include, such as Java, Spring,
    or JavaScript. An event can cover multiple topics, so it can have
    multiple tags.

The first two of these are familiar to you from our `coding-events` app.
The `EventDetails` and `Tag` classes will be introduced later in this
chapter.

## One-to-One {#one-to-one-def}

::: index
! one-to-one
:::

The simplest type of relationship is the **one-to-one relationship**.
This occurs when each instance of type A may be related to only one
instance of type B, and vice versa.

::: admonition
Note

In the following examples, arrows point in the direction of the
relationship. If A points to B, then you can say that A *knows about* B.

While relationships in SQL are bidirectional, relationships in
programming languages are unidirectional. In other words, if A knows
about B, then B doesn\'t necessarily know about A.
:::

<figure>
<img src="figures/one-to-one.png" width="800"
alt="figures/one-to-one.png" />
<figcaption>A one-to-one relationship between an <code>Event</code>
object and an <code>EventDetails</code> object</figcaption>
</figure>

An `Event` object should only have one collection of details, so it
should only be related to one `EventDetails` object. Similarly, details
about an event are specific to that event, so an `EventDetails` object
should only be related to one `Event` object.

::: admonition
Examples

The following pairs of things generally have one-to-one relationships:

1.  People / driver\'s licenses
2.  States / capital cities
3.  iPhones / serial numbers

It is not *required* that each instance of type A be related to an
instance of type B. For example, a person may not have a driver\'s
license.
:::

## One-to-Many and Many-to-One

::: index
! one-to-many
:::

A **one-to-many** relationship occurs when each instance of type A may
be related to more than one instance of type B, but each instance of B
can only be related to a single instance of type A.

<figure>
<img src="figures/one-to-many.png" width="800"
alt="figures/one-to-many.png" />
<figcaption>A one-to-many relationship between
<code>EventCategory</code> and <code>Event</code> objects</figcaption>
</figure>

::: index
! many-to-one
:::

In this case, we say that A has a one-to-many relationship to B. A
category can contain multiple items, therefore an `EventCategory` object
may be related to multiple `Event` objects. But an event may only be in
one category.

::: admonition
Examples

The following pairs of things generally have one-to-many relationships:

1.  Birth dates / people
2.  States / U.S. Representatives
3.  Model numbers / iPhones
:::

When discussing the inverse relationship, we say that B has a
**many-to-one** relationship to A.

<figure>
<img src="figures/many-to-one.png" width="800"
alt="figures/many-to-one.png" />
<figcaption>A many-to-one relationship between <code>Event</code> and
<code>EventCategory</code> objects</figcaption>
</figure>

A many-to-one relationship operates in the opposite direction of a
one-to-many relationship. The difference between the two is which side
of the relationship *knows about* the objects on the other side. In Java
terms, this will translate into a field on one class that references the
other.

::: admonition
Examples

Many-to-one relationships are simply the opposite direction of
one-to-many. Therefore, each of the following pairs has a many-to-one
relationship.

1.  People / birth dates
2.  U.S. Representatives / states
3.  iPhones / model numbers
:::

## Many-to-Many

**Many-to-many** relationships occur when each instance of type A can be
related to multiple instances of type B, and vice versa.

::: {#many-to-many-figure}
<figure>
<img src="figures/many-to-many.png" width="800"
alt="figures/many-to-many.png" />
<figcaption>A many-to-many relationship between Event and Tag
objects</figcaption>
</figure>
:::

An event can have multiple tags, and a tag may be associated with
multiple events. Thus, we have a many-to-many relationship.

::: admonition
Examples

The following pairs of things generally have many-to-many relationships:

1.  Books / authors
2.  Recipes / ingredients
3.  Actors / movies
:::

## Check Your Understanding

::: admonition
Question

Match the following pairs with the appropriate relationship type:

1.  car / manufacturer
2.  car / title
3.  car / driver
4.  car / tire
:::

::: admonition
Question

True/False: In order for two Java classes, A and B, to be mapped in a
one-to-many relationship, class A must contain a field for instances of
B and B must have a field for instances of A.

1.  True
2.  False
:::
