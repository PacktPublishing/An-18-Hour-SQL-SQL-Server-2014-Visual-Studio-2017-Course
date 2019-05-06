--1. In SQL Server Express 2014, you can type: 
       select DATEDIFF(YEAR,[Birth Date], GETDATE()) as Age,
       Format(Salary, 'C','en-us') as Salary,
	   Upper(RTRIM(LTRIM(comment))) as Comment
       from WorkerData$
