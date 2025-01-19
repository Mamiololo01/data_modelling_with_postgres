-- Insert sample data into DimStudent (10 rows)
INSERT INTO DimStudent (StudentID, FirstName, LastName, DateOfBirth, Gender, GradeLevel)
VALUES 
(1, 'John', 'Doe', '2010-05-15', 'M', 9),
(2, 'Jane', 'Smith', '2009-08-22', 'F', 10),
(3, 'Alex', 'Johnson', '2011-03-10', 'M', 8),
(4, 'Emily', 'Brown', '2010-11-30', 'F', 9),
(5, 'Michael', 'Davis', '2009-07-18', 'M', 10),
(6, 'Sophia', 'Wilson', '2011-09-05', 'F', 8),
(7, 'Daniel', 'Taylor', '2010-02-14', 'M', 9),
(8, 'Olivia', 'Anderson', '2009-12-03', 'F', 10),
(9, 'William', 'Thomas', '2011-06-20', 'M', 8),
(10, 'Ava', 'Jackson', '2010-10-11', 'F', 9);

-- Insert sample data into DimDate (10 rows)
INSERT INTO DimDate (DateID, Date, DayOfWeek, Month, Quarter, Year, IsSchoolDay)
VALUES 
(1, '2025-01-20', 'Monday', 'January', 1, 2025, 1),
(2, '2025-01-21', 'Tuesday', 'January', 1, 2025, 1),
(3, '2025-01-22', 'Wednesday', 'January', 1, 2025, 1),
(4, '2025-01-23', 'Thursday', 'January', 1, 2025, 1),
(5, '2025-01-24', 'Friday', 'January', 1, 2025, 1),
(6, '2025-01-25', 'Saturday', 'January', 1, 2025, 0),
(7, '2025-01-26', 'Sunday', 'January', 1, 2025, 0),
(8, '2025-01-27', 'Monday', 'January', 1, 2025, 1),
(9, '2025-01-28', 'Tuesday', 'January', 1, 2025, 1),
(10, '2025-01-29', 'Wednesday', 'January', 1, 2025, 1);

-- Insert sample data into DimCourse (10 rows)
INSERT INTO DimCourse (CourseID, CourseName, Department, Credits)
VALUES 
(1, 'Algebra I', 'Mathematics', 3),
(2, 'World History', 'Social Studies', 3),
(3, 'Biology', 'Science', 4),
(4, 'English Literature', 'English', 3),
(5, 'Chemistry', 'Science', 4),
(6, 'Geometry', 'Mathematics', 3),
(7, 'Spanish I', 'Foreign Languages', 2),
(8, 'Physical Education', 'PE', 1),
(9, 'Art History', 'Fine Arts', 2),
(10, 'Computer Science', 'Technology', 3);

-- Insert sample data into DimTeacher (10 rows)
INSERT INTO DimTeacher (TeacherID, FirstName, LastName, Department, HireDate)
VALUES 
(1, 'Michael', 'Brown', 'Mathematics', '2020-08-15'),
(2, 'Sarah', 'Davis', 'Social Studies', '2018-09-01'),
(3, 'Emily', 'Wilson', 'Science', '2019-07-30'),
(4, 'David', 'Martinez', 'English', '2017-08-22'),
(5, 'Jennifer', 'Taylor', 'Science', '2021-01-10'),
(6, 'Robert', 'Anderson', 'Mathematics', '2016-08-05'),
(7, 'Maria', 'Garcia', 'Foreign Languages', '2019-08-18'),
(8, 'James', 'Moore', 'PE', '2018-07-25'),
(9, 'Lisa', 'Clark', 'Fine Arts', '2020-08-01'),
(10, 'Daniel', 'White', 'Technology', '2021-08-10');

-- Insert sample data into DimAttendance (10 rows)
INSERT INTO DimAttendance (AttendanceID, AttendanceStatus)
VALUES 
(1, 'Present'),
(2, 'Absent'),
(3, 'Tardy'),
(4, 'Present'),
(5, 'Present'),
(6, 'Excused'),
(7, 'Present'),
(8, 'Absent'),
(9, 'Present'),
(10, 'Tardy');

-- Insert sample data into FactStudentPerformance (10 rows)
INSERT INTO FactStudentPerformance (PerformanceID, StudentID, DateID, CourseID, TeacherID, AttendanceID, Grade, BehaviorScore)
VALUES 
(1, 1, 1, 1, 1, 1, 85.5, 8),
(2, 2, 1, 2, 2, 1, 92.0, 9),
(3, 3, 2, 3, 3, 3, 78.5, 7),
(4, 4, 2, 4, 4, 4, 88.0, 8),
(5, 5, 3, 5, 5, 5, 90.5, 9),
(6, 6, 3, 6, 6, 6, 82.0, 7),
(7, 7, 4, 7, 7, 7, 95.0, 10),
(8, 8, 4, 8, 8, 8, 79.5, 6),
(9, 9, 5, 9, 9, 9, 87.0, 8),
(10, 10, 5, 10, 10, 10, 91.5, 9);