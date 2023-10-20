select * from tblEmployee

select MAX(salary) from tblEmployee

select city, SUM(salary) as TotalSalary
from tblEmployee
Group by city

-- group mulitple columns
select city, gender, SUM(salary) as TotalSalary
from tblEmployee
group by city, gender
order by City

-- group mulitple columns and count the total employees
select gender, city, SUM(salary) as TotalSalary,
COUNT(ID) as [Total Employees] 
from tblEmployee
group by gender, city

--  getting male employees using where clause
select gender, city, SUM(salary) as TotalSalary,
COUNT(ID) as [Total Employees]
from tblEmployee
where gender = 'Male'
group by gender, city

-- getting male employees using having clause
select gender, city, SUM(salary) as TotalSalary,
COUNT(ID) as [Total Employees]
from tblEmployee
group by gender, city
having gender = 'male'

-- aggregate f^n can only be used in HAVING clause
select gender, city, SUM(salary) as TotalSalary,
COUNT(ID) as [Total Employees]
from tblEmployee
group by gender, city
having SUM(salary) > 4000
