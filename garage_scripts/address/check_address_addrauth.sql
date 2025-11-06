DROP TABLE IF EXISTS garage.check_address_addrauth_tbl; 
CREATE TABLE garage.check_address_addrauth_tbl as (
select 
    addrauth, 
    count(*)
from 
    tn911.address_points 
group by
    addrauth
order by 
    count desc); 
