---
title: "Controllers with Parameters"
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

## Controllers with Parameters

Now that you know the basics of a controller method, we can start to add some more variables into the mix. Some controller methods can take in parameters in the form of query strings or sections of the URL path. Passing this URL data to the controller is one step closer to more flexible web applications.

A **route** is the mechanism by which a request path gets assigned to a controller within our application. We’ll explore routes and how data is transferred from a webpage with a given route to a specific controller.

### Query Strings are URL Data

A brief refresher: query strings are additional bits of information tacked onto the ends of URLs. They contain data in key-value pairs.

```bash
www.galaxyglossary.net?aKey=aValue&anotherKey=anotherValue&thirdKey=thirdValue
```

{{% notice blue Note "rocket" %}}
Do HTTP requests and responses feel unfamiliar? Do you remember what a **query string** is? If you're feeling rusty on these topics, it's a good idea to brush up now, as routing requires a foundational understanding of HTTP data transfer.

Here's our [introduction to HTTP](https://education.launchcode.org/intro-to-professional-web-dev/chapters/http/index.html) for reviewing the concepts.
{{% /notice %}}

### Controllers and Query Parameters - Video

{{< youtube cXwlynCtZSM >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found in the [static-responses branch](https://github.com/LaunchCodeEducation/hello-spring/tree/static-responses) of the `hello-spring` repo. The final code presented in this video is found on the [query-parameters branch](https://github.com/LaunchCodeEducation/hello-spring/tree/query-parameters). Be sure to code along to the videos on your own `hello-spring` project.
{{% /notice %}}

## `@RequestParam`

We can pass `@RequestParam` as an argument of a controller method. This annotation as an argument lets the handler method know about a given query string based on its own argument.

```java
// Responds to get requests at /hello?coder=LaunchCoder
@GetMapping("hello")
@ResponseBody
public String hello(@RequestParam String coder) {        
   return "Hello, " + coder + "!";
}
```

The controller method looks for the query string in the URL that matches its parameter, `coder`, and puts the paired value of that `coder` key into the response text.

### Controllers and Path Parameters - Video

{{< youtube lRNO0eAcSs4 >}}

{{% notice blue Note "rocket" %}}
The starter code for this video is found in the [query-parameters branch](https://github.com/LaunchCodeEducation/hello-spring/tree/query-parameters) of the `hello-spring` repo. The final code presented in this video is found on the [path-variables branch](https://github.com/LaunchCodeEducation/hello-spring/tree/path-variables). Please code along to the videos on your own `hello-spring` project.
{{% /notice %}}

## `@PathVariable`

Another way to handle data with a controller is by accessing the data via a segment of the URL. This is done with `@PathVariable`. `@PathVariable` takes an argument that, if matching a portion of the URL, will deliver this data into the handler.

```java
// Responds to get requests at /hello/LaunchCode
@GetMapping("hello/{name}")
@ResponseBody
public String helloAgain(@PathVariable String name) {
   return "Hello, " + name + "!";
}
```

Above, `name` is a placeholder, indicating where in the URL segment to look for the `@PathVariable`. From the comment, we know that the actual value is `LaunchCode`, but this can easily be changed. If we changed the value of this URL segment to `/hello/Ada`, then this controller would respond with `Hello, Ada` when a `GET` request is made.

{{% notice blue Note "rocket" %}}
Also know that you can redirect a user by removing the `@ResponseBody` annotation from the controller and returning `"redirect:/DESIREDPATH"`.
{{% /notice %}}

### Check Your Understanding

{{% notice green Question "rocket" %}}
Your application is served at `myfavoriteplanets.net`. What is the path that this controller maps to?

```java
@GetMapping("venus")
@ResponseBody
public String venusSurface(@RequestParam String terrestrial) {
   if (terrestrial == true) {
      return "Venus is rocky."        
   } else {
      return "Venus is gaseous."
   }
}
```

1. `myfavoriteplanets.net/venus?terrestrial=true`

1. `net.myfavoriteplanets/venus?terrestrial=true`

1. `myfavoriteplanets/venus?terrestrial=true`

1. `myfavoriteplanets/venus/terrestrial`
{{% /notice %}}


{{% notice green Question "rocket" %}}
Your application is served at `myfavoriteplanets.net`. What URL do you need to hit so that the response is: "Akatsuki currently orbits Venus."?

```java
@GetMapping("venus/{orbiter}")
@ResponseBody
public String venusOrbiter(@PathVariable String orbiter) {
   return orbiter + " currently orbits Venus."
}
```

1. `myfavoriteplanets.net/venus/{Akatsuki}`

1. `myfavoriteplanets.net/venus/orbiter=Akatsuki`

1. `myfavoriteplanets.net/venus/Akatsuki`

1. `myfavoriteplanets.net/venus/name=Akatsuki`
{{% /notice %}}