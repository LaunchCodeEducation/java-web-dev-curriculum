---
title: "Task 1: Connect a Database to a Spring App"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Sally Steuterman # update any time edits are made after review
lastEditorGitHub: gildedgardenia # update any time edits are made after review
lastMod: 2023-08-01 # UPDATE ANY TIME CHANGES ARE MADE
---

1. Start MySQL Workbench and create a new schema named `techjobs`.

{{% notice green Tip "rocket" %}}
Remember to double click on the schema name in the file tree to make it the default schema.
{{% /notice %}}

2. In the administration tab, create a new user, `techjobs` with the same settings as described in the lesson tutorial. This user should have the password `techjobs` as well.
3. Update `build.gradle` with the necessary dependencies. At this point, you should be able to run the tests. Run the tests in `TestTaskOne` to verify your gradle dependencies.
4. Update `src/resources/application.properties` with the correct info. This will include
`spring.datasource.url` set to the address of your database connection, as well as the username and password for a user you have create Refer to the tip below for the other properties you must add to complete your database setup.

{{% notice green Tip "rocket" %}}
<!-- TODO: Update below link to the coding events repo -->
You can double check your setup against what you've already done for <!-- [your coding events repo](https://education.launchcode.org/java-web-development/chapters/orm-part1/background.html#setup-orm-database) -->. You can copy these property assignments from your coding events repo, only needing to change the database address and username/password values.
{{% /notice %}}

{{% notice green Tip "rocket" %}}
If when starting your application, you encounter an error similar to

```bash
com.mysql.cj.exceptions.InvalidConnectionAttributeException: The server time zone value 'CDT' is unrecognized …
```

then add `?useLegacyDatetimeCode=false&serverTimezone=America/Chicago` to the end of your `spring.datasource.url` value.
{{% /notice %}}

### Test It with SQL

When your database is properly configured, you should have no compiler errors when starting the application. Execute `bootRun`
and check the compiler output to make sure this is the case. If everything runs, you will be able to view your app
locally in the browser at `http://localhost:8080` (unless of course you have changed the server port).

1. In your MySQL workbench, open a new query tab to check your database connection.
1. **SQL TASK:** At this point, you will have one table, `job`. In `queries.sql` under "Part 1", list the columns and their data types in the table as a SQL comment.

Your running application still has limited functionality. You won't yet be able to add a job with the *Add Job* form. You also
won't yet be able to view the list of jobs or search for jobs - but this is mostly because you have no job data. Move on to
[Part 2]({{< relref "../part-two/index.html" >}}) below to start adding these functionalities.