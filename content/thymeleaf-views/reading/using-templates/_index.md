---
title: "Using Templates"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Sally Steuterman # to be set by the page reviewer
reviewerGitHub: gildedgardenia # to be set by the page reviewer
lastEditor: Terri Penn # update any time edits are made after review
lastEditorGitHub: tpenn # update any time edits are made after review
lastMod: 2023-09-22T08:34:55-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

In the [next video]({{< relref "../conditionals-templates/_index.md#try-it" >}}), you will extend your `hello-spring` project and practice using Thymeleaf templates as you code along with the clip.

Before you get there, however, we need to review a few core skills and best-practices.

## Passing Data to a Template

The controller class contains methods that send data to different templates.
These methods have a structure similar to:

```java
public String methodName(Model model) {

    // method code here

    model.addAttribute("variableName", variableValue);

    return "pathToTemplate";
}
```
Each method that sends data to a template requires:

1. A `Model` parameter (line 1). This object stores the variable names and values that get passed into a template.
1. One or more `addAttribute` statements that add data to the `model` object (line 5). `variableName` must be a string. `variableValue` can be a variable of any type, a number, a 'character', or a "string".
1. A `return` statement of type `String`.
1. The `return` string contains the path and file name for the desired template (line 7). For example, if our `templates` folder contains a subfolder called `animals` that holds a template called `dogs.html`, then the return statement would be `return "animals/dogs";`.

### Accessing Data in a Template

Thymeleaf commands appear (in most cases) as *attributes* within a standard
HTML tag. Each command starts with the prefix ``th``, followed by a keyword.

```html
<tag th:keyword = "..."></tag>

```

The code inside the quotation marks will vary depending on the keyword.
Usually, this will involve the data passed in from the controller. The data
available to a template includes any variables and values stored in the
`model` object, and these will be accessed with the syntax
`${variableName}`.

For example, if the controller stores data in the `name` variable, then the
template can display that value like so:

```html
<p th:text = "${name}"></p>

```

In essence, `th:text` says, *Take the value of the variable inside the ${}
and display it as the text for this element*. If `name` stores the string
"Rutabaga", then when the program runs, the code interprets
`<p th:text = "${name}"></p>` in the same way as:

```html
<p>Rutabaga</p>
```

By using `th:text = "${name}"`, we make our webpage *dynamically* display
data within the `p` element. Changing the value of `name` leads to a
corresponding change in the text in the view after refreshing.

## Setting Default Text

What if we want to view our template without running the program? As mentioned
earlier in the chapter, Thymeleaf files can be opened in a browser and
displayed as a webpage. With no data, however, opening a template shows blank
spaces wherever information from the controller is expected. Fortunately, we
can add some default text within the framework to give us an idea of what the
page will look like when we start the program.

To include default text in our template, simply include some *placeholder*
information inside the elements that contain a Thymeleaf attribute.

```html
<h2 th:text = "${title}">Default Title</h2>
<div>
    <p th:text = "${bookQuote}">Don't Panic</p>
    <a href = "someURL" th:text = "${linkText}">LaunchCode</a>
</div>
```

The text `Default Title`, `Don't Panic`, and `LaunchCode` appear if we
open the template file in a browser. When the program runs, however, these text
samples will be replaced by the values stored in the `title`, `bookQuote`,
and `linkText` variables.

In most cases, you will never see the default text in your live webpage.
Including it helps, however, if you need to visualize your planned layout for
the webpage before your project is completely finished.

{{% notice green Tip "rocket" %}}
Best-practice encourages us to include default text in our templates. This
improves the readability of the code, and it gives an outside observer a
better idea of the structure of the webpage. Default text also indicates what
data will appear in different sections.
{{% /notice %}}

## Organizing Templates

As any project grows, the number of templates required to build the website
will increase. Instead of just throwing all of the files into the
`templates` folder, best-practice mandates that we place related items
into subfolders.

For example, if we build a website for a zoo, we can help ourselves immensely
if we avoid a `templates` folder with a single level of files for every
animal or feature of the site. A better approach would be to divide the
templates into related categories like `feedingSchedules`, `concessions`,
`donations`, `pachyderms`, etc. Each subfolder can also hold finer
categories as needed.

The goal is to consolidate your files into related groups. That way, you only
need to use a single file path in a given controller. This improves the
efficiency of your code, saves you from getting a headache trying to find and
fix a specific file, and streamlines updates by reducing the lines of code
that need to be modified.

## Check Your Understanding

{{% notice green Question "rocket" %}}
Given the code:

```html
<p th:text = "${name}">Name: Default</p>
```

What will be displayed on the screen if the controller sends in a `name` variable with a value of "Blake"?

1. Name: Default
1. Name: Blake
1. Blake: Default
1. Blake

<!-- Solution: Name: Blake -->
{{% /notice %}}


{{% notice green Question "rocket"%}}
We want a list element to read, "Item name: ______, Price = ______", where
the blanks need to be filled in with `name` and `price` values sent from
the controller.

Which of the following will produce the desired result?

1. `<li th:text = "${'Item name: ' + name + ', Price = ' + price}"></li>`
1. `<li th:text = "Item name: ${name}, Price = ${price}"></li>`
1. `<li th:text = "${name}, ${price}">Item name: , Price = </li>`
1. `<li>Item name: ${name}, Price = ${price}</li>`

<!-- Solution: `<li th:text = "Item name: ${name}, Price = ${price}"></li>` -->
{{% /notice %}}