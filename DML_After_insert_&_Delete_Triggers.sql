create table tblEmployeeAudit(Id INT IDENTITY(1,1) PRIMARY KEY, AuditData nvarchar(100))

select * from tblEmployee
select * from tblEmployeeAudit

create trigger tr_tblEmployee_ForInsert
ON tblEmployee
for insert
as
begin
		declare @Id int
		select @Id = Id from inserted

		insert into tblEmployeeAudit(AuditData)
		values ('New employee with Id = ' + 
				CAST(@Id as nvarchar(5)) +
				' is added at ' +
				CAST(Getdate() as nvarchar(20))
				)
end

set IDENTITY_INSERT tblEmployee on
insert into tblEmployee(ID, Name, Gender, Salary, City, DepartmentId)
values (11, 'Fallon','Female',  2800, 'New York' , 1)
set IDENTITY_INSERT tblEmployee off


create trigger tr_tblEmployee_ForDelete
ON tblEmployee
for delete
as
begin
		declare @Id int
		select @Id = Id from deleted

		insert into tblEmployeeAudit(AuditData)
		values ('An existing employee with Id = ' + 
				CAST(@Id as nvarchar(5)) +
				' is deleted at ' +
				CAST(Getdate() as nvarchar(20))
				)
end

DELETE from tblEmployee WHERE Id = 15

