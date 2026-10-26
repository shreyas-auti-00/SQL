select sum(salary) as total_salary,avg(salary), max(salary), department
from employees
where experience >2
group by department
having sum(salary)>500000 AND avg(salary)>50000
order by total_salary desc;
--2
select count(employee), min(salary), max(salary) as max_salary, city
from employees
where salary>30000
group by city
having count(employee)>=5 and max(salary)>80000
order by max_salary desc;
--3 
select count(employee), avg(experience) as avg_exp, max(experience), department
from employees
where salary >40000
group by department
having count(employee) >3 and avg(experience) >4
order by avg_exp desc;
--4
select count(employee), sum(salary), avg(salary) as avg_sal, gender
from employees
where city = 'Pune'
group by gender
having count(employee) >5 and avg(salary) >45000 
order by avg_sal desc;
--5
select min(salary), max(salary), avg(salary) as avg_sal, city
from employees
where experience >3
group by city
having min(salary) >30000 and max(salary) > 75000 and avg(salary) >50000
order by avg_sal desc;
--6
select count(employee) as emp_count, sum(salary), avg(experience), department
from employees
where salary between 35000 and 90000 
group by department
having count(employee)>=4 and sum(salary) > 400000 
order by emp_count desc;
--7
select count(employee), avg(salary) as avg_sal, max(experience), city
from employees
where experience >2
group by city 
having count(employee) >3 and avg(salary) >45000 and max(experience) > 8
order by avg_sal desc;
--8
select count(employee), avg(salary), sum(salary) as total_sal, department
from employees
where salary > 50000
group by department
having count(employee) >=3 and avg(salary) > 65000 
order by total_sal desc;
--9
select count(employee), avg(experience) as avg_exp, avg(salary), city
from employees
where salary >40000
group by city
having count(employee) >=5 and avg(experience) >5 and avg(salary)>55000
order by avg_exp desc;
--10
select min(salary), max(salary) as max_sal,  avg(salary), count(employee), department
from employees
where experience >=3
group by department
having max(salary) > 100000 and avg(salary) > 60000 and count(employee) >=4 
order by max_sal desc;