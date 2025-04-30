CREATE DATABASE IF NOT EXISTS track_grades

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT null,
    class VARCHAR(50) NOT null
);

CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT null
);

CREATE TABLE grades (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject_id INT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);

INSERT INTO students (name, class) 
VALUES 
('Menna', 'A'),
('Noran', 'B'),
('Jana', 'C');

INSERT INTO subjects (name) 
VALUES 
('OOP'),
('DSP'),
('OS');

INSERT INTO grades (student_id, subject_id, grade) 
VALUES 
(1, 1, 50.5),
(1, 2, 90.0),
(1, 3, 78.0),
(2, 1, 40.5),
(2, 2, 92.0),
(2, 3, 80.0),
(3, 1, 91.0),
(3, 2, 85.0),
(3, 3, 95.0);

-- Get the average grade for each student
SELECT students.name , AVG(grades.grade)
FROM students JOIN grades
ON students.id = grades.student_id
GROUP BY students.id

-- Get the highest and lowest grades in each subject
SELECT subjects.name , MAX(grades.grade) AS highest , MIN(grades.grade) AS lowest
FROM subjects JOIN grades
ON subjects.id = grades.subject_id
GROUP BY subjects.name 

-- List all students who scored more than 85 in any subject
SELECT students.name , grades.grade ,subjects.name
FROM students JOIN grades 
ON students.id = grades.student_id
JOIN subjects
ON subjects.id = grades.subject_id
WHERE grades.grade > 85;