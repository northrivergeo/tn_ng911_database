select
   ap.oirid, 
   l_f_add, 
   l_t_add, 
   r_f_add, 
   r_t_add 
from 
   tn911.address_points as ap 
left join 










select left1.label, left1.oirid, left1.l_f_add::int, left1.l_t_add::int, left2.label, left2.oirid, left2.l_f_add::int, left2.l_t_add::int
from (select oirid,
             label,
             l_f_add::int,
             l_t_add::int
      from tn911.centerlines) left1
inner join (select oirid,
             label,
             l_f_add::int,
             l_t_add::int
      from tn911.centerlines) left2
 on left1.label = left2.label
 and left1.oirid < left2.oirid
where left2.l_f_add::int between left1.l_f_add::int and left1.l_t_add::int
 or left1.l_t_add::int between left2.l_f_add::int and left2.l_t_add::int;

