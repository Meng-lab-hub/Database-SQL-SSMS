
-- TASK 02

select * from
account;


-- TASK 04

BEGIN TRANSACTION

UPDATE account
SET balance = balance - 300
WHERE id = 2;

UPDATE account
SET balance = balance + 300
WHERE id = 1;

COMMIT;


-- TASK 06

select limit
from exam
where id=1;

select count(*)
from signup
where examid=1;

insert into signup
values(1, 444);

SELECT *
FROM signup;

SELECT *
FROM exam;

-- TASK 07
-- A DEADLOCK HAPPENNED, THE FIRST TRANSACTION IS COMPLETED SUCCESSFULLY, THE SECOND IS ABORTED
-- The first transaction will wait until the second transaction is aborted

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
values(1,666);

ROLLBACK;
COMMIT;

-- TASK 08

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
values(1,666);

ROLLBACK;
COMMIT;

-- TASK 09

set transaction isolation
level serializable;

Begin transaction;

select limit
from exam
where id=2;

select count(*)
from signup
where examid=2;

insert into signup
values(2,666);

ROLLBACK;
COMMIT;

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



commit

-- TASK 12

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
values(1,444);

commit

-- TASK 13

set transaction isolation
level read committed
begin transaction

select limit
from exam with(XLOCK)
where id=2

select count(*)
from signup
where examid=2

insert into signup
values(2,444);

commit