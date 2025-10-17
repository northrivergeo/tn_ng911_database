DROP TABLE IF EXISTS garage.check_address_city_zip_tbl; 
CREATE TABLE garage.check_address_city_zip_tbl as (
select 
    city, 
    zip
from 
    tn911.address_points 
group by
    city, zip
order by 
    city desc); 
