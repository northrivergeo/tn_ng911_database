DROP TABLE IF EXISTS garage.check_esn_addressmatch_tbl; 
create table garage.check_esn_addressmatch_tbl as (
select
   a.esn,
   a.oirid
from
   tn911.address_points as a
join tn911.esn as e
   on st_within(e.geom, a.geom)
   where a.esn <> e.esn);

