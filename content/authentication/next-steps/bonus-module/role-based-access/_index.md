---
title: "Role-Based User Access"
date: 2023-12-07T10:26:50-06:00
draft: false
weight: 5
originalAuthor: Ben Clark # to be set by page creator
originalAuthorGitHub: brclark # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In this final lesson for the Bonus Module, we will add some new features to
Coding Events that make use of the roles & privileges infrastructure. We
will modify some core functionality that has been there from the beginning
of the project.

Overall, we will define the actions that two of our user types can take, the
base `ROLE_USER` and the more powerful `ROLE_ORGANIZER`. `ROLE_USER` will be
able to view events that have been created by `ROLE_ORGANIZER`, as well as all
categories that have been created as well. `ROLE_USER` will then be able to mark
themselves as interested or **attending** an event, which will store
persistently in the database. `ROLE_USER` will have a limited menu bar that does
not show links to event and category creation.

`ROLE_ORGANIZER` will be able to create new events and categories that are
associated with their account. We will expand the access and view of the menu
bar for `ROLE_ORGANIZER` so that they can see links to the routes they have
access to.

## Adding Role-Based Features for Users - VIDEO

**TODO**

{{% notice blue Note "rocket" %}}
The code for this section begins with the [spring-security-features branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/spring-security-features)
and ends with the [role-based-access branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/role-based-access)
of the `CodingEventsJava` repository.
{{% /notice %}}

## Adding Role-Based Features for Users - TEXT

The first portion of this lesson will add event attendance relationships
to our models, as well as the ability to mark in login that you want to be
an event organizer.

### Add Event Attendance Relationship

#### Add `User` and `Event` many-to-many relationship

In the `Event` model, we will add another field that stores `Collection<User>
attendees` as a many-to-many relationship. Add the following field to `Event`,
recognizing that we are manually specifying the join table:

```java
    @ManyToMany
    @JoinTable(
            name = "users_events",
            joinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "event_id", referencedColumnName = "id"))
    private Collection<User> attendees;
```

Be sure to add a getter and a setter as well for the new field.

Now, in the `User` model we will add the same relationship to connect a
`Collection<Event> attendingEvents` field. Add the following field to `User`:

```java
    @ManyToMany
    @JoinTable(
            name = "users_events",
            joinColumns = @JoinColumn(
                    name = "event_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"))
    private Collection<Event> attendingEvents;
```

Be sure to add a getter and setter for this field too.

#### Add Attendance CRUD logic to `EventService`

We can add methods to `EventService` that provide functionality for marking
and removing attendance relationships between an event and a user. These
methods will be used specifically in our controllers and views for displaying
and adding attendance.

Add the following `addAttendanceForUser` method to the `EventService` class.
Notice that we use the `attendees` collection to manage the relationship and
add a `user` object to the collection.

```java
    public void addAttendanceForUser(Integer eventId, User user) {
        Event event = eventRepository.findById(eventId)
            .orElseThrow(ResourceNotFoundException::new);

        if (!event.getAttendees().contains(user)) {
            event.getAttendees().add(user);
            eventRepository.save(event);
        }
    }
```

With that in place we can make a more useful method to us ---
`addAttendanceForCurrentUser`:

```java
    public void addAttendanceForCurrentUser(Integer eventId) {
        addAttendanceForUser(eventId, userService.getCurrentUser());
    }
```

Now we have to provide the similar logic for removing a user from the attendance
collection, with `removeAttendanceForUser` method:

```java
    public void removeAttendanceForUser(Integer eventId, User user) {
        Event event = eventRepository.findById(eventId)
            .orElseThrow(ResourceNotFoundException::new);

        event.getAttendees().remove(user);
        eventRepository.save(event);
    }

    public void removeAttendanceForCurrentUser(Integer eventId) {
        removeAttendanceForUser(eventId, userService.getCurrentUser());
    }
```

Lastly, we will need some helpful methods for checking if the current user
is marked as attending an event and for getting the events they will attend:

```java
    public boolean getUserEventAttendance(Event event) {
        return event.getAttendees().contains(userService.getCurrentUser());
    }

    public List<Event> getAttendingEventsByCurrentUser() {
        return (List<Event>) userService.getCurrentUser().getAttendingEvents();
    }
```

#### Add Event Attendance CRUD to `EventController`

We need to set up routes that will allow users to look at the events they have
marked for attendance, and routes to allow for easy setting/unsetting of
attendance for an event by the current user.

In `EventController`, let's first add a route at `GET /events/attending` that
will load the table of events that the current user has RSVP'd to:

```java
    @GetMapping("attending")
    public String displayMyEvents(Model model) {
        model.addAttribute("events", eventService.getAttendingEventsByCurrentUser());
        model.addAttribute("title", "My Events");
        return "events/index";
    }
```

Next, we need two POST request handlers at `POST /events/{id}/attending` and
`POST /events/{id}/removeAttending`. These methods will assume that the current
user is marking themselves for attendance to a specific event.

```java
    @PostMapping("{id}/attending")
    public String processUserEventAttendance(@PathVariable Integer id, Model model) {

        eventService.addAttendanceForCurrentUser(id);

        return "redirect:/events/detail?eventId=" + id;
    }

    @PostMapping("{id}/removeAttending")
    public String removeUserEventAttendance(@PathVariable Integer id, Model model) {

        eventService.removeAttendanceForCurrentUser(id);

        return "redirect:/events/detail?eventId=" + id;
    }
```

Last, we want the Event Details page to display a button to RSVP or remove attendance
easily from the event. We'll pass a boolean value as a model attribute to the
details template that says whether the current user is attending the event, which
will help us display the correct form for changing the reservation.

In `displayEventDetails` method in `EventController`, add another model attribute in
the `try` block:

```java{ hl_lines="6" }
        try {
            Event event = eventService.getEventByIdForCurrentUser(eventId);

            model.addAttribute("title", event.getName() + " Details");
            model.addAttribute("event", event);
            model.addAttribute("userAttendance", eventService.getUserEventAttendance(event));
        } catch (ResourceNotFoundException ex) {
```

#### Adding User Attendance UI in templates

We want to allow users to mark themselves for attendance to a coding event. We
can put this functionality in multiple places. For now, we will put that choice
in the event details page. We'll have a button that displays the current
attendance and allows users to flip their choice.

In the `events/detail.html` template, let's dynamically add a button based on
the `userAttendance` attribute value we passed in:

```html{hl_lines="5-17"}
    <tr>
        <th>Contact Email</th>
        <td th:text="${event.eventDetails.contactEmail}"></td>
    </tr>
    <tr>
        <th>
            Actions
        </th>
        <td>
            <form th:unless="${userAttendance}" method="post" th:action="@{/events/{id}/attending(id=${event.id})}">
                <input type="submit" class="btn btn-info btn-sm" value="RSVP">
            </form>
            <form th:if="${userAttendance}" method="post" th:action="@{/events/{id}/removeAttending(id=${event.id})}">
                <input type="submit" class="btn btn-outline-info btn-sm" value="I'm attending!">
            </form>
        </td>
    </tr>
```

With that addition, every user should be able to mark themselves for attendance
to an event.

#### Add `RoleRepository` Field
Our `UserService` implements the `loadUserByUsername` method that is a part
of the `UserDetailsService` interface. In that method, we need to properly
load the *granted authorities* for that user.

In `UserService` add a new autowired field for the `RoleRepository`:

```java
    @Autowired
    private RoleRepository roleRepository;
```

#### Update `getAuthorities` to pull roles & privileges for `User`

We want to modify `getAuthorities` to take an argument for a `Collection<Role>`
object that is a list of the roles for a user. We'll refactor this method
and introduce some helper methods. The result will be that `getAuthorities`
returns a collection of granted authories that includes *all roles &
privileges* for a given list of user roles.

```java
    private Collection<? extends GrantedAuthority> getAuthorities(
            Collection<Role> roles) {
        return getGrantedAuthorities(getPrivilegesAndRoles(roles));
    }

    private List<String> getPrivilegesAndRoles(Collection<Role> roles) {
    }

    private List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
    }
```

In `getPrivilegesAndRoles`, we will take a list of `Role` objects and return a
list of roles and associated privileges in `String` form. We will heavily use
Java `stream` and `map` methods here to translate between collections:

Update the `getPrivilegesAndRoles` method as below:

```java
    private List<String> getPrivilegesAndRoles(Collection<Role> roles) {
        List<Privilege> collection = new ArrayList<>();
        for (Role role : roles) {
            collection.addAll(role.getPrivileges());
        }
        List<String> rolesAndPrivileges =  collection.stream()
                .map(Privilege::getName)
                .collect(Collectors.toList());
        rolesAndPrivileges.addAll(roles.stream()
            .map(Role::getName)
            .collect(Collectors.toList())
        );
        return rolesAndPrivileges;
    }
```

We will use that `List<String>` object to create a `List<GrantedAuthority>`
object. Update `getGrantedAuthorities` method as below:

```java
    private List<GrantedAuthority> getGrantedAuthorities(List<String> privileges) {
        return privileges.stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }
```

Now, the current user in session will have their roles and privileges stored in
the `Authentication` object in `SecurityContext`.

### Add Event Organizer role capability for users

#### Add field to `RegisterFormDTO`

When a user is registering for Coding Events, they should be able to mark
themselves as an event organizer, so that they can have both `ROLE_USER` and
`ROLE_ORGANIZER`.

In `RegisterFormDTO`, add a field:

```java
    private Boolean eventOrganizer;
```

Add a getter and a setter for this field as well.

#### Update `UserService save` for Event Organizer field in `RegisterFormDTO`

We have already added a `Boolean` to `RegisterFormDTO` that allows a user to
mark themselves as an organizer. We need to make sure their assigned roles
reflect that. In `UserService save` add the following update:

```java{ hl_lines="11-20" }
    public User save(RegisterFormDTO registration) {
        String password = registration.getPassword();
        String verifyPassword = registration.getVerifyPassword();
        if (!password.equals(verifyPassword)) {
            throw new UserRegistrationException("Passwords do not match");
        }

        String pwHash = passwordEncoder.encode(registration.getPassword());
        User user = new User(registration.getUsername(), pwHash);

        if (registration.getEventOrganizer()) {
            List<Role> roles = new ArrayList<>();
            roles.add(roleRepository.findByName(RoleType.ROLE_USER.toString()));
            roles.add(roleRepository.findByName(RoleType.ROLE_ORGANIZER.toString()));
            user.setRoles(roles);
        } else {
            user.setRoles(Collections.singletonList(
                roleRepository.findByName(RoleType.ROLE_USER.toString())
            ));
        }

        return userRepository.save(user);
    }
```

If the user has marked themselves as an organizer, we add both `ROLE_USER` and
`ROLE_ORGANIZER` to their account.

#### Add organizer option to register form

In our registration form, we need to give the option to register as an event
organizer. Add the following input to the `register.html` template:

```html{hl_lines="6-11"}
    <div class="form-group">
        <label>Verify Password
            <input class="form-control" th:field="${registerFormDTO.verifyPassword}" type="password" />
        </label>
    </div>
    <div class="form-group">
        <label>
            <input th:field="${registerFormDTO.eventOrganizer}" type="checkbox" />
            I am an event organizer
        </label>
    </div>

    <input type="submit" class="btn btn-primary" value="Register" />
```

Now when someone checks the option for "I am an event organizer", their user
type for `ROLE_ORGANIZER` is set.

In the next section, we will add security annotations to the controllers to
limit access depending on user role.

### Secure controllers with authorization annotations

We currently have route filtering done in our `WebSecurity` class. This can be
a helpful way to set up route filtering based on prefixes. For example,
we use `.requestMatchers("/login").permitAll()` to allow any client to access
this route.

We could also design our app to have Admin routes behind `/admin/` prefix,
and with this, we could limit access using
[Ant matchers again](https://docs.spring.io/spring-security/reference/servlet/authorization/authorize-http-requests.html#match-by-ant),
with a method like `.requestMatchers("/admin/**").hasRole("ROLE_ADMIN")`.

For Coding Events, we are going to set up authorization per controller and
request handler using the `@PreAuthorize` annotation. The basics of
[Authorization with Annotation](https://docs.spring.io/spring-security/reference/servlet/authorization/method-security.html#authorizing-with-annotations)
are described in documentation, and require us to add
`@PreAuthorize("hasRole('ROLE_ORGANIZER')")` to request handlers that we
want to restrict role-based access to.

#### Secure `EventCategoryController`

Our first task is to update `EventCategoryController` with `@PreAuthorize`
annotations. The `/eventCategories` route is already protected by our
request matchers in `WebSecurity` for basic user authentication. We will go
above and beyond to add authorization to the controller for `ROLE_USER`.

Add the following to `EventCategoryController`, which will apply this
authorization to every request handler by default:

```java{hl_lines="3"}
@Controller
@RequestMapping("eventCategories")
@PreAuthorize("hasRole('ROLE_USER')")
public class EventCategoryController {
```

Now we can selectively apply `ROLE_ORGANIZER` authorization to individual
request handlers. We want to restrict the creation of new categories to
the `ROLE_ORGANIZER` type.

```java{hl_lines="2"}
    @GetMapping("create")
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    public String renderCreateEventCategoryForm(Model model) {
```

```java{hl_lines="2"}
    @PostMapping("create")
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    public String processCreateEventCategoryForm(@Valid @ModelAttribute EventCategoryDTO eventCategoryDto,
                                                 Errors errors, Model model, HttpSession session) {
```

We had previously prevented users from seeing categories that they did not
create, meaning one could not see another user's categories. With these roles,
however, we want to allow a regular `ROLE_USER` to browse the categories created
by `ROLE_ORGANIZER`.

Therefore, we should update our `displayAllCategories` handler to show all
categories as below:

```java{hl_lines="4"}
    @GetMapping
    public String displayAllCategories(Model model, HttpSession session) {
        model.addAttribute("title", "All Categories");
        model.addAttribute("categories", eventCategoryService.getAllCategories());
        return "eventCategories/index";
    }
```

#### Secure `EventController`

Similar to `EventCategoryController`, we will add `@PreAuthorize` by default to
every request:

```java{hl_lines="3"}
@Controller
@RequestMapping("events")
@PreAuthorize("hasRole('ROLE_USER')")
public class EventController {
```

When a `ROLE_USER` user looks at `/events`, they should see a list of all events
created by other organizers for them to browse. Let's update `displayEvents` to
return all events:

```java{hl_lines="4 7"}
    public String displayEvents(@RequestParam(required = false) Integer categoryId, Model model, HttpSession session) {
        if (categoryId == null) {
            model.addAttribute("title", "All Events");
            model.addAttribute("events", eventService.getAllEvents());
        } else {
            try {
                EventCategory category = eventCategoryService.getCategoryById(categoryId);
```

Next, we'll create a separate `Event` index for `ROLE_ORGANIZER` so that they
can see the events they have created, which will live at `/events/organizer`.
It reuses the `/events/index.html` template but passes different data in. Add
the following method:

```java
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    @GetMapping("organizer")
    public String displayOrganizerEvents(Model model) {

        model.addAttribute("title", "My Organizer Events");
        model.addAttribute("events", eventService.getAllEventsByCurrentUser());

        return "events/index";
    }
```

For the rest of CRUD, add the same `@PreAuthorize` annotation so that only
`ROLE_ORGANIZER` can create and delete events.

In `displayCreateEventForm`, we want to pass all of the categories to the view
so that organizers can use categories created by others.

```java{hl_lines="1 6"}
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    @GetMapping("create")
    public String displayCreateEventForm(Model model) {
        model.addAttribute("title", "Create Event");
        model.addAttribute(new EventDTO());
        model.addAttribute("categories", eventCategoryService.getAllCategories());
        return "events/create";
    }
```

```java{hl_lines="1 7"}
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    @PostMapping("create")
    public String processCreateEventForm(@ModelAttribute @Valid EventDTO newEventDto,
                                         Errors errors, Model model) {
        if(errors.hasErrors()) {
            model.addAttribute("title", "Create Event");
            model.addAttribute("categories", eventCategoryService.getAllCategories());
            return "events/create";
        }

        eventService.save(newEventDTO);
        return "redirect:/events";
    }
```

```java{hl_lines="1"}
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    @GetMapping("delete")
    public String displayDeleteEventForm(Model model) {
```

```java{hl_lines="1"}
    @PreAuthorize("hasRole('ROLE_ORGANIZER')")
    @PostMapping("delete")
    public String processDeleteEventsForm(@RequestParam(required = false) int[] eventIds) {
```

Last, we want our `displayEventDetails` handler to show any event id that is
passed. Update the method to retrieve the event without checking the current
user:

```java{ hl_lines="4" }
    @GetMapping("detail")
    public String displayEventDetails(@RequestParam Integer eventId, Model model) {
        try {
            Event event = eventService.getEventById(eventId);

            model.addAttribute("title", event.getName() + " Details");
            model.addAttribute("event", event);
            model.addAttribute("userAttendance", eventService.getUserEventAttendance(event));
        } catch (ResourceNotFoundException ex) {
            model.addAttribute("title", "Invalid Event ID: " + eventId);
        }

        return "events/detail";
    }
```


{{% notice blue Note "rocket" %}}
The `detail` template shows the `Tag` entries associated with an `Event`.
Consider how you might display the tags to all users but restrict the ability
to add tags to `ROLE_ORGANIZER` only.
{{% /notice %}}

### Update Navigation by Role

Depending on which role is logged-in, we can selectively display certain content
versus another. [The Spring Security Thymeleaf documentation](https://www.thymeleaf.org/doc/articles/springsecurity.html)
has some background on the `sec:authorize` attribute that we can use. It is
similar to the `th:if` attribute that will selectively include an HTML element
depending on the condition.

We will use one of the following:

1. `sec:authorize="isAuthenticated()"`
1. `sec:authorize="hasRole('ROLE_ORGANIZER')"`

Let's redesign our navbar to show all `ROLE_USER` links first, and then hide
`ROLE_ORGANIZER` links in some dropdown menus.

In order for Dropdown menus to work in Bootstrap, we need to include PopperJS
as a dependency of Bootstrap in `fragments.html`:

```html{hl_lines="5"}
<head th:fragment="head">
  <meta charset="UTF-8"/>
  <title>Coding Events</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
  <link rel="stylesheet" th:href="@{/styles.css}">
</head>
```

Next, let's rework the nav list in `fragments.html` to use `sec:authorize`:

```html{hl_lines="1 5-20"}
  <ul sec:authorize="isAuthenticated()" class="nav" style="float:right;">
    <li class="nav-item"><a class="nav-link" href="/logout">Log out</a></li>
  </ul>
  <ul class="nav">
    <li sec:authorize="isAuthenticated()" class="nav-item"><a class="nav-link" href="/events">All Events</a></li>
    <li sec:authorize="isAuthenticated()" class="nav-item"><a class="nav-link" href="/eventCategories">All Categories</a></li>
    <li sec:authorize="isAuthenticated()" class="nav-item"><a class="nav-link" href="/events/attending">My Events</a></li>
    <li sec:authorize="hasRole('ROLE_ORGANIZER')" class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="organizerDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          Organize Events
        </a>
        <ul class="dropdown-menu" aria-labelledby="organizerDropdown">
          <li><a class="dropdown-item" href="/events/organizer">My Organizer Events</a></li>
          <li><a class="dropdown-item" href="/events/create">Create Events</a></li>
          <li><a class="dropdown-item" href="/events/delete">Delete Events</a></li>
          <li><a class="dropdown-item" href="/eventCategories/create">Create Event Categories</a></li>
          <li><a class="dropdown-item" href="/tags">All Tags</a></li>
          <li><a class="dropdown-item" href="/tags/create">Create Tags</a></li>
        </ul>
      </li>
  </ul>
```

That should take care of it! Be sure to test at this point to verify that users
can mark their attendance and that they do not have access to routes like
`/events/create` which are reserved for `ROLE_ORGANIZER`. Also test that a user
with `ROLE_ORGANIZER` can access all of the restricted routes and see the
updated navigation.
