create table tblMaterial(ProductId int not null Primary key,
Name nvarchar(50), UnitPrice int, QtyAvailable int)

select * from tblMaterial

create table tblMaterialSales(ProductSalesId int,
ProductId int, QuantitySold int)

delete from tblMaterial where Name = 'Mobile Phone'

select * from tblMaterialSales

create Proc spSellMaterial @ProductId int,
@QuantityToSell int
as
begin
		-- check the stock available, for the product we want to sell
		declare @StockAvailable int
		select	@StockAvailable = QtyAvailable
		from	tblMaterial where ProductId = @ProductId

		-- throw an error to the calling applicationk, if enough stock
		-- is not available
		if(@StockAvailable < @QuantityToSell)
		 begin
			Raiserror('Not enough stock available',16,1)
		 end
		 -- if enough stock availble
		else
		 begin
			 Begin Tran
			 -- First reduce the quantity available
			 update tblMaterial set QtyAvailable = (QtyAvailable - @QuantityToSell)
			 where	ProductId = @ProductId

			 declare @MaxProductSalesId int
			 -- Calculate Max ProductSalesId
			 select @MaxProductSalesId = case when
											MAX(ProductSalesId) IS NULL
											then 0 else MAX(ProductSalesId) end
										from tblMaterialSales
			-- Increment @MaxProductSalesId by 1, so we don't get a primary key violation
			set @MaxProductSalesId = @MaxProductSalesId + 1
			insert into tblMaterialSales values(@MaxProductSalesId,
			@ProductId, @QuantityToSell)
			if(@@ERROR <> 0)
			begin
				rollback transaction
				print	'Transaction rolled back'
			end
			else
			begin
				commit Tran
				print 'Transaction Committed'
			end
		 end
end

exec spSellMaterial 1, 20

-- @@Error function key points
insert into tblMaterial values(2, 'Mobile Phone', 1500, 100)
if(@@ERROR <> 0)
	print 'Error Occured'
else
	print 'No errors'

-- @@Error function key points
insert into tblMaterial values(2, 'Mobile Phone', 1500, 100)
-- At this point @@Error will have a Non Zero value
select * from tblMaterial
-- At this point @@Error gets reset to ZERO, because the select statement
-- sussessfully execute
if(@@ERROR <> 0)
	print 'Error Occured'
else
	print 'No errors'

-- store the error in variable
declare @Error int
insert into tblMaterial values(2, 'Mobile Phone', 1500,100)
set @Error = @@ERROR
select * from tblMaterial
if(@Error <> 0)
	print 'Error occured'
else
	print 'No Errors'