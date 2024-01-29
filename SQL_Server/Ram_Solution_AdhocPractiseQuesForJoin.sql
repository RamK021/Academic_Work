/*
Practice Questions For Joins
TrainName	Stoppage	Time
12309		Jaipur		2023-08-01 10:00
12309		Ajmer		2023-08-01 12:00
12309		Bhilwara	2023-08-01 15:10
12309		Udaipur		2023-08-01 17:30
12309		Bikaner		2023-08-01 20:30
12309		Jaisalmer	2023-08-02 01:00
12309		Jodhpur		2023-08-02 10:00
Write a Query to retrieve the following result setStart
Stoppage, EndStoppage, DurationInHours, Date, TrainNumber
*/
select * from TrainInfo;

select s.Stoppage as StartStop, e.Stoppage as EndStop,
datediff(hour, s.DepTime, e.DepTime) as DurationInHours,
format(s.DepTime, 'yyyy-MM-dd') as [Date],
s.TrainNumber as TrainNumber
from TrainInfo s
inner join TrainInfo e on s.TrainNumber=e.TrainNumber and s.DepTime < e.DepTime
where not exists(
	select * from TrainInfo t 
	where t.TrainNumber=s.TrainNumber  and (s.DepTime<t.DepTime and t.DepTime<e.DepTime)   
)

