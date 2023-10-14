---
title: "Task 2: Complete List Views"
date: 2023-05-22T10:20:54-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-09-23T10:03:01-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

## Complete the List Views

Open the `list-jobs.html` template. Currently, the page just establishes the
navigation bar and page title. You need to add code that will present relevant
job information.

### Display List of Jobs

This page needs to show full job listings---ID, employer, location, etc.

1. In `list-jobs.html`, create a loop to display each job passed in from the
   controller. The job data should be presented in *tables*, with each job in its own table. Be sure to check in `ListController` to find the variable names available to the template.
1. Adding the CSS class `"job-listing"` to a table provides some nice
   styling, courtesy of Carly’s work!
1. Construct a table for each job, with
   one job field per row, referring to the demo app if you need a visual on how to display the job listings.
1. Be sure to test your code by running the program and clicking links from
   different categories on the `/list` page.

   a. Clicking the *Web - Back End* link yields 6 jobs.
   b. *iOS* yields 4 jobs.
   c. *New York* yields 1 job.
   d. Etc.

### Add `View All` Link

Open the `list.html` template. This file builds the table to display all of
the links for the different `Job` fields. However, the link for the `All`
column is missing.

You can fix this several different ways, but two options are presented below.
Note that you only need to implement ONE option, not both.

1. Modify `tableChoices` in `ListController` to include another key/value
   pair. Check the method that renders the template to help identify the name
   to use for the key.
1. Modify `list.html` to fill in the empty table cell with the necessary
   link. Check `ListController` to help identify the data to pass in for the
   query parameters.

Be sure to test your code by clicking your new *View All* link in the table.
There are 98 jobs in the data file.