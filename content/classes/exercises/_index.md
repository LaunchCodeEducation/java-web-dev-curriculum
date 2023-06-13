---
title: "Exercises"
date: 2023-01-23T13:36:52-06:00
draft: false
weight: 2
originalAuthor: Sally Steuterman # to be set by page creator
originalAuthorGitHub: gildedgardenia # to be set by page creator
reviewer: Kimberly Horan # to be set by the page reviewer
reviewerGitHub: codinglikeagirl42 # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

## Classes and Objects

Work on these exercises in the IntelliJ `java-web-dev-exercises` project.

{{% notice blue Note "rocket" %}}
If you have not already cloned the `java-web-dev-exercises` project repository you can find it here: [Java Web Dev Projects Repository](https://github.com/LaunchCodeEducation/java-web-dev-projects-17)
{{% /notice %}}

1. Open up the file, `Student.java`, and add all of the necessary getters and setters. Think about the access level each field and method should have, and try reducing the access level of at least one setter to less than public.

{{% expand "Check Your Solution" %}}
```java
public void setName(String name) {
   this.name = name;
}

public void setStudentId(int studentId) {
   this.studentId = studentId;
}

public void setGpa(double gpa) {
   this.gpa = gpa;
}

private void setNumberOfCredits(int numberOfCredits) {
   this.numberOfCredits = numberOfCredits;
}

public String getName() {
   return name;
}

public int getStudentId() {
   return studentId;
}

public int getNumberOfCredits() {
   return numberOfCredits;
}

public double getGpa() {
   return gpa;
}
```
{{% /expand %}}

2. Instantiate the `Student` class using yourself as the student. For the `numberOfCredits` give yourself `1` for this class and a GPA of `4.0` because you are a Java superstar!

3. In the `school` package, create a class `Course` with at least three fields. Before diving into IntelliJ, try using pen and paper to work through what these might be. At least one of your fields should be an `ArrayList` or `HashMap`, and you should use your `Student` class.

{{% expand "Check Your Solution" %}}
```java
public class Course {
   private String topic;
   private Teacher instructor;
   private ArrayList<Student> enrolledStudents;
}
```
{{% /expand %}}

4. In the `school` package, create a class `Teacher` with four fields: `firstName`, `lastName`, `subject`, and `yearsTeaching`. Add getters and setters to the class and add the access level to each field and method in the class. When adding your getters and setters, think about what we read about in the section on Encapsulation.

1. What access modifier restricts access the most for what we need?

1. If it is a field, could we restrict the access to `private` and use getters and setters?

1. If we do set fields to `private`, what access level do we have to give our getters and setters?