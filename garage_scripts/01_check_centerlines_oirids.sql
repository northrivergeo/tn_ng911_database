DROP TABLE IF EXISTS garage.check_centerlines_oirid_tbl;
CREATE TABLE garage.check_centerlines_oirid_tbl as (
select
    oirid,
    count(*)
from
    tn911.centerlines
group by
    oirid
order by
    count asc);

