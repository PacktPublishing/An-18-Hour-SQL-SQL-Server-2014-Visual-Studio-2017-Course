select * from customers$
select * from orders$

select  [customer name],
        customers$.orderid,
		quantity
        from 
           customers$ inner join orders$
		   on
		   customers$.orderid=orders$.orderid
order by quantity desc
--1. logical execution order: join, from, select, order by


