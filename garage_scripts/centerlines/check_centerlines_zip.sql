DROP TABLE IF EXISTS garage.check_centerlines_zip_tbl; 
CREATE TABLE garage.check_centerlines_zip_tbl as (
select 
    zip_l, 
    zip_r,  
    count(*)
from 
    tn911.centerlines 
group by
    zip_l, zip_r
order by 
    count desc); 
