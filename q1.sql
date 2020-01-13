with playerCount as
	(select count(college) as total, college, team, count(team) as players
	from nfl.players
	group by college, team)
select *
from (select max(total) as collegeGrads, team, players
	from playerCount
	where college = 'Vanderbilt'
	group by team);	
