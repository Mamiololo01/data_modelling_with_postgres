----Get Student Performance---------
CREATE OR REPLACE FUNCTION get_student_performance(p_student_id INT)
RETURNS TABLE (
    CourseName VARCHAR(100),
    Grade DECIMAL(3,1),
    BehaviorScore INT,
    TeacherName VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.CourseName,
        f.Grade,
        f.BehaviorScore,
        t.FirstName || ' ' || t.LastName AS TeacherName
    FROM FactStudentPerformance f
    JOIN DimCourse c ON f.CourseID = c.CourseID
    JOIN DimTeacher t ON f.TeacherID = t.TeacherID
    WHERE f.StudentID = p_student_id;
END;
$$
 LANGUAGE plpgsql;

---Update Student Grade------------------
CREATE OR REPLACE PROCEDURE update_student_grade(
    p_student_id INT,
    p_course_id INT,
    p_new_grade DECIMAL(3,1)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE FactStudentPerformance
    SET Grade = p_new_grade
    WHERE StudentID = p_student_id AND CourseID = p_course_id;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'No matching record found for StudentID % and CourseID %', p_student_id, p_course_id;
    END IF;
END;
$$
;

---Get Course Attendance Summary--------------
CREATE OR REPLACE FUNCTION get_course_attendance_summary(p_course_id INT)
RETURNS TABLE (
    CourseName VARCHAR(100),
    TotalStudents INT,
    PresentCount INT,
    AbsentCount INT,
    TardyCount INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        c.CourseName,
        COUNT(DISTINCT f.StudentID) AS TotalStudents,
        COUNT(CASE WHEN a.AttendanceStatus = 'Present' THEN 1 END) AS PresentCount,
        COUNT(CASE WHEN a.AttendanceStatus = 'Absent' THEN 1 END) AS AbsentCount,
        COUNT(CASE WHEN a.AttendanceStatus = 'Tardy' THEN 1 END) AS TardyCount
    FROM FactStudentPerformance f
    JOIN DimCourse c ON f.CourseID = c.CourseID
    JOIN DimAttendance a ON f.AttendanceID = a.AttendanceID
    WHERE f.CourseID = p_course_id
    GROUP BY c.CourseName;
END;
$$
 LANGUAGE plpgsql;