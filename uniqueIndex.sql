
create table [tblUniqueIndex]
(
	[Id] int Primary key,
	[FirstName] nvarchar(50),
	[LastName] nvarchar(50),
	[Salary] int,
	[Gender] nvarchar(10),
	[City] nvarchar(50)
)

-- creating unique constraint so that same name and lastname 
-- data cannot be entered
create unique nonclustered index
UIX_tblEmployee_FirstName_LastName
on [tblUniqueIndex](FirstName, LastName)

alter table tblUniqueIndex
add constraint UQ_tblUniqueIndex_city
unique (City)

sp_helptext UQ_tblUniqueIndex_city