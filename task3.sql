-- 1. Create Table
CREATE TABLE StudentsA (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    GradeLevel VARCHAR(20),
    SubjectsEnrolled INT,
    AverageScore INT,
    AttendancePercent INT,
    TuitionFeeUSD DECIMAL(10,2)
);

-- 2. Insert Data (sample)
INSERT INTO StudentsA VALUES
(5001, 'Student_1', 9, 'Male', 'Primary', 10, 25, 68, 922),
(5002, 'Student_2', 16, 'Female', 'Middle', 6, 34, 90, 2925),
(5003, 'Student_3', 23, 'Female', 'Middle', 5, 69, 82, 3949),
(5004, 'Student_4', 14, 'Female', 'Primary', 2, 46, 84, 636),
(5005, 'Student_5', 23, 'Female', 'High School', 5, 86, 58, 3251),
(5006, 'Student_6', 5, 'Male', 'College', 8, 67, 70, 4840),
(5007, 'Student_7', 16, 'Female', 'Middle', 5, 93, 52, 1412),
(5008, 'Student_8', 9, 'Female', 'College', 2, 91, 96, 4692),
(5009, 'Student_9', 8, 'Male', 'High School', 5, 86, 92, 4112),
(5010, 'Student_10', 9, 'Male', 'Primary', 1, 30, 54, 3391),
(5011, 'Student_11', 16, 'Female', 'College', 8, 13, 83, 2220),
(5012, 'Student_12', 6, 'Male', 'High School', 7, 23, 66, 2631),
(5013, 'Student_13', 6, 'Male', 'Middle', 9, 73, 50, 1650),
(5014, 'Student_14', 7, 'Male', 'College', 5, 85, 74, 4039),
(5015, 'Student_15', 11, 'Male', 'Middle', 4, 42, 82, 447),
(5016, 'Student_16', 14, 'Male', 'Primary', 9, 100, 71, 4539),
(5017, 'Student_17', 9, 'Male', 'College', 10, 51, 52, 2133),
(5018, 'Student_18', 19, 'Male', 'Primary', 8, 72, 78, 2924),
(5019, 'Student_19', 7, 'Male', 'Middle', 7, 10, 75, 4861);

-- 3. SELECT example: List all students with score > 80
SELECT StudentName, AverageScore
FROM StudentsA
WHERE AverageScore > 80;

-- 4. GROUP BY example: Average score per GradeLevel
SELECT GradeLevel, AVG(AverageScore) AS AvgScore
FROM StudentsA
GROUP BY GradeLevel;

-- 5. ORDER BY example: Students sorted by tuition fee
SELECT StudentName, TuitionFeeUSD
FROM StudentsA
ORDER BY TuitionFeeUSD DESC;

-- 6. JOIN (simulated): Assume a table of Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    GradeLevel VARCHAR(20)
);

-- Insert dummy course data
INSERT INTO Courses VALUES
(1, 'Math Basics', 'Primary'),
(2, 'Science Intro', 'Middle'),
(3, 'Advanced Physics', 'High School'),
(4, 'Psychology 101', 'College');

-- INNER JOIN: Match Students with their grade level's course
SELECT s.StudentName, s.GradeLevel, c.CourseName
FROM StudentsA s
JOIN Courses c ON s.GradeLevel = c.GradeLevel;

-- 7. Subquery: Students with score above average
SELECT StudentName, AverageScore
FROM StudentsA
WHERE AverageScore > (
    SELECT AVG(AverageScore) FROM StudentsA
);

-- 8. Aggregates: Total tuition by gender
SELECT Gender, SUM(TuitionFeeUSD) AS TotalTuition
FROM StudentsA
GROUP BY Gender;

-- 9. View for analysis: Students with high attendance
CREATE VIEW HighAttendanceStudents AS
SELECT StudentID, StudentName, AttendancePercent
FROM StudentsA
WHERE AttendancePercent > 80;

-- 10. Index: Optimize queries on AverageScore
CREATE INDEX idx_avg_score ON StudentsA(AverageScore);

