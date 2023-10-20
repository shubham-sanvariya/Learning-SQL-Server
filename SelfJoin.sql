select * from tblSelfJoin

insert into tblSelfJoin values(5,'shap',null)

-- self join from left join
select     E.Name as Employee, M.Name as Manager
from	   tblSelfJoin E
left join  tblSelfJoin M
on         E.ManagerId = M.EmployeeId

-- self join from inner join
select     E.Name as Employee, M.Name as Manager
from	   tblSelfJoin E
join  tblSelfJoin M
on         E.ManagerId = M.EmployeeId