--0. In English: Show the name, title and salary of all 
--   people who earn less than 170,000 or more than 250,000
--   and show them first sorted by title descending and then by 
--   salary ascending
use mydbase
go
select Name as 'First Name', 
       Title as 'Employee Title', 
	   [Money Earned] as Salary 
from table_1
where [Money Earned] not between 170000 and 250000
order by Title desc,Salary
--1. grab the table with from
--2. where runs to select the records we want
--3. select runs to get the columns we want
--4. order by runs last and therefore Salary can be used in the 
--5. order by