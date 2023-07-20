---
title: "Simple Controllers"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 1
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

The first of the MVC elements we'll work on implementing are the controllers. Recall that controllers are like the traffic cops of our application. They handle the requests made from users interacting with the application's view and update model data accordingly. Conversely, changes to model data are sent to the view via controller methods.

![MVC Flow](pictures/mvcOverviewDetail.png?classes=border)

## Controllers and Static Responses - Video

{{< youtube attSxLlXkz8 >}}

**Note:** The starter code for this video is found in the [starter branch](https://github.com/LaunchCodeEducation/hello-spring/tree/starter) of the `hello-spring` repo. The final code presented in this video is found on the [static-responses branch](https://github.com/LaunchCodeEducation/hello-spring/tree/static-responses). Code along to the videos on your own `hello-spring` project.

## Controllers and Static Responses - Intro

### `@Controller`

In the Spring Boot context, we'll organize controller code into a controller package. Remember when we mentioned that the framework works by convention over configuration? This is what we mean. It's not required for a controller to be in a controller package, but it's generally a good idea.

<!-- TODO: send link below back to Chapter 6: Unit Testing Java Annotations when able -->
To designate a given class as a controller within the Spring framework, we use the annotation `@Controller`. Recall that [java-annotations](#java-annotations) are like metadata about your code. They help the framework do its work by adding context to your code.

```java
@Controller
public class HelloSpringController {

   // class code here ...

}
```

### Controllers Map to Requests

`@GetMapping` is another critical annotation used on controller methods. `@GetMapping` designates a controller action with a URL path. For every `GET` request made to the provided path, the controller method will be called. The path is defined with `@GetMapping("pathname")`. If the pathname value is null, then the path used is the index path, or `/`.

```java
@Controller
public class HelloSpringController {

   // responds to get requests at "/hello"
   @GetMapping("hello")
   public String hello() {
      // method code here ...
   }

}
```

For every controller method that you want to respond to a request, you will want to use a mapping annotation. Not surprisingly, though, `@GetMapping` only handles `GET` requests. If you want to write a controller method that takes care of a `POST` request, you'll want to use `@PostMapping`. Of course, there are other annotations for the other request methods, but these are the two we will use in this class.

```java
@Controller
public class HelloSpringController {

   // responds to post requests at "/goodbye"
   @PostMapping("goodbye")
   public String goodbye() {
      // method code here ...
   }

}
```

If we want to write a controller method that will be used for both `GET` and `POST` at the same path, we can label the method with `@RequestMapping`. `@RequestMapping` can handle more than one method as such:

```java
@Controller
public class HelloSpringController {

   // responds to get and post requests at "/hellogoodbye"
   @RequestMapping(value="hellogoodbye", method = {RequestMethod.GET, RequestMethod.POST})
   public String hellogoodbye() {
      // method code here ...
   }

}
```

The default method of `@RequestMapping` is `GET`. Another added capability of `@RequestMapping` is

 that it can be applied to a whole class, not just a single method. When applied to a whole class, `@RequestMapping` essentially designates a base path that all methods in the class start with. 
 
## `@ResponseBody`

`@ResponseBody` is yet another annotation used in the Spring controller context to return plain text from a controller method. This annotation we will only need to use for a short while, before we start to work with templates. Spring Boot's default action when responding to a controller method is to return a template. Since we aren't doing that yet however, we need to tell the framework to return plain text by adding the `@ResponseBody` annotation.

Let's put it all together:

```java
@Controller
public class HelloSpringController {

   // responds to get requests at "/hello" 
   @GetMapping("hello")
   @ResponseBody
   public String hello() {
      return "Hello, Spring!";
   }

}
```

## Check Your Understanding

{{% notice green Question "rocket" %}}
True/False: The `@Controller` annotation goes above a method to classify it as a controller method.

1. True

1. False
{{% /notice %}}

{{% notice green Question "rocket" %}}
Which of the following is true about controllers?

1. Controllers handle the data storage of an MVC app.

1. Controllers manage what the user of an MVC application sees.

1. Controllers relay the messages between data and views in an MVC application.

1. Controllers determine what information can be submitted in an online form.
{{% /notice %}}