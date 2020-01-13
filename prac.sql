select races.name, drivers.num, points, time, rank, position, surname, racedate
from f1.Results inner join f1.Drivers
on f1.results.driverID = f1.drivers.driverID
inner join f1.races
on f1.results.raceID = f1.results.raceID
where year = 2017 and name = 'Canadian Grand Prix' and surname = 'Bottas'
group by races.name, drivers.num, points, time, rank, position, surname, forename, racedate;
