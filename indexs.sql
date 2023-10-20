select * from tblEmployee

create index IX_tblEmployees_Salary
on tblEmployee (Salary asc)

-- to find the indexs on table
sp_helpindex tblEmployee

-- to drop or delete a index
--drop index tblEmployee.IX_tblEmployees_Salary