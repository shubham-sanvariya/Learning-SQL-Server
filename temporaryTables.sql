create table #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'John')
insert into #PersonDetails values(3,'Todd')

select * from #PersonDetails

-- to check if temp table exist or not
select name from tempdb..sysobjects
where name like '#PersonDetails%'

-- if temp table is created inside stored proc it gets dropped automatically
-- upon completion of store poc
create proc spCreateLocalTempTable
as
begin
create table #PersonDetails(Id int, Name nvarchar(20))

insert into #PersonDetails values(1,'Mike')
insert into #PersonDetails values(2,'John')
insert into #PersonDetails values(3,'Todd')

select * from #PersonDetails
end

-- Global variables are declared by ##
create table ##PersonDetails(Id int, Name nvarchar(20))