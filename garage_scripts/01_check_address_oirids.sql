DROP TABLE IF EXISTS garage.check_address_oirid_tbl;
CREATE TABLE garage.check_address_oirid_tbl as (
select
    oirid,
    count(*)
from
    tn911.address_points
group by
    oirid
order by
    count asc);

