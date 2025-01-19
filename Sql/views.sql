---Student Performance Overview
CREATE VIEW vw_StudentPerformanceOverview AS
SELECT 
    s.StudentID,
    s.FirstName || ' ' || s.LastName AS StudentName,
    c.CourseName,
    t.FirstName || ' ' || t.LastName AS TeacherName,
    AVG(f.Grade) AS AverageGrade,
    AVG(f.BehaviorScore) AS AverageBehaviorScore
FROM FactStudentPerformance f
JOIN DimStudent s ON f.StudentID = s.StudentID
JOIN DimCourse c ON f.CourseID = c.CourseID
JOIN DimTeacher t ON f.TeacherID = t.TeacherID
GROUP BY s.StudentID, s.FirstName, s.LastName, c.CourseName, t.FirstName, t.LastName;

---Course Performance Summary
CREATE VIEW vw_CoursePerformanceSummary AS
SELECT 
    c.CourseID,
    c.CourseName,
    c.Department,
    AVG(f.Grade) AS AverageGrade,
    COUNT(DISTINCT f.StudentID) AS NumberOfStudents
FROM FactStudentPerformance f
JOIN DimCourse c ON f.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName, c.Department;

---Teacher Performance Overview
CREATE VIEW vw_TeacherPerformanceOverview AS
SELECT 
    t.TeacherID,
    t.FirstName || ' ' || t.LastName AS TeacherName,
    t.Department,
    AVG(f.Grade) AS AverageStudentGrade,
    COUNT(DISTINCT f.StudentID) AS NumberOfStudents
FROM FactStudentPerformance f
JOIN DimTeacher t ON f.TeacherID = t.TeacherID
GROUP BY t.TeacherID, t.FirstName, t.LastName, t.Department;
