with results as (
    SELECT oirid,
       CASE WHEN l_f_add::int > l_t_add::int THEN 'Left Range is an Incorrect Order'
            WHEN r_f_add::int > r_t_add::int THEN 'Right Range is an Incorrect Order'
       else
            NULL
       END
    FROM tn911.centerlines where l_f_add::int <> 0 and r_f_add::int <> 0 )
select oirid, "case" from results where "case" is not null; 
