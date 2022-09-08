CREATE DATABASE lab4;

USE lab4;

SELECT *
FROM account;

-- TASK 01

drop table account;
create table account
(id int primary key,
balance int)
insert into account values(1, 5000)
insert into account values(2, 8500)
insert into account values(4, 6400);

-- TASK 02
-- 2 UPDATES HAPPENED INDEPENDENTLY (NOT ATOMICALLY)

update account
set balance=balance-1000
where id=1;


update account
set balance=balance+1000
where id=2;


-- TASK 03
-- IN THIS WAY THE TRANSACTION IS ATOMIC
-- IF WE DON'T COMMIT, THE OTHER QUERRY CANNOT READ THE ACCOUNT TABLE, WE MUST COMMIT IT FIRST

begin transaction
update account
set balance=balance-1000
where id=1;

update account
set balance=balance+1000
where id=2;
commit;

-- TASK 04
-- there is a deadlock happened in this task, since transfer 1 and transfer 2 tried to use the same resouce,
-- transfer 1 successfully executed but transfer 2 is aborted

BEGIN TRANSACTION

UPDATE account
SET balance = balance - 500
WHERE id = 1;

UPDATE account
SET balance = balance + 500
WHERE id = 2;

COMMIT;

-- TASK 05

drop table signup;
drop table exam;



create table exam
( id int primary key,
 subject varchar(20),
 date datetime,
 limit int
);

create table signup(
 examid int references exam(id),
 studentid int,
 primary key (examid,studentid)
);

insert into exam
values(1, 'Informatics2',convert(datetime,'2007.06.15',102),3);

insert into exam
values(2, 'Mathematics',convert(datetime,'2007.06.18',102),3);

insert into signup values(1,111);
insert into signup values(1,222);

SELECT *
FROM signup;

SELECT *
FROM exam;

-- TASK 06
-- TWO STUDENT SEE THAT FOR THIS EXAM THERE IS ONE AVAILABLE PLACE, BUT THEY REGISTER AT THE SAME TIME
-- THIS IS PHANTOM RECORD OR (READ) AND BY DEFAULT PROTECTION (READ COMMITTED), IT CANNOT PREVENT THIS

select limit
from exam
where id=1;

select count(*)
from signup
where examid=1;	

insert into signup
values(1, 333);

-- TASK 07

set transaction isolation
level serializable;

Begin transaction

select limit
from exam
where id=1;

select count(*)
from signup
where examid=1;

insert into signup
values(1,555);

-- AT THIS STEP THE INSERT CANNOT PROCESS
ROLLBACK;
COMMIT;

-- TASK 08

SELECT *
FROM signup;

SELECT *
FROM exam;

UPDATE exam
SET limit = 5
WHERE exam.id = 1;

set transaction isolation
level serializable;

Begin transaction

select limit
from exam
where id=1;

select count(*)
from signup
where examid=1;

insert into signup
values(1,555);

ROLLBACK;
COMMIT;

-- Task 09
-- both transaction can read data simultaneously, until when both want to insert, a deadlock happenned, only one of the transaction is executed successfully

SELECT *
FROM signup;

SELECT *
FROM exam;

set transaction isolation
level serializable;

Begin transaction;

select limit
from exam
where id=1;

select count(*)
from signup
where examid=1;

insert into signup
values(1,555);

ROLLBACK;
COMMIT;

-- TASK 10

drop table signup;
drop table exam;

create table exam
( id int primary key,
 subject varchar(20),
 date datetime,
 limit int
);

create table signup(
 examid int references exam(id),
 studentid int,
 primary key (examid,studentid)
);

insert into exam
values(1, 'Informatics2',convert(datetime,'2007.06.15',102),3);

insert into exam
values(2, 'Mathematics',convert(datetime,'2007.06.18',102),3);

insert into signup values(1,111);
insert into signup values(1,222);

SELECT *
FROM signup;

SELECT *
FROM exam;

-- TASK 11

set transaction isolation
level read committed
begin transaction

select limit
from exam with(XLOCK)
where id=1

select count(*)
from signup
where examid=1

insert into signup
values(1,333)

commit

-- TASK 12

UPDATE exam
SET limit = 6
WHERE id = 1;

SELECT *
FROM signup;

SELECT *
FROM exam;

set transaction isolation
level read committed
begin transaction

select limit
from exam with(XLOCK)
where id=1

select count(*)
from signup
where examid=1

insert into signup
values(1,333)

commit

-- TASK 13
-- both transaction works well independently from each other. no waiting for each other.

set transaction isolation
level read committed
begin transaction


select limit
from exam with(XLOCK)
where id=1

select count(*)
from signup
where examid=1

insert into signup
values(1,333)

commit

SELECT * 
FROM signup;

SELECT *
FROM exam;
