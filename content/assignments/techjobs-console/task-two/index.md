---
title: "Task Two"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

# Create Method `findByValue`

At this stage, the application will allow users to search a *given
column* of the data for a given String. Your next task is to enable a
search that looks for the search term in *all* of the columns.

In the `JobData` class, find the method `findByValue`. This method has been outlined
for you but contains none of the code needed to work (you should leave the `loadData()` call as the first line of the method, however). Here are a few observations:

1. The code that you write should not contain duplicate jobs. So, for example, if a listing has position type "Web - Front End" and name "Front end web dev" then searching for "web" should not include the listing twice.
2. As with `printJobs`, you should write your code in a way that if a new column is added to the data, your code will automatically search the new column as well.
3. You should NOT write code that calls `findByColumnAndValue` once for each column. Rather, utilize loops and collection methods as you did above.
4. You *should*, on the other hand, read and understand `findByColumnAndValue`, since your code will look similar in some ways.

You'll need to call `findByValue` from somewhere in `main`. We'll leave it up to you to find where. You might have noticed that when you try to search all columns using the app, a message is printed, so that is a good clue to help you find where to place this new method call. Once you find where to call your new method, you can *Run* the program again to test your code.