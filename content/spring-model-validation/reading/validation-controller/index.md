---
title: "Validating Models in a Controller"
date: 2023-07-17T15:23:11-05:00
draft: false
weight: 3
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Validation involves both model and controller components of an MVC application. After we have defined validation rules using annotations on the model, we must also update the controller to ensure that the rules are checked and appropriate action is taken when validation fails.

## Validation Flow

Before diving into the details of the code, let's consider the logical flow of control for validating data in a request. Recall our `POST` handler from the previous chapter, which used model binding to create new `Event` objects from form submissions.

```java
@PostMapping("create")
public String processCreateEventForm(@ModelAttribute Event newEvent) {
   EventData.add(newEvent);
   return "redirect:";
}
```

The flow of this request can be described as follows:

1. Server receives `POST` request
1. Server creates `newEvent` object using request parameters
1. `processCreateEventForm` is called with `newEvent`
1. `newEvent` is saved
1. A 303 redirect response is returned, redirecting the user to `/events`

The request creates an `Event` object using data from the incoming request. Regardless of what the data looks like, the new object is saved to the data layer. The user could submit an empty form, with no name or description filled in, and our code would be happy to create an `Event` and save it. Similarly, a user could submit the full text of the massive novel "War and Peace" as the description. This isn't great. 

{{% notice blue "Note" "rocket" %}}

   Technically, submitting a request containing "War and Peace" would fail with most applications. This is because web servers typically set a limit on the maximum size of a `POST` request. However, our application code is willing to take requests of any size, at this point.

{{% /notice %}}


Some modest validation rules for a new `Event` object might be:

1. The `name` field must contain between 3 and 20 characters, and 
1. The `description` field may be empty, but may contain no more than 500 characters.

With these rules in place, conceptually, the flow of our controller code should look more like the following:

1. Server receives `POST` request
1. Server creates `newEvent` object using request parameters
1. `processCreateEventForm` is called with `newEvent`
1. Controller checks for validation errors in the model object. If errors are found, return the user to the form. Otherwise, proceed.
1. `newEvent` is saved
1. A 303 redirect response is returned, redirecting the user to `/events`

Let's look at how we can practically do this within Spring Boot.

## Handling Validation Errors - Video

{{< youtube omSQO6721cU >}}

{{% notice blue "Note" "rocket" %}}

   The starter code for this video is found at the [add-validation-annotations branch](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/add-validation-annotations) of the `CodingEventsJava` repo. 
   The final code presented in this video is found on the [validation-errors branch](https://github.com/LaunchCodeEducation/coding-events/tree/validation-errors). As always, code along to the 
   videos on your own `codingevents` project.

{{% /notice %}}

## Handling Validation Errors - Text

When using model binding, we can use Spring Boot annotations and tools to validate new model objects before they are saved to a data layer or database. 

### Using `@Valid`

Within `EventController`, the `processCreateEventForm` handler method uses model binding to receive an `Event` object that is created using form data. This object is NOT validated automatically, even if validation annotations are present on its fields.

Recall that *both* the model and controller play a role in validation. The model's responsibility is simply to define validation rules. The controller must check that those rules are satisfied.

The first step to enable validation in a controller is to add `@Valid` to a method parameter that is created using model binding. 

```java
@PostMapping("create")
public String processCreateEventForm(@ModelAttribute @Valid Event newEvent) {
   EventData.add(newEvent);
   return "redirect:";
}
```

In lieu of explicit validation error handling (which we will cover below), Spring Boot throws an exception if validation fails for the new object. This means that an object that fails validation will NOT be saved. 

However, the user experience for this flow is not great. If a user submits bad data, rather than showing them a complicated stack trace, we would be better off to provide a helpful message and allow them to try again.

{{% notice blue "Note" "rocket" %}}

   Remember, exceptions should be messages to programmers and programs, not end users. Even if an exception occurs, we should avoid displaying it to the user.

{{% /notice %}}

### Using the `Errors` Object

We can prevent a validation exception from being thrown by explicitly handling validation errors. Spring Boot makes an object of type `Errors` available when a method uses `@Valid`. As with `Model` objects, we can access this object by placing it in a method's parameter list. 

```java {linenos=table, linenostart=33}
@PostMapping("create")
public String processCreateEventForm(@ModelAttribute @Valid Event newEvent,
                                    Errors errors, Model model) {
   if(errors.hasErrors()) {
      model.addAttribute("title", "Create Event");
      model.addAttribute("errorMsg", "Bad data!");
      return "events/create";
   }

   EventData.add(newEvent);
   return "redirect:";
}
```

Here, we have added `Errors errors` to our handler. This object has a boolean method, `.hasErrors()` that we can use to check for the existence of validation errors. If there are validation errors, we return the form again, along with a simple message for the user. This message can be displayed in the `events/create` template by adding some code above the form:

```html
<p th:text="${errorMsg}" style="color:red;"></p>
```

Now, when a user submits the form with bad data they will be notified and no exception will be thrown. However, the message "Bad data!" is far from ideal. The next section introduces a technique to display more useful error messages. 

## Check Your Understanding

{{% notice green "Question" "rocket" %}}
   Which of the following statements are true?

   1. A method parameter may have only one annotation.
   1. `@Valid` can only be used in conjunction with model binding.
   1. Using `@Valid` means that a method will never be called with invalid data.
   1. Spring Boot can infer validation requirements based on the name of a field. 
{{% /notice %}}

<!-- b, @Valid can only be used in conjunction with model binding. -->