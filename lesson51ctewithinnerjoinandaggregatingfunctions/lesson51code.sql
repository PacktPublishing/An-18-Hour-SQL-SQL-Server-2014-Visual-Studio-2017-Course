--1. importing CSV (comma separated files)
--2. joining them in a common table expression
--3. selecting records from the common table expression
--4. drop table SalesAmounts, SalesPeople
bulk insert SalesPeople
   from 'C:\Data\SalesPeople.csv'
   with
       (
	      FIRSTROW=2,
		  FIELDTERMINATOR=',',
		  ROWTERMINATOR='\n'
	   )
select * from SalesPeople;

bulk insert SalesAmounts
   from 'C:\Data\SalesAmounts.csv'
   with
       (
	      FIRSTROW=2,
		  FIELDTERMINATOR=',',
		  ROWTERMINATOR='\n'
	   )
select * from SalesAmounts;

With JoinCTE (Name,SalesAmount)
As
(
     Select Name, Sum(Amount) as TotalSales
	 from 
	     SalesPeople as s inner join SalesAmounts as a 
		 on s.SalesPersonID=a.SalesPersonID
		 group by Name
)
select * from JoinCTE
delete from SalesAmounts
delete from SalesPeople
