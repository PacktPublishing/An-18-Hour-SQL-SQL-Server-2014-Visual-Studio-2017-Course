--1. returning entire tables from calling functions
--2. table-valued function
use AdventureWorks2014
go
create function GetProductDetails(@ProductID int)
returns @ProductDetails table (Name Name,Color nvarchar,ListPrice money)
as
begin
     declare @Name name, @Color nvarchar, @ListPrice money
	 select @Name=name, @Color=color, @ListPrice=ListPrice
	 from Production.Product
	 where ProductID=@ProductID
	 insert @ProductDetails select @Name, @Color, @ListPrice
	 return
end
go
select name,Color from GetProductDetails(1)
drop function GetProductDetails