CREATE TABLE Students(

StudentID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Age INT,
CourseID INT 
);
CREATE TABLE Courses (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50)
);
INSERT INTO Students (StudentID, FirstName, LastName, Age,CourseID)
VALUES (1, 'Maria','Maria', 19, 1),
       (2, 'Farhan','Farhan', 20, 2),
       (3, 'Ali','Ali', 21, 2),
	   (4, 'Ahmad','Ahmad', 22, 3),
	   (5, 'Irfan','Irfan', 34, 3),
	   (6, 'Ayesha','Ayesha', 35, 3),
	   (7, 'Amara','Amara', 44, 5),
	   (8, 'Minahil','Minahil', 48, 1),
	   (9, 'Erum','Erum', 28, 4),
	   (10, 'Ahmar','Ahmar', 45, 1);
GO
SELECT * FROM Students;
INSERT INTO Courses (CourseID, CourseName)
VALUES (1, 'Biology'),
       (2, 'Chemistry'),
	   (3, 'Computer'),
	   (4, 'Maths'),
       (5, 'Physics');
GO
--drop table Students
--drop table Courses
--assign foreign key to link both tables
ALTER TABLE Students
ADD CONSTRAINT FK_Courses
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID);
GO


---- update age of studentid 1
--UPDATE Students
--SET Age = 33
--WHERE StudentID = 1;
--GO

---- delete one studentid
--DELETE FROM Students
--WHERE StudentID = 5;
--GO
----view table
--SELECT * FROM Students;
--SELECT * FROM Courses;

---- query to list all students older than 20.
--SELECT * FROM Students
--WHERE Age > 20;
--GO

-- --query to list all students enrolled in a specific course, along with the course name.
--SELECT * FROM Students
--join Courses on Courses.CourseID = Students.CourseID --join courses table where courseid in table courses= courseid in table students
--where Courses.CourseID  = 3 --set against which course id we want to display students
--GO

---- COUNT function to find the total number of students.
--SELECT COUNT(*) FROM Students;
--GO
----  AVG function to find the average age of students.
--SELECT AVG(Age) FROM Students;
--GO
---- update courseid studentid 1
--UPDATE Students
--SET CourseID = null
--WHERE StudentID = 15;
--GO
----List the names of students who are not enrolled in any course.
--SELECT * FROM Students
--WHERE CourseID is null;
--GO
----the most popular course (the course with the most students enrolled).
--SELECT TOP 1 CourseID,
--COUNT(CourseID) AS popular_subject,
--(SELECT COURSENAME FROM COURSES
--WHERE CourseID = Students.CourseID)
--FROM Students
--GROUP BY CourseID
--ORDER BY popular_subject DESC --ORDER IN DESCENDING 
--GO
---- update courseid studentid 1
--UPDATE Students
--SET CourseID = 2
--WHERE StudentID = 1;
--GO
----the students who are older than the average age of students.
--SELECT * FROM Students
--WHERE Age> (SELECT AVG(Age) FROM Students);
--GO
