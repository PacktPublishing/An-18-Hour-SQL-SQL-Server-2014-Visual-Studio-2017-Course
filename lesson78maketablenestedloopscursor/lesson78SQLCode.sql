create table SalesTable
(
   ID int identity(1,1) primary key,
   EmpID int,
   DateSold date, 
   MonthOnly varchar(20),
   Amount money
)
declare EmpIDCursor cursor for (select EmpID from EmployeesTable)
declare @InnerCounter int=1
declare @EmpID int
open EmpIDCursor
fetch next from EmpIDCursor into @EmpID
	while @@FETCH_STATUS=1
		begin
		    while @InnerCounter<=10
				begin 
				     insert into SalesTable(EmpID, DateSold, MonthOnly, Amount)
					             values(@EmpID,
								        GetDate()+@InnerCounter,
										DateName(Month,GetDate()+@InnerCounter),
										Rand()*10000)
					 set @InnerCounter=@InnerCounter+1
				end	
				set @InnerCounter=1
				fetch next from EmpIDCursor into @EmpID
		end
close EmpIDCursor
deallocate EmpIDCursor
select * from SalesTable
drop table SalesTable