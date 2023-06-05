---
title: "Task 2: Creat the Support Classes"
date: 2023-06-05T10:20:54-05:00
draft: false
weight: 2
originalAuthor: Courtney Frey # to be set by page creator
originalAuthorGitHub: speudusa # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Sally needs you to build up the remaining classes. In each case, refer to the `Employer` class for hints on how to structure your code.

## The `Location` Class

Open the `Location.java` file. Note that the getters, setters, and custom methods for this class are done, as is the constructor for initializing the `id` field.

Sally left you a `TODO` comment with instructions for coding a second constructor:

1. It should call the first constructor to initialize the `id` field.
1. It must also initialize the `value` field for a new `Location` object.


## The `CoreCompetency` Class

Open the class file. In this case, the constructors and custom methods are ready. Sally needs you to complete the somewhat tedious task of writing the getters and setters for the `id` and `value` fields, but NOT for `nextID`.

Fortunately, IntelliJ has a tool to help with this:

1. Right-click in the editor pane and select Generate.
1. Select the Getter and Setter option.
1. Select the `value` option, then click _OK_.  you should now see the getters and setters.
1. Since the unique value of `id` is set with the constructors, we only need to add a getter for this field. Select Generate again and use the Getter option for `id`.


{{% notice blue "Note" "rocket" %}} 
Want to use fewer clicks? You could always _Generate_ getters and setters for both `id` and `value`, and then delete the `setID` method.

Be careful, though. If you forget to remove `setID`, then users can change the `id` value, which may cause problems in the program.
{{% /notice %}}

## The `PositionType` Class
Open the class file. This time the constructors, getters, and setters are done. Sally’s comments direct you to where you need to add the custom methods.

<!-- //TODO: Update link below when Classes and Objects part 2 chapter is added to this book -->

1. Code a `toString` method that just returns the `value` of a `PositionType` object.
1. Use the _Generate_ option again to add the `equals` and `hashCode` methods. Refer to the [previous section](https://education.launchcode.org/java-web-development/chapters/classes-part2/equals-shortcut.html#equals-shortcut) of this chapter if you need a quick review.
1. Assume that two `PositionType` objects are equal when their id fields match.

{{% notice green "Tip" "rocket" %}} 
 Now would be a good time to `save`, `commit`, and `push` your work up to GitHub.
{{% /notice %}}

[Next]({{< relref "../../../assignments/techjobs-oo/task3/index.md" >}})


