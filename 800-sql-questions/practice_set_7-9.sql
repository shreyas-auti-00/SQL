--------------------------------------------------------------------SET 7--------------------------------------------------
--60 What would be the output of the following query(INNER JOIN) 
 SELECT T1.ID, T2.ID FROM TBL_1 T1 INNER JOIN TBL_2 T2 ON T1.ID = T2.ID 

--66 What would be the output of the following query.(Related Tables : Table_1,Table_2) 
SELECT A.[ID] ,A.[Name],B.[ID] ,B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID = B.ID 

--67. What would be the output of the following query.(Related Tables : Table_1,Table_2) 
SELECT A.[ID] ,A.[Name],B.[ID] ,B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID = B.ID AND A.[Name] = B.[Name] 

--70 What would be the output of the following query.(Related Tables : Table_1,Table_2) --(INNER JOIN WITH NOT EQUAL !=) 
SELECT A.[ID], A.[Name],B.[ID], B.[Name] FROM [Table_1] A INNER JOIN [Table_2] B 
ON A.ID != B.ID

--75 Write down the query to fatch record from Table_1 which not exist in Table_2(based on ID column) 
select * from table_1 a left join table_2 b on a.id = b.id where b.name is null

--77 write down the query to fatch record from Table_2 which not exist in Table_1(based on ID column)
select * from table_1 a right join table_2 b on a.id = b.id where a.name is null

--------------------------------------------------------------------SET 8 ---------------------------------------------------------------------------------
--78. Write down the query to create employee table with Identity column([EmployeeID])
create table employeedetail2 (employeeID int identity(1,1) , firstname varchar(50), lastname varchar(50), salary int, joining_date datetime, department varchar(50), gender varchar(50))

--80. Write down the query to create employee table with primary key (EmployeeID)
create table employeedetail3 (employeeid int identity(1,1) primary key, firstname varchar(30), lastname varchar(30), salary int, joiningdate datetime, department varchar(30), gender varchar(30))

--81. How to set Primary key using Alter command
alter table employeedetail2 drop constraint PK__employee__C134C9A1399AAF8C
alter table employeedetail2 add primary key (employeeid)
select * from information_schema.TABLE_CONSTRAINTS where table_name = 'employeedetail'

--82. How to set primary key and foreignkey relationship using query(set EmployeeID column ofProjectDetail table as a foreignkey)
select * from projectdetail
alter table projectdetail2 add constraint pr_fk foreign key (employeedetailid) references employeedetail(employeeid)

---------------------------------------------------------set 9-------------------------------------------------------------------------
--83.
select  15 -- ans. 15

--84.
select $ ---ans 0.00

--85. 
select count(*) ---ans 1

--86. 
select count('7') ---ans 1

--87.
select 'vikas' + 1 --ans error

--88.
select 'vikas' + '1' --ans vikas1

--89.
select (select 'vikas') -- ans vikas

--90.
select select vikas --ans error

--91.
select * from 'country' --ans error

--92.
select * from employeedetail, country -- cross join of both table

--93.
select count(*) + count(*) --ans 2

--94.
select 'vikas' from country --display vikas times the no. of rows

--95.
select sum(1+2*3) --ans 7

--96.
select max(1+2*3) --ans 7

--97.
select max(1,3,4) --error

--98.
select max('vikas') --ans vikas

--99.
select count(select * from country) --error 

--100.
select 1+'1' --ans 2 (works if string happen to be a number)

--101.
select '1'+1 --ans 2

--102.
select null +5 --ans null ( anything + null is null)

--103.
select null + '1' --ans null

--104.
select 1 where null = null -- empty as null never equates to ever another null

--105.
select sum(1) --ans 1

--106.
select sum('1') --ans error

--107.
select sum(null) --error

--108.
select 6/0 --divide by zero error

--109.
select 0/0 --error

--110.
select 0/9 --ans 0
