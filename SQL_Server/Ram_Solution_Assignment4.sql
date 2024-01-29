/***User Defined Functions Practice Questions***/
/*1.	Create a UDF named GetFullName that concatenates the first name and last name of an employee 
with a space in between and Write a query to get the full names of all employees using the GetFullName UDF.*/

create function udfFullNameOfEmployee(@Limit int)
returns table
as
return
(
	select top (@Limit) firstName+' '+lastName as FullName from Employee
);

select * from udfFullNameOfEmployee(5);

/*2.	Create a UDF named GetSalaryGrade that takes an employee's salary as input and returns their salary grade based on the following conditions:
a.	If the salary is less than 50000, return 'Low'.
b.	If the salary is between 50000 and 80000 (inclusive), return 'Medium'.
c.	If the salary is greater than 80000, return 'High'.
d.	Write a query to get the EmployeeID, FullName, and SalaryGrade for all employees using the GetSalaryGrade UDF.
*/

create function udfGetSalaryGradeOfDatEmployee(@salary int)
returns table
as
return
(
	select Id, Name, Department,
	case
		when @salary < 5000 then 'Low'
		when @salary between 5000 and 15000 then 'Medium'
		else 'High'
		end as SalaryGrade
	from DatEmployee
);

alter function udfGetSalaryGradeOfDatEmployee(@salary int)
returns table
as
return
(
	select Id, Name, Department,
	case
		when @salary < 5000 then 'Low'
		when @salary between 5000 and 15000 then 'Medium'
		else 'High'
		end as SalaryGrade
	from DatEmployee where Salary = @salary
);

select * from udfGetSalaryGradeOfDatEmployee(10000);
/*
3.	Create a UDF named GetAverageSalary that calculates and returns the average salary of all employees and Write a query
to get the average salary of all employees using the GetAverageSalary UDF.
*/
create function udfGetAvgSalaryOfDatEmployee()
returns int
as
begin
	return (select avg(Salary) from DatEmployee)
end;

select dbo.udfGetAvgSalaryOfDatEmployee() as AverageSalary; 

/*4.	Create a Scalar UDF to calculate the discounted price for a product. The discount percentage is 10% and
Use the Scalar UDF to get the discounted prices for all products.*/

CREATE TABLE product_table (
    product_name VARCHAR(50),
    product_price DECIMAL(10, 4)
);

INSERT INTO product_table (product_name, product_price)
VALUES
    ('Road-150 Red', 2171.2942),
    ('Mountain-100 Silver', 1912.1544),
    ('Mountain-100 Silver', 1912.1544),
    ('Road-650 Black', 413.1463),
    ('Mountain-100 Silver', 1912.1544),
    ('Road-150 Red', 2171.2942),
    ('Road-150 Red', 2171.2942),
    ('Mountain-100 Black', 1898.0944),
    ('Mountain-100 Silver', 1912.1544),
    ('Road-150 Red', 2171.2942);

select * from product_table;

alter function udfGetDiscountOfProduct(@productcost float)
returns float
as 
begin
	return (select  round(@productcost - @productcost*0.1,2))
end;


select dbo.udfGetDiscountOfProduct(1912.1544) as Discount;

select product_name, product_price, dbo.udfGetDiscountOfProduct(product_price) as '10%Discount' from product_table;


/*
5.	Create a Table-Valued UDF to return all products within a specific price range and Use the Table-Valued UDF 
to get products within a price range.
*/
CREATE FUNCTION udfProdAsPriceRange(@lower int, @upper int)
returns table
as 
return
(
	select product_name, product_price 
	from product_table
	where product_price between @lower and @upper
);

select * from udfProdAsPriceRange(1500,2000);

/*
6.	Create an Inline Table-Valued UDF to get all products in a specific category and Use the Inline 
Table-Valued UDF to get all products from a specific category.
*/
create function udfProductCategory()
returns table
as
return
(
	select product_price, string_agg(product_name, ',') as Products
	from product_table
	group by product_price
);

select * from udfProductCategory();

/***Stored Procedure Practice Questions***/
/*
•	Basic Stored Procedure: Write a simple stored procedure named GetEmployeeCount 
that returns the total number of employees in the "Employees" table.
*/
alter proc spGetEmployeeCount
as
begin
	select count(employeeId) as EmployeeCount 
	from Employee
end

spGetEmployeeCount

/*
•	Input Parameters: Create a stored procedure named GetEmployeesByDepartment that takes a department name as input 
and returns all the employees who belong to that department.
*/

alter proc spGetEmployeesByDepartment  
@DeptName nvarchar(20)
as
begin
	select FirstName, LastName, DepartmentName 
	from Staff s
	inner join Departments d
	on s.DepartmentId=d.DepartmentId
	where DepartmentName = @DeptName
end

spGetEmployeesByDepartment 'Sales'

/*
•	Output Parameters: Write a stored procedure named GetEmployeeInfo that takes an employee ID as input and returns the employee's name,
job title, and hire date using output parameters.
*/
create proc spGetEmployeesInfo  
@id int
as
begin
	select EmployeeId, FirstName, LastName, DepartmentName 
	from Staff s
	inner join Departments d
	on s.DepartmentId=d.DepartmentId
	where EmployeeId = @id
end

spGetEmployeesInfo 2

/*
•	Error Handling: Create a stored procedure named InsertEmployee that inserts a new employee into the "Employees" table. However,
if the insertion fails due to duplicate employee ID or any other reason, the procedure should return an error message.
•	Table-Valued Parameters: Create a stored procedure named InsertEmployees that takes a table-valued parameter containing employee data (employee ID, name, department, etc.) 
and inserts multiple employees into the "Employees" table in a single call.
*/
create proc spInsertEmployee
@id int,
@firstname nvarchar(20),
@lastname nvarchar(20),
@deptid int
as
begin
	begin try
		insert into Staff(EmployeeId, FirstName, LastName, DepartmentId)
		values(@id, @firstname, @lastname, @deptid)
	end try
	begin catch
		select
			ERROR_MESSAGE() AS ErrorMessage,
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_LINE() AS ErrorLine,
			ERROR_PROCEDURE() AS ErrorProcedure
	end catch
end

spInsertEmployee 7, 'Dinesh', 'Kumar', 102

/*
•	Returning Resultsets: Write a stored procedure named GetEmployeeProjects that takes an employee ID as input and returns two result sets:
o	The first result set should contain the employee's details (name, department, etc.).
o	The second result set should contain all the projects the employee is currently working on.
*/
alter proc GetEmployeeProjects
@id int
as
begin
	select s.EmployeeId, FirstName, LastName, string_agg(ProjectName, ',') as ProjectsName 
	from Staff s inner join Projects p on s.EmployeeId=p.EmployeeId
	where s.EmployeeId = @id
	group by s.EmployeeId, FirstName, LastName
end

GetEmployeeProjects 1

/*
•	Dynamic SQL: Write a stored procedure named GetEmployeeByFilter that allows the user to search for employees based on different filters, such as name, job title, and department.
The procedure should use dynamic SQL to construct the query based on the provided filter values.
*/
alter proc GetEmployeeByFilter
@id int=null,
@firstname nvarchar(20)=null,
@lastname nvarchar(20)=null,
@deptid int=null
as
begin
		if @id is not null
		begin
			(select EmployeeId, FirstName, LastName, DepartmentId
			from Staff where EmployeeId=@id)
		end
	    if @firstname is not null
		begin
			(select EmployeeId, FirstName, LastName, DepartmentId
			from Staff where FirstName=@firstname)
		end
		if @lastname is not null
		begin
			(select EmployeeId, FirstName, LastName, DepartmentId
			from Staff where LastName=@lastname)
		end
		else
		    (select EmployeeId, FirstName, LastName, DepartmentId
		    from Staff where DepartmentId=@deptid)
end

GetEmployeeByFilter @id=3
GetEmployeeByFilter @firstname='Alex'
GetEmployeeByFilter @lastname='Mongia'
GetEmployeeByFilter @deptid=101

select * from Staff;

/*
•	Transactions: Design a stored procedure named TransferFunds that transfers a specified amount from one bank account to another.
The procedure should handle transactions to ensure data consistency in case of failures.
*/
select * from TransactionA;
select * from TransactionB;

alter proc TransferFunds
@fromid int,
@toid int,
@transferfund money
as
begin
	select * from TransactionA
	union
    select * from TransactionB
	update TransactionA set ATotalBalance=(ATotalBalance - @transferfund)  where ATransId=@fromid
	update TransactionB set BTotalBalance=(BTotalBalance + @transferfund)  where BTransId=@toid
	select * from TransactionA
	union
    select * from TransactionB
end

TransferFunds @fromid=1000, @toid=2000, @transferfund=500