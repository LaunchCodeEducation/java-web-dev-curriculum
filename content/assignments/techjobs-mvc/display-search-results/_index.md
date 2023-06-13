---
title: "Display Search Results"
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

## Display Search Results

Once you have your `displaySearchResults` handler passing information to the
view, you need to display the data.

1. In `search.html`, create a loop to display each job passed in from the
   controller.
1. Put the job results into a set of tables, similar to what you did for the
   `list-jobs` view.

{{% notice green "Tip" "rocket" %}}

   You can *reuse* the code you just wrote in `list-jobs.html` by defining a
   new *fragment* in that file. Then you need to include that fragment in
   `search.html`.

   For the fragment to work properly in both files, the variables passed in by
   `model.addAttribute()` must use the same names.

{{% /notice %}}