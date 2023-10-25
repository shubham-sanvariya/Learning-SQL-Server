create TABLE Accounts
(
    Id INT PRIMARY KEY Identity,
    Name nvarchar(50),
    Balance int
)

insert INTO Accounts VALUES('Mary', 1000)

SELECT * FROM Accounts

-- Transfer $100 from Mark to Mary Account
BEGIN TRY
    BEGIN TRANSACTION
        UPDATE Accounts SET Balance = Balance - 100 WHERE Id = 1
        UPDATE Accounts SET Balance = Balance + 100 WHERE Id = 2
    COMMIT TRANSACTION
    PRINT 'Transaction Commited'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Transaction Rolled back'
END CATCH