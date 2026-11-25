---------------------------------------------------set 10----------------------more tricky questions --------------------------------------------------------------
--100. Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)
select concat(upper(substring(firstname,1,1)), lower(substring(firstname, 2))) from employeedetail

--101. Write down the query to display all employee name in one cell seprated by ',' ex:-"Vikas, nikita, Ashish, Nikhil , anish"(EmployDetail table)
select string_agg(firstname, ', ') from employeedetail --after 2017 versions
--or
select stuff((select ', ' + e.firstname from employeedetail as e for xml path('')), 1, 2, '')
--or
declare @name varchar(max) = ''
select @name = @name + firstname + ',' from employeedetail
select len(stuff(@name, len(@name) ,1, ''))
--or
declare @name2 varchar(max) = ''
select @name2 = @name2 + firstname +', ' from employeedetail
select substring(@name2, 1, len(@name2)-1)

--102. Write down the query to get ProjectName and respective EmployeeName(firstname) which areworking on the project,
--if more then one employee working on same project, then it should be in same cell seprated by comma
--for example :- Task Tracker : Vikas, Ashish
select p2.projectname, 
stuff((select ', ' + firstname
	from employeedetail e join projectdetail p1 
	on e.employeeid = p1.employeedetailid 
	where p1.projectname = p2.projectname for xml path('')), 1, 2, '') as [employees working]
from employeedetail e join projectdetail p2 on e.employeeid  = p2.employeedetailid group by p2.projectname

--or 
select projectname, string_agg(firstname, ', ') as 'emplyee names'
from employeedetail e join projectdetail p 
on e.employeeid = p.employeedetailid
group by projectname

--103: You have a table(FuelDetail) with ID, Fuel, And Date columns.
--Fuel column is contain fuel quantity at a particular time when car start traveling. So we need to find out that when the driver fill Petrol in his/her car.
--By FuelDetail Table image on the top of this post, you can understand the query.
--Car start driving at 10 Am on 25th April with petrol(10 liter)
--at 11 AM Petrol was 9 liters
--at 12 AM petrol was 8 liters
--at 2 PM (14) petrol was 12 liters...
--This means that he/she fill the petrol at 25th April 2014 at 2PM
--Next time he fill petrol at 7PM 25th April 2014
--and Next time he fill petrol at 11PM 25th April 2014
with cte as 
(select *, lag(fuel)over(order by id) f2 , lag(date)over (order by id) previous_time
from fueldetail )
select * from cte where f2<fuel
--or
select a.id ,a.fuel, a.date , b.id,b.fuel, b.date
from fueldetail a join fueldetail b on a.id = b.id-1
and a.fuel<b.fuel

-----------------------------------------------------------SET 11---------------------------------------------------------------------------
--104.
SELECT a.a FROM (SELECT 1 A, 2 B) A
JOIN (SELECT 1 A,1 B)B ON A.A = B.B
--ans. c

--105.
SELECT B.A FROM (SELECT 1 A) A
JOIN (SELECT 1 A, 2 B)B ON A.A = B.A
--ans. c

--106.
SELECT B.A FROM (SELECT 1 A) A
JOIN (SELECT 1 A, 2 B)B ON A.A = B.B
--ans. b

--107.
SELECT * FROM (SELECT 1 A UNION ALL SELECT 2 B) A
JOIN (SELECT 1 A,2 B UNION ALL SELECT 1 A, 1 B)B ON A.A = B.B
--ans. e

--108.
SELECT * FROM (SELECT 1 A UNION ALL SELECT 2 B) A
JOIN (SELECT 1 A,2 B)B ON A.A = B.B
--ans. d

-------------------------------------------------------------------------------set 13---------------------------------------------------------------------------------
--1). How to select random record form a table?
Select top 1 *, newid() from employee order by newId()

--2).Suppose that you have table Employee with a column EName which contain
--Records Employee name(EName) as A,B,A,A,B,D,C,M,A, Write a query which will
--change/Swap the EName A to B and B to A.
begin transaction
update employee set ename = case when ename = 'b' then 'a' when ename = 'a' then 'b' else ename end 
select * from employee
rollback transaction --do not forget to run either rollback or commit after running begin transaction

--3). Write a query to create a clone of existing table without using Create Command.
select top 0 *  into e2 from employee -- creates table named e2 with no rows
--or
select * into e3 from employee where 1=2 --with false where condition that returns nothing

--4). Table Tbl1 has 100 rows, Table Tbl2 has 0 rows so number of rows returned by thebelow query?
SELECT Tbl_1.* from Tbl_1, Tbl_3;

--5). Write a query to print 1 to 100 in sql server without using loops?
--TIP : USE RECURSIVE COMMON TABLE EXPRESSION
WITH CTE AS
( SELECT 1 A
UNION ALL 
SELECT A+1 FROM CTE WHERE A<100)
SELECT * FROM CTE

DECLARE @I INT
SET @I = 0
WHILE (@i<100)
BEGIN
SELECT @I = @I + 1
PRINT @I
END
--OR 
SELECT VALUE FROM GENERATE_SERIES(1,100, 2)

--6). Write a query to calculate number of A in string 'VIKASAAA'?
select sum(len('VIKASAAA')  - len(replace('VIKASAAA', 'a', '')))

--7). What would be the output of below query?
SELECT * FROM ( SELECT 1  UNION ALL SELECT 2 ) M
--ans. will throw an error cause no column name is specified

--8). ). What would be the output of below query?
SELECT sum(a) as [sum]  FROM ( SELECT 1 A UNION ALL SELECT NULL A) m


