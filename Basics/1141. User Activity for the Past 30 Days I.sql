Select activity_date as day, COUNT(DISTINCT user_id) AS active_users
from Activity
where (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
group by activity_date