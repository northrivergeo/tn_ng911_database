create table tn911.centerline_points as (
select
    a.oirid,
    ST_LineInterpolatePoint(ST_GeometryN(c.geom,1), ((a.stnum::int - l_f_add::int)*5.28)/(st_length(ST_GeometryN(c.geom,1)))) as geom
from
    tn911.address_points as a
    join tn911.centerlines as c on concat_ws(' ', a.name, a.esn) = concat_ws(' ', c.name, c.esn_l)
    where a.stnum::int between c.l_f_add::int and c.l_t_add::int
    and seg_side = 'L'
union all
select
    a.oirid,
    ST_LineInterpolatePoint(ST_GeometryN(c.geom,1), ((a.stnum::int - r_f_add::int)*5.28)/(st_length(ST_GeometryN(c.geom,1)))) as geom
from
    tn911.address_points as a
    join tn911.centerlines as c on concat_ws(' ', a.name, a.esn) = concat_ws(' ', c.name, c.esn_r)
    where a.stnum::int between c.r_f_add::int and c.r_t_add::int
    and seg_side = 'R');

-------------------------------------------------------

--This isn't right because it's not the true length of the line. I need to incorporate the line length + address to make this work. I made it too complicated. 

select
    a.oirid,
    ST_LineInterpolatePoint((c.geom), ((a.stnum::int - l_f_add::int)*5.28)/(st_length(ST_GeometryN(c.geom,1)))) as geom
from
    tn911.address_points as a
    join tn911.centerlines as c on concat_ws(' ', a.name, a.esn) = concat_ws(' ', c.name, c.esn_l)
    where a.stnum::int between c.l_f_add::int and c.l_t_add::int
    and seg_side = 'L'

