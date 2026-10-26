--q1 all employee details
select * from employeedetail
--q2 first name column
select firstname from employeedetail
--q3 first name in uppercase
select upper(firstname) as First_Name from employeedetail
--q4 first name in lower case
select lower(firstname) as 'First Name' from employeedetail
--q5 first and last name combined as Name with space between them
select concat(firstname, ' ', lastname) as Name from employeedetail
--q6 employee details whose name is vikas
select * from employeedetail where firstname = 'vikas'
--q7 employee details whose name start with a
select *from employeedetail where firstname like 'a%'
--q8 employee details whose name contains'k'
select *from employeedetail where firstname like '%k%'
--q9 employee details whose name end with 'h'
select *from employeedetail where firstname like '%h'
--q10 employee details whose first name statrt with any character between a-p
select *from employeedetail where firstname like '[a-p]%'
----------------------------------------------------SET 2-----------------------------------------------------
--q11 employee detail whose first name do not start with characters from a-p
select *from employeedetail where firstname like '[^a-p]%'
--q12 employee detail whose gender end with 'le' and has 4 characters
select *From employeedetail where gender like '__le'
--q13 employee detail whose first name start with a and has 5 letters
select *from employeedetail where firstname like 'a____'
--q14  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as"
select *from employeedetail where firstname like '%[%]%'
--q15 get all unique department from employee table
select distinct department from employeedetail
--q16 highest salary from employeedetail
select max(salary)as highest_salary from employeedetail
--q17 lowest salary from employeedetail
select min(salary) as minimum_Salary from employeedetail 
--q18 show joining date in dd mmm yyyy format - code 106
select convert(varchar(20), joiningDate, 106) as 'date' from employeedetail
--q19 convert joining date in yyyy/mm/dd format
select convert(varchar(20), joiningdate, 111) as 'date' from employeedetail
--q20 show only time part of joining date
select convert(varchar(20), joiningdate, 111) as 'date' from employeedetail
-------------------------------------------------------set 3 ------------------------------------------------------------------
--q21 get only year part of the joiningdate
select datepart(yy, joiningdate) as 'year' from employeedetail
--q22 get only month part
select datepart(mm, joiningdate)as 'month' from employeedetail
--q23 get system date
select getdate()
--q24 get utc date
select getutcdate()
--q25 get the first name , current date, and difference between current date and joining_date in months
select firstname, getdate() as 'current date', joiningdate, datediff(mm, joiningdate, getdate()) as 'date difference in months' from employeedetail
--q26 get the first name , current date, and difference between current date and joining_date in days
select firstname, getdate() as 'current date', joiningdate, datediff(dd, joiningdate, getdate()) as 'date difference in month' from employeedetail
--q27 employee detail whose joingi year is 2013
select *from employeedetail where datepart(yy, joiningdate) =2013
--q28 employee detail whose joining month is jan(1)
select * from employeedetail where datepart(mm, joiningdate) = 1
--q29 Get all employee details from EmployeeDetail table whose joining date between"2013-01-01" and "2013-12-01
select *from employeedetail where joiningdate between '2013-01-01' and '2013-12-01'
--q30 display how many employee exist in employeedetail table
select count(*) as 'no of em employees' from employeedetail
-----------------------------------------------------set 4 ------------------------------------------------------------
--q31 select top record from employeedertail
select top 1* from employeedetail
--q32 Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select *from employeedetail where firstname in('vikas', 'ashish', 'nikhil')
--q33 Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select *from employeedetail where firstname not in ('vikas', 'ashish', 'nikhil')
-- 34 Select first name from "EmployeeDetail" table after removing white spaces from right side
select rtrim(firstname)firstname from employeedetail
--35 select first name after removing white spaces from left side
select ltrim(firstname)firstname from employeedetail
--36 display first name and gender as M/F
select firstname, case when gender = 'male' then 'M' when gender = 'female' then 'F' end as 'gender' from employeedetail
--37 Select first name from "EmployeeDetail" table prifixed with "Hello "
select concat('Hello ', firstname) as firstname from employeedetail
--38 Get employee details from "EmployeeDetail" table whose Salary greater than 600000
select * from employeedetail where salary > 600000
--39 employeedetailwhose salary is less then 700000
select *from employeedetail where salary<700000
--40 employee whose salary is between 5lack and 6 lack
select * from employeedetail where salary between 500000 and 600000
--41 second highest salary
select top 1 salary from (select top 2 salary from employeedetail order by salary desc)t order by salary asc
------------------------------------------------------------SET 5---------------------------------------------------------------------------------------------------
--42 Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table
select sum(salary)as total_salary, department from employeedetail group by department
--43 Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
select department, sum(salary) as total_salary from employeedetail group by department order by total_salary asc