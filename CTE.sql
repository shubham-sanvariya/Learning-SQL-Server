with WorkersCount(DeptName, DepartmentId, TotalWorkers)
as
(
	select DeptName, DepartmentId, COUNT(*) as TotalWorkers
	from	tblworkers
	join	tblworkerDept
	on		tblworkers.DepartmentId = tblworkerDept.DeptId
	group by	DeptName, DepartmentId
)

select	DeptName, TotalWorkers
from	WorkersCount
where	TotalWorkers >= 2

select * from tblworkers
select * from tblworkerDept

update tblworkers set DepartmentId = 3 where Id = 1

with WorkerCountBy_Payroll_IT_Dept(DepartmentName, Total)
as
	(
		select DeptName, COUNT(Id) as TotalWorkers
		from	tblworkers
		join	tblworkerDept
		on		tblworkers.DepartmentId = tblworkerDept.DeptId
		where	DeptName in ('Payroll', 'IT')
		group by	DeptName
	),
WorkerCountBy_HR_Admin_Dept(DepartmentName, Total)
as
	(
		select DeptName, COUNT(Id) as TotalWorkers
		from	tblworkers
		join	tblworkerDept
		on		tblworkers.DepartmentId = tblworkerDept.DeptId
		where	DeptName in ('HR', 'Admin')
		group by	DeptName
	)
select * from WorkerCountBy_HR_Admin_Dept
union
select * from WorkerCountBy_Payroll_IT_Dept