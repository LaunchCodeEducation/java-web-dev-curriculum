---
title: "Gradle"
date: 2023-07-12T10:22:37-05:00
draft: false
weight: 1
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-09-24T09:41:55-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

By now you have created at least two Spring projects using Gradle. If you recall, Spring is the framework that will enable us to create an MVC application. When we created each project, we selected "Gradle Project", but what is Gradle?

Gradle is an **automated build tool** that handles tasks like:

1. Managing dependencies
1. Testing protocols
1. Packaging the executable program for deployment.

So far we have included Gradle in our Spring Boot projects.  

{{% notice blue "Note" "rocket" %}}

   You can also import Gradle using the terminal. 
   Instruction on that is beyond the scope of this class.
   Here is [documentation](https://docs.gradle.org/current/userguide/part1_gradle_init.html) on this process if you are curious.

{{% /notice %}}

## How Gradle Works

A Gradle build represents one or more **projects**. Projects are created from a series of **tasks**. Gradle manages tasks based on their function in the build. Some tasks run tests, some compile, etc. Gradle organizes these tasks in the `build.gradle` file. 

### `build.gradle`

The `build.gradle` file is the project build script. Gradle will refer to this file as it runs through the task list to build the application. You can code tasks into this file or you can import tasks into this file.

If we are using external tasks, we use methods to group tasks by functionality in this file. Tasks call the methods to execute a task or series of tasks to build the project. You are also allowed code directly in the build file, but this is more common if you are creating a Gradle project from scratch.
 
{{% notice blue "Note" "rocket" %}}
   
   Spring Boot populated this file as it initialized your `hello-spring` build. 
   
   Open your `build.gradle` file and look at each section.

{{% /notice %}}

#### `tasks` and `plugins`

As stated earlier, Gradle builds a project by running tasks. These tasks are kept in a task method that calls them when needed. The task method is where you create tasks.   

{{% notice blue "Note" "rocket" %}}
   
  `hello-spring` has a task method that runs a test.

{{% /notice %}}

Often you will import tasks from an external resource as **plugins**. Plugins contain any necessary tasks and scripts to extend a project’s capabilities. Plugins often need **dependencies** and external **repositories**.  

{{% notice blue "Note" "rocket" %}}

   Your Spring Boot framework projects contain plugins.

{{% /notice %}}

#### `dependencies`

`dependencies` are external code libraries used by tasks to build your project. Gradle often groups related dependencies together in `configurations`. In the `dependencies` method, the configuration name proceeds the dependency information.

{{% notice blue "Note" "rocket" %}}

   Your `hello-spring` project has three dependencies. 
   Note that each dependency has its own configuration name, such as `implementation` or `developmentOnly`.

{{% /notice %}}

#### `configurations`

Some projects contain a stand-alone `configurations` method. This method bundles dependencies together based on their role in the build. Dependency configurations can extend from one another, reducing redundancies within your code.
   
{{% notice blue "Note" "rocket" %}}

   None of the `build.gradle` files in projects up to this point contained a configurations method.  The upcoming studio `Spa Day!` will.

{{% /notice %}}

#### `repositories`

Where do we get the source code if dependencies are external libraries? It comes from an external repository site, such as Maven Central. Maven Central is a repository website that contains files for dependencies. This is not the only external repository.  Other repositories work the same as Maven Central. In the `build.gradle` file we link up with Maven Central by using the `repositories` method.

{{% notice blue "Note" "rocket" %}}

   You will see repositories in your Spring Boot projects.

{{% /notice %}}

## Troubleshooting Tips

### My dependencies won't build

We are using IntelliJ as our IDE to build our Gradle projects for this class. 
IntelliJ’s built-in IntelliSense should prompt you to refresh your build.gradle whenever 
you change a file. You should see a small icon appear in the top right corner of the `build.gradle` file. 
If you click on the icon, it will refresh your build.
If you update `build.gradle` and the icon does not appear, you can manually refresh the build. 
**Mac Users** try *Shift + Command + I* and **Windows/Linux Users** try *Control + Shift + O*.

For more on Gradle and IntelliJ, visit this [website](https://www.jetbrains.com/idea/guide/tutorials/working-with-gradle/gradle-dependencies/).

### I've refreshed, but my dependencies still won't build

Read IntelliJ's  documentation on [Maven.Importing](https://www.jetbrains.com/help/idea/maven-importing.html). 

## Check Your Understanding

{{% notice green "Question" "rocket" %}}

   From where do `dependencies` access their source code?
   1. An external repository such as Maven Central
   1. Internal code within a Class you created

{{% /notice %}}

<!-- 1, an external repository such as Maven Central -->