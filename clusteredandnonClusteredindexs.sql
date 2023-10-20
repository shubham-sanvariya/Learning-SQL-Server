CREATE TABLE [tblclusteredIndex]
(
	[ID] int Primary Key,
	[Name] nvarchar(50),
	[Salary] int,
	[Gender] nvarchar(10),
	[City] nvarchar(50)
)

-- we are inserting data in non sequential manner 
INSERT into tblclusteredIndex values(3, 'John' ,4500,'Male','New York')
INSERT into tblclusteredIndex values(1, 'Sam' ,2500,'Male','London')
INSERT into tblclusteredIndex values(4, 'Sara' ,5500,'Female','Tokyo')
INSERT into tblclusteredIndex values(5, 'Todd' ,3100,'Male','Toronto')
INSERT into tblclusteredIndex values(2, 'Pam' ,6500,'Female','Sydney')

-- but the data comes in sequential manner
select * from tblclusteredIndex

-- we can only have one clustered index on a tbl
-- it is possible for that one clustered index to have multiple columns
create clustered index IX_tblEmployees_Gender_Salary
on tblclusteredIndex(Gender desc, Salary asc)
-- now the columns are arranged in desc and asc order
select * from tblclusteredIndex

create nonclustered index IX_tblEmployee_Name
on tblclusteredIndex(Name)