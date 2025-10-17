DROP TABLE IF EXISTS garage.check_address_zip_tbl; 
CREATE TABLE garage.check_address_zip_tbl as (
select 
    zip, 
    count(*) 
from 
    tn911.address_points 
group by
    zip
order by 
    count desc); 
