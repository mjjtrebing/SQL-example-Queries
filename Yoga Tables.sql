drop table HighAttend;
drop table Log_Refund_Yoga;
DROP TABLE Enroll;
DROP TABLE Class;
DROP TABLE Instructor;
DROP TABLE Student;
drop sequence HighAttend_Log;
drop sequence Refund_Log;

-- Andy wrote this table
CREATE TABLE Instructor (
    TID INT,
    Fname VARCHAR2(50) NOT NULL,
    Lname VARCHAR2(50) NOT NULL,
    City VARCHAR2(50),
    State CHAR(2),
    Rate_Hour NUMBER NOT NULL,
    CONSTRAINT Instructor_pk PRIMARY KEY (TID)
);

-- Andy wrote this table
CREATE TABLE Student (
    SID INT,
    First VARCHAR2(50),
    Last VARCHAR2(50),
    Exp_Level CHAR(1), 
    City VARCHAR2(50),
    State CHAR(2),
    CONSTRAINT Student_pk PRIMARY KEY (SID),
    CONSTRAINT Student_Exp_Lvl CHECK(Exp_level ='B' OR Exp_level ='E' OR Exp_level = 'I')
);

-- Matt wrote this table
CREATE TABLE Class (
	Name VARCHAR2(25),
	Duration NUMBER,
	class_level CHAR(1),
	TID INT,
	Day VARCHAR2(5) NOT NULL,
	Time VARCHAR2(8) NOT NULL,
	cost NUMBER,
	CONSTRAINT CHK_LVL CHECK(Class_level ='A' OR Class_level ='B' OR Class_level ='E' OR Class_level ='I'),
	CONSTRAINT PK_TID_NAME PRIMARY KEY (TID, Name),
    CONSTRAINT FK_CLASS FOREIGN KEY (TID) REFERENCES Instructor(TID),
	CONSTRAINT CHK_Day CHECK(Day != 'Fri' OR day !='Sun')
);

-- Matt wrote this table	
Create table Enroll (
	Class_Name VARCHAR2(25),
	TID INT,
	SID CHAR(3),
	payment NUMBER,
	CONSTRAINT CHK_PAY CHECK(Payment >= 10 AND Payment <= 100),
	CONSTRAINT PK_CN_TID_SID PRIMARY KEY (Class_Name, TID, SID),
	CONSTRAINT FK_tEnroll_tClass FOREIGN KEY (TID,Class_Name) REFERENCES Class(TID, name)
);



-- Completed by Matts
create table HighAttend (
		logNum number,
		Name Varchar2(25),
		entryDate date,
		constraint PK_LOGatt primary key (LogNum, Class_Name)
);
		
	create sequence HighAttend_Log;
	
	--TEST DATA
	--insert into HighAttend (logNum, Class_Name, EntryDate) values(HighAttend_Log.nextval, "Fun with Yoga", sysdate);
	--insert into HighAttend values(HighAttend_Log.nextval, "Yoga for All", sysdate);
		
create table Log_Refund_Yoga (
		logNum number,
		SID int not null,
		payment number default 10,
		constraint PK_LOGref primary key (LogNum, SID)
	);
	
	
	create sequence Refund_Log;
	
	--TEST DATA
	insert into Log_Refund_Yoga values(Refund_Log.nextval, 101, 15);
	insert into Log_Refund_Yoga values(Refund_Log.nextval, 104, 10);
	
	

    
-- Completed by Andy
-- Starting inserts for the Instructor table

INSERT INTO Instructor(TID, Fname, Lname, City, State, Rate_hour)
VALUES (1, 'Sally', 'Greenville', 'Radford', 'VA', 40.00);

INSERT INTO Instructor(TID, Fname, Lname, City, State, Rate_hour)
VALUES (2, 'John', 'Wooding', 'Blacksburg', 'VA', 60.00);

INSERT INTO Instructor(TID, Fname, Lname, City, State, Rate_hour)
VALUES (3, 'Debbie', 'Greenville', 'Radford', 'VA', 45.00);

INSERT INTO Instructor(TID, Fname, Lname, City, State, Rate_hour)
VALUES (4, 'Elaine', 'Tobies', 'Radford', 'VA', 50.00);

-- Completed by Andy
-- Starting inserts for the Student table

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (101, 'Sally', 'Treville', 'E', 'Salem', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (102, 'Gerald', 'Warner', 'B', 'Roanoke', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (104, 'Katie', 'Johnson', 'B', 'Blacksburg', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (105, 'Matt', 'Kingston', 'E', 'Radford', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (106, 'Ellen', 'Maples', 'I', 'Radford', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (108, 'Tom', 'Rivers', 'E', 'Radford', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (109, 'Barbara', 'Singleton', 'E', 'Radford', 'VA');

INSERT INTO Student(SID, First, Last, Exp_Level, City, State)
VALUES (110, 'Jonathan', 'Stiner', 'I', 'Salem', 'VA');



-- Completed by Matts
insert into Class values('Fun with Yoga',	60,	'B',	1,	'Mon',	'6:00 PM',	15);
insert into Class values('Stretch Yoga',	90,	'I',	2,	'Tues',	'5:30 PM',	20);
insert into Class values('Lunch Yoga',	50,	'A',	3,	'Wed',	'12:30 PM',	15);
insert into Class values('Yoga for All',	90,	'A',	4,	'Thurs',	'7:00 PM',	25);
insert into Class values('Yoga Inversions',	60,	'I',	1,	'Sat',	'10:00 AM',	20);
insert into Class values('Advanced Yoga',	90,	'E',	4,	'Sat',	'2:00 PM',	25);
insert into Class values('Relaxation Yoga',	90,	'I',	4,	'Mon',	'7:30 PM',	40);
	

-- Completed by Matts
insert into Enroll values('Fun with Yoga',	1,	102,	15);
insert into Enroll values('Fun with Yoga',	1,	104,    15);
insert into Enroll values('Fun with Yoga',	1,	108,	15);
insert into Enroll values('Stretch Yoga',	2,	106,	20);
insert into Enroll values('Stretch Yoga',	2,	108,	20);
insert into Enroll values('Lunch Yoga',	3,	102,	15);
insert into Enroll values('Lunch Yoga',	3,	109,	15);
insert into Enroll values('Yoga for All',	4,	106,	10);
insert into Enroll values('Yoga for All',	4,	108,	25);
insert into Enroll values('Yoga Inversions',	1,	106,	25);
insert into Enroll values('Yoga Inversions',	1,	105,	25);
insert into Enroll values('Advanced Yoga',	4,	106,	25);
insert into Enroll values('Advanced Yoga',	4,	108,	25);
insert into Enroll values('Stretch Yoga',	2,	110,	20);
insert into Enroll values('Relaxation Yoga',	4,	101,	10);
insert into Enroll values('Relaxation Yoga',	4,	106,	10);
insert into Enroll values('Relaxation Yoga',	4,	108,	10);

-- beginning the second part of the project

ALTER TABLE Class
ADD classCount INT DEFAULT 0;

UPDATE Class
SET classCount = 3
WHERE Name = 'Fun with Yoga';

UPDATE Class
SET classCount = 3
WHERE Name = 'Stretch Yoga';

UPDATE Class
SET classCount = 2
WHERE Name = 'Lunch Yoga';

UPDATE Class
SET classCount = 2
WHERE Name = 'Yoga for All';

UPDATE Class
SET classCount = 2
WHERE Name = 'Yoga Inversions';

UPDATE Class
SET classCount = 2
WHERE Name = 'Advanced Yoga';

UPDATE Class
SET classCount = 3
WHERE Name = 'Relaxation Yoga';

CREATE or REPLACE PROCEDURE addStudent(SID2 INT, First2 varchar2, Last2 varchar2, Exp_level2 char, City2 varchar2, State2 varchar2)
AS 
Begin
    Insert into Student(
        SID, First, Last, Exp_Level, City, State
    )
    VALUES(
        SID2, First2, Last2, Exp_level2, City2, State2
    );
End;
/
CREATE or REPLACE PROCEDURE addClass(newName VARCHAR2, newDuration NUMBER, newClass_level CHAR, newTID INT, newDay VARCHAR2, newTime VARCHAR2, newCost NUMBER)
AS 
Begin
    Insert into Class(
        Name, Duration, class_level, TID, Day, Time, cost
    )
    VALUES(
        newName, newDuration, newClass_level, newTID, newDay, newTime, newCost
    );
End;
/

CREATE or REPLACE PROCEDURE addEnroll(newClass_Name VARCHAR2, newTID INT, newSID CHAR, newPayment NUMBER)
AS 
Begin
    Insert into Enroll(
        Class_Name, TID, SID, Payment
    )
    VALUES(
		newClass_Name, newTID, newSID, newPayment
    );
	UPDATE Class
	SET classCount = classCount + 1
	WHERE Name = newClass_Name;
End;
/

CREATE or REPLACE PROCEDURE deleteEnroll(Class_Name2 VARCHAR2, TID2 INT, SID2 CHAR, Payment2 NUMBER)
AS 
Begin
    DELETE FROM Enroll
	WHERE Class_Name = Class_Name2 AND TID = TID2 AND SID = SID2 AND Payment = Payment2;

	UPDATE Class
	SET classCount = classCount - 1
	WHERE Name = Class_Name2;
End;
/

CREATE OR REPLACE TRIGGER expLevelTrigger
BEFORE INSERT
ON Enroll
FOR EACH ROW
DECLARE 
class_levelNumber INT;
exp_levelNumber INT;
class_levelLetter CHAR;
exp_levelLetter CHAR;

BEGIN
SELECT Class.class_level 
INTO class_levelLetter
FROM Class
WHERE :New.Class_Name = Class.Name;

SELECT Student.exp_level
INTO exp_levelLetter
FROM Student
WHERE :New.SID = Student.SID;

	IF
	class_levelLetter = 'B'
	THEN
	class_levelNumber := 0;
	
	ELSIF
	class_levelLetter = 'I'
	THEN
	class_levelNumber := 1;

	ELSIF
	class_levelLetter = 'E'
	THEN
	class_levelNumber := 2;

	ELSIF
	class_levelLetter = 'A'
	THEN
	class_levelNumber := 0;
	END IF;

	IF
	exp_levelLetter = 'B'
	THEN
	exp_levelNumber := 0;

	ELSIF
	exp_levelLetter = 'I'
	THEN
	exp_levelNumber := 1;

	ELSIF
	exp_levelLetter = 'E'
	THEN
	exp_levelNumber := 2;

	ELSIF
	exp_levelLetter = 'A'
	THEN
	exp_levelNumber := 0;
	END IF;

	IF 
	exp_levelNumber < class_levelNumber
	THEN
	raise_application_error(-1, 'You are not qualified for this class');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER highAttendTrigger 
AFTER UPDATE of classCount
ON Class
FOR EACH ROW
WHEN(New.classCount >= 4 AND Old.classCount < 4)
BEGIN
	INSERT INTO HighAttend(logNum, Class_Name, entryDate)
	VALUES (HighAttend_Log.nextval, :Old.Name, sysdate);
end;
/


create or replace trigger log_Yoga_Refund_Trigger
after delete on Enroll
for each row
begin
	INSERT INTO Log_Refund_Yoga
	VALUES (Refund_Log.nextval, :Old.SID, :Old.payment);

end;
/

exec deleteEnroll('Lunch Yoga', 3, 102, 15.00);
exec deleteEnroll('Advanced Yoga', 4, 108, 25.00);





SHOW ERRORS;