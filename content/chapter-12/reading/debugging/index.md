---
title: "Debugging in IntelliJ"
date: 2023-07-12T10:22:37-05:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

<!-- # youtube 1bCgzjatcr4 -->

Watch this video to learn the basics of the debugging tools available in IntelliJ.
If you want to follow along, Chris is working with `ArrayListGradebook` 
from the [Control Flow and Collections chapter]("../../../control-flow-and-collections/reading/arraylist/") 
and the `HelloMethods` and `Message` from [Classes and Objects, Part 2 chapter]("../../../classes-part-2/reading/instance-and-static-methods/").
You should have already downloaded this code from `java-web-dev-projects`.  

{{% notice blue "Note" "rocket" %}}

   The video is using an older version of IntelliJ.  

   The overall functionality of the debugging pane is still there, however, 
   you may have to explore the location of buttons.  
   We recommend hovering over each icon and looking at the names of each.

   IntelliJ has [documentation and videos](https://www.jetbrains.com/help/idea/debugging-code.html#df9fd13c) exploring their debugger if you are curious.

{{% /notice %}}

## Steps to Find and Diagnose Logical Bugs

1. Set a **breakpoint** where you want to pause the execution of the code. This will provide a more detailed look at what the program is doing at this point.  Right-click in the text editing window to add a breakpoint to your code.
1. Run your program in **Debug mode**.
1. Inspect the values of your variables in the **Debugger Pane**.
1. If needed, use the **Add/Watch** button to watch a specific expression as your program executes.
1. You can also set a **conditional breakpoint** to pause the execution of the code when a certain condition is a method.

## Control the Flow of Execution

1. **Step-over** button executes a given line then steps to the next executable line
1. **Step-into** button allows you to review a called method and see what is going to line within the method
1. **Step-out-of** button allows you to move out of the method you stepped into and resume stepping through the main code
1. **Variables Pane** allows you to examine how variables are manipulated within your code.  Also allows you to identify specific *Watch expressions*
1. **Frames Pane** tracks any method calls and threads in your code line by line.  Best used with breakpoints.

## Advantage of Debugger Over Printing to the Console

The debugger lets you look at *all* the values in your program instead of just guessing which values you want to track via logging to the console.

## Check Your Understanding

{{% notice green "Question" "rocket" %}}

   What is a breakpoint?

   1.   A point in our code where the debugger will stop running and provide information about the current state.
   1.   A point in our code that we anticipate will result in an exception or error.
   1.   A point in our code where we include a print statement to see what’s going on.
   1.   A point in our code where we want to throw the computer out of a window because nothing works.

{{% /notice %}}

<!-- 1 -->