---
title: "Controllers with Forms"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 3
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Courtney Frey # update any time edits are made after review
lastEditorGitHub: speudusa # update any time edits are made after review
lastMod: 2023-30-06T10:28:27-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

## Sending Form Data - Video

{{< youtube LQxzrKPnUGY >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found in the [path-variables branch](https://github.com/LaunchCodeEducation/hello-spring/tree/path-variables) of the `hello-spring` repo. The final code presented in this video is found on the [forms branch](https://github.com/LaunchCodeEducation/hello-spring/tree/forms). As always, code along to the videos on your own `hello-spring` project.
{{% /notice %}}

## Sending Form Data - Text

What if we want to send over some form data? To send data via a simple form in Spring Boot, we'll set things up like this:

We have a controller method that generates a form at index.

```java
@GetMapping
@ResponseBody
public String helloForm() {
   String html = 
      "<html>" +
         "<body>" +
            "<form method = 'get' action = '/hello'>" +
               "<input type = 'text' name = 'coder' />" +
               "<input type = 'submit' value = 'Greet Me!' />" +
            "</form>" +
         "</body>" +
      "</html>";
   return html;
}
```

Remember, without an argument, `@GetMapping` maps to `/`. On form submission, the data is sent to another path, `/hello`. We need a controller for that.

```java
@GetMapping("hello")
@ResponseBody
public String hello(@RequestParam String coder) {
   return "Hello, " + coder + "!";
}
```

Now, you have a controller that can handle the form submission. When the form submits, the input entered in the text box will be passed to the URL via a query string. This is why the controller method above passes in `@RequestParam` to handle the `coder` key.

To be able to submit the form via `POST`, we'll need to modify the `hello()` controller to use `@RequestMapping`. Remember, `@RequestMapping` can annotate a method that responds to both `GET` and `POST`.

```java
// Responds to get and post requests at /hello?coder=LaunchCoder
@RequestMapping(value = "hello", method = {RequestMethod.GET, RequestMethod.POST})
@ResponseBody
public String hello(@RequestParam String coder) {        
   return "Hello, " + coder + "!";
}

@GetMapping
@ResponseBody
public String helloForm() {
   String html = 
      "<html>" +
         "<body>" +
            "<form method = 'post' action = '/hello'>" +
               "<input type = 'text' name = 'coder' />" +
               "<input type = 'submit' value = 'Greet Me!' />" +
            "</form>" +
         "</body>" +
      "</html>";
   return html;
}
```

## Check Your Understanding

{{% notice green Question "rocket" %}}
Which annotation is applied above a controller class?

1. `@Controller`
      
1. `@GetMapping`

1. `@PostMapping`

1. `@RequestMapping`

1. `@ResponseBody`

1. `@RequestParam`

1. `@PathVariable`
{{% /notice %}}

{{% notice green Question "rocket" %}}
Select all the annotations applied above a controller method from the list below. 
1. `@Controller`
      
1. `@GetMapping`

1. `@PostMapping`

1. `@RequestMapping`

1. `@ResponseBody`

1. `@RequestParam`

1. `@PathVariable`
{{% /notice %}}

