-- this System stored proc gives information 
-- about parameters req. for the stored proc 
sp_help spGetEmployeeCountByGender

select * from tblEmployee

-- stored proc of output parameter
create proc spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int output
as
begin
	select @EmployeeCount = COUNT(ID)
	from tblEmployee where Gender = @Gender
end


declare @TotalCount int
execute spGetEmployeeCountByGender 'Male',
@TotalCount output -- we need to specify output to get the value
if(@TotalCount is null)
	print '@TotalCount is null'
else 
	print '@TotalCount is not null'
print @TotalCount