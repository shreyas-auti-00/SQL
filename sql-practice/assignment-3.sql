--1
select emp_name, department, joining_date 
from employee 
where datepart(yy, joining_date) = 2023

--2 
select emp_name, joining_date--, dateadd(mm, -6, getdate()), datediff(mm, getdate(), joining_date)
from employee 
where joining_date >= dateadd(mm, -6, getdate())

--3
select emp_name, joining_date, datediff(yy, joining_date, getdate()) as experience
from employee
where datediff(yy, joining_date, getdate()) > 3

--4 employee birthdays
select emp_name, DOB, department
from employee
where datepart(mm, getdate()) = datepart(mm, dob)

--5 department wise avg experience
select department, avg(datediff(yy, joining_date, getdate())) as avg_experience
from employee
group by Department
having avg(datediff(yy, joining_date, getdate())) > 5

--6 monthly joining analysis
select year(joining_date) as joining_year, month(joining_date) as joining_month
,count(*)
from employee
group by datepart(yy, joining_date), datepart(mm, joining_date)
order by joining_year, joining_month

--7 inactive employees
select emp_name, last_login, datediff(dd, last_login, getdate()) as login_delay
from employee
where datediff(dd, last_login, getdate()) > 30 
--8
select emp_name, joining_date,
case when datepart(weekday, joining_date) = 1 then 'sunday' else 'saturday' end as day_of_week
from employee
where datepart(weekday, joining_date) in (1,7)

--9
select department, count(*) as no_of_joiners
from employee
where datepart(yy, joining_date) = 2025
group by department
having count(*) >=5

--10
select emp_name, dob, datediff(yy, dob, getdate()) as age
from employee
where datediff(yy, dob, getdate()) between 25 and 35
order by age desc




