


-- using views
create view vWworkerCount
as
select DeptName, DepartmentId, COUNT(*) as TotalWorkers
from	tblworkers
join	tblworkerDept
on		tblworkers.DepartmentId = tblworkerDept.DeptId
group by	DeptName, DepartmentId

select * from vWworkerCount

select DeptName, TotalWorkers from vWworkerCount
where  TotalWorkers >= 2

-- using Temp Tables
select DeptName, DepartmentId, COUNT(*) as TotalWorkers
into	#TempWorkersCount
from	tblworkers
join	tblworkerDept
on		tblworkers.DepartmentId = tblworkerDept.DeptId
group by  DeptName, DepartmentId

select * from #TempWorkersCount

select  DeptName, TotalWorkers
from	#TempWorkersCount
where	TotalWorkers >= 2

-- using Table variables

declare @tblWorkersCount table(DeptName nvarchar(20), DepartmentId int, TotalWorkers int)

insert	@tblWorkersCount
select	DeptName, DepartmentId, COUNT(*) as TotalWorkers
from	tblworkers
join	tblworkerDept
on		tblworkers.DepartmentId = tblworkerDept.DeptId
group by	DeptName, DepartmentId

select	DeptName, TotalWorkers
from	@tblWorkersCount
where	TotalWorkers >= 2

-- using Derived Tables
select DeptName, TotalWorkers
from	
	(
		select	DeptName, DepartmentId, COUNT(*) as TotalWorkers
		from	tblworkers
		join	tblworkerDept
		on		tblworkers.DepartmentId = tblworkerDept.DeptId
		group by	DeptName, DepartmentId
	)
as WorkersCount
where	TotalWorkers >= 2

-- using CTE(Common Table Expression)
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