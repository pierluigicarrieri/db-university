-- Selezionare tutti gli studenti nati nel 1990:

SELECT * 
FROM `students` 
WHERE YEAR(`date_of_birth`) = 1990;

-- Selezionare tutti i corsi che valgono più di 10 crediti:

SELECT * 
FROM `courses` 
WHERE `cfu` > 10;

-- Selezionare tutti gli studenti che hanno più di 30 anni;

SELECT *, DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(`date_of_birth`, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(`date_of_birth`, '00-%m-%d')) AS age 
FROM `students` 
WHERE DATE_FORMAT(NOW(), '%Y') - DATE_FORMAT(`date_of_birth`, '%Y') - (DATE_FORMAT(NOW(), '00-%m-%d') < DATE_FORMAT(`date_of_birth`, '00-%m-%d')) >= 30;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea;

SELECT * 
FROM `courses` 
WHERE `period`= "I semestre" 
AND `year` = 1;

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020

SELECT * 
FROM `exams`
WHERE `date` = "2020-06-20" 
AND `hour` >= "14:00:00";

-- Selezionare tutti i corsi di laurea magistrale

SELECT * 
FROM `degrees` 
WHERE `level`= "magistrale";

-- Da quanti dipartimenti è composta l'università?

SELECT COUNT(*) 
FROM `departments`;

-- Quanti sono gli insegnanti che non hanno un numero di telefono?

SELECT COUNT(*) 
FROM `teachers`
WHERE `phone` IS NULL;