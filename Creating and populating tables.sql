/*Matt Trebing
9/13/17
Itec340
*/

drop table Condo_assign; 
drop table Condo_Reservation;
drop table Trip;
drop table SkiTeam;






create table Trip
(
	TID number(1),
	Resort varchar2(25) not null,
	Sun_Date date,
	city varchar2(25),
	state char(2),
	constraint TID_PK Primary key(TID));
	
Create table SkiTeam
(
	M_ID number(3),
	first varchar2(25),
	last varchar2(25),
	Exp_Level char(1),
	Gender char(1) not null,
	constraint MID_PK Primary key(M_ID),
	Constraint CK_ExpLvl Check (Exp_Level ='B' or Exp_Level = 'I' or Exp_Level= 'E'));

Create table Condo_Reservation
(
	RID char(3),
	TID number(1),
	Name varchar2(40) not null,
	Unit_NO number(3),
	Bldg number(1),
	Gender char(1) not null,
constraint RID_PK Primary key(RID),
CONSTRAINT CR_Trip FOREIGN KEY (TID) REFERENCES Trip(TID),
Constraint CK_Gender Check (Gender='M' or Gender='F'));

Create table Condo_Assign
(
	M_ID number(3),
	RID char(3),
	Deposit number(5,2),
constraint RID_MID_PK Primary key(RID, M_ID),
/*CONSTRAINT CA_ST FOREIGN KEY (M_ID) REFERENCES SkiTeam(M_ID),
*/CONSTRAINT CA_CR FOREIGN KEY (RID) REFERENCES Condo_Reservation(RID),
Constraint CK_Deposit Check (deposit>= 50.00));






insert into SkiTeam values(100, 'John', 'Snyder', 'I', 'M');
insert into SkiTeam values(600, 'Sally', 'Treville', 'E', 'F');
insert into SkiTeam values(104, 'Katie', 'Johnson', 'I', 'F');
insert into SkiTeam values(601, 'Matt', 'Kingston', 'E', 'M');
insert into SkiTeam values(108, 'Tom', 'Rivers', 'I', 'M');
insert into SkiTeam values(109, 'Barbara', 'Singleton', 'E', 'F');



insert into Trip values(1, 'Copper mtn', '21-Jan-2018', 'Copper', 'CO');
insert into Trip values(2, 'Heavenly mtn', '28-Jan-2018', 'Lake Tahoo', 'CA');
insert into Trip values(3, 'Squaw Valley', '04-Jan-2018', 'Lake Tahoo', 'CA');
insert into Trip values(4, 'Taos Ski Valley', '02-Nov-2018', 'Taos', 'NM');

insert into Condo_Reservation values('R10',	1,	'Lewis Ranch',	320,	3,	'M');
insert into Condo_Reservation values('R11',	1,	'Lewis Ranch',	321,	3,	'F');
insert into Condo_Reservation values('R12',	2,	'Heavenly Village',	304,	2,	'M');
insert into Condo_Reservation values('R13',	2,	'Heavenly Village',	284,	1,	'F');
insert into Condo_Reservation values('R14',	3,	'South Shore',	262,	1,	'M');
insert into Condo_Reservation values('R15',	3,	'South Shore',	263,	4,	'F');
insert into Condo_Reservation values('R16', 4, 'Cozy Mtn', 301, 3, 'F');
insert into Condo_Reservation values('R17', 4, 'Cozy Mtn', 302, 3, 'M');

insert into Condo_Assign values(100,	'R10',	100.00);
insert into Condo_Assign values(600,	'R11',	50.00);
insert into Condo_Assign values(102,	'R10',	75.00);
insert into Condo_Assign values(104, 'R11',	75.00);
insert into Condo_Assign values(601,	'R10',	75.00);
insert into Condo_Assign values(600,	'R13',	100.00);
insert into Condo_Assign values(104,	'R13',	50.00);
insert into Condo_Assign values(601,	'R12',	50.00);
insert into Condo_Assign values(108,	'R12',	75.00);
insert into Condo_Assign values(109,	'R13',	100.00);
insert into Condo_Assign values(600,	'R15',	50.00);
insert into Condo_Assign values(104,	'R15',	75.00);
insert into Condo_Assign values(106,	'R15',	60.00);
insert into Condo_Assign values(102,	'R12',	50.00);
insert into Condo_Assign values(600,	'R16',	50.00);
insert into Condo_Assign values(104,	'R16',	50.00);
insert into Condo_Assign values(109,	'R16',	50.00);






















