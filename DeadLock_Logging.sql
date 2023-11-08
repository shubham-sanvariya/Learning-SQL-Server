DBCC Traceon(1222) -- for just a session
DBCC Traceon(1222, -1) -- globally
DBCC TraceStatus(1222)
DBCC TraceOff(1222)
DBCC TraceOff(1222, -1)

-- to read error log
EXECUTE sp_readerrorlog

CREATE TABLE TableAlpha(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50)
)

INSERT INTO TableAlpha values('Mark')

CREATE TABLE TableBeta
(
    Id INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(50)
)

INSERT INTO TableBeta values('Mary')

select * from TableAlpha
SELECT * FROM TableBeta

drop TABLE TableAlpha
DROP TABLE TableBeta

-- transaction 1
EXECUTE spTransaction1

Create PROCEDURE spTransaction1
as
BEGIN
    BEGIN TRANSACTION
        update TableAlpha SET Name = 'Mark Transaction 1'
        WHERE Id = 1
        WAITFOR delay '00:00:05'
        update TableBeta SET Name = 'Mary Transaction 1'
        WHERE Id = 1
    COMMIT TRANSACTION
END

-- transaction 2
EXECUTE spTransaction2

Create PROCEDURE spTransaction2
as
BEGIN
    BEGIN TRANSACTION
    update TableBeta SET Name = 'Mark Transaction 2'
        WHERE Id = 1
    WAITFOR delay '00:00:05'
    update TableAlpha SET Name = 'Mary Transaction 2'
        WHERE Id = 1
    COMMIT TRANSACTION
END