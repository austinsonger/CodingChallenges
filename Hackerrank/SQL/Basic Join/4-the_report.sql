/*
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

Grades contains three columns Grade, Min_Mark and Max_Mark.

Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't 
want the NAMES of those students who received a grade lower than 8. The report must be in descending order 
by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade 
(8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the 
grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If 
there is more than one student with the same grade (1-7) assigned to them, order those particular students 
by their marks in ascending order.

Write a query to help Eve.
*/

select name, grade, marks from students join grades on marks between min_mark and max_mark 
and grade >= 8 order by grade desc, name;
select NULL, grade, marks from students join grades on marks between min_mark and max_mark 
and grade < 8 order by grade desc, marks;
