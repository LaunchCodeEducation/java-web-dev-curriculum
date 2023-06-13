---
title: "Submitting Your Work and Bonus Missions"
date: 2023-05-22T10:20:54-05:00
draft: false
weight: 5
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Sanity Check

At this point, all autograding tests should be passing. To be sure, right-click on the `org.launchcode.techjobs.mvc` package in `src/test/java` and select *Run tests in...* If any test fails, evaluate the failure/error message and go back to fix your code.

You might also want to check your app's behavior against that of [our demo app](https://java-techjobs-mvc.launchcodetechnicaltraining.org/).

## How to Submit

To turn in your assignment and get credit, follow the [submission instructions]({{< relref "../../hello-world/#submitting-your-work-on-canvas" >}}).

## Bonus Missions

Here are some additional challenges, for those willing to take them on:

1. When we select a given field to search within and then submit, our choice is
   forgotten and returns to "All" by default. Modify the view template to keep
   the previous search field selected when displaying the results.
1. In the tables displaying the full job data, find a way to manipulate the
   font, style, capitalization, etc. to further distinguish the labels from the
   data (e.g. **Employer:** *LaunchCode*). (*Hint:* We capitalize the title
   string in multiple templates, so have a look around).
1. In the tables of the job results, make each value (except `name`)
   hyperlinked to a new listing of all jobs with that same value. For example,
   if we have a list of jobs with the `JavaScript` skill, clicking on a
   location value like `Saint Louis` will generate a new list with all the
   jobs available in that city.

### Super Bonus Mission

This is a big one! Prepare for a challenge!

Notice that we went to the trouble of passing in the ``actionChoices``
HashMap to the view in the ``HomeController.index`` method. This puts the
responsibility of which actions should be presented on the controller, and not
the view. However, we didn’t go to such lengths for the navigation links
displayed on every page of the site.

In order to make the navigation links similarly detached, we’d need to pass
`actionChoices` in to *every* view, since the nav links are generated in
`fragments.html`. We’d have to do something like the line below in every
handler method, which would be a pain, not to mention error-prone and difficult
to update.

```java
   model.addAttribute("actions", actionChoices);
```

Let’s fix this.

1. Make a new controller, `TechJobsController`. This new controller should
   have a static HashMap, `actionChoices`. The HashMap should be populated
   via a no-argument constructor, just like `columnChoices` is
   populated in `ListController`. You do NOT need to add the `@Controller`
   annotation to this class.
1. Write a static method `getActionChoices` in `TechJobsController` that
   returns the `actions` HashMap.
1. Add the annotation `@ModelAttribute("actions")` to this method. This
   annotation will cause the return value of the method to be set in the model
   with key `"actions"` for every controller that extends
   `TechJobsController`.
1. Modify every one of your other controllers to extend `TechJobsController`.
1. Modify `fragments.html` to use the passed-in action choices to generate
   the navigation links.
1. Finally, update your code so that `columnChoices` also lives in
   `TechJobsController`.