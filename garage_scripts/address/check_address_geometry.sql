/*here we are looking for duplicate geometry on the addresses*/ 
DROP TABLE IF EXISTS garage.check_address_geometry_tbl; 
CREATE TABLE garage.check_address_Geometry_tbl as (
SELECT
    a.oirid
FROM 
    tn911.address_points b,
    tn911.address_points a
WHERE  a.wkb_geometry = b.wkb_geometry AND a.id > b.id group by a.id);

