DROP TABLE IF EXISTS garage.check_centerlines_type_tbl; 
CREATE TABLE garage.check_centerlines_type_tbl as (
select 
    name, 
    count(*) 
from 
    tn911.centerlines
group by
    name
order by 
    count desc); 
