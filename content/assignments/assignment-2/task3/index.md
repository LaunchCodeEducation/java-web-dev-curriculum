---
title: "Task 3: Complete the Job Class"
date: 2023-06-05T10:20:54-05:00
draft: false
weight: 3
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-06-26T10:20:54-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

Now open the `Job` file. OOF! There are a lot of fields declared and not much else.

1. Code a constructor to initialize the `id` field with a unique value. This constructor should take no parameters.

1. Code a second constructor that takes 5 parameters and assigns values to `name`, `employer`, `location`, `positionType`, and `coreCompetency`. Also, this constructor should call the first in order to initialize the `id` field. Make sure the parameters are defined in the specified order.

1. Generate getters and setters for each field EXCEPT `nextID` and `id`.

1. Generate a getter for the `id` field.

1. Generate the `equals` and `hashCode` methods. Consider two `Job` objects equal when their id fields match.

{{% notice green "Tip" "rocket" %}} 
 Now would be a good time to `save`, `commit`, and `push` your work up to GitHub.
{{% /notice %}}

[Next]({{< relref "../../../assignments/techjobs-oo/task4/index.md" >}})
