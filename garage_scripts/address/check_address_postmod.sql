DROP TABLE IF EXISTS garage.check_address_postmod_tbl; 
CREATE TABLE garage.check_address_posmod_tbl as (
select 
    postmod, 
    count(*) 
from 
    tn911.address_points 
group by
    postmod
order by 
    count desc); 
