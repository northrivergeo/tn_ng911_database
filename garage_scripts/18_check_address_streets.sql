DROP TABLE IF EXISTS garage.check_address_centerlines_tbl; 
CREATE TABLE garage.check_address_centerlines_tbl as (
select
   concat_ws( ' ', ap.predir,  ap.pretype,  ap.name, ap.type, ap.sufdir,  ap.postmod) as address_name,
   concat_ws( ' ', rc.predir,  rc.pretype,  rc.name, rc.type, rc.sufdir,  rc.postmod) as street_name
from
   tn911.address_points ap
left join
   tn911.centerlines rc on concat_ws( ' ', ap.predir,  ap.pretype,  ap.name, ap.type, ap.sufdir,  ap.postmod) = concat_ws( ' ', rc.predir,  rc.pretype,  rc.name, rc.type, rc.sufdir,  rc.postmod)
   group by street_name, address_name
order by address_name asc); 
