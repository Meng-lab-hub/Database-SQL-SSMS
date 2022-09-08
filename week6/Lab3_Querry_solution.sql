CREATE DATABASE lab3;

USE lab3;

SELECT *
FROM Student;
SELECT *
FROM Class;
SELECT *
FROM Enrolled;
SELECT *
FROM Faculty;

SELECT * 
FROM Faculty
INNER JOIN Class ON Class.fid = Faculty.fid
INNER JOIN Enrolled ON Enrolled.cname = Class.name
INNER JOIN Student ON Student.snum = Enrolled.snum



-- Task 1

SELECT sname
FROM Student
INNER JOIN Enrolled ON Student.snum = Enrolled.snum
INNER JOIN Class ON Enrolled.cname = Class.name
INNER JOIN Faculty ON Class.fid = Faculty.fid
WHERE Student.standing = 'JR' AND Faculty.fname LIKE 'I% Teach';

-- Task 2

SELECT DISTINCT age AS [Max Age]
FROM Student
WHERE Student.age = (
	SELECT MAX(Student.age)
	FROM Student
	INNER JOIN Enrolled ON Student.snum = Enrolled.snum
	INNER JOIN Class ON Enrolled.cname = Class.name
	INNER JOIN Faculty ON Class.fid = Faculty.fid
	WHERE Student.major = '%History%' OR Faculty.fname LIKE 'I% Teach%'
);


-- Task 3


SELECT name
FROM Class
WHERE Class.room = 'R128' OR Class.name IN (
	SELECT name
	FROM Class
	INNER JOIN Enrolled ON Class.name = Enrolled.cname
	GROUP BY Class.name
	HAVING COUNT(name) >= 5
);

-- Task 4

SELECT sname
FROM Student
INNER JOIN Enrolled ON Enrolled.snum = Student.snum
INNER JOIN Class AS C1 ON Enrolled.cname = C1.name
INNER JOIN Class AS C2 ON Enrolled.cname = C2.name AND C1.meets_at = C2.meets_at
WHERE C1.name <> C2.name;


-- Task 5

/*
SELECT fname
FROM Faculty
WHERE fname IN (
	SELECT Faculty.fname
	FROM Enrolled
	INNER JOIN Class ON Enrolled.cname = Class.name
	INNER JOIN Faculty ON Faculty.fid = Class.fid
	GROUP BY Faculty.fname
	HAVING COUNT (DISTINCT Class.room) = (
		SELECT COUNT(DISTINCT Class.room)
		FROM Enrolled
		INNER JOIN Class ON Enrolled.cname = Class.name
	)
);

*/

SELECT Faculty.fname
FROM Faculty
INNER JOIN Class ON Faculty.fid = Class.fid
GROUP BY Faculty.fname
HAVING count(DISTINCT Class.room) = (
	SELECT count(DISTINCT class.room) 
	FROM class
);




-- Task 6 

SELECT Faculty.fname
FROM Faculty
WHERE Faculty.fname IN (
	SELECT Faculty.fname
	FROM Faculty
	LEFT JOIN Class ON Class.fid = Faculty.fid
	LEFT JOIN Enrolled ON Enrolled.cname = Class.name
	LEFT JOIN Student ON Student.snum = Enrolled.snum
	GROUP BY Faculty.fname
	HAVING COUNT(Enrolled.snum) < 5
)
ORDER BY Faculty.fname ASC;

-- Task 7

SELECT Student.standing, AVG(Student.age) AS [Average age]
FROM Student
GROUP BY Student.standing

SELECT Student.standing, AVG(Student.age) AS [Average age]
FROM Student
WHERE Student.standing <> 'JR'
GROUP BY Student.standing

-- Task 8

SELECT Student.sname AS 'Hard-working students'
FROM Student
WHERE Student.snum IN (
	SELECT Enrolled.snum
	FROM Enrolled
	GROUP BY Enrolled.snum
	
	HAVING COUNT(Enrolled.cname) >= ALL (
		SELECT COUNT (EnrolledTemp.cname)
		FROM Enrolled AS EnrolledTemp
		GROUP BY EnrolledTemp.snum
	)
)
ORDER BY Student.sname ASC;



-- Task 9


SELECT Student.sname AS 'Lazy students'
FROM Student
WHERE Student.snum IN (
	SELECT Student.snum
	FROM Student
	LEFT JOIN Enrolled ON Enrolled.snum = Student.snum
	WHERE Enrolled.cname IS NULL
)
ORDER BY Student.sname ASC;


-- Task 10

SELECT DISTINCT Student.age, Student.standing
FROM Student
WHERE Student.age IN (
	SELECT Student.age
	FROM Student
	GROUP BY Student.age, Student.standing
	HAVING COUNT(Student.standing) >= ALL (
		SELECT COUNT(Student.standing)
		FROM Student
		GROUP BY Student.age, Student.standing
	) 
)
ORDER BY Student.age ASC;

