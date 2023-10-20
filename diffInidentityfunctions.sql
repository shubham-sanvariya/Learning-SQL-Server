--user 1 sesion1
insert into Test2 values('zzz')

select * from Test1
select * from Test2

select SCOPE_IDENTITY()
select @@IDENTITY
select IDENT_CURRENT('Test2')

create Trigger trForInsert on Test1 for insert
as
begin
	insert into Test2 values('yyyy')
end