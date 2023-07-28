---
title: "Models and Data"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer:  # to be set by the page reviewer
reviewerGitHub:  # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In order to work with data, we need to add another element to our MVC application. Say, for example,
we want to do things like remove an event from our list. Well, if two events both have the same name, 
how might we identify which of those items to delete? We can't yet. So we need to tweak how we store
event data. 

### Add a Unique Id - Video

{{< youtube ijnIgreiNHU >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [add-property branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-property) of the `CodingEventsJava` repo. The final code presented in this video is found on the [add-id branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-id). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

### Add a Unique Id - Text

Identifying data by a user-defined string called `name` is not a sustainable or scalable method
of handling data in most situations. Consider the address book example. How can
we distinguish between two contact entries with the same name field? It is a frequent
practice to add a **unique identifier** field (sometimes called, or even labelled, **uid**) to a class 
responsible for modeling data. This ensures that our address book can contain two separate entries for 
our contacts who have the same name as one another. 

To accomplish the same data clarity with events, we'll add a few things to the event model class:

1. A private `id` field .
2. A static counter variable, `nextId`.
3. Additional constructor code that:
   a. Sets the `id` field to the `nextId` value.
   b. Increments `nextId`.
4. A getter method for the `id` field.

The result in `models/Event.java`:

```java {linenos=true}
public class Event {

   private int id;
   private static int nextId = 1;

   private String name;
   private String description;

   public Event(String name, String description) {
      this.name = name;
      this.description = description;
      this.id = nextId;
      nextId++;
   }

   public int getId() {
      return id;
   }

   // ... other getters and setters ... //

}
```

With these additions, every time a new event object is created, it is assigned a unique integer to its `id` field.

### Create a Data Layer - Video

{{< youtube 8AQtYZ_q57M >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [add-id branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-id) repo. 
The final code presented in this video is found on the [create-data-layer branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/create-data-layer). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

### Create a Data Layer - Text

Now that we've begun building a model, it's a good time to remind ourselves that models are not designed to be 
data storage containers. Rather, models are meant to shape the data stored in another location into objects that 
can be used in our application. As we work our way into learning about database usage and service calls, however, 
we'll use a Java class to store some data temporarily. 

Create a new package called `data` and add a class `EventData`. Whereas `Event` is responsible for organizing
user-inputted information into a Java object, `EventData` is responsible for maintaining those objects once they 
are created. `EventData` is itself a Java class that stores events. It contains several methods for managing and 
maintaining the event data that simply extend built-in HashMap methods.

The contents of `data/EventData.java`:

```java {linenos=true}
public class EventData {

   private static Map<Integer, Event> events = new HashMap<>();

   public static Collection<Event> getAll() {
      return events.values();
   }

   public static void add(Event event) {
      events.put(event.getId(), event);
   }

   public static Event getById(Integer id) {
      return events.get(id);
   }

   public static void remove(Integer id) {
      if (events

.containsKey(id)) {
         events.remove(id);
      }
   }

}
```

With `EventData` managing event data, we must once again refactor `EventController` to update the items stored in 
`EventData`. In keeping with the objective to remove data handling from the controller, we'll remove the list 
of events at the top of the class. Consequently, for the `displayAllEvents` handler, we'll now use events from 
`EventData` in `addAttribute()`:

```java
model.addAttribute("events", EventData.getAll());
```

And back to `processCreateEventForm`, we'll make use of the `.add()` method from `EventData`:

```java
EventData.add(new Event(eventName, eventDescription));
```

### Delete an Event - Video

{{< youtube orsBBbDaJMM >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [create-data-layer branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/create-data-layer) of the `CodingEventsJava` repo. The final code presented in this video is found on the [delete-events branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/delete-events). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

### Delete an Event - Text

Now that we've refined our events storage method, we are able to tackle the task of deleting an object. 
To delete an event object from storage, we'll grab the event's id and use that
information to call the `remove` method of `EventData`.
Since the delete event is user-initiated, a controller will be involved to pass
the information from the user-accessible view to the data layer. So our first step
with this task is to create a controller method to get a view to delete events.

Onto the end of `EventController`, add the following method:

```java {linenos=true}
@GetMapping("delete")
public String renderDeleteEventForm(Model model) {
   model.addAttribute("title", "Delete Event");
   model.addAttribute("events", EventData.getAll());
   return "events/delete";
}
```

We'll now need to create a new view for the path mapped in the method above. Add a new template, 
`events/delete.html`. This view will reference event id fields in order to distinguish which items the user 
will request to delete via checkbox inputs. 

```html {linenos=true}
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org/">
   <head th:replace="fragments :: head"></head>
   <body class="container">

      <header th:replace="fragments :: header"></header>

      <form method="post">

         <th:block th:each="event : ${events}">
            <div class="form-group">
            <label>
                  <span th:text="${event.name}"></span>
                  <input type="checkbox" name="eventIds" th:value="${event.id}" class="form-control">
            </label>
            </div>
         </th:block>

         <input type="submit" value="Delete Selected Events" class="btn btn-danger">
      </form>

   </body>
</html>
```

We also need a `POST` handler to take care of what to do when the delete event information
is submitted by the user. We'll have this post handler redirect the user back to the home 
page once they have selected which event, or events, to remove from storage.

In `EventController`, add another controller method:

```java {linenos=true}
@PostMapping("delete")
public String processDeleteEventsForm(@RequestParam(required = false) int[] eventIds) {

     if (eventIds != null) {
         for (int id : eventIds) {
             EventData.remove(id);
         }
     }

     return "redirect:/events";
}
```

This handler method uses the `required = false` parameter of `@RequestParam` to make this parameter optional. This allows the user to submit the form without any events selected. Once `eventIds` is optional, we must also check that it is not `null` before entering the loop. 

### Check Your Understanding

{{% notice green Question "rocket" %}}
In `codingevents`, which method can we call to list every event object?

<!-- Solution: EventData.getAll() -->
{{% /notice %}}

{{% notice green Question "rocket" %}}
In `codingevents`, breaking up the event storage from the `Event` model is an example of which object-oriented
concept?

<!-- Solution: Encapsulation -->
{{% /notice %}}