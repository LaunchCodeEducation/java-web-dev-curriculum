---
title: "Types of Relationships"
date: 2023-08-21T14:38:32-05:00
draft: false
weight: 1
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Just as data in different database tables [can have relationships](https://education.launchcode.org/SQL/chapters/mysql-part-2/relationships.html#one-to-many-relationships) to each other, so can classes and objects. In fact, relationships between objects will translate into relationships between rows in a database when using ORM. 

This chapter introduces the tools needed to create meaningful relationships using ORM. Before considering how to do this with Spring Boot, however, let's consider the different types of relationships at a conceptual level. 

For the examples below, we use four classes:

1. `Event` - A class representing a coding event.
1. `EventCategory` - A class representing categories of coding events.
1. `EventDetails` - A class that encapsulates details about a single event, such as description, contact email, location, and so on.
1. `Tag` - A piece of metadata labeling an event. You can think of these as topics that an event might include, such as Java, Spring, or JavaScript. An event can cover multiple topics, so it can have multiple tags.

The first two of these are familiar to you from our `codingevents` app. The `EventDetails` and `Tag` classes will be introduced later in this chapter.

## One-to-One

The simplest type of relationship is the **one-to-one relationship**. This occurs when each instance of type A may be related to only one instance of type B, and vice versa.

{{% notice blue "Note" "rocket" %}}

   In the following examples, arrows point in the direction of the relationship. If A points to B, then you can say that A *knows about* B.

   While relationships in SQL are bidirectional, relationships in programming languages are unidirectional. In other words, if A knows about B, then B doesn't necessarily know about A.

{{% /notice %}}

![A single Event object on the left, with a double-sided arrow point to a single EventDetails object on the right](pictures/one-to-one.png)

An `Event` object should only have one collection of details, so it should only be related to one `EventDetails` object. Similarly, details about an event are specific to that event, so an `EventDetails` object should only be related to one `Event` object.

{{% notice blue "Exxample" "rocket" %}}

   The following pairs of things generally have one-to-one relationships:

   1. People / driver's licenses
   1. States / capital cities
   1. iPhones / serial numbers

   It is not *required* that each instance of type A be related to an instance of type B. For example, a person may not have a driver's license.

{{% /notice %}}

## One-to-Many and Many-to-One

A **one-to-many** relationship occurs when each instance of type A may be related to more than one instance of type B, but each instance of B can only be related to a single instance of type A.

![A single EventCategory object on the left, related to two Event objects on the right](pictures/one-to-many.png)

In this case, we say that A has a one-to-many relationship to B. A category can contain multiple items, therefore an `EventCategory` object may be related to multiple `Event` objects. But an event may only be in one category.

{{% notice blue "Example" "rocket" %}}

   The following pairs of things generally have one-to-many relationships:

   1. Birth dates / people
   1. States / U.S. Representatives
   1. Model numbers / iPhones

{{% /notice %}}

When discussing the inverse relationship, we say that B has a **many-to-one** relationship to A.

![Two Event objects on the left, related to a single EventCategory object on the right](pictures/many-to-one.png)

A many-to-one relationship operates in the opposite direction of a one-to-many relationship. The difference between the two is which side of the relationship *knows about* the objects on the other side. In Java terms, this will translate into a field on one class that references the other.

{{% notice blue "Example" "rocket" %}}

   Many-to-one relationships are simply the opposite direction of one-to-many. Therefore, each of the following pairs has a many-to-one relationship.

   1. People / birth dates
   1. U.S. Representatives / states
   1. iPhones / model numbers

{{% /notice %}}

## Many-to-Many

**Many-to-many** relationships occur when each instance of type A can be related to multiple instances of type B, and vice versa. 

![Three Event objects on the left, with various relationships to three Tag objects on the right](pictures/many-to-many.png)

An event can have multiple tags, and a tag may be associated with multiple events. Thus, we have a many-to-many relationship.

{{% notice blue "Example" "rocket" %}}

   The following pairs of things generally have many-to-many relationships:

   1. Books / authors
   1. Recipes / ingredients
   1. Actors / movies

{{% /notice %}}

## Check Your Understanding

{{% notice green "Question" "rocket" %}}

   Match the following pairs with the appropriate relationship type:

   1. car / manufacturer
   1. car / title
   1. car / driver 
   1. car / tire

{{% /notice %}}

<!-- Solution: a. many-to-one, b. one-to-one, c. many-to-many, d. one-to-many -->

{{% notice green "Question" "rocket" %}}

   True/False: In order for two Java classes, A and B, to be mapped in a one-to-many relationship, class A must 
   contain a field for instances of B and B must have a field for instances of A.

   1. True
   1. False

{{% /notice %}}

<!-- Solution: False, A one-to-many relationship may be present without B containing a field A. -->