SELECT    customers$.[customer name], orders$.orderid, orders$.quantity, orders$.item
FROM       customers$ RIGHT OUTER JOIN
               orders$ ON customers$.orderid = orders$.orderid
WHERE    (orders$.quantity <= 3)
ORDER BY orders$.quantity DESC
--1. from, on, where, select, order by

INSERT INTO customers$
               (id, [customer name], orderid)
VALUES    (12, N'Tom Smith', 9)
select * from customers$