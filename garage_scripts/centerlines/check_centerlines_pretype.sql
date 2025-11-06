DROP TABLE IF EXISTS garage.check_centerlines_type_tbl; 
CREATE TABLE garage.check_centerlines_pretype_tbl as (
select 
    pretype, 
    count(*) 
from 
    tn911.centerlines 
group by
    pretype
order by 
    pretype, count desc); 
