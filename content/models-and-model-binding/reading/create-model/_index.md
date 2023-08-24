---
title: "Create a Model"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer:  # to be set by the page reviewer
reviewerGitHub:  # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In the next several pages, we will be making updates to `codingevents` to demonstrate model creation,
how models relate to data, and the practice of model binding. The first of these steps is to move data 
handling out of our controller classes and into a model class. As we discussed on the previous page, the 
controller class is not responsible for holding data.

In `codingevents`, we'll remove the `ArrayList` data from `EventController` and create a proper 
Java class to deal with event items. We'll then update our controller methods to take
advantage of the new model and its properties, rather than the strings stored in the list.
Lastly, because the controller is updating, the template variables it relies upon will also need to
change to reflect the model properties.

### Create a Model Class - Video

{{< youtube tDfwNJ3Nk_M >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [add-bootstrap branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-bootstrap) of `CodingEventsJava` repository. The final code presented in this video is found on the 
[create-model branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/create-model). As always, code along with the videos on your own `codingevents` project.
{{% /notice %}}

### Create a Model Class - Text

Like controllers, model classes are conventionally located in a `models`
package. Structurally, model classes most closely resemble the kinds of classes we practiced
making at the start of this course, before introducing Spring Boot. In other words,
models are **plain old Java objects**, or **POJOs**.

To create a model to shape event data, we include a field for `name`.
Of course, we'll also like at least one constructor and some getters and setters. 

In `models/Event.java`:

```java {linenos=true}
public class Event {

   private String name;

   public Event(String name) {
      this.name = name;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   @Override
   public String toString() {
      return name;
   }
}
```

Now that we're working to move the data handling out from the controller classes and into a class of its own, 
we'll need to update the `POST` handler that creates new events. Update the `.add()` method inside of 
`processCreateEventForm` to add a new `Event` instance:

```java {linenos=true}
@PostMapping("create")
public String processCreateEventForm(@RequestParam String eventName) {
   events.add(new Event(eventName));
   return "redirect:/events";
}
```

And you'll notice, we're adding a different type of data to the `ArrayList`, so we'll have to update that too:

```java
private static List<Event> events = new ArrayList<>();
```

Back in the `events/index.html` template, update the HTML to use the `Event` object's fields, rather than 
simply strings.

```html
<td th:text="${event.name}"></td>
```

{{% notice blue Note "rocket" %}}
The syntax `event.fieldName` runs a getter method behind the scenes in order to access a field.
{{% /notice %}}

### Add a Model Property - Video

{{< youtube 5dtyojtADbk >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [create-model branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/create-model)  of the `codingevents-demo` repo. The final code presented in this video is found on the [add-property branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-property). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

### Add a Model Property - Text

To round out the `Event` class, we'll add a `description` field to showcase what our events are all about.

Updates to `models/Event.java`:

```java {linenos=true}
public class Event {

   private String name;
   private String description;

   public Event(String name, String description) {
      this.name = name;
      this.description = description;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   @Override
   public String toString() {
      return name;
   }
}
```

Now that our data is object-oriented, it's quick and easy to add a new property affiliated with an event. If after 
this, we decide to add a `date` or `location` field, we would simply follow the pattern established. Before, 
with events stored as name strings, we would have had more changes to make in order to add other information fields
to the shape of the data.

Update both the `events/create.html` and `events/index.html` templates to create an event object with a 
description field and to display that description along with the event's name. 

`events/create.html`:

```html {linenos=true}
<label>
   Description
   <input type="text" name="eventDescription"  class="form-control">
</label>
```

`events/index.html`:

```html
<td th:text="${event.description}"></td>
```

Lastly, add a parameter to the 
`processCreateEventForm` to handle the form submission and pass the description
value into the creation of the Event object.

`EventController`:

```java {linenos=true}
@PostMapping("create")
public String processCreateEventForm(@RequestParam String eventName, @RequestParam String eventDescription) {
   events.add(new Event(eventName, eventDescription));
   return "redirect:";
}
```

### Check Your Understanding

{{% notice green Question "rocket" %}}
True/False: Model code is framework independent.

<!-- Solution: True, models are just java objects -->
{{% /notice %}}