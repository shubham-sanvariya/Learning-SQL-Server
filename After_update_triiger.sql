select * from tblProduct
select * from tblProductSales
select * from tblEmployeeAudit

create table tblProductAudit(Id int identity(1,1), AuditData nvarchar(1000))
select * from tblProductAudit

drop trigger tr_tblProduct_ForUpdate

create trigger tr_tblProduct_ForUpdate
on tblProduct
for update
as
begin 
	 declare @Id int
	 declare @OldName nvarchar(20), @NewName nvarchar(20)
	 declare @OldPrice int, @NewPrice int
	 
	 declare @AuditString nvarchar(1000)
	 
	 select * into #Temptable
	 from inserted

	 while(Exists(select ProductId from #Temptable))
	 begin
			set @AuditString = ''

			select TOP 1 @Id = ProductId, @NewName = Name,
			@NewPrice = UnitPrice
			from #Temptable

			select @OldName = Name, @OldPrice = UnitPrice 
			from deleted where ProductId = @Id

			set @AuditString = 'ProductId = ' + CAST(@Id as nvarchar(4))
			+ 'changed'
			if(@OldName <> @NewName)
				set @AuditString = @AuditString + ' Name from ' + @OldName
				+ ' to ' + @NewName

			if(@OldPrice <> @NewPrice)
				set @AuditString = @AuditString + ' price from ' + Cast(@OldPrice as nvarchar(4))
				+ ' to ' + Cast(@NewPrice as nvarchar(4))

			insert into tblProductAudit values(@AuditString)

			delete from #Temptable where ProductId = @Id
		end
end

update tblProduct set Name = 'Note Books' , UnitPrice = 50
where ProductId = 4