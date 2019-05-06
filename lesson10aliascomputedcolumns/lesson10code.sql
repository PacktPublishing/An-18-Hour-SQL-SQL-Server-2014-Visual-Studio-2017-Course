--0. In English: Show the name, title, salary, tax amount
--   and take home pay for all people who are earning between
--   100,000 and 200,000 take home pay, and display the
--   results sorted by take home pay, from highest to lowest.
--1. aliasing computed columns
use mydbase
go
select Name as 'First Name',
       title as 'Employee Title',
	   [Money Earned] as Salary,
	   [Money Earned]*0.33 as 'Tax Amount',
	   [Money Earned]*0.66 as 'Take Home Pay'
from Table_1
where [Money Earned]*0.66 between 100000 and 200000 
order by 'Take Home Pay' desc
--2. write down the order of execution
--3. from, where, select, order by