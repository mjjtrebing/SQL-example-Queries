select team, conference
from nfl.teams
having offensiveyards>= avg(offensiveyards)
group by offensiveyards, team, conference;
