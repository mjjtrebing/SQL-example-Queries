/*query 1*/
select DriverID, lap, position, time,
sum(lapTime) over(order by DriverID, lap, position, time) as cumLaptTime
from
	(Select DriverID, lap, position, time, substr(f1.time_to_seconds(time),1,15) as lapTime
	From f1.laptimes
	where raceID=978 and driverID = 1)
	union
	select DriverID, lap, position, time,
	sum(lapTime) over(order by DriverID, lap, position, time) as cumLaptime
	from
		(Select DriverID, lap, position, time, substr(f1.time_to_seconds(time),1,15) as lapTime
		From f1.laptimes
		where raceID=978 and driverID = 822);
