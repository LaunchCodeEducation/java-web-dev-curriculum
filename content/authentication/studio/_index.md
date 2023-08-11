---
title: "Studio: TechJobs Authentication"
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

For this studio, you'll be tasked with adding simple user authentication to your 
`techjobs` application. The steps to do this will match what you have already done 
in `codingevents`. You should refer back to the tutorial starting 
[here]({{< relref "../reading/creating-user-model/_index.md/#a-user-model" >}}).

1. [Create the User Model]({{< relref "#create-the-user-model" >}})
1. [Create the Login and Registration Forms]({{< relref "#create-the-login-and-registration-forms" >}})
1. [Filter Requests]({{< relref "#filter-requests" >}})

## The Starter Code

1. Fork and clone the starter code for [TechJobs (Auth Edition)](https://github.com/LaunchCodeEducation/TechjobsAuthenticationJava).

1. The dependencies for the database connection and hashing function 
   are already added for you in `build.gradle`. You will need to 
   do some work to ensure that the schema, user, and database password 
   match your own local MySQL setup.

   1. Open `application.properties` and view the first three statements:

   ```console
   # Database connection settings
   spring.datasource.url=jdbc:mysql://localhost:3306/techjobs?useLegacyDatetimeCode=false&verifyServerCertificate=false&useSSL=false&requireSSL=false&allowPublicKeyRetrieval=true&serverTimezone=America/Chicago

   spring.datasource.username=techjobs
   spring.datasource.password=techjobs
   ```

   1. You likely do not already have a schema named `techjobs_auth` or this combination of username and password so you must create them.

<!-- TODO: Update Links below when content is added to book -->
   <!-- {{% notice green Tip "rocket" %}}
   To create a new schema in your current connection, refer back to the instructions in `SQL Part 1 Exercises <https://education.launchcode.org/SQL/chapters/mysql-part-1/exercises.html>`_.

   To create a new user with permissions, refresh your memory
   in :ref:`setup-orm-database`.
   {{% /notice %}} -->
      


{{% notice blue Note "rocket" %}}
We've greatly reduced the functionality of the app so you can focus
on the work to set up authentication. Running the application now 
gives you a familiar-looking navbar with two menu options, *Add Jobs* and *Logout*.
You can add jobs right away and an astute observer of the starter code and
schema tables will notice that the fields on `Job` are only strings, not
complex objects. Logout functionality is not yet implemented, but you'll get there by the end of 
this studio.
{{% /notice %}}

## Create the User Model

1. In the project you have cloned, create a `User` model identical to that in `codingevents`. The class needs:

   1. To be an entity.
   1. To have username and encrypted password fields.
   1. To have appropriate constructors, getters, setters.

1. Encode the `User` password field.

   1. Add a static `BCryptPasswordEncoder` variable.
   1. Update the constructor that has arguments to encode the password field.
   1. Add a method to check password values.

1. Create a `UserRepository`.

   1. Add the special query method to find a user by username.

{{% notice green Tip "rocket" %}}
At this point, re-starting your application will not change the view
at `localhost:8080`, but you can confirm you have done everything correctly if you see a `user` 
table in MySQL Workbench. 
{{% /notice %}}

## Create the Login and Registration Forms

1. Create an `AuthenticationController`.

   1. Include an autowired `UserRepository`.

1. Add session handling utilities. This includes:

   1. A static final variable for the session key.
   1. A method to get the user information from the session.
   1. A method to set the user in the session.

1. Create two DTOs for the user registration and login forms in a new package, `dto` under `models`.

   1. Create a login form DTO with username and password fields.
   1. Create a register form DTO with the fields above and a field to verify a password.

1. Handle the registration data.

   1. Add a `GET` handler in `AuthenticationController` to display a registration form.
   1. Create a register template with form fields corresponding to the register DTO.
   1. Create a `POST` handler in `AuthenticationController` to process the form.

      1. If the form has validation errors, re-render the registration form with a useful message.
      1. If the username is already tied to a user, add a fitting error message and re-render the form.
      1. If the two form fields for passwords do not match, add an error message and re-render the form.
      1. If none of the above conditions are met, 
      
         - Create a new user with the form data, 
         - Save the user to the database, 
         - Create a new user session,
         - Redirect to the home page.

1. Handle the login data.

   1. Repeat steps 1 + 2 for handling the registration data, this time with the login information.
   1. Apart from model validation checks and the final redirect, the `POST` handler for the login form will 
      have some different checks from that of the registration form:

      1. If the database does not contain a user with the submitted username, add an error message and re-render.
      1. If the submitted password does not match the encoded password attached to the username in the form, 
         add an error message and re-render.
      1. If the submission passes all of these checks, create a new user session.

1. Handle logging out.

   1. Still in `AuthenticationController`, create a `GET` handler method for a path to logout.

      1. Invalidate the session data from the request object.
      1. Redirect the user to the login form.

{{% notice green Tip "rocket" %}}
Now, clicking the *Logout* navbar link will result in a redirect to the login page. You can also now create 
a brand new user through the link to register as one, and confirm the object's existence in your `user`
table.
{{% /notice %}}

## Filter Requests

1. Create an `AuthenticationFilter` class in the `techjobsauth` package.

   1. Have this class implement the `HandlerInterceptor`.
   1. Add autowired instances of both `UserRepository` and `AuthenticationController`.
   1. Add a `preHandle` method.

      1. This must override the inherited method of the same name.
      1. Grab the session information from the request object.
      1. Query the the session data for a user.
      1. If a user exists, return true. Otherwise, redirect to the login page and return false.

1. Create a whitelist.

   1. In the top of `AuthenticationFilter`, add a whitelist variable containing the paths that can be 
      accessed without a user session.
   1. Create a method next that checks a given path against the values in the whitelist. 
   1. Update `preHandle` with a call to this method.

      1. Before looking for session and user status, add a conditional that checks the whitelist status 
         of the current request object.

1. Register the filter with Spring.

   1. Create a class called `WebApplicationConfig` at the same 
      level as `AuthenticationFilter` with the following:

      ```java {linenos=table}
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

{{% notice green Tip "rocket" %}}
You'll know your filter setup works when you re-start your application and attempt to get to 
`localhost:8080` but instead get redirected to `/login`.

You'll also know that your filters are working if hitting your login and and register forms now renders
them without any styling. Bonus points if you can determine why this is.
{{% /notice %}}

That's it, that's all. You're done. Go forth and test the auth flow. 
Then add this to any other Spring project you're working on!