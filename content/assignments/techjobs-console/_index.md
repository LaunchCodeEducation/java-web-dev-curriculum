---
title: "Assignment #1: Tech Jobs Console"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: colinbrock # update any time edits are made after review
lastEditorGitHub: colinbrock # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Introduction

Congratulations! Based on your hard work and strong coding skills, you have
been brought on as an apprentice to the LaunchCode Tech Team. You will be
paired with a mentor to help you get comfortable and continue learning.

The Company Team at LaunchCode works with employer partners to match qualified
programmers with apprenticeships. They asked for a new tool to be built to
help them easily manage data for currently available jobs. Over the next few
weeks, you will help them build this application alongside mentors from the
Tech Team.

This first project will be a simple proof-of-concept prototype. It won't be
pretty or have lots of features, but it will give you a chance to work through
some initial concepts and get feedback from LaunchCode staff.

Your mentor on this project is Blake.

{{< rawhtml >}}
   <img src="pictures/LC-Blake.png" alt="LaunchCode Mentor Blake" width=20% />
{{< /rawhtml >}}

## Learning Objectives

In this project, you will show that you can:

1. Read and understand code written by others.
2. Use core Java syntax (methods, variables, loops, conditionals).
3. Utilize `ArrayList` and `HashMap` collection types.
4. Work with console I/O via the `Scanner` class.
5. Work with data types and arrays.

## TechJobs (Console Edition)

The app you must help design is a simple console (i.e. command-line) prototype
of the new TechJobs app. It will allow LaunchCode staff to browse and search
listings of open jobs by employer partners.

The prototype process gives everybody a chance to work out some initial ideas
without investing a ton of time into developing a finished product. Once
everybody likes the prototype, the Tech Team will begin work toward a
full-fledged application.

## Your Assignment

Blake created a console application and started to fill in some features. His
code allows users to search job listings by one of several fields. It can also
display lists of all of the values of a given field in the system (e.g. all
employers, or all locations).

Blake has now handed the task off to you. You must add a couple of features and
then get feedback from the Company Team.

After you work through the tasks Blake has laid out for you, tackle one
or more of the [bonus missions]({{% relref "./submission/#bonus-missions" %}}).

## Getting Started

{{% notice blue Note "rocket" %}}
You may need to enable actions within your github repository if you have not done so already. Please refer back to the instructions on how to do so in the [Running the Autograding Tests through Github Actions]({{% relref "../hello-world/#running-the-autograding-tests-through-github-actions" %}}) section of `Assignment 0` 
{{% /notice %}}

The starter code for this project is in [this github repository](https://github.com/LaunchCodeEducation/techjobs-console-java-graded-17). Fork the repository to your personal profile, copy the repo’s URL for cloning, and open up IntelliJ. and then set up the project in IntelliJ. Refer back to the setup instructions from [assignment 0]({{% relref "../hello-world/#getting-started" %}}) for more details. 

Before diving in and starting to code, make sure you understand what the code
you've been given does. Since you're starting with a functioning---albeit
unfinished---program, go ahead and run it to get an idea of how it works. To do
this, right-click on the `main` method in the `TechJobs` class and select
*Run TechJobs.main()*.


{{% notice red Warning "rocket" %}}
The application will run until you force it to quit, re-prompting time after time. To kill it, press the red "stop" icon in the Run pane *or* enter `x` from the initial prompt. We'll learn precisely how the program manages to work this way below.

Let's explore the code by starting with the source of the data our program is
providing access to.
{{% /notice %}}

