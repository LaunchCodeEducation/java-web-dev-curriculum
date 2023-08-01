---
title: "Task 3: Setting Up a One-to-Many Relationship"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 4
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

In this application, any one `Job` object is affiliated with one employer while one `Employer` may contain several jobs.

Now that you have set up persistence for the `Employer` and `Skill` classes, it is time to update the `Job` class
to make use of these. `Job` is already using the Spring Data framework to be persistent and now you'll update its
`Employer` field to create a one-to-many relationship. You'll also add a field on `Employer` to list the jobs associated
with each instance.

## Add a `jobs` Field to `Employer`

1. Within `Employer`, add a private property `jobs` of type `List<Job>` and initialize it to an empty `ArrayList`. After we set up the `Job` class to work with `Employer` objects, this list will represent the list of all items in a given job. We’ll do this in a bit.
1. Use the `@OneToMany` and `@JoinColumn` annotations on the jobs list in `Employer` to declare the relationship between data tables. Recall that this annotation needs a `name` parameter. What should its value be? 

## Update `Job` Model

1. Since the `Job` model class has `id` and `name` fields, it too can inherit from `AbstractEntity`. Update the class definition of `Job` to extend `AbstractEntity`. Remove the redundant fields from `Job`.
1. Replace the type of the field `employer` to be of type `Employer`. You will also need to refactor the affected constructor and getter and setter that use this field.
1. Add the `@ManyToOne` annotation on the field `employer`

## Updating `HomeController`

{{% notice red Warning "rocket" %}}
As above, there is a test in `TestTaskThree` that needs to be uncommented. There is only one, and it is near the end of the file. Do that now.

Open `TestTaskThree` in IntelliJ and find this test.

1. Select the entire commented-out method.
1. Uncomment the method by using `cmd+/` on Mac or `ctrl+/` on Windows.

If you do not uncomment this test, your code will not pass the autograder.
{{% /notice %}}

We’ll make several updates here. Similar to what you have done in Part 1, several of the methods in `HomeController` are
missing code because the class has not yet been *wired* with the data layer yet.

1. Add a field `employerRepository` annotated with `@Autowired`.
2. A user will select an employer when they create a job. Add the employer data from `employerRepository` into the form template. The add job form already includes an employer selection option. Be sure your variable name for the employer data matches that already used in `templates/add`.
3. Checkout `templates/add.html`. Make a mental note of the name of the variable being used to pass the selected employer id on form submission.
4. In `processAddJobForm`, add code inside of this method to select the employer object that has been chosen to be affiliated with the new job. You will need to select the employer using the request parameter you've added to the method.

{{% notice blue Note "rocket" %}}
An employer only needs to be found and set on the new job object if the form data is validated.
{{% /notice %}}

## Test It with SQL

You made a lot of changes! Great work.

Assuming you don’t have any compiler errors , start up your application. Don’t forget to start your SQL server. Make sure you can create a new job object from the *Add Jobs* form, selecting a pre-existing employer.

Then, make sure the data has been saved in your job table. You should see a column for `employer_id`, corresponding to the employer object selected for the new job.

You have changed the architecture of your job table. You will still be able to add a new entry that has an`employer_id` column but you'll note that job still has the now defunct `employer` column. You can keep your database clean by removing the job table. It will be recreated when you run the application again.

1. **SQL TASK:** In `queries.sql` under "Part 3", write the SQL statement to remove the job table.

The *List* and *Search* functionality still isn't quite fixed so to view a job in the application, make a note
of the job's id in the SQL table. Back in your browser, enter the path for `/view/{jobId}`.

When everything works, move on to [Part 4]({{< relref "../part-four/index.html" >}}) below.