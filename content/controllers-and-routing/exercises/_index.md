---
title: "Exercises"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

While reading the chapter, you created a basic Hello, World application using Spring Boot called `hello-spring`. Open that project up in IntelliJ, and get ready to add some features!

{{% notice blue Note "rocket" %}}
Before you start these exercises, take a look at the [hello-spring class-annotations branch](https://github.com/LaunchCodeEducation/hello-spring/tree/class-annotations) to make sure your own application matches ours.
{{% /notice %}}

Create and checkout a branch for your exercises solution. Name it something useful, such as `controller-exercises`.

Modify your `HelloController` class to display a form on a `GET` request that asks the user for both their name and the language they would like to be greeted in. It should look something like this:

![Greeting Form](pictures/form.png?classes=border)

The resulting form submission should return and display the message, "Bonjour Chris".

{{% notice blue Note "rocket" %}}
The language is presented in a dropdown, more formally known as a `select` element. For more information about the `select` element and how it works, read the [MDN documentation](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select).
{{% /notice %}}

When the user submits the form (via a `POST` request), they should be greeted in the selected language. Your new feature should:

1. Include at least 5 languages, with English being the default. If you don't speak 5 languages yourself, ask your friend [the Internet](http://pocketcultures.com/2008/10/30/say-hello-in-20-languages/).
2. Include a new `public static` method, `createMessage`, in the `HelloController` that takes a name as well as a language string. Based on the language string, you'll display the proper greeting.

{{% expand "Check Your Solution" %}}
When the user submits the form (via a ``POST`` request), they should be
greeted in the selected language. Your new feature should: 

1. Include at least 5 languages, with English being the default. If you don’t speak 5 languages yourself, ask your friend `the Internet <http://pocketcultures.com/2008/10/30/say-hello-in-20-languages/>`__.
1. Include a new ``public static`` method, ``createMessage``, in the ``HelloController`` that takes a name as well as a language string. Based on the language string, you’ll display the proper greeting.

```java
@RequestMapping(value="hello", method = RequestMethod.POST)
@ResponseBody
public String helloPost(@RequestParam String name, @RequestParam String language) {
    if (name == null) {
        name = "World";
    }

    return createMessage(name, language);

    // For a bonus mission, students can change this response text to look nicer.
    // This is subjective, but students should be modifying the HTML of the response string.
}

public static String createMessage(String n, String l) {
    String greeting = "";

    if (l.equals("english")) {
        greeting = "Hello";
    }
    else if (l.equals("french")) {
        greeting = "Bonjour";
    }
    else if (l.equals("italian")) {
        greeting = "Bonjourno";
    }
    else if (l.equals("spanish")) {
        greeting = "Hola";
    }
    else if (l.equals("german")) {
        greeting = "Hallo";
    }

    return greeting + " " + n;
}
```
{{% /expand %}}

Commit your changes!

## Bonus Mission

1. Instead of returning the greeting as plain text, add a bit of HTML to the response string so that the displayed message looks a bit nicer.