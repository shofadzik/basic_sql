CREATE TABLE adzik (
person_id int,
last_name varchar(255), 
first_name varchar(255),
phone_number int,
created_at timestamp);

INSERT INTO adzik 
(person_id, last_name, first_name, phone_number, created_at)
VALUES 
(1,'Umar', 'Zain',120289, NOW()),
(5,'Ahmad', 'Ali',737283, NOW())
;

ALTER TABLE adzik 
ADD email varchar(255);

ALTER TABLE adzik 
ADD salary int;

ALTER TABLE adzik 
ADD gender char;

ALTER TABLE adzik 
ADD job char;

ALTER TABLE adzik 
DROP COLUMN email;

UPDATE adzik 
SET
last_name = 'Alfred Schmidt',
first_name= 'Frankfurt'
WHERE person_id = 1;

UPDATE adzik 
SET
salary = 5000000
WHERE person_id = 5;

UPDATE adzik
SET
job = 'guru'
WHERE person_id = 1;

UPDATE adzik 
SET
gender = 'L'
WHERE person_id = 1;

SELECT first_name, last_name 
FROM adzik;

SELECT * 
FROM adzik;

TRUNCATE TABLE adzik; 

DROP TABLE adzik; 

-- SQL COMMANDs

SELECT * FROM adzik 
WHERE person_id = 1;

SELECT * FROM adzik 
WHERE last_name LIKE '%A%';

SELECT count(salary) from 
adzik WHERE gender = 'L';

SELECT sum(salary) from 
adzik WHERE gender = 'L';

SELECT job, sum(salary) from 
adzik WHERE gender = 'L'
GROUP BY job
ORDER BY job desc;


SELECT MAX(salary) from 
adzik WHERE person_id = '2';

SELECT MIN(salary) FROM
adzik WHERE person_id = '2';