create view vWEmployeeDataExceptSalary
as
select ID, Name, Gender, DepartmentId
from tblEmployee

select * from vWEmployeeDataExceptSalary

-- this will update the base table in this case tblEmployee
update vWEmployeeDataExceptSalary
set Name = 'Mikey' where ID = 2

select * from tblEmployee

-- we can also delete from base table
delete from vWEmployeeDataExceptSalary where ID = 2

-- we can also insert values in the base table
insert into vWEmployeeDataExceptSalary
values (2, 'Mikey', 'male', 2)


