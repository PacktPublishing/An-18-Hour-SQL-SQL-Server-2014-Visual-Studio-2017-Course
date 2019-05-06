--1. user defined functions allow us to create reusuable blocks
--of code
--2. scalar valued functions return one quantity as a result of
--   of their operations
use AdventureWorks2014
go
--3. create a function that returns the line total for an order id
--4. call function with order id, order id value goes into the body
--5. of the function, which uses it and then returns the sum
--6. for that order id back to the calling line
create function ufnTotalOrderAmount(@OrderID int) returns money
as
   begin
         declare @TotalOrderAmount money
         select @TotalOrderAmount=sum(LineTotal)
 from Sales.SalesOrderDetail
 where SalesOrderID=@OrderID
 return @TotalOrderAmount
   end
go
Print 'Total Order Amount '+Format(dbo.ufnTotalOrderAmount(43659),'C')
