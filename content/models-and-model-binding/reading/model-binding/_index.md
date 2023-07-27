---
title: "Models Binding"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 4
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer:  # to be set by the page reviewer
reviewerGitHub:  # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

We now introduce a useful technique to auto-create model instances, called **model binding**. Model binding takes place when a whole model object is created by the Spring framework on form submission. This saves us the effort, and the code, needed to pass in each form field to a controller. 

Model binding reduces the amount of code we need to write to create an object and it helps with validation (which we’ll explore further in the next section). Because we use the `@ModelAttribute` annotation, Spring Boot will create an `Event` object for us when it gets the `POST` request from `/create`.

### How to Use Model-Binding - Video

{{< youtube gzk__EWfvaw >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [delete-events branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/delete-events) of the `CodingEventsJava` repo. The final code presented in this video is found on the [model-binding branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/model-binding). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

### How to Use Model-Binding - Text

With the `Event` model in place, we can incorporate another annotation, `@ModelAttribute`. When submitting the event creation information, rather than passing in each field used to instantiate a model, we can instead pass in `@ModelAttribute Event newEvent` as a parameter of the controller method. 

Revised `processCreateEventForm` in `EventController`:

```java
@PostMapping("create")
public String processCreateEventForm(@ModelAttribute Event newEvent) {
   EventData.add(newEvent);
   return "redirect:/events";
}
```

This is the essence of model binding. The model instance is created on form submission. With only two fields needed to create an event, the value of this data binding may not be particularly apparent right now. You can imagine, though, with a larger form and class, that `@ModelAttribute` is quite an efficient annotation.

For binding to take place, we must use the model field names as the form field names. So back in the create form HTML, we update the form fields to match the event fields. 

`events/create.html`:

```html
<div class="form-group">
   <label>Name
      <input type="text" name="name" class="form-control">
   </label>
   <label>
      Description
      <input type="text" name="description"  class="form-control">
   </label>
</div>
```

If a form field name does NOT match up with a model field, then binding will fail for that piece of data. It is critically important to ensure these names match up. 

### Check Your Understanding

{{% notice green Question "rocket" %}}
Complete this sentence: Model binding ...

1. requires an `@ModelAttribute` annotation.
1. helps with form validation.
1. reduces controller code.
1. is useful for all of the reasons above.

<!-- Solution: All of the above -->
{{% /notice %}}

{{% notice green Question "rocket" %}}
In `codingevents`, we add an additional private field, `numberOfAttendees`, to the `Event` class. What other change must we make to ensure the user of our application can determine this value? (Assume we are using model binding to process form submission.)

1. Pass in a `numberOfAttendees` parameter to the form submission handler.
1. Add another input element to the create event form with a `name=numberOfAttendees` attribute.
1. Add a `getAttendees` method to `EventData`.
1. All of the above.

<!-- Solution: Add another input element to the create event form with a `name=numberOfAttendees` attribute. -->
{{% /notice %}}