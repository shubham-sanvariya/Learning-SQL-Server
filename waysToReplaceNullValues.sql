select * from tblSelfJoin

--changing value if null by using ISNULL f^n
select		E.Name as Employee, 
			ISNULL(M.Name, 'No Manager') as Manager
from		tblSelfJoin E
left join	tblSelfJoin M
on			E.ManagerId = M.EmployeeId

--changing value if null by using COALESCE f^n
select		E.Name as Employee, 
			coalesce(M.Name, 'No Manager') as Manager
from		tblSelfJoin E
left join	tblSelfJoin M
on			E.ManagerId = M.EmployeeId

--changing value if null by using case f^n
select		E.Name as Employee, 
			case when M.Name is null then
			'No Manager' else M.Name end
			as Manager
from		tblSelfJoin E
left join	tblSelfJoin M
on			E.ManagerId = M.EmployeeId