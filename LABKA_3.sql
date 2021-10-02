--1.

--a.
SELECT * FROM course
WHERE credits > 3;
--b.
SELECT * FROM classroom
WHERE building = 'Watson' OR building = 'Packard';
--c.
SELECT * FROM course
WHERE dept_name = 'Comp. Sci.';
--d.
SELECT course.course_id, title, semester FROM course, section
WHERE course.course_id = section.course_id AND semester = 'Fall';
--e.
SELECT id, name, tot_cred FROM student
WHERE tot_cred BETWEEN 45 AND 90;
--f.
--These letters are vowels in English: A, E, I, O, U, and sometimes Y and W.
SELECT name FROM student
WHERE name LIKE '%a'
OR name LIKE '%e'
OR name LIKE '%i'
OR name LIKE '%o'
OR name lIKE '%u';
--OR name LIKE '%y'
--OR name LIKE '%w';
--g.
SELECT course.course_id, title, prereq_id FROM course, prereq
WHERE course.course_id = prereq.course_id AND prereq_id = 'CS-101';

--2.

--a.
SELECT dept_name, avg (salary)
FROM instructor
GROUP BY dept_name
ORDER BY avg(salary);
--b.
--c.
--d.
--e.
SELECT name, dept_name FROM instructor
WHERE dept_name = 'Biology'
or dept_name = 'Philosophy'
or dept_name = 'Music';
--f.
SELECT DISTINCT id
FROM teaches
WHERE year = 2018 and id NOT IN
(SELECT id FROM teaches WHERE year= 2017);

--3.

--a.
SELECT DISTINCT name
FROM student, takes
WHERE dept_name = 'Comp. Sci.' AND grade LIKE 'A%' AND student.id = takes.id;
--b.
--c.
--d.
--e.
SELECT DISTINCT time_slot.time_slot_id, title
FROM time_slot, course, section
WHERE end_hr < 13 AND section.time_slot_id = time_slot.time_slot_id AND course.course_id = section.course_id
ORDER BY time_slot.time_slot_id;
