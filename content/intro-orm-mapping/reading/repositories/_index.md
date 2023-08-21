---
title: "Repositories"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub:  # to be set by the page reviewer
lastEditor:  # update any time edits are made after review
lastEditorGitHub:  # update any time edits are made after review
lastMod: 2023-30-06T10:28:27-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

Now that we have a general idea of how to set up our entity classes and repositories, let's take a deeper dive into how repositories are used to perform CRUD operations on a database.

## CRUD Operations

Previously, we learned that we can create a repository to fetch rows of a table in a database.
To do so, we need to create a corresponding controller. 

When creating our controller, we add a variable of the repository type that has the annotation `@Autowired`.

Next, we will learn how to use some of the more common `CrudRepository` methods, such as `delete(T entity)`, `deleteById(ID id)`, `findAll()`, `findById(ID id)`, and `save(S entity)`.

## Using Persistence in a Controller - Video

The following video explains how we can add a controller to manage persistence in our `codingevents` application. 
The accompanying text is a quick rundown of what happens in the video. To get started, create a branch off of your [persistent-model](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/persistent-model) branch.

{{< youtube 0eug2HI7rbo >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [persistent-model branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/persistent-model) of the `CodingEventsJava` repo. 

he final code presented in this video is found on the  [persistent-controller branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/persistent-controller). As always, code along to the 
videos on your own `codingevents` project.
{{% /notice %}}

### Using Persistence in a Controller - Text

Inside of `EventController`, we can add a variable of type `EventRepository` and give it an `@Autowired` annotation.
For events, we want to be able to display all of the events in our database as well as add and delete events.

When displaying the events in our database, we write a method, `displayAllEvents`.
We want to use `displayAllEvents` to display a table that contains all of our events. 
We did something similar to this before, but we used a list or iterable containing all of the objects we wanted to display.
Since we have set up ORM between the MySQL database and our MVC application, we need to use the methods from `CrudRepository` to get all of the instances of the `Event` class.
We can use the `findAll()` method to return an iterable containing all of the events in our database.

As you write the methods necessary for `EventController`, you might notice that this controller doesn't look too different from other controllers we previously created.

Now we need to use the methods in `CrudRepository` to fetch the necessary information or update the correct table. Update your methods within `EventController` so that they no longer use the `EventData` class and instead use our newly created `eventRepository`.

Since we no longer use the `EventData` class it can be safely removed.

## Check Your Understanding

{{% notice green Question "rocket" %}}
True or false: We add different methods directly to our repository.

<!-- Solution: .. ans: False -->
{{% /notice %}}
