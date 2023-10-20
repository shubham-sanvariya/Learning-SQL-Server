create proc spGetNameById1
@Id int,
@Name nvarchar(20) output
as
begin
	select @Name = Name from tblEmployee where ID = @Id
end

declare @Name nvarchar(20)
execute spGetNameById1 1, @Name out
print 'Name = ' + @Name

-- return only returns int type so it will fail
-- because it will not be able to convert nvarchar
-- to int
-- trying with return 
create proc spGetNameById2
@Id int
as
begin
	return (select Name from tblEmployee where ID = @Id)
end

declare @Name nvarchar(20)
execute @Name = spGetNameById2 1
print 'Name = ' + @Name