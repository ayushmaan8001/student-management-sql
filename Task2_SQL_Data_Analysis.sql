USE StudentManagement;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE Enrollments;
TRUNCATE TABLE Courses;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Courses (CourseName)
VALUES
('SQL'),
('Python'),
('Data Analytics');

INSERT INTO Enrollments (StudentID, CourseID, Grade)
VALUES
(1,1,85),
(2,1,78),
(3,1,92),
(4,1,35),
(5,1,74),
(6,2,88),
(7,2,81),
(8,2,95),
(9,2,30),
(10,2,83),
(1,3,90),
(3,3,89),
(6,3,91),
(8,3,93),
(10,3,87);

SELECT * FROM Courses;

SELECT * FROM Enrollments;

SELECT
    s.Name,
    c.CourseName,
    e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
ORDER BY c.CourseName;

SELECT
    c.CourseName,
    AVG(e.Grade) AS AverageGrade
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;

SELECT
    s.Name,
    AVG(e.Grade) AS AvgGrade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.Name
ORDER BY AvgGrade DESC
LIMIT 3;

SELECT
    COUNT(*) AS FailedStudents
FROM Enrollments
WHERE Grade < 40;