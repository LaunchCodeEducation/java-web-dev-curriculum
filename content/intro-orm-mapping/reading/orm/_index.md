---
title: "Object-Relational Mapping"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 1
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Sally Steuterman # to be set by the page reviewer
reviewerGitHub: gildedgardenia # to be set by the page reviewer
lastEditor:  # update any time edits are made after review
lastEditorGitHub:  # update any time edits are made after review
lastMod: 2023-30-06T10:28:27-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

With all that we have learned about MVC applications and relational databases, we are ready to connect the two and add persistent data storage to our apps!
To do so, we need to use *object-relational mapping*.

**Object-Relational Mapping** or **ORM** is a technique for converting data between Java objects and relational databases.
ORM converts data between two incompatible type systems (Java and MySQL), such that each model class becomes a table in our database and each instance a row of the table.

{{% notice blue Example "rocket" %}}
Let's say we have a Java class called `ContactInfo`. `ContactInfo` has three fields: an integer `id`, a string `name`, and a string `email`.
Now we want to store this information in a MySQL database.
We can use ORM so that the database of our application has a table to contain all objects instantiated from the `ContactInfo` class.
The table called `contactinfo` has three columns: an integer `id`, a varchar `name`, and a varchar `email`.

Now, let's instantiate a Java object:

```java
public ContactInfo frank = new ContactInfo(3,"Frank","frank@email.com"); 
```

Having properly set up our application, we can add Frank's info to our `contactinfo` table.
While we will write the code to add Frank's info to our database in Java, the frameworks and APIs that make ORM happen will run the following MySQL query for us.

```mysql
INSERT INTO contactinfo (id,name,email)
VALUES (3,"Frank","frank@email.com");
```
   
Now Frank's info is safely stored in our MySQL database in the `contactinfo` table!
{{% /notice %}}

At the most basic level, we need two components to make ORM work in our Java applications: an API and an object-relational mapper.
The API will set the standards by which the **object-relational mapper** will convert between Java and MySQL.
In the example above, the API reads through our Java code and designates a class that will be turned into a table.
The mapper will then read through the class and create the following MySQL query to make the `contactinfo` table.

```mysql
CREATE TABLE contactinfo (
   INT id,
   VARCHAR(255) name,
   VARCHAR(255) email
);
```

In Java, this API is called a **JPA** or **Java Persistence API**.
JPAs makes use of **data layers**.
When we learned about models, we learned that [data layers]({{% relref "../../../models-and-model-binding/reading/models-and-data/_index.md" %}}) add abstraction between models and the data we want to store.
Models are NOT persistent data stores and relational databases do NOT shape the Java objects we will be using.
We want to make sure that the two remain separate.

## ORM in Spring

In Spring, our JPA is called the **Spring Data JPA**. If you look up JPA on the internet, you will find many different examples!
While JPAs follow the same set of standards, different frameworks have different JPAs that work within their specific framework.
The object-relational mapper we will be using with the Spring Data JPA is **Hibernate**. 
As you run your apps, you will notice Hibernate and JPA pop up in the logs!
To run your apps, you need to connect MySQL to a Spring application. Let's do this with `codingevents`!

## Setting up a Persistent Database - Video

The following video explains how we can add a MySQL database to our `codingevents` application. 
The accompanying text is a quick rundown of what happens in the video. To get started, create a branch off of your [enums](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/enums) branch.

{{< youtube GVOpKW3NcMk >}}
	
{{% notice blue Note "rocket" %}}
The starter code for this video is found at the [enums branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/enums) of the `coding-events-demo` repo. 
The final code presented in this video is found on the [db-config branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/db-config). As always, code along to the videos on your own `codingevents` project.
{{% /notice %}}

## Setting up a Persistent Database - Text

To get started with using a relational database with our MVC applications, we need to first go to MySQL Workbench.

In MySQL Workbench, you need to do the following:

1. Create a new schema, `codingevents`.

{{% notice blue Note "rocket" %}}
In the video, Chris names his schema `coding_events`. Either name works just fine, as long as you are 
consistent within your own application.
{{% /notice %}}
   
2. Add a new user with a new password. Give the user all privileges to modify your new schema. 


In IntelliJ, attach MySQL to your project in `application.properties`.

```console
# Database connection settings
spring.datasource.url=jdbc:mysql://localhost:3306/coding-events
spring.datasource.username=user
spring.datasource.password=greatpassword

# Specify the DBMS
spring.jpa.database = MYSQL

# Show or not log for each sql query
spring.jpa.show-sql = false

# Hibernate ddl auto (create, create-drop, update)
spring.jpa.hibernate.ddl-auto = update

# Use spring.jpa.properties.* for Hibernate native properties (the prefix is
# stripped before adding them to the entity manager)
spring.jpa.properties.hibernate.dialect = org.hibernate.dialect.MySQL8Dialect
```

Set the value of `username` and `password` to the username and password you set up in MySQL Workbench.

In the `dependencies` of `build.gradle`, add MySQL and the Spring Data JPA, like so:

```groovy
implementation 'org.springframework.boot:spring-boot-starter-data-jpa'
implementation 'mysql:mysql-connector-java:8.0.32'
```

Once you have taken these steps, you are ready to set up the appropriate models and controllers for the application!

### Key Takeaways

Before we can get into the ins and outs of using ORM, we need to make sure that our application has a corresponding database and that our application is ready to connect to MySQL.
We can start to do this by creating new schemas and setting user privileges in MySQL Workbench.
We also *must* make sure that the Spring application has the correct dependencies, username, and password to access the schema.

If we do not do these steps, then our application will not be able to use a persistent data source.

As Chris noted in our video, while we can simply set the value of `spring.datasource.username` and `spring.datasource.password` to the value of the username and password, this is NOT best practice. We regularly commit our code to Github, meaning anyone who reads the code in our repository can see the username and password. While you can do it for the applications in this class, you do not want to do it in the future.

To avoid this in the future, you can configure your `application.properties` file to use **environment variables**.
You then hide the appropriate info by setting the environment variable's value equal to the password, for example.

We have written an [article](https://education.launchcode.org/gis-devops/configurations/02-environment-variables-intellij/index.html) on how to configure your environment variables to keep the username and password to your database safe and secure.

## Check Your Understanding

{{% notice green Question "rocket" %}}
True or false: writing usernames and passwords in plain text in a file is a GREAT idea!

<!-- Solution" .. ans: False -->
{{% /notice %}}

{{% notice green Question "rocket" %}}
True or false: an ORM converts data between Java objects and relational databases.

<!-- Solution: .. ans: True -->
{{% /notice %}}

{{% notice green Question "rocket" %}}
True or false: We need Hibernate AND Spring Data to successfully use ORM.

<!-- Solution: .. ans: True -->
{{% /notice %}}
