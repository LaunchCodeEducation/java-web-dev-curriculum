---
title: "Task 4: Setting Up a Many-to-Many Relationship"
date: 2023-01-03T10:42:56-06:00
draft: false
weight: 5
originalAuthor: John Woolbright # to be set by page creator
originalAuthorGitHub: jwoolbright23 # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: Sally Steuterman # update any time edits are made after review
lastEditorGitHub: gildedgardenia # update any time edits are made after review
lastMod: 2023-08-01 # UPDATE ANY TIME CHANGES ARE MADE
---

Using a many-to-many relationship, we can now use the `Skill` object to store a `Job` object's skills. At the moment,
a job can have many skills listed as strings. In this section, you'll be tasked with changing this field type to be a list
of skills. Just as a job requires many skills, any skill can be associated with several jobs. With this in mind, you'll also
add a list of jobs as a field onto the skill class.

{{% notice orange Warning "rocket" %}}
As before, there are a few tests in `TestTaskFour` that have been commented out because they depend on the code you wrote in Part 1. Open `TestTaskFour` in IntelliJ and find these tests. For each one:

1. Select the entire commented-out method.
1. Uncomment the method by using `cmd+/` on Mac or `ctrl+/` on Windows. If you do not uncomment these tests, your code will not pass the autograder.
{{% /notice %}}

## `Skill.jobs`

1. In your `Skill` class, add a jobs field.
- What type should this field be? Initialize it in the field declaration accordingly.
- Add a getter and setter for the field.
- This field has a many-to-many type relationship with skills. You'll need to add the `@ManyToMany` annotation with an argument `mappedBy="skills"` to configure this mapping.

## Refactor `Job.skills`

1. Update your `Job` model class to fit its many-to-many relationship with skills.
- `Job.skills` already exists. What needs to change and/or be added to map this relationship?
- Be sure to check the whole class for any necessary type updates.

## Updating `HomeController`, Again

You next need to wire `HomeController` with the skills data in order to add skills objects to a new job.
This will look almost precisely like what you have done for employer data above. Refer back to [that section]({{% relref "../part-three/index.md#updating-homecontroller" %}}) to inject the controller with skill data.

There is, however, one difference to keep in mind. The job form being processed only accepts one employer by an `id` field. Many skills can be added to a single job, though. Here's what we'll say about how to send the right skills along with the job form.

1. The code for the view has already been written. Look in `templates/add.html`. You'll see a form-group section that iterates over available skills data and renders a checkbox for each skill. Each checkbox input contains an attribute `name="skills"`.
2. You'll need to pass in that attribute value to `processAddJobForm` in `HomeController` as a `@RequestParam`.

```java
@RequestParam List<Integer> skills
```

3. Then, to get the skills data from a list of ids (rather than a single id as we did with employer), use the `CrudRepository` method `.findAllById(ids)`.

```java
List<Skill> skillObjs = (List<Skill>) skillRepository.findAllById(skills);
newJob.setSkills(skillObjs);
```

{{% notice blue Note "rocket" %}}
As with a job's employer, you only need to query your database for skills if the job model is valid.
{{% /notice %}}

## It's Your Job, List It and Re-Search It

You now have all the tools in place to re-implement the list and search views from [TechJobs MVC]({{% relref "../../techjobs-mvc/_index.md" %}}).

1. In the `ListController` class, add fields for `EmployerRepository ` and `SkillRepository`, both annotated with `@Autowired`.
1. You'll also need to pass the employer and skill data from those repositories into the view template rendered at `list/`. Add the right `model.addAttribute(name, value)` statements to pass this info into `templates/list.html`.

## Test It with SQL

Run your application and make sure you can create a new job with an employer and several skills. You should now also have restored
full list and search capabilities.

1 **SQL TASK:** In `queries.sql` under "Part 4", write a query to return the names of all skills that are attached to jobs in alphabetical order. If a skill does not have a job listed, it should not be included in the results of this query.

When everything works, you’re done! Congrats!
