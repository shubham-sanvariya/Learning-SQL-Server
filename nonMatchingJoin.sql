select * from tblDepartment
select * from tblEmployee

-- note always use is keyword for null not = 

-- non matching joins from left table
select       Name, Gender, Salary, Department
from         tblEmployee
left join    tblDepartment
on           tblEmployee.DepartmentId = tblDepartment.Id
where        tblEmployee.DepartmentId is null

-- non matching joins from right table
select       Name, Gender, Salary, Department
from         tblEmployee
right join    tblDepartment
on           tblEmployee.DepartmentId = tblDepartment.Id
where        tblEmployee.DepartmentId is null

-- non matching joins from both table
select       Name, Gender, Salary, Department
from         tblEmployee
full join    tblDepartment
on           tblEmployee.DepartmentId = tblDepartment.Id
where        tblEmployee.DepartmentId is null