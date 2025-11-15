with esn_check as (select 
   c.oirid, 
   e.esn,
   c.esn_l, 
   c.esn_r, 
   case when esn_l <> esn then 'Left ESN Range is wrong'
        when esn_r <> esn then 'Right ESN Range is wrong'
   else
        NULL
   end
      from tn911.esn as e, 
           tn911.centerlines as c 
      where st_intersects(c.geom, e.geom)) 
select 
    oirid, 
    esn, 
    esn_l, 
    esn_r,
    "case"
from 
    esn_check where "case" is not null order by esn sort asc; 

