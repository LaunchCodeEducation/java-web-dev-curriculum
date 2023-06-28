---
title: "Exercises: Objects and Classes Part 2"
date: 2023-06-14T16:06:05-05:00
draft: false
weight: 3
originalAuthor: <no value> # to be set by page creator
originalAuthorGitHub: <no value> # to be set by page creator
reviewer: # to be set by the page reviewer
reviewerGitHub: # to be set by the page reviewer
lastEditor: # update any time edits are made after review
lastEditorGitHub: # update any time edits are made after review
lastMod: # UPDATE ANY TIME CHANGES ARE MADE
---

Work on these exercises in the IntelliJ `java-web-dev-projects/classes-part-two/exercises` project. You will update your `Student.java` file by implementing the `addGrade` and `getGradeLevel` methods that were sketched out in the [Instance Methods]({{< relref "../reading/instance-and-static-methods/_index.md" >}}) section.

## 1. The `getGradeLevel` Method

This method returns the student’s level based on the number of credits they have earned: Freshman (0-29 credits), Sophomore (30-59 credits), Junior (60-89 credits), or Senior (90+ credits).

{{% expand "Check your solution" %}}
```java
public static String getGradeLevel(int credits) {
   if (credits <= 29){
      return "freshman";
   } else if (credits <= 59){
      return "sophomore";
   } else if (credits <= 89) {
      return "junior";
   } else {
      return "senior";
   }
}
```
{{% /expand %}}

## 2. The `addGrade` Method

This method accepts two parameters—a number of course credits and a numerical grade (0.0-4.0). With this data, you need to update the student’s GPA.

### GPA Information
GPA is computed via the formula:

   >  gpa = (total quality score) / (total number of credits)

   1. The quality score for a class is found by multiplying the letter grade score (0.0-4.0) by the number of credits.

   1. The total quality score is the sum of the quality scores for all classes.

For example, if a student received an “A” (worth 4 points) in a 3-credit course and a “B” (worth 3 points) in a 4-credit course, their total quality score would be: 4.0 * 3 + 3.0 * 4 = 24. Their GPA would then be 24 / 7 = 3.43.

### Determine the New GPA

To update the student’s GPA:

   1. Calculate their current total quality score by using the formula `gpa * numberOfCredits`.
   1. Use the new course grade and course credits to update their total quality score.
   1. Update the student’s total `numberOfCredits`.
   1. Compute their new GPA.

{{% expand "Check your solution" %}}
```java{linenos=table,hl_lines=[],linenostart=1}
public void addGrade(int courseCredits, double grade) {
   double totalQualityScore = this.gpa * this.numberOfCredits;
   totalQualityScore += courseCredits * grade;
   this.numberOfCredits += courseCredits;
   this.gpa = totalQualityScore/this.numberOfCredits;
}
```
{{% /expand %}}

## 3. `toString` and `equals`
Add custom equals() and toString() methods to the Student class.

{{% expand "Check your solution" %}}

```java{linenos=table,hl_lines=[],linenostart=1}
public String toString() {
   
   String studentReport = String.format("%s is a %s with %d credits and a GPA of %.2f", this.name, this.getGradeLevel(this.numberOfCredits), this.getNumberOfCredits(), this.getGpa());
   return studentReport;
}

public boolean equals(Object toBeCompared) {
   if (toBeCompared == this) {
      return true;
   }

   if (toBeCompared == null) {
      return false;
   }

   if (toBeCompared.getClass() != getClass()) {
      return false;
   }

   Student theStudent = (Student) toBeCompared;
   return theStudent.getStudentId() == getStudentId();
}
```
{{% /expand %}}

<!-- TODO: Update link when classes has been merged -->
Add custom `equals()` and `toString()` methods to the `Course` class which you started in the exercises for the [previous chapter].