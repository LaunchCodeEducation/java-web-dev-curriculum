---
title: "User Roles & Privileges"
date: 2023-11-08T23:36:10-06:00
draft: false
weight: 3
originalAuthor: Ben Clark # to be set by page creator
originalAuthorGitHub: brclark # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

We are going to add some additional features to Coding Events in the next three
lessons. We currently have ability for users to manage their own data. Our next
feature is to bring roles and privileges to our users. We will be able to
configure users as admin, event creator, or event attendee.

With roles and privileges in place, we are able to restrict certain functions
to specific users. This is a common feature of many applications. Consider how
we might associate users to the roles they hold, and how we might associate
privileges to roles.

Also, consider that your future apps may not need both roles AND privileges,
and may just require one or the other. There is flexibility in how you design
and implement future projects.

## Adding Roles & Privileges to Users

{{% notice blue Note "rocket" %}}
The code for this section begins with the
[add-service-dto branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-service-dto)
and ends with the
[user-roles-privileges branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/user-roles-privileges)
of the `CodingEventsJava` repository.
{{% /notice %}}

This lesson describes how to add new models for `Role` and `Privilege` and
associate them with the `User` model. This lesson will *not* add role-based
functionality. That will be added in another lesson.

Some definitions:

- **Privilege**: access to a function or feature, such as `READ_EVENTS` or
`CREATE_EVENTS`
- **Role**: can be assigned to a user and combines multiple privileges in a
distinct role, such as `ROLE_ADMIN` or `ROLE_CREATOR`

### `Role` & `Privilege` Models

Our `Role` model will need a database relationship with the `Privilege` model. We
can say that a role can have many privileges, and a privilege can belong to many
roles, giving us a **Many-to-Many** relationship.

#### Adding the `Privilege` Model

Create a new `Privilege` in your `models` package and make this class
inherit from `AbstractEntity` and require the `@Entity` annotation.

This class will only require a `String name` field to track what the privilege
is. Add the field, constructors (including the empty constructor), getter/setter,
and `toString` method for this class.

In addition to this Model, we need to create some predefined privilege types
for our application, which we can do with an `enum`. We will define privileges
for being able to CRUD events and users. Some users will only have privileges
to *read events* while others will have privileges to *read and create events*.

Create a new `enum` in `models` package named `PrivilegeType`.

```java
public enum PrivilegeType {
    READ_EVENTS,
    CREATE_EVENTS,
    DELETE_EVENTS,
    READ_USERS,
    UPDATE_USERS,
    DELETE_USERS
}
```

#### Adding the `Role` Model

Similar to our `Privilege` model, we need to create a `Role` model that
inherits from `AbstractEntity` and defines a field `String name`, along
with the constructors, getter/setter, and `toString` method.

Create the `Role` class within your `models` package.

Once you have created this base for the `Role` class, we have to define
the relationship between a `Role` object and `Privilege` object. We are
going to define a **Many-to-Many** relationship, but we are going to do
it slightly differently than we did in the previous chapter.

Add the following field to the `Role` class after the `name` field definition.

```java
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "roles_privileges",
            joinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "privilege_id", referencedColumnName = "id"))
    private Collection<Privilege> privileges;
```

Here, we are defining the `@ManyToMany` relationship between roles and
privileges, and we are manually defining the *Join Table* that we want
to be created. This requires us to specify which fields in the join
table are foreign keys used to link roles to privileges. It is not
required to define the join table in this way, but it gives us an example
of how we can have more control over the database tables via our ORM
definitions.

Add a constructor to set the `name` and a no-argument constructor as well. Also,
add a getter/setter for the `privileges` field as well.

Similar to the `PrivilegeType` definition we added, we need a `RoleType`
enum definition to specify the types of roles our app allows. For now,
we will say that there can be *admin*, *event creator*, and *regular* users.

Add a new `enum` definition `RoleType` to the `models` package.

```java
public enum RoleType {
    ROLE_USER("User"),
    ROLE_ORGANIZER("Organizer"),
    ROLE_ADMIN("Admin");

    private final String displayName;

    RoleType(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
```

Admin users will be able to manage user accounts. Event creators will be able
to create new events for the event listing. Regular users will be able to read
the event listing and RSVP to the events they want to attend.

Lastly, we need a special getter in the `Role` class that allows us to retrieve
the `RoleType` enum from a `Role` object. Add the following method to your `Role`
class:

```java
    public RoleType getType() {
        return RoleType.valueOf(name);
    }
```

#### Associating Users with Roles

Our `User` model needs the ability to be assigned certain roles. In this regard,
we need to set up a **Many-to-Many** relationship between `User` and `Role`. 

We will make a few other additions to our `User` model as well, such as a
constraint on unique usernames, and a field to store when the user account
was created.

First, add this `@Table` annotation above the `User` class (after `@Entity`):

```java
@Table(uniqueConstraints = @UniqueConstraint(columnNames = "username"))
```

Next, we will add two new fields:

```java
    private LocalDateTime createDate;

    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(
            name="users_roles",
            joinColumns = @JoinColumn(
                    name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(
                    name = "role_id", referencedColumnName = "id"))
    private Collection<Role> roles;
```

The `createDate` field will store info about when the user account is created.
And similar to our Many-to-Many relationship between `Role` and `Privilege`,
here we have manually set up the join table for our M2M relationship between
`User` and `Role`.

Next, let's add a new constructor that would allow us to initialize a `User`
object and specify their roles:

```java
    public User(String username, String pwHash, Collection<Role> roles) {
        this.username = username;
        this.pwHash = pwHash;
        this.roles = roles;
    }
```

Our `createDate` field will be populated by a special method that runs
automatically. Add this method after the constructors:

```java
    @PrePersist
    public void setUpCreateDate() {
        createDate = LocalDateTime.now();
    }
```

Notice the `@PrePersist` annotation, which will automatically call this method
before a new `User` instance gets created in the database.

Lastly, we need a getter/setter for our the `roles` field. Add your getter/
setter below the other methods.

### Adding `Role` & `Privilege` Repositories

Now that we have models defined for our database schema, we need to define a
repository interface for each class so that we can interact with their database
entries. We will define and override some of the repository methods to give more
customized control over the database.

First, let's create the `PrivilegeRepository` interface in the `data` package:

```java
@Repository
public interface PrivilegeRepository extends CrudRepository<Privilege, Integer> {

    Privilege findByName(String name);
}
```

The `findByName` method creates a custom database query that allows us to
provide the name of a privilege and retrieve the `Privilege` object.

Next, let's create the `RoleRepository` interface in the `data` package.

```java
@Repository
public interface RoleRepository extends CrudRepository<Role, Integer> {

    Role findByName(String name);
}
```

### Preloading Initial Data

Until this point, if we needed any data in our database, we had to directly
update the database or use the forms in our app to create new data. Sometimes,
we have relational data that we need preloaded into the database, and we
want to be certain it is added before our application is served to users.

In this case, we can set up a component that will preload the database with
some specific entries *when the application boots*. This requires us to listen
for an `ApplicationReadyEvent` and trigger some writes to the database when
it occurs.

Create a new class `InitialDataLoader` within the `data`
package. The following code block introduces some new Spring annotations:

```java
@Component
@Transactional
public class InitialDataLoader implements ApplicationListener<ApplicationReadyEvent> {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PrivilegeRepository privilegeRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
}
```

Setting up our `InitialDataLoader` class, it has `@Component` and
`@Transactional` annotations. `@Component` tells Spring to manage this class
instance similar to `@Controller`, and it is necessary so that the class
can handle the `ApplicationListener` event. `@Transactional` is applied to the
whole class and makes sure that our method for loading data either applies
successfully or not at all.

Next, we'll add a method for initializing data when the application is ready:

```java
    @Override
    public void onApplicationEvent(final ApplicationReadyEvent event) {
        Privilege createEvents = createPrivilegeIfNotFound(PrivilegeType.CREATE_EVENTS.toString());
        Privilege readEvents = createPrivilegeIfNotFound(PrivilegeType.READ_EVENTS.toString());
        Privilege deleteEvents = createPrivilegeIfNotFound(PrivilegeType.DELETE_EVENTS.toString());
        Privilege readUsers = createPrivilegeIfNotFound(PrivilegeType.READ_USERS.toString());
        Privilege updateUsers = createPrivilegeIfNotFound(PrivilegeType.UPDATE_USERS.toString());
        Privilege deleteUsers = createPrivilegeIfNotFound(PrivilegeType.DELETE_USERS.toString());

        Role adminRole = createRoleIfNotFound(RoleType.ROLE_ADMIN.toString(),
                Arrays.asList(readUsers, updateUsers, deleteUsers));
        Role organizerRole = createRoleIfNotFound(RoleType.ROLE_ORGANIZER.toString(),
                Arrays.asList(createEvents, deleteEvents));
        Role userRole = createRoleIfNotFound(RoleType.ROLE_USER.toString(),
                Arrays.asList(readEvents));

        User admin = new User("admin", passwordEncoder.encode("launchcode"),
                Arrays.asList(adminRole, organizerRole, userRole));

        createUserIfNotFound(admin);
    }
```

We will load entries for the different `Privilege` types, `Role` types, and
create a default admin user. `ROLE_ADMIN` is associated with user CRUD.
`ROLE_ORGANIZER` is associated with event creation and deletion. `ROLE_USER`
is associated with reading events.

Finally, we need to add the methods that will create the entries if they don't
already exist in the database. Notice how the relationships are set up when
creating a `Role`, by setting the list of `Privilege` objects associated with
that `Role`.

```java
    private User createUserIfNotFound(User user) {
        if (userRepository.findByUsername(user.getUsername()) == null) {
            userRepository.save(user);
        }
        return user;
    }

    private Privilege createPrivilegeIfNotFound(String name) {
        Privilege privilege = privilegeRepository.findByName(name);
        if (privilege == null) {
            privilege = new Privilege(name);
            privilegeRepository.save(privilege);
        }
        return privilege;
    }

    private Role createRoleIfNotFound(String name, Collection<Privilege> privileges) {
        Role role = roleRepository.findByName(name);
        if (role == null) {
            role = new Role(name);
            role.setPrivileges(privileges);
            roleRepository.save(role);
        }
        return role;
    }
```

Now, when you boot your application, these entries will be added to the database
automatically the first time. Test it out.

### Adding a `SecurityService`

With roles and privileges added to our database, the last piece to add is
a service that can check whether the current user has a specific role or
privilege. We will not make use of this service in our application yet, but
recognize that this could be used to determine if an action can be taken in the
controller.

Create a new package named `security` inside the `codingevents` package. Then,
create a new class `SecurityService` inside the `security` package.

```java
@Service
public class SecurityService {
    @Autowired
    private UserService userService;
}
```

We will add two methods that allow us to check if a user has a certain privilege
or a certain role. Add the following `hasPrivilege` method to this service.

{{% notice blue Note "rocket" %}}
The `hasPrivilege` method below uses Java streams and lambda expressions to
simplify the code for searching for a matching privilege within a user's
associated roles. Take a look at the [Java docs for Stream](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html)
for more background on this syntax.
{{% /notice %}}

```java
    public boolean hasPrivilege(String privilege) {
        final User theUser = userService.getCurrentUser();
        if (theUser == null) {
            return false;
        }
        Boolean hasPrivilege = theUser.getRoles()
            .stream()
            .map(Role::getPrivileges)
            .flatMap(coll -> coll.stream())
            .map(Privilege::getName)
            .anyMatch(p -> p.equals(privilege));
        return hasPrivilege;
    }
```

This method will take a privilege, such as `"READ_EVENTS"`, and check if the
current user has a role with the associated privilege. For each role, we get
the privileges and gather them in a large collection, where we then check to
see if the given argument matches any in the collection.

Similary, we will add a `hasRole` method to the service as well.

```java
    public boolean hasRole(String role) {
        final User theUser = userService.getCurrentUser();
        if (theUser != null) {
            return false;
        }
        Boolean hasRole = theUser.getRoles()
            .stream()
            .map(Role::getName)
            .anyMatch(r -> r.equals(role));
        return hasRole;
    }
```

This method is similar to `hasPrivilege` but simpler, as we only need to compare
the argument to the user's associated roles.

With this service in place, we could check in each controller request handler
whether we want to allow the current user to take action. But, Spring provides
a larger framework for us to use in order to handle security, authentication,
and checking user roles & privileges. In the next lesson, we will set up that
framework and plug our existing models into it.
