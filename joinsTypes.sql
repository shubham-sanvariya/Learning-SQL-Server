select * from tblDepartment
select * from tblEmployee

alter table tblEmployee
add DepartmentId int

-- join or inner join for matching rows
select Name, Gender, Salary, Department
from tblEmployee
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Id

-- left join for both matching and non-matching
--rows from left table
select Name, Gender, Salary, Department
from tblEmployee
left join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Id

-- right join for both matching and non-matching
--rows from right table
select Name, Gender, Salary, Department
from tblEmployee
right join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Id

-- full join for both matching and non-matching
--rows from both table
select Name, Gender, Salary, Department
from tblEmployee
full join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.Id