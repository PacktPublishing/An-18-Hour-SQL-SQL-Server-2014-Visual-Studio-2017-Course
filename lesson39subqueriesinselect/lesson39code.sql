use AdventureWorks2014
go
--1. add a column to show the color of a product
--2. color column comes from the product details table
--3. it can be added as a subquery
--4. (select color from Production.Product as ProdDetails 
--	   where OrderDetails.ProductID=ProdDetails.ProductID) 
--	   as Color
--5. The subquery in 4. above functions as a new column

select SalesOrderID, ProductID, 
       
	   (select color from Production.Product as ProdDetails 
	   where OrderDetails.ProductID=ProdDetails.ProductID) 
	   as Color

from Sales.SalesOrderDetail as OrderDetails