use mydbase
go
select Name, title, [money earned] from Table_1
where [money earned] between 170000 and 260000
order by [money earned] desc
--1. pick out the people who earn between 170,000 and 
--2. 260,000 and sort the results by the money earned
--3. logical execution order
--4. from, where, select, order by runs last
