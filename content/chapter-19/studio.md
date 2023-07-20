# Studio: TechJobs Authentication

For this studio, you\'ll be tasked with adding simple user
authentication to your `techjobs` application. The steps to do this will
match what you have already done in `coding-events`. You should refer
back to the tutorial starting
`here <user_auth_walkthrough>`{.interpreted-text role="ref"}.

1.  `auth_studio_user_model`{.interpreted-text role="ref"}
2.  `auth_studio_forms`{.interpreted-text role="ref"}
3.  `auth_studio_filter`{.interpreted-text role="ref"}

## The Starter Code

1.  Fork and clone the starter code for [TechJobs (Auth
    Edition)](https://github.com/LaunchCodeEducation/java-web-dev-techjobs-authentication).
2.  The dependencies for the database connection and hashing function
    are already added for you in `build.gradle`. You will need to do
    some work to ensure that the schema, user, and database password
    match your own local MySQL setup.
    1.  Open `application.properties` and view the first three
        statements:

            # Database connection settings
            spring.datasource.url=jdbc:mysql://localhost:3306/techjobs_auth
            spring.datasource.username=techjobs_auth
            spring.datasource.password=auth

    2.  You likely do not already have a schema named `techjobs_auth` or
        this combination of username and password so you must create
        them.

        ::: admonition
        Tip

        To create a new schema in your current connection, refer back to
        the instructions in [SQL Part 1
        Exercises](https://education.launchcode.org/SQL/chapters/mysql-part-1/exercises.html).

        To create a new user with permissions, refresh your memory in
        `setup-orm-database`{.interpreted-text role="ref"}.
        :::

::: admonition
Note

We\'ve greatly reduced the functionality of the app so you can focus on
the work to set up authentication. Running the application now gives you
a familiar-looking navbar with two menu options, *Add Jobs* and
*Logout*. You can add jobs right away and an astute observer of the
starter code and schema tables will notice that the fields on `Job` are
only strings, not complex objects. Logout functionality is not yet
implemented, but you\'ll get there by the end of this studio.
:::

## Create the User Model {#auth_studio_user_model}

1.  In the project you have cloned, create a `User` model identical to
    that in `coding-events`. The class needs:
    1.  To be an entity.
    2.  To have username and encrypted password fields.
    3.  To have appropriate constructors, getters, setters.
2.  Encode the `User` password field.
    1.  Add a static `BCryptPasswordEncoder` variable.
    2.  Update the constructor that has arguments to encode the password
        field.
    3.  Add a method to check password values.
3.  Create a `UserRepository`.
    1.  Add the special query method to find a user by username.

::: admonition
Tip

At this point, re-starting your application will not change the view at
`localhost:8080`, but you can confirm you have done everything correctly
if you see a `user` table in MySQL Workbench.
:::

## Create the Login and Registration Forms {#auth_studio_forms}

1.  Create an `AuthenticationController`.
    1.  Include an autowired `UserRepository`.
2.  Add session handling utilities. This includes:
    1.  A static final variable for the session key.
    2.  A method to get the user information from the session.
    3.  A method to set the user in the session.
3.  Create two DTOs for the user registration and login forms in a new
    package, `dto` under `models`.
    1.  Create a login form DTO with username and password fields.
    2.  Create a register form DTO with the fields above and a field to
        verify a password.
4.  Handle the registration data.
    1.  Add a `GET` handler in `AuthenticationController` to display a
        registration form.
    2.  Create a register template with form fields corresponding to the
        register DTO.
    3.  Create a `POST` handler in `AuthenticationController` to process
        the form.
        1.  If the form has validation errors, re-render the
            registration form with a useful message.
        2.  If the username is already tied to a user, add a fitting
            error message and re-render the form.
        3.  If the two form fields for passwords do not match, add an
            error message and re-render the form.
        4.  If none of the above conditions are met,
            1.  Create a new user with the form data,
            2.  Save the user to the database,
            3.  Create a new user session,
            4.  Redirect to the home page.
5.  Handle the login data.
    1.  Repeat steps 1 + 2 for handling the registration data, this time
        with the login information.
    2.  Apart from model validation checks and the final redirect, the
        `POST` handler for the login form will have some different
        checks from that of the registration form:
        1.  If the database does not contain a user with the submitted
            username, add an error message and re-render.
        2.  If the submitted password does not match the encoded
            password attached to the username in the form, add an error
            message and re-render.
        3.  If the submission passes all of these checks, create a new
            user session.
6.  Handle logging out.
    1.  Still in `AuthenticationController`, create a `GET` handler
        method for a path to logout.
        1.  Invalidate the session data from the request object.
        2.  Redirect the user to the login form.

::: admonition
Tip

Now, clicking the *Logout* navbar link will result in a redirect to the
login page. You can also now create a brand new user through the link to
register as one, and confirm the object\'s existence in your `user`
table.
:::

## Filter Requests {#auth_studio_filter}

1.  Create an `AuthenticationFilter` class in the
    `javawebdevtechjobsauthentication` package.
    1.  Have this class inherit from `HandlerInterceptorAdapter`.
    2.  Add autowired instances of both `UserRepository` and
        `AuthenticationController`.
    3.  Add a `preHandle` method.
        1.  This must override the inherited method of the same name.
        2.  Grab the session information from the request object.
        3.  Query the the session data for a user.
        4.  If a user exists, return true. Otherwise, redirect to the
            login page and return false.
2.  Create a whitelist.
    1.  In the top of `AuthenticationFilter`, add a whitelist variable
        containing the paths that can be accessed without a user
        session.
    2.  Create a method next that checks a given path against the values
        in the whitelist.
    3.  Update `preHandle` with a call to this method.
        1.  Before looking for session and user status, add a
            conditional that checks the whitelist status of the current
            request object.
3.  Register the filter with Spring.
    1.  Create a class called `WebApplicationConfig` at the same level
        as `AuthenticationFilter` with the following:

        ``` {.java lineno-start="11"}
        @Configuration
        public class WebApplicationConfig implements WebMvcConfigurer {

           // Create spring-managed object to allow the app to access our filter
           @Bean
           public AuthenticationFilter authenticationFilter() {
              return new AuthenticationFilter();
           }

           // Register the filter with the Spring container
           @Override
           public void addInterceptors(InterceptorRegistry registry) {
              registry.addInterceptor( authenticationFilter() );
           }

        }
        ```

::: admonition
Tip

You\'ll know your filter setup works when you re-start your application
and attempt to get to `localhost:8080` but instead get redirected to
`/login`.

You\'ll also know that your filters are working if hitting your login
and and register forms now renders them without any styling. Bonus
points if you can determine why this is.
:::

That\'s it, that\'s all. You\'re done. Go forth and test the auth flow.
Then add this to any other Spring project you\'re working on!
