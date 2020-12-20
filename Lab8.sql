-------------------------------Q1-----------------------------









-------------------------------Q2-----------------------------
-- code to show Dirty Read
-- at first we should run section1 as first query then
-- we have to run the section 2 as seconde query in another window
-- so we see that the second sections reads the Dirty data

--section 1
begin transaction tran1

update Sales.SalesOrderHeader
set SubTotal = SubTotal - 100
where SalesOrderID = 43659;

waitfor delay '00:00:10';

rollback;

select SubTotal
from Sales.SalesOrderHeader
where SalesOrderID = 43659;



--section 2
begin transaction tran2
set transaction isolation level read uncommitted

select SubTotal
from Sales.SalesOrderHeader
where SalesOrderID = 43659;

commit;

-- code to show NonRepeatable Read
-- at first we should run section1 as first query then
-- we have to run the section 2 as seconde query in another window


--section 1
begin transaction tran1

select SubTotal
from Sales.SalesOrderHeader
where SalesOrderID = 43659;

waitfor delay '00:00:10';

select SubTotal
from Sales.SalesOrderHeader
where SalesOrderID = 43659;

commit;





--section 2

begin transaction tran2
set transaction isolation level read uncommitted

update Sales.SalesOrderHeader
set SubTotal = SubTotal - 100
where SalesOrderID = 43659;

select SubTotal
from Sales.SalesOrderHeader
where SalesOrderID = 43659;

commit;