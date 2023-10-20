select * from tblEmployee

-- creating stored procedure
create proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(10),
@DepartmentId int
as
begin
	select Name, Gender from tblEmployee
	where Gender = @Gender
	and DepartmentId = @DepartmentId
end
-- calling stored procedure
spGetEmployeesByGenderAndDepartment 'male', 1

-- altering stored proc
alter proc spGetEmployees
as
begin
	select Name, Gender from tblEmployee order by Name
end

spGetEmployees

-- encrypting stored procedure
alter proc spGetEmployeesByGenderAndDepartment
@Gender nvarchar(10),
@DepartmentId int
with Encryption
as
begin
	select Name, Gender from tblEmployee
	where Gender = @Gender
	and DepartmentId = @DepartmentId
end

sp_helptext spGetEmployeesByGenderAndDepartment