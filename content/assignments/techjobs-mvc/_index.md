---
title: "Assignment #3: Tech Jobs (MVC Edition)"
date: 2023-05-22T10:20:54-05:00
draft: false
weight: 4
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Introduction

Your first two tasks as an apprentice went well! You, Blake, and Sally built
the TechJobs console prototype and then refactored the code to move it to an
object-oriented format.

After demonstrating the prototype for the Company Team at LaunchCode, it
received the green light to be fully built out as a web application.

The first step in this process will be to quickly develop a [minimum viable
product](https://en.wikipedia.org/wiki/Minimum_viable_product), or MVP. The
goal is to get a functioning web app up and running with as little work as
possible. That way, additional feedback and testing can be done early in the
development process. After that, additional behind-the-scenes work will be
carried out to fully develop the model and data side of the application.

For this next step in the project, you’ll be working with Carly.

{{< rawhtml >}}
   <img src="figures/LC-Carly.png" alt="LaunchCode Mentor Carly" width=20% />
{{< /rawhtml >}}

Carly was once a LaunchCode apprentice as well, so she knows just what
it’s like to be in your shoes. She’s done some initial work on the
project and left you some `TODO` tasks that she knows you can handle.

## Learning Objectives

In this project, you’ll show that you can:

1. Read and understand code written by others.
1. Work within the controller and view portions of a Spring Boot application.
1. Use Thymeleaf syntax to display data within a view.
1. Create new handler methods to process form submission.

## TechJobs (MVC Edition)

You’ll start with some code that Carly has provided. The idea behind your
current assignment is to quickly deliver a functioning Spring Boot application,
so you’ll focus on the controllers and views.

In order to do this, you’ll be reusing the `JobData` class and
`job_data.csv` file from the console app. You will eventually have to go back
and rewrite the data portion of the application to make a true, database-backed
model. However, using the existing `JobData` class to provide some basic data
functionality lets you focus on the views and controllers for now.

## Your Assignment

The list below provides a general overview of your assigned tasks. Specific
details for each part appear in the following sections, so be sure to read them
carefully as you solve each problem.

1. Review Carly’s code in the `JobData` file as well as in the existing
   controllers and views.
1. As her next step, Carly created two basic templates to show lists of jobs
   for each field of the data (`employer`, `location`, etc.). You will need
   to add some details to these views to allow users to select and display jobs
   stored in the system.
1. Carly started working on the search feature, but only got as far as
   writing the code to display the search form. She’s handed the project to you
   to finish the rest. First, you'll create a controller method to retrieve search results.
1. Finally, you'll display search results in the view. 

Throughout your work, refer to our [demo app](https://java-techjobs-mvc.launchcodetechnicaltraining.org/) as needed to clarify questions about intended application behavior.

### Assignment Links

{{% children %}}



