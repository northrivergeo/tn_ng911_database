DROP TABLE IF EXISTS garage.check_centerlines_postmod_tbl; 
CREATE TABLE garage.check_centerlines_posmod_tbl as (
select 
    postmod, 
    count(*) 
from 
    tn911.centerlines 
group by
    postmod
order by 
    count desc); 
