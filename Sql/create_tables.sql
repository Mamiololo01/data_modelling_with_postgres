CREATE TABLE IF NOT EXISTS FactStudentPerformance (
    PerformanceID INT PRIMARY KEY NOT NULL,
    StudentID INT NOT NULL,
    DateID INT NOT NULL,
    CourseID INT NOT NULL,
    TeacherID INT NOT NULL,
    AttendanceID INT NOT NULL,
    Grade DECIMAL(3,1) NOT NULL,
    BehaviorScore INT NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES DimStudent(StudentID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID),
    FOREIGN KEY (CourseID) REFERENCES DimCourse(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES DimTeacher(TeacherID),
    FOREIGN KEY (AttendanceID) REFERENCES DimAttendance(AttendanceID),
    CHECK (Grade BETWEEN 0 AND 100),
    CHECK (BehaviorScore BETWEEN 1 AND 10)
);

CREATE TABLE IF NOT EXISTS DimStudent (
    StudentID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(1) NOT NULL,
    GradeLevel INT NOT NULL,
    CHECK (Gender IN ('M', 'F', 'O')),
    CHECK (GradeLevel BETWEEN 1 AND 12)
);

CREATE TABLE IF NOT EXISTS DimDate (
    DateID INT PRIMARY KEY NOT NULL,
    Date DATE NOT NULL,
    DayOfWeek VARCHAR(10) NOT NULL,
    Month VARCHAR(10) NOT NULL,
    Quarter INT NOT NULL,
    Year INT NOT NULL,
    CHECK (Quarter BETWEEN 1 AND 4)
);

CREATE TABLE IF NOT EXISTS DimCourse (
    CourseID INT PRIMARY KEY NOT NULL,
    CourseName VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Credits INT NOT NULL DEFAULT 1,
    CHECK (Credits > 0)
);

CREATE TABLE IF NOT EXISTS DimTeacher (
    TeacherID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS DimAttendance (
    AttendanceID INT PRIMARY KEY NOT NULL,
    AttendanceStatus VARCHAR(20) NOT NULL,
    CHECK (AttendanceStatus IN ('Present', 'Absent', 'Tardy', 'Excused'))
);