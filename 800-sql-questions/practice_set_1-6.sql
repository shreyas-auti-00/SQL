--1 all employee details
select * from employeedetail
--2 first name column
select firstname from employeedetail
--3 first name in uppercase
select upper(firstname) as First_Name from employeedetail
--4 first name in lower case
select lower(firstname) as 'First Name' from employeedetail
--5 first and last name combined as Name with space between them
select concat(firstname, ' ', lastname) as Name from employeedetail
--6 employee details whose name is vikas
select * from employeedetail where firstname = 'vikas'
--7 employee details whose name start with a
select *from employeedetail where firstname like 'a%'
--8 employee details whose name contains'k'
select *from employeedetail where firstname like '%k%'
--9 employee details whose name end with 'h'
select *from employeedetail where firstname like '%h'
--10 employee details whose first name statrt with any character between a-p
select *from employeedetail where firstname like '[a-p]%'
----------------------------------------------------SET 2-----------------------------------------------------
--11 employee detail whose first name do not start with characters from a-p
select *from employeedetail where firstname like '[^a-p]%'
--12 employee detail whose gender end with 'le' and has 4 characters
select *From employeedetail where gender like '__le'
--13 employee detail whose first name start with a and has 5 letters
select *from employeedetail where firstname like 'a____'
--14  Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as"
select *from employeedetail where firstname like '%[%]%'
--15 get all unique department from employee table
select distinct department from employeedetail
--16 highest salary from employeedetail
select max(salary)as highest_salary from employeedetail
--17 lowest salary from employeedetail
select min(salary) as minimum_Salary from employeedetail 
--18 show joining date in dd mmm yyyy format - code 106
select convert(varchar(20), joiningDate, 106) as 'date' from employeedetail
--19 convert joining date in yyyy/mm/dd format
select convert(varchar(20), joiningdate, 111) as 'date' from employeedetail
--20 show only time part of joining date
select convert(varchar(20), joiningdate, 111) as 'date' from employeedetail
-------------------------------------------------------set 3 ------------------------------------------------------------------
--21 get only year part of the joiningdate
select datepart(yy, joiningdate) as 'year' from employeedetail
--22 get only month part
select datepart(mm, joiningdate)as 'month' from employeedetail
--23 get system date
select getdate()
--24 get utc date
select getutcdate()
--25 get the first name , current date, and difference between current date and joining_date in months
select firstname, getdate() as 'current date', joiningdate, datediff(mm, joiningdate, getdate()) as 'date difference in months' from employeedetail
--26 get the first name , current date, and difference between current date and joining_date in days
select firstname, getdate() as 'current date', joiningdate, datediff(dd, joiningdate, getdate()) as 'date difference in month' from employeedetail
--27 employee detail whose joingi year is 2013
select *from employeedetail where datepart(yy, joiningdate) =2013
--28 employee detail whose joining month is jan(1)
select * from employeedetail where datepart(mm, joiningdate) = 1
--29 Get all employee details from EmployeeDetail table whose joining date between"2013-01-01" and "2013-12-01
select *from employeedetail where joiningdate between '2013-01-01' and '2013-12-01'
--30 display how many employee exist in employeedetail table
select count(*) as 'no of em employees' from employeedetail
-----------------------------------------------------set 4 ------------------------------------------------------------
--31 select top record from employeedertail
select top 1* from employeedetail
--32 Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select *from employeedetail where firstname in('vikas', 'ashish', 'nikhil')
--33 Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
select *from employeedetail where firstname not in ('vikas', 'ashish', 'nikhil')
--34 Select first name from "EmployeeDetail" table after removing white spaces from right side
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
--44  Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary.
select department, sum(salary)as total_salary from employeedetail group by department order by total_salary desc
--45 write a qury to fet dept, no of dept, total salary grouped by salary
select department, count(department) as 'no of dept', sum(salary) as 'total salary' from employeedetail group by department
--46 Get department wise average salary from "EmployeeDetail" table order by salary ascending
select  department, avg(salary) as 'dept avg salary' from employeedetail group by department
--47 Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
select department, max(salary) as 'max salary' from employeedetail group by department
--48 dept wise min salary from employeedetail
select department, min(salary) from employeedetail group by department
--49 Write down the query to fetch Project name assigned to more than one Employee
select projectname, count(*) as 'no of employee' from projectdetail group by projectname having count(*) > 1
-----------------------------------------------------------SET 6 ------------------------------------------------------------------------------------------------
--51 Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
select firstname, projectname from employeedetail e join projectdetail p on e.employeeID = p.employeedetailID order by firstname
--52 Get employee name, project name order by firstname from "EmployeeDetail" and"ProjectDetail" for all employee even they have not assigned project.
select firstname, projectname from employeedetail e left join projectdetail p on e.employeeid = p.employeedetailid order by firstname
--53(35.1) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned".
select firstname, isnull(projectname,'project not assigned') from employeedetail e left outer join projectdetail p on e.employeeid = p.employeedetailid order by firstname
--54 Get all project name even they have not matching any employeeid, in left table,order by firstname from "EmployeeDetail" and "ProjectDetail".
select firstname, projectname from employeedetail a right join projectdetail b on a.employeeid = b.employeedetailid order by firstname
--55 Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL.
select firstname, projectname from employeedetail a full outer join  projectdetail b on a.employeeid = b.employeedetailid order by firstname
--56. Write a query to find out the employeename who has not assigned any project, and display "-No Project Assigned"( tables :- [EmployeeDetail],[ProjectDetail]).
select firstname, isnull(projectname, 'no project assigned') from employeedetail e left join projectdetail p on e.employeeid =p.employeedetailid where projectname is null
--57 Write a query to find out the project name which is not assigned to any employee(tables :- [EmployeeDetail],[ProjectDetail]).
select projectname from employeedetail e right join projectdetail p on e.employeeid = p.employeedetailid where firstname is null
--58 Write down the query to fetch EmployeeName & Project who has assign than one project.
select firstname, projectname, employeeid from employeedetail a join projectdetail b on a.employeeid = b.employeedetailid
where employeeid in (select employeedetailid from projectdetail group by employeedetailid having count(*) >1)
--59 Write down the query to fetch ProjectName on which more than one employee  are working along with EmployeeName. 
select firstname, projectname from employeedetail a join projectdetail b on a.employeeid = b.employeedetailid 
where projectname in (select projectname from projectdetail group by projectname having count(*) > 1)




