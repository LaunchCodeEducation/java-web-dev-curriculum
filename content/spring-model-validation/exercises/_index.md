---
title: "Exercises: Model Validation"
date: 2023-07-17T15:23:11-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Let’s practice adding more fields onto our event objects and 
validating them. Create a new branch from your own `display-errors` branch. Here's the `display-errors` branch on
[CodingEventsJava](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/display-errors) if you need to get up to speed. 

Below, we describe some new fields for you to add to the `Event` class. 
For each field, consider the following factors:

1. What will you call your field?
1. Will you need accessors for this field?
1. What type of input should be added to capture the field's information from the user?
1. Refer to the documentation page to find an appropriate annotation to fit the constraints. 
1. What should the error message convey to the user?
1. What, if anything, will you need to update on the controller to account for the new field?

Event information to add:

1. Add a field to collect information about where the event will take place. This field should not be 
   null or blank. 

   {{% expand "Check your solution" %}}

   ```java
   @NotBlank(message="Location cannot be left blank.")
   private String location;
   ```

   {{% /expand %}}

1. Add a field to collect information about whether an attendee must register for the event or not. For 
   the purposes of validation practice, make this field only able to be marked as true. 

1. Add a field to collect information about the number of attendees for the event. Valid values for this 
   field should be any number over zero.

   {{% expand "Check your solution" %}}

   ```java
   @Positive(message="Number of attendees must be one or more.")
   private int numberOfAttendees;
   ```

   {{% /expand %}}

1. Browse the validation annotations to find one to use on another new field of your choosing.
