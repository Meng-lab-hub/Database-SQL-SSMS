
-- choose database to work on
use lab1;



-- creating table
create table Address
(
	City nvarchar(50) not null,
	Street nvarchar(50) not null,
	House int not null,
	PostalCode int not null
)

create table Bus
(
	LicensePlate nchar(6) not null,
	Manufacturer nvarchar(50) not null,
	Seats int not null,
	Year int not null
)

create table Driver
(
	Name nvarchar(50),
	Experience int,
	PhoneNumber nchar(10)
)

create table Route
(
	Priority int,
	Financing nvarchar(50),
	ID int not null
)

create table School
(
	Title nvarchar(50) not null,
	Type nvarchar(50) not null,
	Capacity int
)

create table Student
(
	Name nvarchar(50) not null,
	DateOfBirth date not null,
	Scholarship bit not null
)


-- Modify data type in table

alter table Driver
alter column Name nvarchar(50) not null;

alter table Driver
alter column PhoneNumber nchar(10) not null;

alter table School
alter column Type nvarchar(50) not null;

-- drop table Address, Driver, Route, School, Student, Bus;

-- create DailyDrive table

create table DailyDrive
(
	Date date not null,
	BusID int not null,
	DriverID int not null,
	RouteID int not null,
	ID int primary key not null
)


-- Use to show table's infos
/*
select *
from Address;

select *
from Bus;

select *
from Driver;

select *
from Route;

select *
from School;

select *
from Student;

select *
from DailyDrive;
*/

-- search query for 'Nguyen Ky' on '2015-02-08'

select Student.Name, DailyDrive.Date, Driver.Name, Driver.PhoneNumber from Driver
inner join DailyDrive on Driver.ID = DailyDrive.DriverID
inner join Route on DailyDrive.RouteID = Route.ID
inner join Address on Address.RouteID = Route.ID
inner join Student on Student.AddressID = Address.ID
where Student.Name = 'Nguyen Ky' and DailyDrive.Date = '2015-02-08';