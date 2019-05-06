use mydbase
go
--1. save points and rolling back transactions
drop table temp
create table temp (id int, value float)
begin transaction
     insert into temp values(1,'')
     select * from temp
     save transaction SavePoint
     update temp 
	        set value=Floor(Rand()*10) 
			where id=1
	 select * from temp
   rollback transaction SavePoint
   select * from temp
commit transaction
