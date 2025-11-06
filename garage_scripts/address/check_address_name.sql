DROP TABLE IF EXISTS garage.check_address_type_tbl; 
CREATE TABLE garage.check_address_type_tbl as (
select 
    name, 
    count(*) 
from 
    tn911.address_points 
group by
    name
order by 
    count desc); 
