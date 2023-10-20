create table tblEmployeeManger(EmployeeId int, Name nvarchar(30), MangerId int)

insert into tblEmployeeManger values(1, 'Tom' , 2)

select * from tblEmployeeManger

--Recursive CTE
with EmployeeCTE (EmployeeId, Name, ManagerId, [Level])
as
(	
	select	EmployeeId, Name, MangerId, 1
	from	tblEmployeeManger
	where	MangerId is null

	union all

	select tblEmployeeManger.EmployeeId, tblEmployeeManger.Name,
		   tblEmployeeManger.MangerId, EmployeeCTE.[Level] + 1
	from	tblEmployeeManger
	join	EmployeeCTE
	on		tblEmployeeManger.MangerId = EmployeeCTE.EmployeeId
)
select	EmpCTE.Name as Employee, ISNULL(MgrCTE.Name, 'Super Boss') as Manager,
EmpCTE.[Level]
from	EmployeeCTE EmpCTE
left join	EmployeeCTE MgrCTE
on		EmpCTE.ManagerId = MgrCTE.EmployeeId