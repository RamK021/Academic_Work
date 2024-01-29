/*
DAY 6 Assignment Questions
Database Management System – Assignments Session 4
Assignment 1:
*/

/*
➢	Create a function to calculate number of orders in a month.
Month and year will be input parameter to function.
*/
create function MaxOrderInMonthOfhpInvoice(@month int, @year int)
returns int
as
begin
	return(
		select count(InvoiceDate) from hp.hpInvoice 
		where datepart(month, InvoiceDate) = @month and datepart(year, InvoiceDate) = @year
	)
end;

select dbo.MaxOrderInMonthOfhpInvoice(7, 2023) as #Orders

/*➢	Create a function to return month in a year having maximum orders. Year will be input parameter.*/

alter function HavingMaxOrderInMonthOfhpInvoice(@year int)
returns int
as
begin
	return(
		select top(1) [Month]
		from(
		select datepart(month, InvoiceDate) as [Month], count(InvoiceId) as #Orders
		from hp.hpInvoice
		where datepart(year, InvoiceDate) = @year
		group by datepart(month, InvoiceDate)
		) as subquery
		order by #Orders desc
	)
end;

select dbo.HavingMaxOrderInMonthOfhpInvoice(2023) as MonthHaveMaxOrder

/****Assignment 2:*****/

/*
➢	Create a Stored procedure to retrieve average sales of each product in a month.
    Month and year will be input parameter to function.
*/
alter proc spRetrieveAvgSalesOfProdOfhpInvoice
@month int,
@year int
as
begin
	select avg(TotalSales) as AvgSales
	from(
	select datepart(month, InvoiceDate) as [Month],datepart(year, InvoiceDate) as [Year],
	       ProdId, sum(Price) as TotalSales
	from hp.hpInvoice
	group by datepart(month, InvoiceDate), datepart(year, InvoiceDate), ProdId
	)as subquery
	where [Month]=@month and [Year]=@year
end;

spRetrieveAvgSalesOfProdOfhpInvoice 8, 2023

/*
➢	Create a stored procedure to retrieve table having order detail with status for a given period.
    Start date and end date will be input parameter.
	Put validation on input dates like start date is less than end date.
	If start date is greater than end date take first date of month as start date.
*/

create proc OrderDetailsOfhpInvoice
@startdate date,
@enddate date
as
begin
	if @startdate<@enddate
	begin
		select * from hp.hpInvoice 
		where @startdate <= format(InvoiceDate, 'yyyy-MM-dd') and InvoiceDate <= @enddate 
	end
	else
	begin
		 select * from hp.hpInvoice 
		 where @enddate <= InvoiceDate and InvoiceDate<=@startdate
	end
end

OrderDetailsOfhpInvoice '2023-07-30', '2023-07-01'


/*
Assignment 3:
➢	Identify the columns require indexing in order, product, category tables and create indexes.
*/

create nonclustered index ixhpInvoice_BillingCity
on hp.hpInvoice(BillingCity asc)

select * from hp.hpInvoice where ixhpInvoice_BillingCity = 'New York'


/*
Practice Questions
3.	Triggers Example-
a.	Create a After Trigger with AFTER and FOR Clause
b.	Instead Trigger
c.	Create a DDL & DML Triggers
4.	Merge Example.
*/


/*
1.Create a Stored Procedure to get the data of Students from a particular department.
  If there are no students available for the Department then Print a message “Please Provide Correct Department”.
*/
alter proc spGetCustomerData
@city nvarchar(20)
as 
begin
	if @city in (select distinct City from hp.hpCustomers)
	begin
		select * from hp.hpCustomers where City=@city
	end
	else
	begin
		print 'Please Provid Correct City Name!!!'
	end
end

spGetCustomerData 'New Delhi'

/*
2.	Create a Procedure which accept the Input Parameter – 
    TableName, QueryClause, ConditionColumn, ConditionOperator and Value of ConditionColumn.
	Return the result set for of Query.
*/

create proc spQueryDefinitionAndResult
@tablename nvarchar(20),
@queryclause nvarchar(20),
@conditioncolumn nvarchar(20),
@conditionoperator nvarchar(10),
@valueofcondition nvarchar(20)
as 
begin
	declare @sql nvarchar(100)
	if @queryclause = 'select'
	begin
		set @sql = N'select * from '+quotename(@tablename)+ N' where '+ 
		quotename(@conditioncolumn)+@conditionoperator+@valueofcondition

		exec @sql 
	end
	else
	begin
		print 'Please provid "select" query clause only!!! '
	end
end;

spQueryDefinitionAndResult 'hp.hpCustomers', 'select', 'City', '=', 'New York'
