CREATE TABLE StudentSource
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(20)
)

Insert INTO StudentSource VALUES (1, 'Mike')
INSERT INTO StudentSource VALUES (2, 'Sara')

Create TABLE StudentTarget
(
    Id int PRIMARY KEY,
    Name NVARCHAR(20)
)

INSERT INTO StudentTarget VALUES(1, 'Mike M')
INSERT INTO StudentTarget VALUES(3, 'John')

select * FROM StudentSource
SELECT * FROM StudentTarget

MERGE INTO StudentTarget as T
USING StudentSource AS S
ON T.Id = S.Id
WHEN MATCHED THEN
    UPDATE SET T.Name = S.Name
WHEN NOT MATCHED BY TARGET THEN
    INSERT (Id, Name) VALUES(S.Id, S.Name);