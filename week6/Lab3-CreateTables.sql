CREATE TABLE Student(
	snum		INT,
	sname		VARCHAR(30),
	major		VARCHAR(25),
	standing	VARCHAR(2),
	age			INT,
	PRIMARY KEY(snum)
);
GO

CREATE TABLE Faculty(
	fid			INT,
	fname		VARCHAR(30),
	deptid		DECIMAL(2,0),
	PRIMARY KEY(fid)
);
GO

CREATE TABLE Class(
	name		VARCHAR(40),
	meets_at	VARCHAR(20),
	room		VARCHAR(10),
	fid			INT,
	PRIMARY KEY(name),
	FOREIGN KEY(fid) REFERENCES faculty
);
GO

CREATE TABLE Enrolled(
	snum		INT,
	cname		VARCHAR(40),
	PRIMARY KEY(snum,cname),
	FOREIGN KEY(snum) REFERENCES student,
	FOREIGN KEY(cname) REFERENCES class(name)
);
GO

INSERT INTO Student VALUES (051135593,'Maria White','English','SR',21);
INSERT INTO Student VALUES (060839453,'Charles Harris','Architecture','SR',22);
INSERT INTO Student VALUES (099354543,'Susan Martin','Law','JR',20);
INSERT INTO Student VALUES (112348546,'Joseph Thompson','Computer Science','SO',19);
INSERT INTO Student VALUES (115987938,'Christopher Garcia','Computer Science','JR',20);
INSERT INTO Student VALUES (132977562,'Angela Martinez','History','SR',20);
INSERT INTO Student VALUES (269734834,'Thomas Robinson','Psychology','SO',18);
INSERT INTO Student VALUES (280158572,'Margaret Clark','Animal Science','FR',18);
INSERT INTO Student VALUES (301221823,'Juan Rodriguez','Psychology','JR',20);
INSERT INTO Student VALUES (318548912,'Dorthy Lewis','Finance','FR',18);
INSERT INTO Student VALUES (320874981,'Daniel Lee','Electrical Engineering','FR',17);
INSERT INTO Student VALUES (322654189,'Lisa Walker','Computer Science','SO',17);
INSERT INTO Student VALUES (348121549,'Paul Hall','Computer Science','JR',18);
INSERT INTO Student VALUES (351565322,'Nancy Allen','Accounting','JR',19);
INSERT INTO Student VALUES (451519864,'Mark Young','Finance','FR',18);
INSERT INTO Student VALUES (455798411,'Luis Hernandez','Electrical Engineering','FR',17);
INSERT INTO Student VALUES (462156489,'Donald King','Mechanical Engineering','SO',19);
INSERT INTO Student VALUES (550156548,'George Wright','Education','SR',21);
INSERT INTO Student VALUES (552455318,'Ana Lopez','Computer Engineering','SR',19);
INSERT INTO Student VALUES (556784565,'Kenneth Hill','Civil Engineering','SR',21);
INSERT INTO Student VALUES (567354612,'Karen Scott','Computer Engineering','FR',18);
INSERT INTO Student VALUES (573284895,'Steven Green','Kinesiology','SO',19);
INSERT INTO Student VALUES (574489456,'Betty Adams','Economics','JR',20);
INSERT INTO Student VALUES (578875478,'Edward Baker','Veterinary Medicine','SR',21);

INSERT INTO Faculty VALUES (142519864,'Ivana Teach',20);
INSERT INTO Faculty VALUES (242518965,'James Smith',68);
INSERT INTO Faculty VALUES (141582651,'Mary Johnson',20);
INSERT INTO Faculty VALUES (011564812,'John Williams',68);
INSERT INTO Faculty VALUES (254099823,'Patricia Jones',68);
INSERT INTO Faculty VALUES (356187925,'Robert Brown',12);
INSERT INTO Faculty VALUES (489456522,'Linda Davis',20);
INSERT INTO Faculty VALUES (287321212,'Michael Miller',12);
INSERT INTO Faculty VALUES (248965255,'Barbara Wilson',12);
INSERT INTO Faculty VALUES (159542516,'William Moore',33);
INSERT INTO Faculty VALUES (090873519,'Elizabeth Taylor',11);
INSERT INTO Faculty VALUES (486512566,'David Anderson',20);
INSERT INTO Faculty VALUES (619023588,'Jennifer Thomas',11);
INSERT INTO Faculty VALUES (489221823,'Richard Jackson',33);
INSERT INTO Faculty VALUES (548977562,'Ulysses Teach',20);
	
INSERT INTO Class VALUES ('Data Structures','MWF 10','R128',489456522);
INSERT INTO Class VALUES ('Database Systems','MWF 12:30-1:45','1320 DCL',142519864);
INSERT INTO Class VALUES ('Operating System Design','TuTh 12-1:20','20 AVW',489456522); 
INSERT INTO Class VALUES ('History of the Choson Dynasty','MWF 3-4:15','R128',248965255);
INSERT INTO Class VALUES ('Aviation Accident Investigation','TuTh 1-2:50','Q3',011564812);
INSERT INTO Class VALUES ('Air Quality Engineering','TuTh 10:30-11:45','R15',011564812);
INSERT INTO Class VALUES ('Russian for Beginners','MWF 3-4:15','R12',248965255);
INSERT INTO Class VALUES ('Dialectical Materialism','TuTh 2-3:15','20 AVW',619023588);
INSERT INTO Class VALUES ('Social Cognition','Tu 6:30-8:40','R15',159542516);
INSERT INTO Class VALUES ('Perception','MTuWTh 3','Q3',489221823);
INSERT INTO Class VALUES ('Multivariate Analysis','TuTh 2-3:15','R15',090873519);
INSERT INTO Class VALUES ('Patent Law','F 1-2:50','R128',090873519);
INSERT INTO Class VALUES ('Urban Economics','MWF 11','20 AVW',489221823);
INSERT INTO Class VALUES ('Organic Chemistry','TuTh 12:30-1:45','R12',489221823);
INSERT INTO Class VALUES ('Marketing Research','MW 10-11:15','1320 DCL',489221823);
INSERT INTO Class VALUES ('Seminar in Fine Arts','M 4','R15',489221823);
INSERT INTO Class VALUES ('Orbital Mechanics','MWF 8','1320 DCL',011564812);
INSERT INTO Class VALUES ('Dairy Herd Management','TuTh 12:30-1:45','R128',356187925);
INSERT INTO Class VALUES ('Communication Networks','MW 9:30-10:45','20 AVW',141582651);
INSERT INTO Class VALUES ('Optical Electronics','TuTh 12:30-1:45','R15',254099823);
INSERT INTO Class VALUES ('Intoduction to Math','TuTh 8-9:30','R128',489221823);

INSERT INTO Enrolled VALUES (112348546,'Database Systems');
INSERT INTO Enrolled VALUES (115987938,'Database Systems');
INSERT INTO Enrolled VALUES (348121549,'Database Systems');
INSERT INTO Enrolled VALUES (322654189,'Database Systems');
INSERT INTO Enrolled VALUES (552455318,'Database Systems');
INSERT INTO Enrolled VALUES (455798411,'Operating System Design');
INSERT INTO Enrolled VALUES (552455318,'Operating System Design');
INSERT INTO Enrolled VALUES (567354612,'Operating System Design');
INSERT INTO Enrolled VALUES (112348546,'Operating System Design');
INSERT INTO Enrolled VALUES (115987938,'Operating System Design');
INSERT INTO Enrolled VALUES (322654189,'Operating System Design');
INSERT INTO Enrolled VALUES (567354612,'Data Structures');
INSERT INTO Enrolled VALUES (552455318,'Communication Networks');
INSERT INTO Enrolled VALUES (455798411,'Optical Electronics');
INSERT INTO Enrolled VALUES (301221823,'Perception');
INSERT INTO Enrolled VALUES (301221823,'Social Cognition');
INSERT INTO Enrolled VALUES (301221823,'Dialectical Materialism');
INSERT INTO Enrolled VALUES (556784565,'Air Quality Engineering');
INSERT INTO Enrolled VALUES (099354543,'Patent Law');
INSERT INTO Enrolled VALUES (574489456,'Urban Economics');
GO