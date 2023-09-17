-- QUERY CON JOIN

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.*, `degrees`.`name` AS `nome_corso`
FROM `students`
INNER JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

-- Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.*, `departments`.`name` AS `nome_dipartimento` 
FROM `degrees`
INNER JOIN `departments` ON `departments`.id = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Neuroscienze"
AND `degrees`.`level` = "Magistrale";

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `courses`.*, `teachers`.`name` AS `nome_professore`, `teachers`.`surname` AS `cognome_professore` 
FROM `courses`
INNER JOIN `teachers` ON `teachers`.`id` = `courses`.`id`
WHERE `teachers`.`id` = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname` AS `cognome_studente`, `students`.`name` AS `nome_studente`, `degrees`.*, `departments`.`name` AS `nome_dipartimento`
FROM `students`
INNER JOIN `degrees` ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`  
ORDER BY `cognome_studente` ASC, `nome_studente` ASC;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `courses`.*, `teachers`.`name` AS `nome_professore`, `teachers`.`surname` as `cognome_professore`, `degrees`.`name` AS `nome_corso_di_laurea`
FROM `degrees`
INNER JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.*, `departments`.`name` AS `nome_dipartimento`
FROM `courses`
INNER JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers` ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `degrees` ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `departments` ON `departments`.`id` = `degrees`.`department_id`
WHERE `departments`.`name` = "Dipartimento di Matematica";

-- Selezionare per ogni studente il numero di tentativi sostenuti per ogni esame, stampando anche il voto massimo. Successivamente, filtrare i tentativi con voto minimo 18.

-- INCOMPLETE, MAYBE MISUNDERSTOOD?
SELECT COUNT(*), `exam_student`.`student_id`, `exam_student`.`exam_id`
FROM `exam_student`
GROUP BY `exam_student`.`student_id`, `exam_student`.`exam_id`;

-- QUERY CON GROUP BY

-- Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`students`.`id`), YEAR(`students`.`enrolment_date`)
FROM `students`
GROUP BY YEAR(`students`.`enrolment_date`);

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT COUNT(`teachers`.`office_address`), `teachers`.`office_address`
FROM `teachers`
GROUP BY `teachers`.`office_address`;

-- Calcolare la media dei voti di ogni appello d'esame

SELECT AVG(`exam_student`.`vote`) AS `media_esame`, `exam_student`.`exam_id`
FROM `exam_student`
GROUP BY `exam_student`.`exam_id`;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT COUNT(*) AS `numero_corsi_di_laurea`, `departments`.`name` AS `dipartimento`
FROM `degrees`
INNER JOIN `departments` ON `degrees`.`department_id` = `departments`.`id`
GROUP BY `degrees`.`department_id`;