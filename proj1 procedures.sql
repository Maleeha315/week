CREATE PROCEDURE GetAllstudents
AS
BEGIN
    SELECT * FROM Students;
END;
GO
CREATE PROCEDURE Courses1
AS
BEGIN
    SELECT * FROM Courses;
END;
GO

CREATE PROCEDURE add_student
    @FirstName VARCHAR(50),
	@LastName VARCHAR(50),
    @Age INT,
	@CourseID INT,
	@StudentID INT
AS
BEGIN
    INSERT INTO Students (StudentID,FirstName, LastName,Age,CourseID)
    VALUES (@StudentID,@FirstName, @LastName,@Age,@CourseID);
END;
GO

CREATE PROCEDURE add_course

	@CourseName VARCHAR(50),
	@CourseID INT
AS
BEGIN
    INSERT INTO Courses (CourseID,CourseName)
    VALUES (@CourseID, @CourseName);
END;
GO

--DROP PROCEDURE DeleteStudent
CREATE PROCEDURE UpdateStudentAge
    @StudentID  INT,
    @NewAge INT
AS
BEGIN
    UPDATE Students
    SET Age = @NewAge
    WHERE StudentID  = @StudentID ;
END;
GO

CREATE PROCEDURE UpdateCourse
    @CourseID  INT,
    @Newcourse VARCHAR(50)
AS
BEGIN
    UPDATE Courses
    SET CourseName = @Newcourse
    WHERE CourseID  = @CourseID ;
END;
GO

CREATE PROCEDURE GetstudentById
    @StudentID INT
AS
BEGIN
    SELECT * FROM Students WHERE StudentID = @StudentID;
END
Go

CREATE PROCEDURE GetcourseById
    @CourseID INT
AS
BEGIN
    SELECT * FROM Courses WHERE CourseID = @CourseID;
END
Go


CREATE PROCEDURE DeleteStudent
    @StudentID  INT
AS
BEGIN
    DELETE FROM Students
    WHERE StudentID  = @StudentID ;
END;
GO

CREATE PROCEDURE Deleteid
    @CourseID  INT
AS
BEGIN
    DELETE FROM Courses
    WHERE CourseID  = @CourseID ;
END;
GO



----DROP PROCEDURE old_avgstudents
--CREATE PROCEDURE StudentNotEnrolled

--AS
--BEGIN
--    SELECT * FROM Students
--    WHERE CourseID is null ;
--END;
--GO

CREATE PROCEDURE POPULAR_COURSE

AS
BEGIN
    SELECT TOP 1 CourseID,
COUNT(CourseID) AS popular_subject,
(SELECT CourseName FROM Courses
WHERE CourseID = Students.CourseID)
FROM Students
GROUP BY CourseID
ORDER BY popular_subject DESC --ORDER IN DESCENDING 
END;
GO

CREATE PROCEDURE old_students

AS
BEGIN
SELECT * FROM Students
WHERE Age> 20;END;
GO

--CREATE PROCEDURE coursenotenrolled

--AS
--BEGIN
--SELECT Courses.CourseID, Courses.CourseName FROM Courses
--LEFT JOIN Students ON Courses.CourseID=Students.CourseID
--WHERE Students.StudentID IS NULL;
--END;
--GO
