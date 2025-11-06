DROP TABLE IF EXISTS garage.check_address_sufdir_tbl; 
CREATE TABLE garage.check_address_sufdir_tbl as (
select 
    sufdir, 
    count(*) 
from 
    tn911.address_points 
group by
    sufdir
order by 
    count desc); 
