
create function fn_GetNameById(@Id int)
returns nvarchar(30)
with encryption
as
begin
	 return (select Name from tblEmployee where ID = @Id)
end

select dbo.fn_GetNameById(2)

-- we cant get the query statement in messages because of encryption
sp_helptext fn_GetNameById

-- using schemaBinding
alter function fn_GetNameById(@Id int)
returns nvarchar(30)
with SCHEMABINDING
as
begin
	 return (select Name from dbo.tblEmployee where ID = @Id)
end

-- if we execute the below querry the command will not be successfull
-- because we have SchemaBind the tblEmployee
drop table tblEmployee