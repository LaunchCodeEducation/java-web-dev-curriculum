---
title: "Bootstrap"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 9
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Introduction

Bootstrap is a commonly-used style library. It allows users to quickly apply its CSS style rules with class selectors. Style updates can add features or improve the usability of an application. For example, Bootstrap, and other styling libraries for that matter, use a standardized color scheme for items like clickable buttons. As the user of the helper library, you can apply the `btn btn-primary` classes to a button on your page and Bootstrap works behind the CSS scenes to render a blue button with white text in a legible font. For more customization, you could also choose which color you want all of the buttons labeled with `btn-primary` on your web page to be.

Straight out of the box, Bootstrap helps developers to get their web apps well-styled without needing to spend much time writing custom CSS rules. The library also does some of the work of applying user-experience best-practices. The button class `btn-danger` for example, is defaulted to appear red, a color most associated with danger.

Image of standard HTML buttons without CSS:

![Standard HTML buttons.](pictures/htmlDefaultButtons.png?classes=border)

Same buttons with Bootstrap:

![Some simple Bootstrap buttons.](pictures/bootstrapButtonOptions.png?classes=border)

## Adding Bootstrap to "coding-events"

### Bootstrap - Video

{{< youtube w-f3NYHHe9Q >}}

> The starter code for this video is found at the [static-resources branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/static-resources) of the `coding-events` repo. The final code presented in this video is found on the [add-bootstrap branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-bootstrap). As always, code along to the videos on your own "coding-events" project.

Apart from adding the library to your Spring Boot project, we won't focus much time on the individual Bootstrap updates to "coding-events" but we want you to know what they are and where they come from. Feel free to add as much or as little Bootstrap styling to your own version.

You'll see from the [Getting Started](https://getbootstrap.com/docs/5.3/getting-started/introduction/) page that there are few ways to incorporate Bootstrap as a dependency in your project. One method is with a link to a **content delivery network**, or **CDN** for short. Linking to a CDN allows you to take advantage of the publicly available library without downloading the entire codebase yourself. Think of the practice like using a web address of an image hosted somewhere else on the web. Unlike downloading the image and including it directly in your own repository, you are not the steward of the image's longevity. The path to an externally hosted image may get moved at some point, or even removed entirely. The same is true with CDNs. So when you use a dependency from a CDN, know that you may need to update the link at some point in your project's lifetime.

From [Bootstrap CDN](https://www.bootstrapcdn.com/), copy the *Complete CSS* and *Complete JavaScript* addresses and drop them into the head tag of `fragments.html` in your "coding-events" project.

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
```

> The addresses you find at [Bootstrap CDN](https://www.bootstrapcdn.com/) may be different from those above.

### Bootstrap Layout

Much of what makes Bootstrap a powerfully helpful and time-saving style library is the layout logic it contains. In brief, Bootstrap uses a grid system of elements labeled *containers* and *rows* that respond dynamically to the state of a web page. Grid elements are given a size label that dictates when an item will shift or change how it is rendered. Broadly speaking, the grid system helps developers write applications that work well on screens of various sizes. Once you play around with it, you'll find that the grid layout can help you write apps that respond to more than just changes in window size.

[Bootstrap Grid](https://getbootstrap.com/docs/4.4/layout/grid/).

### Bootstrap Tables

Bootstrap gives us some table styling that we can use to display events in "coding-events". Some table styling is customizable, so read around Bootstrap's site and explore adding different options to your table.

[Bootstrap Tables](https://getbootstrap.com/docs/4.4/content/tables/).

### Bootstrap Forms

Bootstrap offers a number of classes meant to decorate form elements. `form-group` helps organize items within a form so that inputs and corresponding labels stay visually connected. `form-control` can be applied to any type of form input to give it the Bootstrap style and look.

[Bootstrap Forms](https://getbootstrap.com/docs/4.4/components/forms/).

## Check Your Understanding

{{% notice green Question "rocket" %}}
True/False: Style updates are considered refactoring, since they add no new features to a project, only make it look better.

1. True
2. False

<!-- Solution: Answer: False, style contributes to user interaction and experience, and updates are therefore not refactoring. -->
{{% /notice %}}



