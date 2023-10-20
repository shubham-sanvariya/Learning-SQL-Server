CREATE FUNCTION fnComputeAge2 (@DOB DATETIME)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Age NVARCHAR(100)

    DECLARE @CurrentDate DATETIME = GETDATE()

    IF @CurrentDate < @DOB
    BEGIN
        SET @Age = 'Invalid Date'
    END
    ELSE
    BEGIN
        SELECT @Age = 
            CAST(DATEDIFF(YEAR, @DOB, @CurrentDate) - 
                CASE 
                    WHEN (MONTH(@CurrentDate) < MONTH(@DOB) OR 
                          (MONTH(@CurrentDate) = MONTH(@DOB) AND DAY(@CurrentDate) < DAY(@DOB)))
                    THEN 1 
                    ELSE 0 
                END AS NVARCHAR(10)) + ' Years ' +
            CAST(CASE 
                    WHEN MONTH(@CurrentDate) < MONTH(@DOB) OR 
                          (MONTH(@CurrentDate) = MONTH(@DOB) AND DAY(@CurrentDate) < DAY(@DOB))
                    THEN 12 - MONTH(@DOB) + MONTH(@CurrentDate) - 1
                    ELSE DATEDIFF(MONTH, @DOB, @CurrentDate) % 12
                END AS NVARCHAR(2)) + ' Months ' +
            CAST(CASE 
                    WHEN DAY(@CurrentDate) < DAY(@DOB)
                    THEN DAY(EOMONTH(@CurrentDate)) - DAY(@DOB) + DAY(@CurrentDate)
                    ELSE DAY(@CurrentDate) - DAY(@DOB)
                END AS NVARCHAR(2)) + ' Days old'
    END

    RETURN @Age
END

SELECT dbo.fnComputeAge2('2003-09-28')
-- Output: 19 Years 10 Months 23 Days old
