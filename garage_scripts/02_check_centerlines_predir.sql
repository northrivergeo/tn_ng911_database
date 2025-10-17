DROP TABLE IF EXISTS garage.check_centerlines_predir_tbl; 
CREATE TABLE garage.check_centerlines_predir_tbl as (
select 
    predir, 
    count(*) 
from 
    tn911.centerlines 
group by
    predir
order by 
    predir, count desc); 
