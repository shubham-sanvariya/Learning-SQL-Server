select * from tblDepartment


create view vWEmployeesByDepartment
as
select e.ID, e.Name, e.Salary, e.Gender, Department
from tblEmployee e
join tblDepartment
on e.DepartmentId = tblDepartment.Id
sp_helptext vWEmployeesByDepartment

create view vWITEmployees
as
select e.ID, e.Name, e.Salary, e.Gender, Department
from tblEmployee e
join tblDepartment
on e.DepartmentId = tblDepartment.Id
where tblDepartment.Department = 'IT'

select * from vWITEmployees

create view vWSummarizedData
as
select  Department, COUNT(e.id) as TotalEmployees
from tblEmployee e
join tblDepartment
on e.DepartmentId = tblDepartment.Id
group by Department

select * from vWSummarizedData
