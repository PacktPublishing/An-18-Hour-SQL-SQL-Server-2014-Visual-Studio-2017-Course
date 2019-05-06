use mydbase
go
--1. table variables 
declare @TableVar table(ID, Date date)
declare @ID int=1
while @ID<=1000
     begin
	    insert into @TableVar values(@ID,Convert(datetime,Rand()*50000)) 
		set @ID=@ID+1
	 end
select * into PermaTable from @TableVar
where (Year(Date) between 1950 and 2017)
--drop table PermaTable
select * from PermaTable