---
title: "Task 2: Persisting Employers and Skills"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Sally Steuterman # update any time edits are made after review
lastEditorGitHub: gildedgardenia # update any time edits are made after review
lastMod: 2023-08-01 # UPDATE ANY TIME CHANGES ARE MADE
---

You will need to have completed the [setup steps]({{< relref "../part-one/index.html" >}}) before starting this
section.

### AbstractEntity

We've replaced the abstract class `JobField` with an even more abstracted class aptly named,
`AbstractEntity`. This class holds the fields and methods that are common across the `Job` class
and the classes it contains as fields.

1. We will be creating tables for the subclasses that inherit from `AbstractEntity` but not a table for this parent class. Therefore, give `AbstractEntity` the `@MappedSuperclass` annotation.
1. Since all of the subclasses of `AbstractEntity` will be entities themselves, add the `@Id` and `@GeneratedValue` annotations to the field `id`.
1. Each subclass will also inherit the `name` field from `AbstractEntity`. Add appropriate validation annotations so that:
    - a user cannot leave this field blank when creating an object.
    - there are reasonable limitations on the size of the name string. Keep in mind that the name field will be shared across `Job`, `Employer`, and `Skill` classes. Some employer names might be longer than 50 characters.

## Models

In the last assignment, a `Job` object contained string fields for employer and core competency data. This employer
and skill (formerly core competency) information about a particular job will now be stored in classes themselves.
These items themselves will hold their own supplementary information.

1. Open the `Employer` model class. In addition to the fields inherited from `AbstractEntity`, `Employer` should have a string field for `location`. Add the field for `location` with validation that ensures it is not empty and has a reasonable length. In addition, add public accessor methods to `Employer`.

{{% notice blue Note "rocket" %}}
For the purposes of this application, an employer can only have one location.
{{% /notice %}}

2. `Employer` is a class that will be mapped to one of our tables. Make sure the class has the `@Entity` annotation, as well as the no-arg constructor required for Hibernate to create an object.
3. In the model class `Skill`, add a field for a longer description of the skill, named `description`, with public accessor methods. Some hiring managers like to havemore information available about the nature of a given programming language or framework.
4. As with `Employer`, give this class the `@Entity` annotation and be sure it contains a no-arg constructor.

## Data Layer

To map the `Employer` and `Skill` classes to your `techjobs` database, you'll add data access interfaces for these relational
objects, similar to the existing `JobRepository` interface. Like `JobRepository`, make use of the Spring Data `CrudRepository` interface to map our objects.

1. In `models/data`, create a new interface `EmployerRepository`.
- `EmployerRepository` should extend `CrudRepository`.
- `EmployerRepository` should be annotated with `@Repository`.
2. Repeat the steps above for an interface, `SkillRepository`.

## Controllers

{{% notice red Warning "rocket" %}}
The tests in `TestTaskTwo` relating to the following tasks have been commented out because they depend on the code you wrote earlier. Open `TestTaskTwo` in IntelliJ and find these tests. For each one:
1. Select the entire commented-out method. These methods start around line 328. You may need to add `import` statements for some of the classes used in these methods.
2. Uncomment the method by using `cmd+/` on Mac or `ctrl+/` on Windows. If you do not uncomment these tests, your code will not pass the autograder. Uncommenting these methods will introduce some new errors related to a class named `SkillController`, but these will be fixed by the code you are about to write. If you like, you can leave these commented out until you get to that task.
{{% /notice %}}


With the employer repository in place, we will reference this to send object information through
the `EmployerController` handlers. `EmployerController` contains two handlers with missing
information. Your task here is to make use of the `EmployerRepository` class in these handlers.

1. Add a private field of `EmployerRepository` type called `employerRepository` to `EmployerController`. Give this field an `@Autowired` annotation.
2. Add an `index` method that responds at `/employers` with a list of all employers in the database. This method should use the template `employers/index`. To figure out the name of the model attribute you should use to pass employers into the view, review this template.
3. `processAddEmployerForm` already takes care of sending the form back if any of the submitted employer object information is invalid. However, it doesn't yet contain the code to save a valid object. Use `employerRepository` and the appropriate method to do so.
4. `displayViewEmployer` will be in charge of rendering a page to view the contents of an individual employer object. It will make use of that employer object's `id` field to grab the correct information from `employerRepository`. `optEmployer` is currently initialized to `null`. Replace this using the `.findById()` method with the right argument to look for the given employer object from the data layer.

{{% notice green Tip "rocket" %}}
The variable holding the id you want to query for is already provided for you in the controller method's parameters.
{{% /notice %}}

5. Create a `SkillController` class and replicate the steps you followed above for `EmployerController`. The new controller should have the methods, `index`, `displayAddSkillForm`, `processAddSkillForm`, and `displayViewSkill`. These methods should behave exactly as the corresponding methods in `EmployerController`. The relevant templates have already been created for you.

At this point, uncomment all remaining methods in `TestTaskTwo`, if you have not done so already. You'll need to add an `import` statement for the new controller to the test file.

## Test It with SQL

The employer and skill view templates for adding and viewing these objects are made for you. Before you move on,
test your application now to make sure it runs as expected. You should be able to create Employer and Skill objects
and view them.

1. Start up your application – don’t forget to have your SQL server running – and go to the `Add Jobs` view from the application's navigation menu.
2. You won't be able to add a job yet, but you'll see a link to `Add Employers` and `Add Skills` in the form. Click them and proceed to check the functionality of the forms that follow.
3. Be sure to test your validation requirements and error handling.

4. **SQL TASK:** In `queries.sql` under "Part 2", write a query to list the names of the employers in St. Louis City. Do NOT specify an ordering for the query results. 

{{% notice green Tip "rocket" %}}
If everything seems to work – that is, you are able to submit the form without any errors – but you don’t see your employers or skills in the list after submission, here’s what you should check:
1. Is there any data in the `employers` and `skills` table? Check by going to MySQL Workbench and looking for the employer/skill data within your schema.
2. If there’s data in the database, check that you are correctly querying for the list of all objects in the controller Are you calling `.findAll()` on the repository?
3. Ensure you’re passing the list into the view, and it is named the same as the variable in the ThymeLeaf template.

When everything works, move on to Part 3 below.
{{% /notice %}}

Throughout your work, refer to the [demo app](https://techjobs-persistent.launchcodetechnicaltraining.org/) as needed.