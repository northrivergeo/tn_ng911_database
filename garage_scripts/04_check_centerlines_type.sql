DROP TABLE IF EXISTS garage.check_centerlines_type_tbl; 
CREATE TABLE garage.check_centerlines_type_tbl as (
select 
    type, 
    count(*) 
from 
    tn911.centerlines 
group by
    type
order by 
    type, count desc); 
