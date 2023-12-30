---
title: "Data Transfer Objects & Services"
date: 2023-10-17T00:02:24-05:00
draft: false
weight: 2
originalAuthor: Ben Clark # to be set by page creator
originalAuthorGitHub: brclark # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

It's time for us to expand on a previous topic used in Chapter 18.
We used **Data Transfer Objects** or DTOs to separate the structure
of our Models from the needs of our client requests or views.

## Separating Business Logic from Controllers

For example, we have a `RegisterFormDTO` containing a necessary `verifyPassword`
field when registering a new account, *but* the `verifyPassword` is not a field
that we need to store in the model. Our DTOs allow us to create data objects
that are specific to the requirements of a form or client request. They
translate the database definition in the Model to the client requirement of
a request.

In order to facilitate the translation of the database Models to a DTO, we will
add another "layer" to our design. The [sequence diagrams](https://en.wikipedia.org/wiki/Sequence_diagram)
below show how we will use modules
called **Services** to manage the interactions between the **Controllers** and the
**Repositories** / **Models**.

{{% notice blue Note "rocket" %}}
Services are a design concept laid out in [Domain Driven Design](https://en.wikipedia.org/wiki/Domain-driven_design).
Any logic that does not fit neatly in to an object, such as the Controller
or Model, can be expressed as a service.

The benefits of a Service layer in an MVC app are described nicely in
[this StackOverflow piece](https://stackoverflow.com/questions/31180816/mvc-design-pattern-service-layer-purpose).
{{% /notice %}}

```mermaid { align="left" zoom="false" }
%%{init:{"fontFamily":"monospace", "zoom":"false"}}%%
sequenceDiagram
    Title: Our Design Before DTOs/Services
    actor User
    participant E as EventController
    participant A as AuthController
    participant Ev as EventRepository
    User->>E: POST /events/create <br> { Event newEvent }
    E->>+A: getUserFromSession
    A-->>-E: currUser
    Note over E: // business logic <br> event.setCreator(currUser)
    E->>Ev: save(Event newEvent)
    E->>User: redirect: /events
```

In our current design without **Services**, our "business logic" --- the logic
that validates and configures our data before saving to the database --- is
handled in the **Controllers**. Our `Event` model also contains fields that are
not used in the `Create Event` form that users complete, such as `user_id`.

We can create a DTO that directly maps to the `Create Event` form,
which gives us flexibility to create customized forms with fields unrelated to
the database models. Again, consider the `RegisterFormDTO` which contained the
`verifyPassword` field, a necessary field for the form that does not end up in
the `User` Model.

With DTOs, our "business logic" will now include the translation of DTO fields to
Model fields. Rather than having this logic clutter our Controllers, we can
move it to the Service layer. Take a look at the diagram below and notice how
our `EventController` passes the `EventDTO` to the `EventService`, where the
"business logic" now resides.

```mermaid { align="right" zoom="false" }
sequenceDiagram
    Title: Design with DTOs & Services
    actor User
    participant E as EventController
    participant Es as EventService
    participant Us as UserService
    participant Ev as EventRepository
    User->>E: POST /events/create <br> { EventDTO newEventDto }
    E->>+Es: save(newEventDto)
    Note over Es: // business logic <br> // translate DTO to Model
    Es->>+Us: getCurrentUser
    Us-->>-Es: currUser
    Note over Es: newEvent.setCreator(currUser)
    Es->>Ev: save(Event newEvent)
    Es-->>E: newEvent
    E->>User: redirect: /events
```

## Adding DTOs & Services to CodingEvents - Video

**TODO**

## Adding DTOs & Services to CodingEvents - Text

### Adding `EventDTO` & `EventCategoryDTO`
We'll start by adding the `EventDTO`. This will be a POJO class that contains
every field from our `Create Event` form. Notice the flattening of the
`EventDetails`, meaning that the DTO has the fields from `EventDetails`
instead of a separate class/object for them.

Move the `dto` package from `codingevents.models.dto` to `codingevents.dto`, so
that it's no longer nested inside the `models` package.

Next, let's create the `EventDTO` class in the same package.

```java
public class EventDTO {
    @NotBlank(message = "Name is required")
    @Size(min = 3, max = 50, message = "Name must be between 3 and 50 characters")
    private String name;

    @Size(max = 500, message = "Description too long!")
    private String description;

    @NotBlank(message = "Email is required")
    @Email(message = "Invalid email. Try again.")
    private String contactEmail;

    private int categoryId;

    private int[] tagIds;

    public EventDTO() {}

    // Add setters & getters...
}
```

Add the getters and setters for the fields. Let's also add the DTO for
`EventCategory`. Create `EventCategoryDTO` in the `dto` package as well.

```java
public class EventCategoryDTO {
    @Size(min=3, message="Name must be at least 3 characters long")
    private String name;

    public EventCategoryDTO() {}

    // Add getters & setters...
}
```

### Prepping `User` model for `UserService`

We have a few updates we need to make to the `User` model to prep it for use
with the `UserService`. Namely, we need to move the `PasswordEncoder` class to
its own managed config. Our password encoder is currently a static instance
in the `User` model, but we will need access to our encoder within the
`UserService` so that we can validate a login password against the user's
encrypted password.

#### Creating `PasswordEncoder` bean

This password encoder object will be a managed Java bean, similar to a
controller, that can be referenced using an `@Autowired` field.

First, create a new package `config` within your `codingevents` package. Then,
create a new class `EncoderConfig` in the package.

```java
@Configuration
public class EncoderConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
```

The `@Configuration` annotation tells Spring that this class will contain
`@Bean` definitions for Spring managed objects. Inside the class, we
define a `@Bean` that will return an instance of the `BCryptPasswordEncoder`
that we were using in the `User` class.

#### Refactoring `User` model

Next, we need to modify our `User` model for use of the `PasswordEncoder`.
We are going to rework our constructor so that a new `User` instance gets
the encoded password passed in, and the `User` object will not be responsible
for doing any encoding.

Remove the field containing the `static final BCryptPasswordEncoder`.

Modify the `User` constructor so that it takes in `String pwHash` as an argument
and uses it to set the field directly, removing the call to `encode`.

Lastly, remove the `isMatchingPassword` method and replace it with a getter for
the `pwHash` field. This will cause an issue in `AuthenticationController` that
we will fix after adding `UserService`.

Our `User` class is now refactored. Instead of having the `User` class be
responsible for encoding passwords, we will do password encryption in the
`UserService` and pass encrypted passwords to new `User` instances.

### Adding `UserService`

The reponsibilities of the service layer are to translate DTOs to Models
and handle interactions between the Controller and the Repository. To follow
this design, let's add a service to handle interactions between
`AuthenticationController` and `UserRepository`, and translating
`RegisterFormDTO` to `User` models.

{{% notice blue Note "rocket" %}}
Services are built in to the [Spring Framework](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/stereotype/Service.html).
A class annotated with `@Service` will become a managed component
in the Spring application context, similar to `@Controller`, meaning that the
instance will be created by the Spring context. We can get a reference to a
service object in a different class using the `@Autowired` annotation.
{{% /notice %}}

Let's first add a package `services` inside the `codingevents` package. Create
the `UserService` class inside this package.

```java
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

}
```

Our `UserService` is going to expose a few methods:

1. `User findByUsername(String username)`: retrieves `User` from
`UserRepository` by the `username`
1. `Optional<User> findById(Integer id)`: expose `UserRepository`
functionality for possible use
1. `List<User> findAll()`: expose `UserRepository` functionality
for possible use
1. `User deleteUser(Integer id)`: expose `UserRepository` functionality
for possible use
1. `User save(RegisterFormDTO registration)`: validates data in
`RegisterFormDTO` and creates a new `User` in `UserRepository`
1. `boolean validateUser(User user, String password)`: validate a password
by encoding it and comparing to the encoded `User` password.
1. `User getCurrentUser()`: retrieves currently logged in `User` from
the `user` attribute in `HttpSession` which is loaded from the
current request context

#### Add methods to expose `UserRepository` functionality

Our `UserService` needs to expose some of the basic functionalities of the
`UserRepository` to the controllers. Add the following methods to your
`UserRepository` class. Don't worry about the `userNotFoundException` --- we
will add this definition in the next section.

```java
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    public Optional<User> findById(Integer id){
        return userRepository.findById(id);
    }

    public List<User> findAll() {
        return (List<User>) userRepository.findAll();
    }

    public User deleteUser(Integer id) {
        User user = userRepository.findById(id)
                .orElseThrow(userNotFoundException(id));
        userRepository.delete(user);
        return user;
    }
```

#### Add custom error handlers

We have to add proper error handling to
our site. When we throw an error during request handling, we can trigger an
automatic error page template to be shown. The automatic error page
will be covered in the next lesson, but for now, we can add our custom
`Exception` type when a resource is not found.

First we need to add a definition for the `userNotFoundException`in `UserService`.
This is a method that supplies a more generic `ResourceNotFoundException` with a
custom message. Add this method to the end of your `UserService` class.

```java
    private Supplier<ResourceNotFoundException> userNotFoundException(Integer id) {
        return () -> new ResourceNotFoundException("User with id %d could not be found");
    }
```

Next we need to define our custom exceptions that will be used to trigger the
error template. Add a new package called `exceptions` in `org.launchcode.codingevents`.
Then create a new class in that package called `ResourceNotFoundException`. This
will extend `RuntimeException` and give us a new exception type for our needs.

```java
public class ResourceNotFoundException extends RuntimeException {
    public  ResourceNotFoundException() {

    }

    public ResourceNotFoundException(String message) {
        super(message);
    }

    public ResourceNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public ResourceNotFoundException(Throwable cause) {
        super(cause);
    }

    public ResourceNotFoundException(String message, Throwable cause,
                                     boolean enableSuppression,
                                     boolean writeableStackTrace) {
        super(message, cause, enableSuppression, writeableStackTrace);
    }
}
```

We need one other custom exception that will be thrown if the user does not
provide matching `password` and `verifyPassword` fields when registering. Create
another new class in `exceptions` named `UserRegistrationException`.

```java
public class UserRegistrationException extends RuntimeException {
    public  UserRegistrationException() { }

    public UserRegistrationException(String message) {
        super(message);
    }

    public UserRegistrationException(String message, Throwable cause) {
        super(message, cause);
    }

    public UserRegistrationException(Throwable cause) {
        super(cause);
    }

    public UserRegistrationException(String message, Throwable cause, boolean enableSuppression,
                                     boolean writeableStackTrace) {
        super(message, cause, enableSuppression, writeableStackTrace);
    }
}
```

#### Add `save` and `validateUser` methods

Two very important methods in our `UserService` will be `save` and
`validateUser` methods.

The `save` method will be responsible for taking a `RegisterFormDTO` instance,
translating it to a new `User` instance, and saving to the database. It will
be responsible for comparing the `verifyPassword` field and encoding the
password for use in the `User` instance.

```java
    public User save(RegisterFormDTO registration) {
        String password = registration.getPassword();
        String verifyPassword = registration.getVerifyPassword();
        if (!password.equals(verifyPassword)) {
            throw new UserRegistrationException("Passwords do not match");
        }

        String pwHash = passwordEncoder.encode(registration.getPassword());
        User user = new User(registration.getUsername(), pwHash);

        return userRepository.save(user);
    }
```

When a user is attempting to login, we will need to validate the password
provided in the `LoginFormDTO` against the `pwHash` of the user.

```java
    public boolean validateUser(User user, String password) {
        if (user == null) {
            return false;
        }

        return passwordEncoder.matches(password, user.getPwHash());
    }
```

#### Add `getCurrentUser` method

One more piece to add in `UserService`, we have to add a `getCurrentUser()` method.

We will do some fancy Spring Framework logic to retrieve the `HttpSession` from
the current HTTP request context, and then get the `User` object similarly to
how we do it in `AuthenticationController`.

Add this method to your `UserService` below the fields.

```java
    public User getCurrentUser() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);

        Integer userId = (Integer) session.getAttribute("user");
        if (userId == null) {
            return null;
        }

        Optional<User> user = findById(userId);

        return user.orElse(null);
    }
```

With these methods added to `UserService`, we can refactor some of our
`AuthenticationController` to make use of the service.

### Refactor `AuthenticationController` to use `UserService`

Our goal in `AuthenticationController` is to remove references to
`UserRepository` and replace them with references to methods from
`UserService`. To begin, update the `userRepository` field to:

```java
    private UserService userService;
```

With `userRepository` removed, we can update `getUserFromSession`,
`processRegistrationForm`, and `processLoginForm`.

First, update `getUserFromSession` to use `userService.findById`, along with
helpful code to deal with `Optional`:

```java{ hl_lines="7" }
    public User getUserFromSession(HttpSession session) {
        Integer userId = (Integer) session.getAttribute(userSessionKey);
        if (userId == null) {
            return null;
        }

        return userService.findById(userId).orElse(null);
    }
```

Next, update `processRegistrationForm` to use `userService.save` with our
`RegistrationFormDTO`:

```java{ hl_lines="4 9 16-21" }
    @PostMapping("/register")
    public String processRegistrationForm(@ModelAttribute @Valid RegisterFormDTO registerFormDTO,
                                          Errors errors, Model model) {
        model.addAttribute("title", "Register");
        if (errors.hasErrors()) {
            return "register";
        }

        User existingUser = userService.findByUsername(registerFormDTO.getUsername());

        if (existingUser != null) {
            errors.rejectValue("username", "username.alreadyexists", "A user with that username already exists");
            return "register";
        }

        try {
            User newUser = userService.save(registerFormDTO);
        } catch (UserRegistrationException ex) {
            errors.rejectValue("password", "passwords.mismatch", "Passwords do not match");
            return "register";
        }

        return "redirect:/login";
    }
```

Last, we need to update `processLoginForm` to use `userService` and the new
`validateUser` method:

```java{ hl_lines="11 20" }
    @PostMapping("/login")
    public String processLoginForm(@ModelAttribute @Valid LoginFormDTO loginFormDTO,
                                   Errors errors, HttpServletRequest request,
                                   Model model) {
        model.addAttribute("title", "Log In");

        if (errors.hasErrors()) {
            return "login";
        }

        User theUser = userService.findByUsername(loginFormDTO.getUsername());

        if (theUser == null) {
            errors.rejectValue("username", "user.invalid", "The given username does not exist");
            return "login";
        }

        String password = loginFormDTO.getPassword();

        if (!userService.validateUser(theUser, password)) {
            errors.rejectValue("password", "password.invalid", "Invalid password");
            return "login";
        }

        setUserInSession(request.getSession(), theUser);

        return "redirect:";
    }
```

### Adding `EventService` and `EventCategoryService`

The `EventService` and `EventCategoryService` will be responsible for
translating `EventDTO` and `EventCategoryDTO` to model objects and
communication between the `EventController` and `EventRepository`.

#### `EventService`

Let's create another class in the `services` package named `EventService`.

Our service will need references to the repositories so that it can access
the database, and a reference to `UserService` so that it can retrieve the
currently logged-in user.

```java
@Service
public class EventService {

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private EventCategoryRepository categoryRepository;

    @Autowired
    private UserService userService;

}
```

Next let's add some methods that will expose database functionality. Notice
how we use the new `findAllByCreator` and `findByIdAndCreator` repository
methods to filter events by user. We also want to create method definitions
that assume the creator is the current user, such as
`getAllEventsByCurrentUser()`.

```java
    public List<Event> getAllEvents() {
        return (List<Event>) eventRepository.findAll();
    }

    public List<Event> getAllEventsByCreator(User creator) {
        return eventRepository.findAllByCreator(creator);
    }

    public List<Event> getAllEventsByCurrentUser() {
        return getAllEventsByCreator(userService.getCurrentUser());
    }

    public Event getEventById(int id) {
        return eventRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
    }

    public Event getEventByIdAndCreator(int id, User creator) {
        return eventRepository.findByIdAndCreator(id, creator).orElseThrow(ResourceNotFoundException::new);
    }

	public Event getEventByIdForCurrentUser(int id) {
        return getEventByIdAndCreator(id, userService.getCurrentUser());
	}

    public void removeEventById(int id) {
        eventRepository.deleteById(id);
    }
```

Last, we must add a `save` method, which
takes in an `EventDTO` object and will translate it to our `Event` and
`EventDetails` models before saving to the database.

```java
    public Event save(EventDTO eventDTO) {
        Event event = new Event();
        event.setName(eventDTO.getName());

        EventDetails details = new EventDetails(eventDTO.getDescription(),
                                                eventDTO.getContactEmail());
        event.setEventDetails(details);

        event.setEventCategory(categoryRepository.findById(eventDTO.getCategoryId())
                                                 .orElse(null));

        event.setCreator(userService.getCurrentUser());

        eventRepository.save(event);

        return event;
    }
```

#### Add `EventCategoryService`

Similar to our `EventService`, we must add methods to the `EventCategoryService`
to expose functionality of the `EventCategoryRepository` to the controllers.

We will only need `EventCategoryRepository` and `UserService` autowired fields
in this class.

Write the following methods, using the previous section on `EventService` as a
guide:

1. `List<EventCategory> getAllCategories()`
1. `List<EventCategory> getAllCategoriesByCreator(User creator)`
1. `List<EventCategory> getAllCategoriesByCurrentUser()`
1. `EventCategory getCategoryById(int id)`
1. `EventCategory getCategoryByIdAndCreator(int id, User creator)`
1. `EventCategory getCategoryByIdForCurrentUser(int id)`
1. `EventCategory save(EventCategoryDTO categoryDTO)`

Now that our service layer is added, we can refactor our controllers to use them
and our form views to use DTOs.

### Refactoring Controllers & Views

We will remove all references to `authController` in `EventController` and
`EventCategoryController`, which is how the sequence diagram above is organized.
We will also make use of the service classes instead of the repository classes.

#### `EventController`

Let's start by refactoring our `EventController` to use the `EventService`,
`EventCategoryService` and `EventDTO`.

Change the `EventRepository` field to be `EventService`, as well as
`EventCategoryRepository` to `EventCategoryService`, like below. Also, remove
the `AuthenticationController` field as we will not be using it to retrieve
the current user anymore.

```java
    @Autowired
    private EventService eventService;

    @Autowired
    private EventCategoryService eventCategoryService;
```

Now, we have to to update the request handlers to use `eventService` and
`eventCategoryService`.

In `displayEvents` we will add a `try/catch` block to catch
`ResourceNotFoundException` if the category ID is invalid. We will also
remove the use of `HttpSession` and `authController`. Instead, we use
the `eventService.getAllEventsByCurrentUser()` that we wrote to find the
current user information:

```java {hl_lines="2 5 7-14"}
    @GetMapping
    public String displayEvents(@RequestParam(required = false) Integer categoryId, Model model) {
        if (categoryId == null) {
            model.addAttribute("title", "All Events");
            model.addAttribute("events", eventService.getAllEventsByCurrentUser());
        } else {
            try {
                EventCategory category = eventCategoryService.getCategoryByIdForCurrentUser(categoryId);

                model.addAttribute("title", "Events in category: " + category.getName());
                model.addAttribute("events", category.getEvents());
            } catch(ResourceNotFoundException ex) {
                model.addAttribute("title", "Invalid Category ID: " + categoryId);
            }
        }

        return "events/index";
    }
```

In the `displayCreateEventForm` method, we have to make sure we switch to using
`EventDTO` as our model-binding object. We can also remove references to
`currUser` and `authController`.

```java {hl_lines="4-5"}
    @GetMapping("create")
    public String displayCreateEventForm(Model model) {
        model.addAttribute("title", "Create Event");
        model.addAttribute(new EventDTO());
        model.addAttribute("categories", eventCategoryService.getAllCategoriesByCurrentUser());
        return "events/create";
    }
```

In our `processCreateEventForm` method, we can remove the logic that prepares
the `newEvent` for saving in `eventRepository`, and instead we can pass our
`newEventDTO` directly to the `eventService` for processing and saving.

```java {hl_lines="2 6 10"}
    @PostMapping("create")
    public String processCreateEventForm(@ModelAttribute @Valid EventDTO newEventDTO,
                                         Errors errors, Model model) {
        if(errors.hasErrors()) {
            model.addAttribute("title", "Create Event");
            model.addAttribute("categories", eventCategoryService.getAllCategoriesByCurrentUser());
            return "events/create";
        }

        eventService.save(newEventDTO);
        return "redirect:/events";
    }
```

Our `displayDeleteEventForm` method should show events that the current user
has created. We will update our `processDeleteEventsForm` method to call
`eventService`, but recognize that we are leaving this method unsecure.

Can a user submit a request to delete events that they do not own? It appears
so. How can we protect this method so that we only delete events with ids that
the user owns?

```java {hl_lines="5 14"}
    @GetMapping("delete")
    public String displayDeleteEventForm(Model model) {
        model.addAttribute("title", "Delete Events");
        model.addAttribute("events", eventService.getAllEventsByCurrentUser());
        return "events/delete";
    }

    @PostMapping("delete")
    public String processDeleteEventsForm(@RequestParam(required = false) int[] eventIds) {

        if (eventIds != null) {
            for (int id : eventIds) {
                eventService.removeEventById(id);
            }
        }

        return "redirect:/events";
    }
```

Lastly, we need to update `displayEventDetails` to validate that a user owns
the `eventId` that is passed in. We can achieve this with the
`getEventByIdForCurrentUser` method that we added in `eventService`.

```java {hl_lines="4-10"}
    @GetMapping("detail")
    public String displayEventDetails(@RequestParam Integer eventId, Model model) {
        try {
            Event event = eventService.getEventByIdForCurrentUser(eventId);

            model.addAttribute("title", event.getName() + " Details");
            model.addAttribute("event", event);
        } catch (ResourceNotFoundException ex) {
            model.addAttribute("title", "Invalid Event ID: " + eventId);
        }

        return "events/detail";
    }
```

That takes care of the `EventController`. Updating the `EventCategoryController`
will be very similar and more simple.

#### `EventCategoryController`

Update `EventCategoryController` to use the `EventCategoryService` and
`EventCategoryDTO`.

Change the `EventCategoryRepository` field to be `EventCategoryService`.

Now, refactor all references to the `eventCategoryRepository` to be
`eventCategoryService` references and use `EventCategoryDTO` in the
create form, similar to how we did it in the previous section. You should
be able to remove all references to `authController` that were needed
to get `currUser`, since we have helpful methods in `EventCategoryService` now.

#### Updating Views to use DTOs

Now that we have our controllers updated to use services, we have to update
our views to make use of DTOs for the `create` forms.

First we will update `events/create.html`. We will use the `eventDTO`
attribute that we passed in to the template for model binding.

```html {hl_lines="4 6 10 12 16 18 22 28" title="events/create.html"}
<form method="post">
    <div class="form-group">
        <label>Name
            <input th:field="${eventDTO.name}" class="form-control">
        </label>
        <p class="error" th:errors="${eventDTO.name}"></p>
    </div>
    <div class="form-group">
        <label>Description
            <input th:field="${eventDTO.description}" class="form-control">
        </label>
        <p class="error" th:errors="${eventDTO.description}"></p>
    </div>
    <div class="form-group">
        <label>Contact Email
            <input th:field="${eventDTO.contactEmail}" class="form-control">
        </label>
        <p class="error" th:errors="${eventDTO.contactEmail}"></p>
    </div>
    <div class="form-group">
        <label>Category
            <select th:field="${eventDTO.categoryId}">
                <option th:each="eventCategory : ${categories}"
                        th:value="${eventCategory.id}"
                        th:text="${eventCategory.name}"
                ></option>
            </select>
            <p class="error" th:errors="${eventDTO.categoryId}"></p>
        </label>
    </div>
    <div class="form-group">
        <input type="submit" value="Create" class="btn btn-success">
    </div>
</form>
```

Lastly, we will update `eventCategories/create.html` and use the
`eventCategoryDTO` that we passed in for model binding.

```html {hl_lines="4 6"}
<form method="post">
  <div class="form-group">
    <label>Name
      <input th:field="${eventCategoryDTO.name}" class="form-control">
    </label>
    <span th:errors="${eventCategoryDTO.name}" class="error"></span>
  </div>
  <input type="submit" value="Create" class="btn btn-primary">
</form>
```

Our updates should be complete. There should be no change in functionality
for Coding Events. Be sure to test the create, read, and delete functions.

The next section will begin a process to add user roles and privileges
to Coding Events. First, we will introduce `Role` and `Privilege` models
that can be associated with `User` models.
