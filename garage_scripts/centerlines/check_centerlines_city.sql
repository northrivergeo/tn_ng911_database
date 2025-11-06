DROP TABLE IF EXISTS garage.check_centerlines_city_tbl; 
CREATE TABLE garage.check_centerlines_city_tbl as (
select 
    city_l, 
    city_r, 
    count(*) 
from 
    tn911.centerlines
group by
    city_l, city_r
order by 
    count desc); 
