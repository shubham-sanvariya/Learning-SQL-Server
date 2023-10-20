-- set table materailSales productsalesId to primary key

select * from tblMaterial
select * from tblMaterialSales

delete tblMaterialSales where ProductId = 1
create table tblMaterialSales(ProductSalesId int not null Primary key,
ProductId int, QtySold int)

update tblMaterial set QtyAvailable = 80 where ProductId = 1

insert into tblMaterial values(2, 'Desktops', 2210, 50)

alter Proc spSellMaterial @ProductId int,
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
		   begin Try
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
			commit Tran
		 end try
		 begin catch
		   Rollback Transaction
		   select 
				ERROR_NUMBER() as ErrorNumber,
				ERROR_MESSAGE() as ErrorMessage,
				ERROR_PROCEDURE() as ErrorProcedure,
				ERROR_STATE() as ErrorState,
				ERROR_SEVERITY() as ErrorSeverity,
				ERROR_LINE() as ErrorLine
		 end catch
	end
end

exec spSellMaterial 2, 5