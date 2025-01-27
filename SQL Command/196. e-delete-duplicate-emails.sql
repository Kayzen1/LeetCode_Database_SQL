"Solution 1"
Delete p1
from Person p1, Person p2
where p1.email = p2.email and p1.id > p2.id


"Solution 2"
with CTE as (
    select id, email, ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn 
    from Person
)
Delete from Person
where id IN (
    select id from CTE Where rn > 1
)

"DELETE FROM table_name WHERE condition;"