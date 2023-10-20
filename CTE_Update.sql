select * from tblworkers

-- CTE on one base table it is possible to update table
with Workers_Name_Gender
as
(
	select	Id, Name, Gender
	from	tblworkers
)
update Workers_Name_Gender set Gender = 'Male' where Id = 1

select * from Workers_Name_Gender 

-- CTE based on two base table, update affecting only one base table
with WorkersByDepartment
as
(
	select	Id, Name, Gender, DeptName
	from	tblworkers
	join	tblworkerDept
	on		tblworkerDept.DeptId = tblworkers.DepartmentId
)
update WorkersByDepartment set Gender = 'Female' where Id = 1

select * from tblworkers

-- CTE based on two base table, update affecting more than one base table
with WorkersByDepartment
as
(
	select	Id, Name, Gender, DeptName
	from	tblworkers
	join	tblworkerDept
	on		tblworkerDept.DeptId = tblworkers.DepartmentId
)
update WorkersByDepartment set Gender = 'Female', DeptName = 'IT'
where Id = 1

select * from tblworkers