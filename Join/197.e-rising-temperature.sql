select Weather.id
from Weather
join Weather w
on datediff(Weather.recordDate, w.recordDate) = 1
and Weather.temperature > w.temperature