--BONUS

--1 Contare quanti iscritti ci sono stati ogni anno

SELECT YEAR(`enrolment_date`), COUNT(*) AS "totale_iscritti_ogni_anno"
FROM `students`
GROUP BY YEAR(`enrolment_date`)
ORDER BY YEAR(`enrolment_date`) ASC;

--2 Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(*) AS "n_insegnanti_stesso_edificio"
FROM `teachers`
GROUP BY `office_address` 
ORDER BY `n_insegnanti_stesso_edificio` ASC;

--3 Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG (`vote`) AS "media_voti"
FROM `exam_student`
GROUP BY `exam_id`

--4 Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id` , COUNT(*) AS "n_corsi"
FROM `degrees`
GROUP BY `department_id`
ORDER BY `n_corsi` DESC;


