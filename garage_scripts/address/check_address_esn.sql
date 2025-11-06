DROP TABLE IF EXISTS garage.check_address_esn_tbl; 
CREATE TABLE garage.check_address_esn_tbl as (
select 
    esn, 
    count(*) 
from 
    tn911.address_points 
group by
    esn
order by 
    count desc); 
