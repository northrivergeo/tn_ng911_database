DROP TABLE IF EXISTS garage.check_centerlines_sufdir_tbl; 
CREATE TABLE garage.check_centerlines_sufdir_tbl as (
select 
    sufdir, 
    count(*) 
from 
    tn911.centerlines 
group by
    sufdir
order by 
    count desc); 
