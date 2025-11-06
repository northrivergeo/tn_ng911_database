DROP TABLE IF EXISTS garage.check_address_segside_tbl;
CREATE TABLE garage.check_address_segside_tbl as (
select
    seg_side,
    count(*)
from
    tn911.address_points
group by
    seg_side 
order by
    count asc);

