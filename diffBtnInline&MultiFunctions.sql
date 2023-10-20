select * from tblEmployee

select * from tblDob
-- inline table valued function
create function fn_ILTVE_GetEmployees()
returns table
as
return
(select Id, Name, Cast(DateOfBirth as Date) as DOB FROM tblDob)

-- updating inline function
update fn_ILTVE_GetEmployees() set Name = 'nanu' where Id = 1

select * from dbo.fn_ILTVE_GetEmployees()

-- Multi-statement table valued function
Create function fn_MSTVF_GetEmployees()
returns @Table table (Id int, Name nvarchar(20), Dob date)
as
begin
	 insert into @Table
	 select Id, Name, Cast(DateOfBirth as date) from tblDob

	 return
end

-- cannot update multi-statement functions

select * from dbo.fn_MSTVF_GetEmployees()