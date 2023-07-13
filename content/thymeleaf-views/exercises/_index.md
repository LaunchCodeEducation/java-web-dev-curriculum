---
title: "Exercises: Thymeleaf Views"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In the chapter, we started working on an application for tracking various
coding events around town.

Open up your `coding-events` project in IntelliJ.

## Getting Started

From your own `add-bootstrap` branch, create and checkout a new branch called `my-views-exercises-solution`.

{{% notice blue Note "rocket" %}}
If you need to make sure your code matches ours to start, look at the [add-bootstrap branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-bootstrap)  on `CodingEventsJava`.
{{% /notice %}}

Now, let's add descriptions to our events!

## Expanding our Events Schedule

1. In the videos, we learned how to use templates to display the elements in a static list called `events`. Let's make our `events` list a HashMap! This enables us to add descriptions to our events.

2. Fill your `events` HashMap with the names and descriptions of 3 coding events around town.

   {{% expand "Check your solution" %}}

   ```java
    events.put("Menteaship","A fun meetup for connecting with mentors");
    events.put("Code With Pride","A fun meetup sponsored by LaunchCode");
    events.put("Javascripty", "An imaginary meetup for Javascript developers");
   ```
   {{% /expand %}}

3. Using `th:block` and `th:each`, put together the events and their descriptions in a table as opposed to an unordered list.

4. Use fragments to store the address of the new tech hub where all of the programmers are hanging out. Use `th:replace` in your main template to bring in the address as a third column in your table. You may need to create a new `fragments.html`.

   {{% expand "Check your solution" %}}

   ```html
    <td th:fragment="address">1234 5th Street</td>
   ```
   {{% /expand %}}

5. Add some CSS to style your table to make it easier to read and center it on the page. You may need to create a new `styles.css` as well. Make sure to connect `styles.css` to the appropriate template with `th:href`.

## Bonus Missions

1. Update your `processCreateEventForm` method so that you are able to create a new event using the new `HashMap`.
- You will also need to update your `events/create` template so that a user can enter a description.

1. Try to add one more column to the table with pictures for each coding event. You need to use `th:href` to pull in pictures in the appropriate template.