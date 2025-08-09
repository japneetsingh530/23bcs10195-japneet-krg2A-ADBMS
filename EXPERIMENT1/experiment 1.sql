
--------------------------- EASY---------------------------
--Author-Book Relationship Using Joins and Basic SQL Operations
--1.	Design two tables — one for storing author details and the other for book details.
--2.	Ensure a foreign key relationship from the book to its respective author.
--3.	Insert at least three records in each table.
--4.	Perform an INNER JOIN to link each book with its author using the common author ID.
--5.	Select the book title, author name, and author’s country.


CREATE TABLE TBL_AUTHOR_DETAILS(
	AUTHOR_ID INT PRIMARY KEY,
	AUTHOR_NAME VARCHAR(50),
	COUNTRY VARCHAR(50)
);

CREATE TABLE TBL_BOOK_DETAILS(
	BOOK_ID INT PRIMARY KEY,
	BOOK_TITLE VARCHAR(MAX),
	AUTHORID INT  
	FOREIGN KEY (AUTHORID) REFERENCES TBL_AUTHOR_DETAILS(AUTHOR_ID)
);

INSERT INTO TBL_AUTHOR_DETAILS VALUES (1,'AMAN','INDIA');
INSERT INTO TBL_AUTHOR_DETAILS VALUES (2,'MARK','USA');
INSERT INTO TBL_AUTHOR_DETAILS VALUES (3,'KANG','CHINA');
SELECT * FROM TBL_AUTHOR_DETAILS;


INSERT INTO TBL_BOOK_DETAILS VALUES (1,'JAVA HANDS ON',1);
INSERT INTO TBL_BOOK_DETAILS VALUES (2,'FB MARKETPLACE',2);
INSERT INTO TBL_BOOK_DETAILS VALUES (3,'MOON DANCE',3);
SELECT * FROM TBL_BOOK_DETAILS;

SELECT BD.BOOK_TITLE, AD.AUTHOR_NAME, AD.COUNTRY
FROM
TBL_AUTHOR_DETAILS AS AD
INNER JOIN 
TBL_BOOK_DETAILS AS BD
ON
AD.AUTHOR_ID = BD.AUTHORID ;



------------------------- MEDIUM ----------------------
--Department-Course Subquery and Access Control
--1. Design normalized tables for departments and the courses they offer, maintaining a foreign key relationship.2. Insert five departments and at least ten courses across those departments.
--3. Use a subquery to count the number of courses under each department.
--4. Filter and retrieve only those departments that offer more than two courses.
--5. Grant SELECT-only access on the courses table to a specific user.

CREATE TABLE TBL_DEPARTMENTS (
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(100) NOT NULL
);

CREATE TABLE TBL_COURSES (
COURSE_ID INT PRIMARY KEY,
COURSE_NAME VARCHAR(150) NOT NULL,
DEPT_ID INT,
FOREIGN KEY (DEPT_ID) REFERENCES TBL_DEPARTMENTS(DEPT_ID)
);

INSERT INTO TBL_DEPARTMENTS VALUES
(1, 'COMPUTER SCIENCE'),
(2, 'MATHEMATICS'),
(3, 'PHYSICS'),
(4, 'CHEMISTRY'),
(5, 'BIOLOGY');
SELECT * FROM TBL_DEPARTMENTS;

INSERT INTO TBL_COURSES VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Algorithms', 1),
(104, 'Calculus I', 2),
(105, 'Linear Algebra', 2),
(106, 'Quantum Mechanics', 3),
(107, 'Classical Mechanics', 3),
(108, 'Modern Poetry', 4),
(109, 'Cell Biology', 5),
(110, 'Genetics', 5);
SELECT * FROM TBL_COURSES;


SELECT DEPT_NAME
FROM TBL_DEPARTMENTS
WHERE DEPT_ID IN (
SELECT DEPT_ID
FROM TBL_COURSES
GROUP BY DEPT_ID
HAVING COUNT(COURSE_ID) > 2
);
