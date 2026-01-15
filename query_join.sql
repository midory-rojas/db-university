--Query con JOIN

--1 Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.*,`degrees`.name AS `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `degrees`.`id`= `students`.`degree_id`
WHERE `degrees`.`name`= "Corso di Laurea in Economia"
ORDER BY `name`ASC

--2 Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.*, `departments`.name 
FROM `degrees`
INNER JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.name = "Dipartimento di Neuroscienze"
AND `degrees`.level = "magistrale";

--3 Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.*, `courses`.name
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`. `id`= `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `teachers`.`id`= 44


--4 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e ilrelativo dipartimento, 
--in ordine alfabetico per cognome e nome

SELECT `students`.id AS "student_id",`students`.name AS "student_name", `students`.surname AS "student_surname", `degrees`.name AS "course", `departments`.name AS "department"
FROM `students`
INNER JOIN `degrees`
ON `students`.`degree_id`= `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id`= `departments`.`id`
ORDER BY `student_name`ASC, `student_surname`ASC


--5 Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.* , `courses`.name AS “couses_name“, `teachers`.name AS “teachers_name“, `teachers`.surname AS “teachers_surname“
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id`= `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id`= `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `teachers`.`id`= `course_teacher`. `teacher_id`


--6 Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.`name`AS `teacher_name`,`teachers`.`surname` AS`teacher_surname`, `departments`.`name` AS `department_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id`= `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id`= `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `courses`.`degree_id`=`degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
WHERE `departments`.`name` = "Dipartimento di Matematica"


--7 BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto persuperare ciascuno dei suoi esami