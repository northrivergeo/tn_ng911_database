DROP TABLE IF EXISTS garage.check_centerlines_esn_tbl; 
CREATE TABLE garage.check_centerlines_esn_tbl as (
select 
    esn_l, 
    esn_r,
    count(*) 
from 
    tn911.centerlines
group by
    esn_l, esn_r
order by 
    count desc); 
