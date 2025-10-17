DROP TABLE IF EXISTS garage.check_address_status_tbl; 
CREATE TABLE garage.check_address_status_tbl as (
select 
    status, 
    count(*)
from 
    tn911.address_points 
group by
    status
order by 
    count desc); 
