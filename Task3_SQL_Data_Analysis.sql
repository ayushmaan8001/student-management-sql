USE StudentManagement;

-- 1. Top student per course
SELECT
    c.CourseName,
    s.Name,
    e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE (e.CourseID, e.Grade) IN (
    SELECT CourseID, MAX(Grade)
    FROM Enrollments
    GROUP BY CourseID
);

-- 2. Pass rate per course
SELECT
    c.CourseName,
    ROUND(
        SUM(CASE WHEN e.Grade >= 40 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*), 2
    ) AS PassRate
FROM Enrollments e
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseName;

-- 3. Overall topper across all courses
SELECT
    s.Name,
    AVG(e.Grade) AS AvgGrade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.Name
ORDER BY AvgGrade DESC
LIMIT 1;

-- 4. Students enrolled in multiple courses
SELECT
    s.Name,
    COUNT(e.CourseID) AS TotalCourses
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
GROUP BY s.Name
HAVING COUNT(e.CourseID) > 1;