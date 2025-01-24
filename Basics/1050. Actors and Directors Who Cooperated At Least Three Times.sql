select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(*) >= 3

'''count(*), count(1) etc counts number of rows''' 