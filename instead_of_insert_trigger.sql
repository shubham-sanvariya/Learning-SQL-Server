create table tblworkerDept(DeptId int, DeptName nvarchar(50))

insert into tblworkerDept values (4, 'Admin')

select * from tblworkerDept

create table tblworkers(Id int, Name nvarchar(50), Gender nvarchar(20), DepartmentId int)

insert into tblworkers values(6, 'Ben' , 'Male' , 3)

select * from tblworkers

create view vWworkerDetails
as
select  Id, Name, Gender, DeptName
from    tblworkers
join    tblworkerDept
on tblworkerDept.DeptId = tblworkers.DepartmentId

select * from vWworkerDetails

create trigger tr_vWworkerDetails_InsteadOfInsert
on vWworkerDetails
instead of insert
as
begin
	 declare @DeptId int

	 --check if there is valid DepartmentId
	 -- for the give DepartmentName
	 select @DeptId = DeptId
	 from	tblworkerDept
	 join   inserted
	 on		inserted.DeptName = tblworkerDept.DeptName

	 -- if DepartmentId is null throw an error
	 -- and stop processing
	 if(@DeptId is null)
	 begin
			Raiserror('Invalid Department Name. Statment terminated.', 16, 1)
			return
	 end

	 -- finally insert into tblworkers table
	 insert into tblworkers(Id, Name, Gender, DepartmentId)
	 select Id, Name, Gender, @DeptId
	 from inserted
end

insert into vWworkerDetails values(7, 'Valraie', 'Female', 'IT')