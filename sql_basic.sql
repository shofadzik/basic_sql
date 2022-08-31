CREATE TABLE adzik (
person_id int,
last_name varchar(255), --(255) ini karakter
first_name varchar(255),
phone_number int,
created_at timestamp);

INSERT INTO adzik --fungsinya menambah di baris baru
(person_id, last_name, first_name, phone_number, created_at)
VALUES 
(1,'Umar', 'Zain',120289, NOW()),
(5,'Ahmad', 'Ali',737283, NOW())
;

ALTER TABLE adzik --tambah kolom email
ADD email varchar(255);

ALTER TABLE adzik --tambah kolom salary
ADD salary int;

ALTER TABLE adzik --tambah kolom gender
ADD gender char;

ALTER TABLE adzik --tambah kolom job
ADD job char;

ALTER TABLE adzik --hapus kolom email
DROP COLUMN email;

UPDATE adzik --mengupdate atau mengganti lastname dan firstname dari person id 1 pada table
SET
last_name = 'Alfred Schmidt',
first_name= 'Frankfurt'
WHERE person_id = 1;

UPDATE adzik --mengupdate atau mengganti salary dari person id 1 pada table
SET
salary = 5000000
WHERE person_id = 5;

UPDATE adzik --mengupdate atau mengganti job dari person id 1 pada table
SET
job = 'guru'
WHERE person_id = 1;

UPDATE adzik --mengupdate atau mengganti gender dari person id 1 pada table
SET
gender = 'L'
WHERE person_id = 1;

SELECT first_name, last_name --hanya memilih(menampilkan) kolom firstname dan lastname
FROM adzik;

SELECT * --menampilkan semua kolom
FROM adzik;

TRUNCATE TABLE adzik; --hanya menghapus isi tabel, tabel masih ada

DROP TABLE adzik; --menghapus semua tabel

-- SQL COMMANDs

SELECT * FROM adzik --hanya menampilkan person_id=1 dari tabel (filter)
WHERE person_id = 1;

SELECT * FROM adzik --hanya menampilkan lastname yang ada hruf A nya disemua dari tabel(filter)
WHERE last_name LIKE '%A%'; --%A = a dibelakang, A% = a nya didepan

SELECT count(salary) from --menghitug jumlah data (jumlah baris)
adzik WHERE gender = 'L';

SELECT sum(salary) from --menghitung jumlah salary (total gaji semua)
adzik WHERE gender = 'L';

SELECT job, sum(salary) from --menampilka job dan jumlah gaji dari gender L
adzik WHERE gender = 'L'
GROUP BY job
ORDER BY job desc;

--hasilnya darii program diatas yaitu pns=sum 5m, karyawan=sum 4m, guru=sum 1m

SELECT MAX(salary) from --mencari nilai max pada person id 2
adzik WHERE person_id = '2';

SELECT MIN(salary) FROM
adzik WHERE person_id = '2';