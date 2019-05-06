--1. choosing grouped records with the having clause
--2. In English: pick out the department where the sales 
--   are above or equal to 800,000
use mydbase
go
select [dept name], 
       sum([sales amount]) as TotalSales
       from Table_2
group by [dept name]
having sum([sales amount])>=800000
--4. clause execution steps: from, group by, having, select 