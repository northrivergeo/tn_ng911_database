DROP TABLE IF EXISTS garage.check_address_type_tbl; 
CREATE TABLE garage.check_address_type_tbl as (
select 
    type, 
    count(*) 
from 
    tn911.address_points 
group by
    type
order by 
    type, count desc); 
