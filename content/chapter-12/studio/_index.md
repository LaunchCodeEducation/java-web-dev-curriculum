---
title: "Studio: If It Ain't Broke, Add a Breakpoint!"
date: 2023-07-12T10:22:37-05:00
draft: false
weight: 3
originalAuthor: <no value> # to be set by page creator
originalAuthorGitHub: <no value> # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

The purpose of this studio is to expand your current debugging strategies.
First, as a group, you will discuss your current debugging strategies.
Next, you will explore the debugger tools addressed in this chapter.

This studio will use a previous studio assignment to explore IntelliJ's Debugger.
On your machine, open up your copy of `java-web-dev-projects` in IntelliJ and navigate to the project for the interfaces studio.

## Part One: Pre-Debugger Debugging

Share with the group one error you encountered when working on your version of the interfaces studio.
This could be the result of a typo or a logical error.

1. What was the error?
1. How did you solve this error?
1. What strategies and tools have you been using so far to debug your code?
1. Could one of the debugging tools help you when addressing this error?

## Part Two: Debugger Debugging

Now, check out the `debugging` branch of the studio repo.
Review the code and then practice using IntelliJ's debugging tools.
To get started, try the following:

1. Add a few breakpoints inside `Main.java`.  Make a note of where you expect the program to break in its execution.
1. Add `cd.name` as a *Watch expression* in the *Variables Pane* of the Debugger.
1. Add a breakpoint inside some of the methods in `BaseDisc.java`.  Anticipate what you expect to see as the last line in the *Variables Pane*  when the debugger stops.

## Part Three: More Debugger Debugging

Take your debugging skills one step further by answering these questions.

1. When would use a *Watch expression*?  If you run the app and it's already functioning, what shows up there?
1. Would a conditional breakpoint make sense to use in the context of this app? Try adding a conditional breakpoint and then run your app.
1. What does the *Frames Pane* tell you as you step through your code?
1. Add `dvd.aName` as a *Watch expression* and add a breakpoint.  Can you explain the output in the *Variables Pane*?

## Part Four: Debugging Beyond This Studio

Once you have worked through the studio’s codebase, open up a piece of code you have been struggling with.
In what ways, could the debugging tools help you figure out what is going on with the code?
