with sub as
	(select team, AVG(WINS)as avgWins, wins
	from nfl.teams
	group by Wins, team)
select *
from sub
having wins > avgwins
group by avgwins, team, wins;
