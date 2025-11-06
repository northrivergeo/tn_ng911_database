DROP TABLE IF EXISTS garage.check_address_predir_tbl; 
CREATE TABLE garage.check_address_predir_tbl as (
select 
    predir, 
    count(*) 
from 
    tn911.address_points 
group by
    predir
order by 
    predir, count desc); 
