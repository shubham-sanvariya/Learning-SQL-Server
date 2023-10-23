CREATE TABLE tblEmployees(Id int IDENTITY PRIMARY KEY,
 Name nvarchar(50), Email nvarchar(100),
  Age int, Gender nvarchar(10), HireDate Date)
insert into tblEmployees VALUES('Paul Sensit',
'Paul.Sensit@test.com',29,'Male','2007-10-23')

select * from tblEmployees

Create PROCEDURE spSearchEmployees
@Name NVARCHAR(50) = NULL,
@Email NVARCHAR(50) = NULL,
@Gender NVARCHAR(50) = NULL,
@Age INT = NULL
as
BEGIN
    select * FROM tblEmployees
    WHERE   (Name = @Name or @Name is null) AND
            (Gender = @Gender or @Gender is null) AND
            (Email = @Email or @Email is null) AND
            (Age = @Age or @Age is null)
END

EXECUTE spSearchEmployees @Gender = 'Male', @Age = 29

