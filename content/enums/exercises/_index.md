---
title: "Exercises: Enum Practice"
date: 2021-10-01T09:28:27-05:00
draft: false
weight: 2
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer:  Sally Steuterman # to be set by the page reviewer
reviewerGitHub:  gildedgardenia # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

1. Fork and clone [EnumerablePlanets](https://github.com/LaunchCodeEducation/EnumerablePlanets).

2. Use the *Get from Version Control* option to open the project in IntelliJ.

3. In the project, create a data package.

4. Create a new public enum called `Planets`.

```java {linenos=true}
public enum Planets {
   // list the planets here.
   // Mercury, Venus, Earth, Mars, Jupiter,
   // Saturn, Uranus, Neptune
   // Don't forget to capitalization convention and enum 
   // syntax to separate value and end the list
}
```

5. Before adding any other fields to `Planets`, go to `PlanetController`
   and update the index handler to pass in a `Model` class argument (e.g. `Model model`). 

   {{% expand "Check Your Solution" %}}
   ```java
   @GetMapping()
   public String displayIndex(Model model) {
      model.addAttribute("planets", Planets.values());
      return "index";
   }
   ```
   {{% /expand %}}

6. Use `.addAttribute` to add the planet values to the model.

7. In `templates/index`, create a list element and use the template
   variable you have just defined in the controller to list all of the 
   planet values on the page.

   {{% expand "Check Your Solution" %}}
   ```java
   <ol>
      <li th:each="planet : ${planets}" th:text="${planet}"></li>
   </ol>
   ```
   {{% /expand %}}

8. Add a `name` field to the planets.

   1. Create a name property to display a non-capitalized version of each of the planet names.
   1. Add a constructor with the name field and a getter for the field.

9. Update the template to display the planet names.

   {{% expand "Check Your Solution" %}}
   ```java
   <ol>
      <li th:each="planet : ${planets}" th:text="${planet.name}"></li>
   </ol>
   ```
   {{% /expand %}}

10. Back in the `Planets` enum, add a new field called `yearLength`.

    1. The value of each `yearLength` should be the number of earth days of a year on the given planet.

       - Number of earth days on each planet:
         - Mercury: 88
         - Venus: 225
         - Earth: 365
         - Mars: 687
         - Jupiter: 4333
         - Saturn: 10759
         - Uranus: 30687
         - Neptune: 60200

    1. Update the constructor and add a getter for this field.

11. Change the index template to display a table of each planet name and its year in earth days.

    1. In `templates/index`, create a table element and add the appropriate bootstrap class.
    1. The table can be styled to your liking. 
    1. Add a message to let the users know what data you are displaying with the `yearLength` field.

   {{% expand "Check Your Solution" %}}
   ```java
   <table th:each="planet : ${planets}" class="table table-striped">
      <thead >
         <tr>
            <th th:text="${planet.name}">
            </th>
         </tr>
      </thead>
      <tr>
         <td th:text="${planet.yearLength} + ' Earth days in one year.'"></td>
      </tr>
   </table>
   ```
   {{% /expand %}}

12. If you wish, add another field to `Planets`. You can find plenty of information on [NASAs web site](https://solarsystem.nasa.gov/planets/overview/).

    1. Update the enum with the new field, including changing the constructor and adding a getter method.
    1. Add the field to display in the table, with a message if helpful to convey the information or units of measure.