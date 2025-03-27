
USE test_db;

CREATE TABLE IF NOT EXISTS student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS grade (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    grade INT
);

-- Якщо в обох таблицях є ім'я John

-- Додавання даних
INSERT INTO student (name, age, department) VALUES
('John', 22, 'Computer Science'),
('Jane', 21, 'Engineering'),
('Alice', 23, 'Mathematics'),
('Bob', 24, 'Mathematics'),
('Emily', 22, 'Engineering');



INSERT INTO grade (name, grade) VALUES
('John', 100),
('Jane', 65),
('Alice', 98),
('Bob', 73),
('Emily', 88);


SELECT *
FROM student LEFT JOIN grade USING (name)
WHERE grade.name = 'John';

SELECT *
FROM student JOIN grade USING (name)
WHERE grade.name = 'John';

-- результати не змінились
-- випадок, коли в одній з таблиць нема імені John

DELETE FROM grade 
WHERE name = 'John';

SELECT *
FROM grade;

SELECT *
FROM student;

---------------

SELECT *
FROM student LEFT JOIN grade USING (name)
WHERE grade.name = 'John';

SELECT *
FROM student JOIN grade USING (name)
WHERE grade.name = 'John';

-- таблиці порожні

-- якби не було умови where

SELECT *
FROM student LEFT JOIN grade USING (name);

-- для студента John колонки, що відповідають його імені 
-- в таблиці балів, порожні

SELECT *
FROM student JOIN grade USING (name);
-- тут немає рядка з іменем John

