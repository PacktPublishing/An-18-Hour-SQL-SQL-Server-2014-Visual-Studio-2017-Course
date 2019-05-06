SELECT    customers$.[customer name] AS [Customer Name], 
          orders$.quantity, 
		  orders$.total, 
		  customers$.orderid
FROM       customers$ INNER JOIN
               orders$ ON customers$.orderid = orders$.orderid
WHERE    (orders$.quantity >= 2)
ORDER BY orders$.total DESC
--1. from, on, where, select, order by 
