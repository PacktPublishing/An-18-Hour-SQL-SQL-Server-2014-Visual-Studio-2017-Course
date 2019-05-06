--1. local variables
--2. generating random values
--3. begin/end and while
use mydbase
go
drop table RandomValues
create Table RandomValues
(
   ID int not null primary key identity(1,1),
   Random float
)

declare @loopCounter int
set @loopCounter=1 --4. this condition shoudl reflect your specific need
while @loopCounter<=250 --5. @counter<=250 is a logical condition we have chosen
      Begin
	    insert into RandomValues values(Rand()) --6. generate and save 250 random values
		set @loopCounter=@loopCounter+1 --7. needed to grow loop counter value
	  End

select * from RandomValues
--8. if loopCounter is not incremented, you get an infinite while loop
--9. if begin/end are missing, you get an infinite loop