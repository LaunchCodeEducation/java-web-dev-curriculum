---
title: "Task 1: Implement printJobs()"
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

When trying out the program, and later when reading the code, you
hopefully noticed that there's some work to do in the `printJobs`
method. As it stands, it currently just prints a message:
`"printJobs is not implemented yet"`.

Complete this method. It should print out jobs *in this precise format*:

```bash
*****
position type: Data Scientist / Business Intelligence
name: Sr. IT Analyst (Data/BI)
employer: Bull Moose Industries
location: Saint Louis
core competency: Statistical Analysis
*****

*****
position type: Web - Back End
name: Ruby specialist
employer: LaunchCode
location: Saint Louis
core competency: Javascript
*****
```

For the autograding script to correctly grade your code, you'll need to match this format *exactly*. In particular, note the number of asterisks surrounding each listing, and the blank line between listings.

If there are no results, it should print `No Results`. Again, you should use this *exact* message.

{{% notice green Tip "rocket" %}}
To do this, you'll need to iterate over an `ArrayList` of jobs. Each job is itself a `HashMap`. While you can get each of the items out of
the `HashMap` using the known keys (`employer`, `location`, etc.), think instead about creating a nested loop to loop over each `HashMap`. If a new field is added to the job records, this approach will print out the new field without any updates to `printJobs`.
{{% /notice %}}

Test this method before moving on to your next step:

1. Save your changes.
2. Select *Run* from the Run menu and choose to run the `TechJobs` class (or if you have recently run it, just select the green arrow in the top right corner of the screen).
3. Select "1" to list the jobs, and then "0" to list them all.
4. Make sure the printout matches the styling above.
5. Test that it prints a descriptive message if no jobs are found by selecting "0" to search and then "3" to search for a location. Then enter a location that is not in the data (e.g. "Cancun"). Your message should be displayed.
