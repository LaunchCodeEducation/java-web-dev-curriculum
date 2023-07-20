# Exercises: Edit Model Classes {#model-classes-exercises}

Add functionality to edit event objects in your `coding-events`
application. These exercises assume that you have added all of the code
from this section of the book and your application resembles the
[model-binding branch of
coding-events-demo](https://github.com/LaunchCodeEducation/coding-events/tree/model-binding).

Create a new branch from here with a descriptive name, such as
`edit-events`. The edit form will resemble the form used to create an
event.

::: admonition
Tip

As you work through these steps, test your code along the way! With each
change you apply to your code, ask yourself what you expect to see when
the application is run. You may not find that all of the steps result in
observable changes, though. Use IntelliJ's debugger and read your error
messages if you run into issues after applying any of the changes.
:::

1.  Create the two handler methods listed below in `EventController`.
    We'll add code to these in a moment, so just put the method outline
    in place for now.

    1.  Create a method to display an edit form with this signature:

        ``` {.java linenos=""}
        public String displayEditForm(Model model, @PathVariable int eventId) {
           // controller code will go here
        }
        ```

    2.  Create a method to process the form with this signature:

        ``` {.java linenos=""}
        public String processEditForm(int eventId, String name, String description) {
           // controller code will go here
        }
        ```

    `Check your solution <model-classes-exercise-solutions1>`{.interpreted-text
    role="ref"}

2.  Add the necessary annotations to these methods for them to both live
    at the path `/events/edit`.

    1.  Judging by the names of the handlers, which should handle `GET`
        requests and which should handle `POST` requests?
    2.  Remember, we've configured `@RequestMapping` with a URL segment
        on the controller class already.
    3.  You'll need to configure the route for `displayEditForm` to
        include the path variable `eventId`, so that paths like
        `/events/edit/3` will work.

3.  Create an `edit.html` view template in `resources/templates/events`.

4.  Copy the code from `create.html` into `edit.html`.

    1.  You\'ll want to update the text of the submit button to reflect
        the edit functionality.

5.  Back in the `displayEditForm` handler, round out the controller
    method.

    1.  Use an `EventData` method to find the event object with the
        given `eventId`.
    2.  Put the event object in the `model` with `.addAttribute()`.
    3.  Return the appropriate template string.

    `Check your solution <model-classes-exercise-solutions5>`{.interpreted-text
    role="ref"}

6.  Within the form fields in `edit.html`,

    1.  Get the name and description from the event that was passed in
        via the `model` and set them as the values of the form fields.
    2.  Add `th:action="@{/events/edit}"` to the `form` tag.

7.  Add another input to hold the id of the event being edited. This
    should be hidden from the user:

    ``` html
    <input type="hidden" th:value="${event.id}" name="eventId" />
    ```

8.  Back in the `displayEditForm` handler, add a title to `model` that
    reads "Edit Event NAME (id=ID)" where NAME and ID are replaced by
    the values for the given event.

9.  In `processEditForm`,

    1.  Query `EventData` for the event being edited with the given id
        parameter.
    2.  Update the name and description of the event with the
        appropriate model setter methods.
    3.  Redirect the user to `/events` (the event listing page).

    `Check your solution <model-classes-exercise-solutions9>`{.interpreted-text
    role="ref"}

10. To access event editing, the user will need an edit option in the
    list of event data.

    1.  In `resources/templates/events/index.html`, add a link in a new
        table column to edit the event:

        ``` {.html linenos=""}
        <td>
           <a th:href="@{/events/edit/{id}(id=${event.id})}">Edit</a>
        </td>
        ```
