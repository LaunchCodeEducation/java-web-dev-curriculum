# Exercises: Model Validation {#model-validation-exercises}

Let's practice adding more fields onto our event objects and validating
them. Create a new branch from your own `display-errors` branch. Here\'s
the `display-errors` branch on
[coding-events-demo](https://github.com/LaunchCodeEducation/coding-events/tree/display-errors)
if you need to get up to speed.

Below, we describe some new fields for you to add to the `Event` class.
For each field, consider the following factors:

a.  What will you call your field?
b.  Will you need accessors for this field?
c.  What type of input should be added to capture the field\'s
    information from the user?
d.  Refer to the documentation page to find an appropriate annotation to
    fit the constraints.
e.  What should the error message convey to the user?
f.  What, if anything, will you need to update on the controller to
    account for the new field?

Event information to add:

1.  Add a field to collect information about where the event will take
    place. This field should not be null or blank.

    `Check your solution <model-validation-exercise-solutions1>`{.interpreted-text
    role="ref"}

2.  Add a field to collect information about whether an attendee must
    register for the event or not. For the purposes of validation
    practice, make this field only able to be marked as true.

3.  Add a field to collect information about the number of attendees for
    the event. Valid values for this field should be any number over
    zero.

    `Check your solution <model-validation-exercise-solutions3>`{.interpreted-text
    role="ref"}

4.  Browse the validation annotations to find one to use on another new
    field of your choosing.
