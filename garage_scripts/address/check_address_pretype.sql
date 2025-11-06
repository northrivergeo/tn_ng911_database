DROP TABLE IF EXISTS garage.check_address_type_tbl; 
CREATE TABLE garage.check_address_pretype_tbl as (
select 
    pretype, 
    count(*) 
from 
    tn911.address_points 
group by
    pretype
order by 
    pretype, count desc); 
