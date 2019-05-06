SELECT    customers$.[customer name], 
customers$.orderid, 
orders$.total, 
orders$.quantity, 
orders$.item
FROM       customers$ full JOIN
               orders$ ON customers$.orderid = orders$.orderid
--1. executin order: from, on select
			   