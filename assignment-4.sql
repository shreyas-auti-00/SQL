--1. Mask phone numbers: Display only the last 4 digits of each employee's phone number. Replace the first 6 digits with *.Expected output: ******3210
select concat('******', substring(phone_number, 7))masked_number from employee2

--2. Create a fixed-width report: Display every employee's first name padded on the right with * until the total length becomes 10 characters.Example: Rahul → Rahul*****
select concat(first_name, replicate('*', 10-len(first_name))) from employee2

--3. Name standardization: Display first names in uppercase if their length is less than 5; otherwise, display them in lowercase.
select case when len(first_name) > 5 then upper(first_name) else lower(first_name) end as standardised_name from employee2

--4. Phone masking: If the phone number starts with 9, mask the first 6 digits with *. Otherwise, display the original phone number.
select case when substring(phone_number, 1, 1) = 9 then concat('******', substring(phone_number, 7)) else phone_number end as masked_phone from employee2

--5. Return the top two salary ranks in each department using DENSE_RANK(). label rank 1 as Gold and rank 2 as Silver.
with cte as (select *, dense_rank() over (partition by department_id order by salary desc)r1 from employee2 )
select * , case when r1 = 1 then 'GOLD' when r1 = 2 then 'SILVER' end as salary_rank from cte where r1<=2

--6. Display employees who joined on Saturday or Sunday. Show the employee name in uppercase with their joining day expl. AMIT_saturday
select joining_date,  case 
when datepart (weekday, joining_date) =1 then concat (upper(first_name), '_', 'sunday') 
when datepart(weekday, joining_date) = 7 then concat(upper(first_name), '_',  'saturday') else null end as weekday_joiners
from employee2 where datepart(weekday, joining_date) in (1,7)

--7. Display employee name and joining quarter,year such as RAHUL-Q1-2022
select first_name, joining_date, concat(upper(first_name), '-', 'Q', datepart(quarter, joining_date),'-' ,datepart(yy, joining_date)) from employee2

--8. Display the number of days since joining and classify employees as New if they joined within the last 365 days, otherwise Existing.
select *,  case 
when datediff(dd, joining_date, getdate()) <= 365 then concat( datediff(dd, joining_date, getdate()) , '-NEW')
else concat(datediff(dd, joining_date, getdate()), '-EXISTING') end as employee_experience
from employee2

--9. Display the joining month name in uppercase, replacing JANUARY with JAN and FEBRUARY with FEB.
select case
when datepart(mm, joining_date) in (1, 2) then substring(upper(datename(mm,joining_date)), 1, 3 )
else upper(datename(mm, joining_date)) end as joining_month
from employee2

--10. Calculate the days remaining until the next joining anniversary and generate a label like RAHUL-45-DAYS.
with cte as (
select *, dateadd(yy, datediff(yy, joining_date, getdate()), joining_date)anv from employee2 ) ,
cte2 as (
select *, case when anv >= getdate() then anv else dateadd(yy, 1, anv) end as new_anv from cte)
select *,  concat(upper(first_name), '-', datediff(dd, getdate(), new_anv), '-', 'DAYS') from cte2
----------------------------------------------------------------------or---------
select * , 
concat(upper(first_name),'-', datediff(dd, getdate(), case when dateadd(yy, datediff(yy, joining_date, getdate()), joining_date) >= getdate()
then dateadd(yy, datediff(yy, joining_date, getdate()), joining_date)
else dateadd(yy, datediff(yy, joining_date, getdate()) +1, joining_date ) end ), '-DAYS') from employee2



