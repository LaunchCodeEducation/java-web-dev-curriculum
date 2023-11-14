---
title: "User Owned Data"
date: 2023-11-14T09:28:27-05:00
draft: false
weight: 1
originalAuthor: Ben Clark # to be set by page creator
originalAuthorGitHub: brclark # to be set by page creator
reviewer: <no-value> # to be set by the page reviewer
reviewerGitHub: <no-value> # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

With the authentication filter additions, our application now requires users
to log in before they can access any features of the site. However, users
will want the data that they create to be associated with their account. How
can we make sure that the events and categories that a user create will be
associated with their account?

Let's associate the new data with the logged-in user using one-to-many database relationships.
We will specify that a `User` has a one-to-many relationship with the `Event` objects
that they create, along with `EventCategory` and `Tag`. This way, we can specify that
we want to load all events or save an event *for a specific user*.

{{% notice blue Note "rocket" %}}
The code for this section begins with the [auth-filter branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/auth-filter) and ends with the [user-data branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/user-data) of the `CodingEventsJava` repository.
{{% /notice %}}

## Creating User Specific Data - Video

**TODO**

## Creating User Specific Data - Text

### Updating the models with a `User` field
Users *own* their data when the entities that they create (events, categories, etc) have their
`user_id` associated with each new entity as a foreign key. That would allow us to, 
say "get all events for a specific user". We need to set up a **One-To-Many** relationship
between the `User` model and the different data models (`Event`, `EventCategory`, `Tag`).

Open the `Event` model and add a `User` field to the field definitions. We will call it `creator`
as it's a reference to the user that created the event, and we will give it a `@ManyToOne` annotation
as there can be many events associated with a single creator.

```java
    @ManyToOne
    private User creator;
```

We'll also need to add a getter and setter. Add the following to your getters
and setters in `Event` class.

```java
    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }
```

`Event` is not the only model that we want to be user-owned. Let's repeat the above steps to
add the `creator` field/getters/setters to `EventCategory` and `Tag`.

### Saving the `User` when creating new data

Now that we can store the associated User as the creator of an Event/Category/Tag, we need
to make sure that the current logged-in User is set as the creator before saving new entries.
Let's update the `EventController` to get the currently logged in user when creating a new
event and setting that user as the `creator`.

To get the currently logged-in user in `EventController`, we need references to the
`AuthenticationController` and the `HttpSession`.

In `EventController`, add the following below your other autowired fields:

```java
    @Autowired
    private AuthenticationController authController;
```

With that reference, we can now get the current logged-in user during the POST handler for
create.

```java(hl_lines=3-4 10)
    @PostMapping("create")
    public String processCreateEventForm(@ModelAttribute @Valid Event newEvent,
                                         Errors errors, Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);
        if(errors.hasErrors()) {
            model.addAttribute("title", "Create Event");
            return "events/create";
        }

        newEvent.setCreator(currUser);

        eventRepository.save(newEvent);
        return "redirect:/events";
    }
```

We need to add a parameter for the incoming `HttpSession` so that we can get the currently
logged in user from the `authController`. If there are no errors in the form, we set
the creator of the `newEvent` to `currUser`.

We need to repeat the above steps for the `EventCategoryController` and `TagController`.

### Retrieving user data from database

In previous lessons when we created a `@ManyToOne` field,
we have included a corresponding `@OneToMany` reference in
the appropriate model --- for example, the way we define
`@OneToMany List<Event> events` in the `EventCategory` model.

Rather than including `@OneToMany` relationships in the `User` model for events, categories
and tags, we will instead use our `CrudRepository` interfaces and define custom queries that
will achieve what we need.

{{% notice blue Note "rocket" %}}
You can create custom queries to the database using the intuitive query builder.
We have used the built-in methods before like `findById`, `findAll`, and `save`.
We can create new queries by defining the methods in our repository interfaces.

For example, defining an `EventRepository` method
`List<Event> findAllByCategory(EventCategory category)` gives us the ability to retrieve
all events for a given category from the database. 

More info on the query builder can be found in the [SpringDataJPA docs](https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories)
{{% /notice %}}

Let's add custom queries to the `EventRepository`, `EventCategoryRepository`,
and `TagRepository` interfaces that will allow us to retrieve all entries for a given `User`.

In `EventRepository` add:

```java(hl_lines=4-5)
@Repository
public interface EventRepository extends CrudRepository<Event, Integer> {

    List<Event> findAllByCreator(User creator);
    Optional<Event> findByIdAndCreator(Integer id, User creator);
}
```

`findAllByCreator` will retrieve the list of events for the associated user.
`findByIdAndCreator` will attempt to retrieve an event based on the event ID,
BUT it will give a null response if the corresponding event is not associated with
the `creator` argument.

Repeat the above steps to add the corresponding methods
to the `EventCategoryRepository` and `TagRepository`.

### Passing user data to views

When users look at the tables for "All Events" or "All Categories", they should see
the data that they created. Similarly, when users are creating new events, they should
only see category options that they created.

Let's update the controllers to retrieve the appropriate user data. This will involve
the `AuthenticationController`, `HttpSession`, and the repository methods we added. 

#### Updating `EventController`

First, we'll update `displayEvents` method that handles `GET /events?categoryId=` requests. We will receive the `HttpSession` as a param, use it to get the current user with `authController`,
and finally pass the user to the `eventRepository` methods that we created.

```java(hl_lines=2-3 7 9)
    @GetMapping
    public String displayEvents(@RequestParam(required = false) Integer categoryId, Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);

        if (categoryId == null) {
            model.addAttribute("title", "All Events");
            model.addAttribute("events", eventRepository.findAllByCreator(currUser));
        } else {
            Optional<EventCategory> result = eventCategoryRepository.findByIdAndCreator(categoryId, currUser);
            if (result.isEmpty()) {
                model.addAttribute("title", "Invalid Category ID: " + categoryId);
            } else {
                EventCategory category = result.get();
                model.addAttribute("title", "Events in category: " + category.getName());
                model.addAttribute("events", category.getEvents());
            }
        }

        return "events/index";
    }
```

In the `displayCreateEventForm` method, we need to pass in the user-created categories instead
of passing in all categories. Update your function like below.

```java(hl_lines=2-3 6)
    @GetMapping("create")
    public String displayCreateEventForm(Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);
        model.addAttribute("title", "Create Event");
        model.addAttribute(new Event());
        model.addAttribute("categories", eventCategoryRepository.findAllByCreator(currUser));
        return "events/create";
    }
```

Don't forget to update the same in the **error** case of the POST request handler. If
there are form errors, we want to pass the user-created categories back to the form.

```java(hl_lines=7)
    @PostMapping("create")
    public String processCreateEventForm(@ModelAttribute @Valid Event newEvent,
                                         Errors errors, Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);
        if(errors.hasErrors()) {
            model.addAttribute("title", "Create Event");
            model.addAttribute("categories", eventCategoryRepository.findAllByCreator(currUser));
            return "events/create";
        }
```

When we display the delete events form, we want to make sure it displays the user-created
events. Let's repeat the same procress to retrieve events for the current user in the
`displayDeleteEventsForm` method.

```java(hl_lines=2-3 5)
    @GetMapping("delete")
    public String displayDeleteEventForm(Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);
        model.addAttribute("title", "Delete Events");
        model.addAttribute("events", eventRepository.findAllByCreator(currUser));
        return "events/delete";
    }
```

Finally, we want to make sure that the event details page will show events owned by the
currently logged in user and reject any event ID's owned by other users. Once again,
we'll use `HttpSession` and `AuthenticationController` to retrieve the current user,
and we'll retrieve the event based on its ID and the current user.

In the `displayEventDetails` method, let's add:

```java(hl_lines=2-5)
    @GetMapping("detail")
    public String displayEventDetails(@RequestParam Integer eventId, Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);

        Optional<Event> result = eventRepository.findByIdAndCreator(eventId, currUser);
```

The rest of the function can stay the same. If a valid event ID is provided but
the current user does not own it, then the `Optional` will contain a null value.

#### Updating `EventCategoryController`

Let's update the `displayAllCategories` method that handles `GET
/eventCategories` requests. We can add the same `HttpSession` reference and
use `authController` to retrieve the current user. We'll pass the categories
for the current user as the model attribute.

```java(hl_lines=2-3 5)
@GetMapping
    public String displayAllCategories(Model model, HttpSession session) {
        User currUser = authController.getUserFromSession(session);
        model.addAttribute("title", "All Categories");
        model.addAttribute("categories", eventCategoryRepository.findAllByCreator(currUser));
        return "eventCategories/index";
    }
```

Next, we'll update the `processCreateEventCategoryForm` method that handles
`POST /eventCategories/create` requests, by getting a reference to the current
user and setting the `creator` field in the new `eventCategory`.

```java(hl_lines=3 10-11)
    @PostMapping("create")
    public String processCreateEventCategoryForm(@Valid @ModelAttribute EventCategory eventCategory,
                                                 Errors errors, Model model, HttpSession session) {

        if (errors.hasErrors()) {
            model.addAttribute("title", "Create Category");
            return "eventCategories/create";
        }

        User currUser = authController.getUserFromSession(session);
        eventCategory.setCreator(currUser);

        eventCategoryRepository.save(eventCategory);
        return "redirect:/eventCategories";
    }
```

Luckily, the views for the `Event` and `EventCategory` resources will not need
to be updated.

The last controller to update is the `TagController`, which we will leave for you
to complete.

In the next lesson, we will expand the use of **Data Transfer Objects** or DTOs
to decouple our database models from our forms, and we will make use of
**Service** classes as a layer between the **Controller** and **Repository**.

