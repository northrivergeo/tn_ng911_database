DROP TABLE IF EXISTS garage.check_address_esn_tbl; 
CREATE TABLE garage.check_address_esn_tbl as (
select
    a.esn as address_esn,
    e.esn as esn
from
    tn911.address_points as a
join tn911.esn as e on st_intersects(a.geom, e.geom) where a.esn <> e.esn);
