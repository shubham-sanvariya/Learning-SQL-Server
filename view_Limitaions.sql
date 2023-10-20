

-- Error : cannot pass Parameters to Views
create view vWEmployeeDetials
@Gender nvarchar(50)
as
select ID, Name, Gender, DepartmentId
from   tblEmployee
where  Gender = @Gender

-- we can filter Gender in the WHERE clause
select * from vWITEmployees where Gender = 'male'

-- Inline table valued function as a replacement for 
-- Parameterized views
create function fn_EmployeesByGender(@Gender nvarchar(20))
returns table
as
return
(select ID, Name, Gender, DepartmentId
from tblEmployee where Gender = @Gender)

select * from dbo.fn_EmployeesByGender('male')

-- created a temp table 
create table ##TestTempTable
(Id int, Name Nvarchar(50), Gender nvarchar(20))
insert into ##TestTempTable values(101, 'John',  'Male')

-- but view or functions are not allowed on temporary tables
create view vWOnTempTable
as
select Id, Name, Gender
from ##TestTempTable