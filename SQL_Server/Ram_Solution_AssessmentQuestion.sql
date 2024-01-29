create database Assessment;

/****Que.1***/
create table Worker(
	WorkerId int,
	FirstName nvarchar(20),
	LastName nvarchar(20),
	Salary money,
	JoiningDate datetime,
	Department nvarchar(20)
);

select * from Worker

create table Bonus(
	WorkerRefId int,
	BonusDate datetime,
	BonusAmount money
);

select * from Bonus;

create table Title(
	WorkerRefId int,
	WorkerTitle nvarchar(20),
	AffectedForm datetime,
);

select * from Title;

/*1.1 Write an SQL query to print details of the Workers who are also Managers.*/
select WorkerId, WorkerRefId, WorkerTitle, FirstName, LastName, Salary, JoiningDate, Department from Worker w
inner join Title t on w.WorkerId=t.WorkerRefId
where WorkerTitle = 'Manager'

/*1.2 Write an SQL query to show only odd rows from Worker table.*/
select * from worker where (WorkerId%2)!=0;

/*1.3 Write an SQL query to print the name of employees having the highest salary in each department*/
select w.Department, FirstName+' '+LastName as EmployeeName, w.Salary
from (select Department, max(Salary) as Salary from Worker group by Department) t 
inner join Worker w  on w.Department=t.Department
where w.Salary=t.Salary;

/*1.4 Write an SQL query to fetch three max salaries from a table.*/
select top (3) Salary from Worker order by Salary desc;

/*
Que 3. 
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and 
displayed underneath its corresponding Occupation. The output column headers should be 
Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/
create table Occupation
(
PerName nvarchar(20),
OccupName nvarchar(20)
);

select OccupName, string_agg(PerName, ', ') as PerName
from Occupation group by OccupName;

/*
Que 4.
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a 
query to print the hacker_id, name, and total score of the hackers ordered by the descending 
score. If more than one hacker achieved the same total score, then sort the result by ascending 
hacker_id. Exclude all hackers with a total score of from your result.
*/

create table Hackers
(
HackerId int,
HackerName nvarchar(20)
);

create table Submission
(
SubId int,
HackId int,
ChallId int,
Score int
);

select HackerId, HackerName, Score from Hackers h
inner join Submission s on h.HackerId=s.HackId
where Score != 0
order by Score desc, HackerId asc

/*Que 6.
Write a query to output the names of those students whose best friends got offered a higher 
salarythan them. Names must be ordered by the salary amount offered to the best friends. It is 
guaranteed that no two students will get the same salary offer.
*/
create table Students
(
Id int,
StudName nvarchar(20)
);

create table Friends
(
FriendId int,
Id int
);

create table Packages
(
Id int,
Salary money
);

select StudName from
(select s.Id, f.FriendId, StudName, Salary from Students s
 inner join Friends f on s.Id=f.Id
 inner join Packages p on p.Id=s.Id) x
inner join
 (select FriendId, Salary from Friends f
  inner join Packages p on f.FriendId=p.Id) y
on x.FriendId=y.FriendId 
where x.Salary < y.Salary;

/**Que 7.
Query - Write a SQL query to retrieve all the CustomerName and their OrderDate for each 
order if applicable. If no order date then print 1900-01-01.
**/
create table Customers
(
CustomerId int,
CustomerName nvarchar(20),
City nvarchar(20)
);

create table Orders
(
OrderId int,
CustomerId int,
OrderDate date
);

update (select CustomerName, OrderDate from Customers c
 left join Orders o on c.CustomerId=o.CustomerId) 
 set OrderDate = '1900-01-01' where OrderDate is NULL;

/* Que 8. 
Query - Write a SQL query to retrieve the names of all the employees along with the names of 
their managers wherever applicable.*/
select * from Employee where managerId is not null;

/*Que 9.
Query –
9.1 Write a SQL query to retrieve the StudentName and the list of courses each student 
is enrolled in.
*/
select StudName , string_agg(y.CourseName,', ') as Courses from
(select s.Id, e.CourseId, StudName from Students s
 inner join Enrollments e on s.Id=e.StudId) x 
 inner join
(select CourseId, CourseName from Courses) y
 on x.CourseId=y.CourseId
 group by StudName


/*
9.2 Write a query to show StudentName, courseName (retrieved in Q. 1) along with the 
count of courses.
*/
select StudName , count(y.CourseId) as #Courses from
(select s.Id, e.CourseId, StudName from Students s
 left join Enrollments e on s.Id=e.StudId) x 
 left join
(select CourseId, CourseName from Courses) y
 on x.CourseId=y.CourseId
 group by StudName

 /*Que 10.
 Query - Write a SQL query to retrieve the following information for each employee:
Employee Name (concatenation of FirstName and LastName) Department Name List of Project 
Names they are working on
 */

 create table Employees
 (
 EmployeeId int,
 FirstName nvarchar(20),
 LastName nvarchar(20),
 DeptId int
 );

 create table Departments
 (
 DeptId int,
 DeptName nvarchar(20)
 );

 create table EmployeeProjects
 (
 EmployeeId int,
 ProjectId int
 );

 create table Projects
 (
 ProjectId int,
 ProjectName nvarchar(20)
 );

 select x.EmployeeName, x.DeptName, string_agg(y.ProjectName, ', ') as Projects
 from
 (select EmployeeId, FirstName+' '+LastName as EmployeeName, DeptName
  from Employees e inner join Departments d on e.DeptId=d.DeptId) x
  inner join
 (select EmployeeId, ProjectName from EmployeeProjects e
  inner join Projects p on e.ProjectId = p.ProjectId ) y
  on x.EmployeeId=y.EmployeeId
  group by x.EmployeeName, x.DeptName

/*
Que 11. Query - Create a scalar UDF named CalculateTotalPrice that takes an OrderID as input and 
returns the total price (Quantity * UnitPrice) for that order.
*/
alter function CalculateTotalPrice(@orderid int)
returns float
as
begin
return( select Quantity*UnitPrice  from Orders
        where OrderId=@orderid)
end

select dbo.CalculateTotalPrice(3) as TotalPrice

/*
Que 12.
Query - Create a table-valued UDF named GetHighValueOrders that returns a table containing 
orders with a total value greater than a given threshold.
*/
create function GetHighValueOrders()
returns table
as
return(
select * from OrderRevenue where
TotalPrice >= (select avg(TotalPrice) from OrderRevenue)
);

select * from dbo.GetHighValueOrders()

/*
Query 13. 
Query- Create an inline table-valued UDF named GetEmployeesByDepartment that takes a 
DepartmentID as input and returns the employees in that department.
*/

alter function GetEmployeeByDepartment(@deptid int)
returns table
as
return
(
select DeptId, string_agg(concat(FirstName,' ',LastName),',') as EmployeesName
from Employees
where DeptId=@deptid
group by DeptId
);

select * from GetEmployeeByDepartment(101)


