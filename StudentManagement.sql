CREATE DATABASE StudentManagement;

USE StudentManagement;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Gender CHAR(1),
    Age INT,
    Grade VARCHAR(2),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);

INSERT INTO Students
(Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Aman', 'M', 18, 'A', 85, 90, 88),
('Riya', 'F', 19, 'B', 78, 82, 80),
('Karan', 'M', 17, 'A', 92, 89, 95),
('Sneha', 'F', 18, 'C', 67, 70, 72),
('Rahul', 'M', 20, 'B', 74, 76, 79),
('Priya', 'F', 19, 'A', 88, 91, 85),
('Arjun', 'M', 18, 'B', 81, 77, 84),
('Neha', 'F', 17, 'A', 95, 93, 96),
('Vikas', 'M', 19, 'C', 60, 65, 70),
('Pooja', 'F', 18, 'B', 83, 87, 82);

SELECT * FROM Students;

SELECT
AVG(MathScore) AS AvgMath,
AVG(ScienceScore) AS AvgScience,
AVG(EnglishScore) AS AvgEnglish
FROM Students;

SELECT *,
(MathScore + ScienceScore + EnglishScore) AS Total
FROM Students
ORDER BY Total DESC
LIMIT 1;

SELECT Grade, COUNT(*) AS StudentCount
FROM Students
GROUP BY Grade;

SELECT Gender,
AVG(MathScore) AS AvgMath
FROM Students
GROUP BY Gender;

SELECT *
FROM Students
WHERE MathScore > 80
ORDER BY MathScore DESC;

UPDATE Students
SET Grade = 'A'
WHERE Name = 'Rahul';

SELECT * FROM Students WHERE Name='Rahul';