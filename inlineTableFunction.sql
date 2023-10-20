select * from tblDob

select * from tblDepartment

create function fn_EmployeesByGender(@Gender nvarchar(10))
returns Table
as
return (select ID, Name, Gender, DepartmentId
		from tblEmployee
		where Gender = @Gender)

-- calling the function
select * from fn_EmployeesByGender('male') where Name = 'ronit'

select	Name, Gender, Department
from	fn_EmployeesByGender('male') E
join    tblDepartment D on D.Id = E.DepartmentId