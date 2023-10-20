--select * from tblDob

-- this f^n is not working created second f^n computeage2
create function fnComputeAge(@DOB DATETIME)
	returns nvarchar(100)
	as
	begin

	declare @tempdate datetime, @years int,
	@months int, @days int

	select @tempdate = @DOB

	select @years = DATEDIFF(year, @tempdate, getdate()) -
					case 
						when (MONTH(@DOB) > MONTH(GETDATE())) 
						OR 
						(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
						THEN 1 ELSE 0
					END

	SELECT @tempdate = DATEADD(year, @years, @tempdate)

	select @months = DATEDIFF(MONTH, @tempdate, GETDATE()) -
					case 
						when DAY(@DOB) > DAY(GETDATE())
						then 1 else 0
					end

	select @days = DATEDIFF(day, @tempdate, Getdate())

	declare @Age nvarchar(100)
	set @Age = cast(@years as nvarchar(4))
	+ ' Years ' +cast(@months as nvarchar(2))
	+ ' Months ' +cast(@days as nvarchar(2))
	+ ' Days old '
	
	return @Age
END
