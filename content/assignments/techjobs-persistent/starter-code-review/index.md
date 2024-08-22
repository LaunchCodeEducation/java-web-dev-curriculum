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

[](../../hello-world/_index.md#getting-started)
## Checkout and Review the Starter Code

Set up a local copy of the project:

1. In Canvas, find **Graded Assignment #4: TechJobs (Persistent Edition)** and click on the starter code repo link. Fork the repository to your personal profile, copy the repo's URL for cloning, and open up IntelliJ. Refer back to the instructions from [assignment0]({{% relref "../../hello-world/_index.md#getting-started" %}}) for more details.
1. Launch the application (via the Gradle pane, *Tasks > Application > bootRun*) to make sure it starts up properly. Then shut it down.
<!-- TODO: Link below will need to be updated once assignment 2 is in the book -->
1. The tests for this assignment are set up the same way as for [Tech Jobs OO]({{% relref "../../techjobs-oo/_index.md" %}}).

You won't be able to run your application or the tests yet. If you try to do so, you'll see a host of errors relating to the
Spring Data annotations and classes. Some of these have already been used in the code, but the dependency that includes them has not yet been declared. That will be one of your tasks. You'll need to complete [Part 1]({{% relref "../part-one/index.html" %}}) before you can run the application and view it in a browser.

That said, it's a good idea to scan the classes and templates even before you're able to execute
`bootRun`. Take a gander at the `Job` class. It will look somewhat similar to the model in [Tech Jobs (MVC Edition)]({{% relref "../../techjobs-mvc/_index.md" %}}), with a few key differences.

You're no longer using a csv file to load job data, instead, we'll be creating new Job objects via a
user form. The Job data will be stored in a MySQL database that you'll setup in [Part 1]({{% relref "../part-one/index.html" %}}) of this assignment.

As you explore
the starter code, you'll notice that the `JobField` abstract class is no longer present. Your task for
[Part 2]({{% relref "../part-two/index.html" %}}) is to complete the work to persist some of the classes.
You'll do this for `Employer` and `Skill` classes, as well as `Job`.

The `Job` class will also look different from how you have last seen it. In [Part 3]({{% relref "../part-three/index.html" %}}) and [Part 4]({{% relref "../part-four/index.html" %}}), you'll add object relational mapping on the `Job` class by refactoring the `employer` and `skills` (formerly `coreCompetency`)
fields.

In your IntelliJ project, you'll see an empty file in the root directory called `queries.sql`. After completing the
Java updates for parts 1, 2, 3, and 4, we ask you to test your application updates with SQL statements.

Since you are entering your own data, the queries we ask you to write will return unique result sets. For example, if you haven't entered
any data yet, there may be an empty result set. However, as the architect of the database, you have the knowledge to write the
appropriate queries nonetheless.

