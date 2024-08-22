---
title: "Submission and Bonus Missions"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 5
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Sanity Check

Before submitting, make sure that your application:

1. Prints each field of a job when using search functionality, and when listing all columns. If there are no search results, a descriptive message is displayed.
1. Allows the user to search for a string across all columns.
1. Returns case-insensitive results.
1. Run the auto-grading tests to ensure that the tests pass.

## Solution Demo

### Watch a demo of a working solution.

{{< youtube Ai9ceGDWkac >}}

### How to Submit
To turn in your assignment and get credit, follow the [submission instructions]({{% relref "../../hello-world/_index.md#submitting-your-work-on-canvas" %}}).

### Bonus Missions

If you want to take your learning a few steps further, here are some additional problems you can try to solve. We're not providing you much guidance here, but we have confidence that you can figure these problems out!

1. **Sorting list results**: When a user asks for a list of employers, locations, position types, etc., it would be nice if results were sorted alphabetically. Make this happen.
2. **Returning a copy of allJobs**: Look at `JobData.findAll()`. Notice that it's returning the `allJobs` property, which is a static property of the `JobData` class. In general, this is not a great thing to do, since the person calling our `findAll` method could then mess with the data that `allJobs` contains. Fix this by creating a copy of `allJobs`. *Hint:* Look at the constructors in the Oracle `ArrayList` documentation.
