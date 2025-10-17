DROP TABLE IF EXISTS garage.check_centerlines_city_zip_tbl; 
CREATE TABLE garage.check_centerlines_city_zip_tbl as (
select 
    city_l, 
    zip_l, 
    city_r, 
    zip_r, 
    count(*)
from 
    tn911.centerlines
group by
    city_l, zip_l, city_r, zip_r 
order by 
    count(*) desc); 
