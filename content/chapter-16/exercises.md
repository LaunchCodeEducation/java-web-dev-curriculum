# Exercises: Enum Practice {#enums-exercises}

1.  Fork and clone
    [enumerable-planets](https://github.com/LaunchCodeEducation/enumerable-planets).

2.  Use the *Get from Version Control* option to open the project in
    IntelliJ.

3.  In the project, create a data package.

4.  Create a new public enum called `Planets`.

    ``` java
    public enum Planets {
       // list the planets here.
       // Mercury, Venus, Earth, Mars, Jupiter,
       // Saturn, Uranus, Neptune
       // Don't forget to capitalization convention and enum 
       // syntax to separate value and end the list
    }
    ```

5.  Before adding any other fields to `Planets`, go to
    `PlanetController` and update the index handler to pass in a `Model`
    class argument (eg. `Model model`).

    `Check your solution <enums-exercise-solutions5>`{.interpreted-text
    role="ref"}

6.  Use `.addAttribute` to add the planet values to the model.

7.  In `templates/index`, create a list element and use the template
    variable you have just defined in the controller to list all of the
    planet values on the page.

    `Check your solution <enums-exercise-solutions7>`{.interpreted-text
    role="ref"}

8.  Add a `name` field to the planets.

    a.  Create a name property to display a non-capitalized version of
        each of the planet names.
    b.  Add a constructor with the name field and a getter for the
        field.

9.  Update the template to display the planet names.

    `Check your solution <enums-exercise-solutions9>`{.interpreted-text
    role="ref"}

10. Back in the `Planets` enum, add a new field called `yearLength`.

    1.  The value of each `yearLength` should be the number of earth
        days of a year on the given planet.
        1.  Number of earth days on each planet:
            1.  Mercury: 88
            2.  Venus: 225
            3.  Earth: 365
            4.  Mars: 687
            5.  Jupiter: 4333
            6.  Saturn: 10759
            7.  Uranus: 30687
            8.  Neptune: 60200
    2.  Update the constructor and add a getter for this field.

11. Change the index template to display a table of each planet name and
    its year in earth days.

    1.  In `templates/index`, create a table element and add the
        appropriate bootstrap class.
    2.  The table can be styled to your liking.
    3.  Add a message to let the users know what data you are displaying
        with the `yearLength` field.

    `Check your solution <enums-exercise-solutions11>`{.interpreted-text
    role="ref"}

12. If you wish, add another field to `Planets`. You can find plenty of
    information on [NASA\'s web
    site](https://solarsystem.nasa.gov/planets/overview/).

    1.  Update the enum with the new field, including changing the
        constructor and adding a getter method.
    2.  Add the field to display in the table, with a message if helpful
        to convey the information or units of measure.
