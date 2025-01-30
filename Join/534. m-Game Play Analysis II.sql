-- "So far", windows function can handle accumulation
select player_id, 
       event_date, 
       sum(games_played) over (partition by player_id order by event_date) as games_played_so_far
from Activity
