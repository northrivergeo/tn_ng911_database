DROP TABLE IF EXISTS garage.check_address_city_tbl; 
CREATE TABLE garage.check_address_city_tbl as (
select 
    city, 
    count(*) 
from 
    tn911.address_points 
group by
    city
order by 
    count desc); 
