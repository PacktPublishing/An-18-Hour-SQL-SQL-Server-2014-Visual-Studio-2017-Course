--1. Please pause the video and import the excel file under
--   lesson resources
--2. import the SalesAmount field as a money
--3. Date import as date data type
--4. percent change: (current amount - previous amount )/previous amount
select SalesAmount,
lag(SalesAmount) over(order by date) As PreviousDaylSales,
(SalesAmount-(lag(SalesAmount) over(order by date))) as Difference,
(SalesAmount-(lag(SalesAmount) over(order by date)))/(lag(SalesAmount) over(order by date))*100
as PercentChange
from Sheet1$


