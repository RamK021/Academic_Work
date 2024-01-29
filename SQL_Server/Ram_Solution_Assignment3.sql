/***
Que 1. You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
Grades contains the following data:
Grade 1 for marks 0-9
Grade 2 for marks 10-19 and so on.
Similarly Grade 10 for marks 90-100
 
Write a query to Generate a report containing three columns: Name, Grade and Mark.
Don’t print the NAMES of those students who received a grade lower than 8.
The report must be in descending order by grade -- i.e., higher grades are entered first.
If there is more than one student with the same grade (8-10) assigned to them, order those students by their name alphabetically.
Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order.
If there is more than one student with the same grade (1-7) assigned to them, order those students by their marks in ascending order.
***/
create table tblGrade(
	Grade int,
	Min_Marks int,
	Max_Marks int
);

insert into tblGrade(Grade, Min_Marks, Max_Marks)
values(1,0,9),
	  (2,10,19),
	  (3,20,29),
	  (4,30,39),
	  (5,40,49),
	  (6,50,59),
	  (7,60,69),
	  (8,70,79),
	  (9,80,89),
	  (10,90,100);

create table Students(
	ID int,
	[Name] nvarchar(20),
	Marks int
);

insert into Students(ID, Name, Marks)
values(1,'IronMan',83),
	  (2,'Captain',77),
	  (3,'Thor',100),
	  (4,'Scarlett',68),
	  (5,'Hulk',63),
	  (6,'DrStrange',87);

select Name, Marks,
	   case
	   when Marks between 70 and 79 then 
	   (select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
	   when Marks between 80 and 89 then 
	   (select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
	   when Marks between 99 and 100 then 
	   (select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
	   end as Grade
from Students
where (select Grade from tblGrade where Marks between Min_Marks and Max_Marks) >= 8
order by Marks desc;


select Name, Marks, Grade from Students
inner join tblGrade on Grade=(select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
where grade>=8
order by Grade desc;

select Name, Marks, Grade from Students
inner join tblGrade on Grade=(select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
where grade>=8
order by Grade desc, Name;

select Name, Marks, Grade from Students
inner join tblGrade on Grade=(select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
where grade<=7
order by Marks desc, Name;

select 
case
	when Grade <= 7 then 'NULL'
	else Name
	end as Name,
Marks, Grade from Students
inner join tblGrade on Grade=(select Grade from tblGrade where Marks between Min_Marks and Max_Marks)
order by Marks desc, Name;

/***
Que 2.
1.	Count all employees under each manager
2.	Find All Direct Subordinates Under Each Manager
3.	Find Both Direct and Indirect Subordinates Under Each Manager
***/
create table Employee(
	employeeId int,
	firstName nvarchar(20),
	lastName nvarchar(20),
	managerId int
);

insert into Employee(employeeId, firstName, lastName, managerId)
values(4529, 'Nancy', 'Young', 4125),
	  (4238, 'John', 'Simon', 4329),
	  (4329, 'Martina', 'Candreva', 4125),
	  (4009, 'Klaus', 'Koch', 4329);

select managerId, count(employeeId) as #Employees
from Employee group by managerId;

select managerId, string_agg(firstName, ',') as DirectSubordinates from Employee 
group by managerId;

select managerId, string_agg(firstName, ',') as DirectSubordinates from Employee 
group by managerId;


select * from Employee;

/*1.	Create Table & Insert Data.*/
create table DatEmployee(
	Id int,
	[Name] nvarchar(20),
	Department nvarchar(10),
	Salary int
);

/*2.	Select all the employees in the table in the order of highest to lowest salary if the salary is the same then sort it on the name A-Z.*/
select * from DatEmployee order by Salary desc, Name;

/*3.	List all the employees the Name start with ‘A’ and end with ‘K’.*/
select Name from DatEmployee where Name like 'A%K';

/*4.	List all the employees their name starts with ‘V’ OR end with ‘S’.*/
select Name from DatEmployee where Name like 'V%' or Name like '%S';

/*5.	List all the employees who have 4th Character as ‘A’ in the Name.*/
select Name from DatEmployee 
where substring(Name,1,4) like '%A';

/*6.	List all the employees having salary between 5000 & 15000.*/
select Name, Salary from DatEmployee 
where Salary between 5000 and 15000;

/*7.	List all the employees having salary >5000 & Salary <15000.*/
select Name, Salary from DatEmployee
where Salary > 5000 and Salary < 15000;

/*8.	List all the employees that have department.*/
select Name, Department from DatEmployee
where Department not in ('NULL');

/*9.	Select all the employees that do not have a department.*/
select Name, Department from DatEmployee
where Department in ('NULL');

/*10.	List all the employees where salary >10000 or name starts with ‘A’ with the department or does not have department. */
select Name, Department, Salary from DatEmployee
where Salary>10000 or Name like 'A%';

/*13.	Select count of employees that start with same letters. */
select left(Name,1) as FirstLetterOfName, count(Name) as #Employees from DatEmployee
group by left(Name,1);

/*14.	Select count of employee for initial character of the name where count is >1 and salary are greater than 5000. */
select FirstLetterOfName, #Employees from
(
select left(Name,1) as FirstLetterOfName, count(Name)as #Employees from DatEmployee
where Salary > 5000
group by left(Name,1)
)
as subquery
where #Employees >1;

/*15.	Select the count of an employee for the initial character of the name where the count is >1 and salary less than 5000. */
select FirstLetterOfName, #Employees from
(
select left(Name,1) as FirstLetterOfName, count(Name)as #Employees from DatEmployee
where Salary < 15000
group by left(Name,1)
)
as subquery
where #Employees >1;

/*16.	List of all employees in the ascending order of department and descending order of salary. (Treat NULL as unknown) */
select Id, Name,
case
	when Department is null then 'Unknown'
	else Department
	end as Department,
Salary
from DatEmployee order by Department, Salary desc; 

/*18.	Get department wise Max. Salary and Min. Salary. */
select Department, max(Salary) as Max_Salary, min(Salary) as Min_Salary from DatEmployee
group by Department;

/*19.	List of employees where Max. Salary <20000 and Min. Salary >5000.*/
select Name, Salary from DatEmployee
where Salary < 20000 and Salary > 5000;

/*(Ques 4.2) Name of Employees whose salary is above average.*/
select Name from DatEmployee 
where Salary > (select avg(Salary) from DatEmployee);

select * from DatEmployee;

/**Que 5. Consider the following example datasets:**/
create table Staff(
	EmployeeId int,
	FirstName nvarchar(10),
	LastName nvarchar(10),
	DepartmentId int
);

create table Departments(
	DepartmentId int,
	DepartmentName nvarchar(20)
);

insert into Staff(EmployeeId, FirstName, LastName, DepartmentId)
values(1, 'John', 'Doe', 101),
	  (2, 'Jane', 'Smith', 102),
	  (3, 'Mike', 'Johnson', 101),
	  (4, 'Emily', 'Brown', 103);

insert into Departments(DepartmentId, DepartmentName)
values(101, 'Sales'),
	  (102, 'Marketing'),
	  (103, 'Finance');

create table Projects(
	ProjectId int,
	ProjectName nvarchar(20),
	EmployeeId int
);

insert into Projects(ProjectId, ProjectName, EmployeeId)
values(1, 'Project_A', 1),
	  (2, 'Project_B', 2),
	  (3, 'Project_C', 3),
	  (3, 'Project_D', 1);

/*INNER JOIN*/
select FirstName, LastName, DepartmentName from Staff s
inner join Departments d on s.DepartmentId=d.DepartmentId;

/*LEFT JOIN*/
select FirstName, LastName, DepartmentName from Staff s
left join Departments d on s.DepartmentId=d.DepartmentId;

/*RIGHT JOIN*/
select DepartmentName, FirstName, LastName from Departments d
right join Staff s on s.DepartmentId=d.DepartmentId
where d.DepartmentId = 101 or d.DepartmentId is null;

/*FULL JOIN*/
select FirstName, LastName, DepartmentName from Staff s
full join Departments d on s.DepartmentId=d.DepartmentId;

/*MULTIPLE JOINS*/
select FirstName, LastName, DepartmentName, ProjectName from Staff s
left join Departments d on s.DepartmentId=d.DepartmentId
left join Projects p on s.EmployeeId = p.EmployeeId

/*JOIN WITH AGGREGATION*/
select DepartmentName, count(EmployeeId) as #Employees from Departments d
left join Staff s on d.DepartmentId=s.DepartmentId
group by DepartmentName order by count(EmployeeId) desc;

select * from Departments;


/*
Write a Query to retrieve the following result set-
StartStoppage, EndStoppage,	DurationinHours, Date, TrainNumber
*/
select * from TrainInfo;


select DepTime from TrainInfo 
where DepTime in
(
select min(DepTime) from TrainInfo
union
select max(DepTime) from TrainInfo
);



