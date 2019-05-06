--1. group by ProductID inside the SalesOrderDetail table
--   and count the number of orders for each product ID
--2. use the output from step 1 as a table you join with the Product table
--   to say things like: ProductID 707, color black, sold 6266 units


select Prod.ProductID,
       Color,
	   TotalQTY
       from Production.Product as Prod,
	   
	   (select ProductID, Sum(OrderQty) as TotalQTY 
	   from Sales.SalesOrderDetail
       group by ProductID) as SubQuery

where Prod.ProductID=SubQuery.ProductID