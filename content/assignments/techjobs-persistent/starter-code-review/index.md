---
title: "Review the Starter Code"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 1
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Checkout and Review the Starter Code

Set up a local copy of the project:

1. In Canvas, **Graded Assignment #4: TechJobs (Persistent Edition)** contains a GitHub Classroom assignment invitation link and then set up the project in IntelliJ. Refer back to the GitHub Classroom instructions from [assignment0](https://education.launchcode.org/java-web-dev-curriculun/assignments/hello-world/index.html) for details. 
1. Launch the application (via the Gradle pane, *Tasks > Application > bootRun*) to make sure it starts up properly. Then shut it down.
<!-- TODO: Link below will need to be updated once assignment 2 is in the book -->
1. The tests for this assignment are set up the same way as for [assignment 2](https://education.launchcode.org/java-web-development/assignments/tech-jobs-oo.html#assignment-2-autograding).

You won't be able to run your application or the tests yet. If you try to do so, you'll see a host of errors relating to the
Spring Data annotations and classes. Some of these have already been used in the code, but the dependency that includes them has not yet been declared. That will be one of your tasks. You'll need to complete [Part1](https://education.launchcode.org/java-web-dev-curriculum/assignments/techjobs-persistent/part-one/#connect-a-database-to-a-spring-app) before you can
run the application and view it in a browser.

That said, it's a good idea to scan the classes and templates even before you're able to execute
`bootRun`. Take a gander at the `Job` class. It will look somewhat similar to the model in
[Tech Jobs (MVC Edition)](https://education.launchcode.org/java-web-development/assignments/tech-jobs-mvc.html#tech-jobs-mvc), with a few key differences.

You're no longer using a csv file to load job data, instead, we'll be creating new Job objects via a
user form. The Job data will be stored in a MySQL database that you'll setup in [Part 1](http://education.launchcode.org/java-web-dev-curriculum/assignments/techjobs-persistent/part-one/#connect-a-database-to-a-spring-app) of this assignment.

As you explore
the starter code, you'll notice that the `JobField` abstract class is no longer present. Your task for
[Part 2](https://education.launchcode.org/java-web-dev-curriculum/assignments/techjobs-persistent/part-two/#persisting-employers-and-skills) is to complete the work to persist some of the classes.
You'll do this for `Employer` and `Skill` classes, as well as `Job`.

The `Job` class will also look different from how you have last seen it. In Parts 3 and 4, you'll
add object relational mapping on the `Job` class by refactoring the `employer` and `skills` (formerly `coreCompetency`)
fields.

In your IntelliJ project, you'll see an empty file in the root directory called `queries.sql`. After completing the
Java updates for parts 1, 2, 3, and 4, we ask you to test your application updates with SQL statements.

Since you are entering your own data, the queries we ask you to write will return unique result sets. For example, if you haven't entered
any data yet, there may be an empty result set. However, as the architect of the database, you have the knowledge to write the
appropriate queries nonetheless.

