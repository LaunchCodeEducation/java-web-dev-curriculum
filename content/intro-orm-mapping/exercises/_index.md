---
title: "Exercises: OMG the ORM!"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer:  # to be set by the page reviewer
reviewerGitHub:  # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub:  # update any time edits are made after review
lastMod: 2023-30-06T10:28:27-05:00 # UPDATE ANY TIME CHANGES ARE MADE
---

For the exercises, we are going to continue building on our `codingevents` application.
The exercise instructions assume that your code resembles the 
[persistent-controller](https://github.com/LaunchCodeEducation/CodingEventsJava/tree/persistent-controller) branch of `CodingEventsJava`.
Create a new branch off of your own `persistent-controller` code to get started on the exercises. 

{{% notice blue Note "rocket" %}}
You will be making one entity class, one repository, and one controller. If you are not sure what these classes and interface should look like, refer back to the sections on [persistent models](https://www.youtube.com/watch?v=YAISqYMOIAw) and [controllers and repositories](https://www.youtube.com/watch?v=0eug2HI7rbo&t=128s).
{{% /notice %}}

## The `EventCategory` Class

First, create a new class called `EventCategory` in the `models` directory.

`EventCategory` needs to have the following:

1. An `id` field of type `int`.
1. A `name` field of type `String`.
1. A constructor.
1. The appropriate getters and setters.

`EventCategory` represents data that will be stored in our database, so you need to use the `@Entity` annotation!

{{% expand "Check Your Solution" %}}
```java
@Entity
public class EventCategory {

   @Id
   @GeneratedValue
   private int id;

   @Size(min=3, message="Name must be at least 3 characters long")
   private String name;

   public EventCategory(@Size(min = 3, message = "Name must be at least 3 characters long") String name) {
      this.name = name;
   }

   public EventCategory() {}

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getId() {
      return id;
   }

   @Override
   public String toString() {
      return name;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;
      EventCategory that = (EventCategory) o;
      return id == that.id;
   }

   @Override
   public int hashCode() {
      return Objects.hash(id);
   }
}
```
{{% /expand %}}

## The `EventCategoryRepository` Interface

Once you have created `EventCategory`, you need to create the `EventCategoryRepository` in the `data` folder.
`EventCategoryRepository` will extend the `CrudRepository` interface.

## The `EventCategoryController` Class

Create `EventCategoryController` in the `controllers` directory.
You can use the `@RequestMapping` annotation to map to `"eventCategories"`.
To get our handlers working, we also need a variable of type `EventCategoryRepository`.

We will be creating 3 handlers in our controller:

1. `displayAllCategories`
1. `renderCreateEventCategoryForm`
1. `processCreateEventCategoryForm`

### `displayAllCategories`

`displayAllCategories` needs to do the following:

1. Use `@GetMapping` and return `"eventCategories/index"`.
1. Add an attribute for the `title` that uses `"All Categories"`.
1. Add an attribute for the `categories` that uses all of the values in your `EventCategoryRepository` variable.

{{% expand "Check Your Solution" %}}
```java
@GetMapping
public String displayAllCategories(Model model) {
   model.addAttribute("title", "All Categories");
   model.addAttribute("categories", eventCategoryRepository.findAll());
   return "eventCategories/index";
}
```
{{% /expand %}}

### `renderCreateEventCategoryForm`

`renderCreateEventCategoryForm` needs to do the following:

1. Use `@GetMapping` and return `"eventCategories/create"`.
1. Add an attribute for the `title` and assign it `"Create Category"`.
1. Add an attribute for a new instance of `EventCategory`.

### `processCreateEventCategoryForm`

`processCreateEventCategoryForm` needs to do the following:

1. Use `@PostMapping`.
<!-- TODO: Update below link when content is added to book -->
1. Use error validation and the `Errors` object appropriately. If you want to review how to use the `Errors` object, check out the section on [error validation]().
1. Add an attribute for the `title` and assign it `"Create Category"`.
1. Add an attribute for a new instance of `EventCategory`.
1. Either return `"eventCategories/create"` or `"redirect:"`.

{{% expand "Check Your Solution" %}}
```java
@PostMapping("create")
public String processCreateEventCategoryForm(@Valid @ModelAttribute EventCategory eventCategory, Errors errors, Model model) {

   if (errors.hasErrors()) {
      model.addAttribute("title", "Create Category");
      model.addAttribute(new EventCategory());
      return "eventCategories/create";
   }

   eventCategoryRepository.save(eventCategory);
   return "redirect:";
}
```
{{% /expand %}}

## Thymeleaf Templates

To finish the exercises, we need to make two new templates.

1. `eventCategories/index`, which will contain a table of the event categories.

{{% expand "Check Your Solution" %}}
```html
<!DOCTYPE html>
   <html lang="en" xmlns:th="http://www.thymeleaf.org/">
      <head th:replace="fragments :: head"></head>
      <body class="container">

         <header th:replace="fragments :: header"></header>

         <table class="table table-striped">
            <thead>
            <tr>
               <th>Category Name</th>
            </tr>
            </thead>
            <tr th:each="category : ${categories}">
               <td th:text="${category.name}"></td>
            </tr>

         </table>

      </body>
   </html>
```
{{% /expand %}}

1. `eventCategories/create`, which will contain a form for adding new event categories.

## The Final Application

Once you are done, launch your app and head to `localhost:8080/eventCategories`!
If you added categories already, you will see any categories already stored in the database.
In this case, we added "Meetup" as a category the first time we ran our app to test it.

![Screenshot showing the categories table with only "Meetup" in it.](pictures/initialcategories.png?classes=border)

If you click on "Create Category", you should be directed to `localhost:8080/eventCategories/create`.
We decided to add "Networking" as a category and filled out the form.

![Screenshot showing the category form filled out with the word "Networking".](pictures/categoryform.png?classes=border)

Once you hit submit, you are redirected back to `localhost:8080/eventCategories`, and your table now contains the newest event category!

![Screenshot showing the categories table with "Meetup" and "Networking" in it.](pictures/finalcategories.png?classes=border)