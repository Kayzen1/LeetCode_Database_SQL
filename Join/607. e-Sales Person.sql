select name
from SalesPerson
where sales_id not in (
    select sales_id
    from Orders
    where com_id = 1
)