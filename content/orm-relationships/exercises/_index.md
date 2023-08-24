---
title: "Exercises: The Early Bird Gets the ORM!"
date: 2023-08-21T14:38:32-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman  # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Now that we have gotten very familiar with our `coding-events` application, let's design some additional features.
As you work on your `coding-events` application, you may have been inspired by [Meetup](https://www.meetup.com/)!
One of the cool features that Meetup has is that people can sign up for accounts.
They can use their Meetup accounts to follow the events they are most interested in and keep track of their calendar of events.
To add similar features to `coding-events`, you need to add a `Person` class.
For the exercises, answer the following questions about what your `Person` class would look like.

{{% notice blue "Note" "rocket" %}}
   You do not have to code anything to complete these exercises!
   This is mainly focused on using our design skills to add a new feature to your application.
{{% /notice %}}

1. You need to add a `Person` class to hold necessary info about users of our app. What fields and methods would this class hold?
1. Would you need to add any additional classes to `Person` to make the app work? If so, what classes would be necessary?
1. What kinds of relationships would `Person` have to the other classes you already created, such as the `Event` class?

As you dream up answers to these questions, write the answers down in a note or piece of paper. You are now going to write up some documentation for your app!

1. Add a `README.md` to your repository by navigating to the repository page on your GitHub profile.
   At the bottom of the page, there is a blue banner asking you to add a `README.md`. Click the button to do so!
1. You should write three sections. The first should describe the purpose of the app. The second should describe the current state of the app.
   The third and final section should describe the future improvements you want to make to the app including your notes about the `Person` class.

{{% expand "Check your solution" %}}

Here is an example of how the README may turn out:

1. Our `Person` class might hold the following fields:

   1. `id` (`int`) - the unique user ID
   1. `firstName` (`String`) - the user’s first name
   1. `lastName` (`String`) - the user’s last name
   1. `email` (`String`) - the user’s email, which will also function as their username
   1. `password` (`String`) - the user’s password

   The class would need getters for all of these fields. It could have setters for all fields except id (since it shouldn’t change).

1. The Person class might also have the following references:

   1. `PersonProfile` - a class to gather up all of the profile information about the user
   1. `List<Events> eventsAttending` - to store events the user wants to attend
   1. `List<Events> eventsOwned` - a different list, to store the events the user has created

`Person` would have a many-to-many relationship with `Event` via `List<Events> eventsAttending`. It would have a one-to-many relationship with `Event` via `List<Events> eventsOwned`.

{{% /expand %}}
