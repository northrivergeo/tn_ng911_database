--=================================================================================================
--address point
--OIRIDs that need to the county changed
--as an example you would need 'HAMILTON_12345' and not 'COUNTY_12345'
--=================================================================================================

/*address oirid*/ 

CREATE OR REPLACE FUNCTION tn911.address_func_oirid()
RETURNS TRIGGER AS $$
BEGIN
   NEW.oirid = 'HENRY'||'_'||new.ogc_fid;
   NEW.editor = current_user;
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

DROP TRIGGER IF EXISTS update_address_oirid on tn911.address_points; 
CREATE TRIGGER update_address_oirid BEFORE insert
    ON tn911.address_points FOR EACH ROW EXECUTE PROCEDURE
    tn911.address_func_oirid();

--Updates ESN in address_points table

CREATE OR REPLACE FUNCTION tn911.address_func_esn()
RETURNS TRIGGER AS $$ 
BEGIN
   NEW.esn := (select esn from tn911.esn where st_within(new.wkb_geometry, wkb_geometry)); 
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;


DROP TRIGGER IF EXISTS update_address_esn on tn911.address_points; 
CREATE TRIGGER update_address_esn 
BEFORE insert or update
    ON tn911.address_points FOR EACH ROW 
    EXECUTE PROCEDURE 
    tn911.address_func_esn();

--Updates geodate in address_points table

CREATE OR REPLACE FUNCTION tn911.address_func_geodate()
RETURNS TRIGGER AS $$ 
BEGIN 
   new.geodate = current_timestamp; 
   RETURN NEW; 
END; 
$$
LANGUAGE PLPGSQL; 

DROP TRIGGER IF EXISTS update_address_geodate on tn911.address_points; 
CREATE TRIGGER update_address_geodate before update 
   on tn911.address_points FOR EACH ROW 
   WHEN (old.wkb_geometry::text is distinct from new.wkb_geometry::text) 
   EXECUTE PROCEDURE 
   tn911.address_func_geodate();  

/*address street label*/ 

CREATE OR REPLACE FUNCTION tn911.address_func_label()
RETURNS TRIGGER AS $$ 
BEGIN
   NEW.esn := (select esn from tn911.esn where st_within(new.wkb_geometry, wkb_geometry));
   NEW.address := concat_ws(' ', new.stnum, new.predir,  new.pretype,  new.name, new.type, new.sufdir,  new.postmod); 
   NEW.addr_esn := concat_ws(' ', new.address,  new.esn); 
   NEW.label := initcap(new.address); 
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

DROP TRIGGER IF EXISTS update_address_label on tn911.address_points; 
CREATE TRIGGER update_address_label BEFORE insert or update
    ON tn911.address_points FOR EACH ROW EXECUTE PROCEDURE
    tn911.address_func_label();

/*address location*/ 

CREATE OR REPLACE FUNCTION tn911.address_func_location()
RETURNS TRIGGER AS $$ 
BEGIN
   NEW.x_sp := st_x(NEW.wkb_geometry); 
   NEW.y_sp := st_y(NEW.wkb_geometry); 
   NEW.lon  := st_x(st_transform(NEW.wkb_geometry, 4326))::varchar(15); 
   NEW.lat  := st_y(st_transform(NEW.wkb_geometry, 4326))::varchar(15);
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

DROP TRIGGER IF EXISTS update_address_location on tn911.address_points; 
CREATE TRIGGER update_address_location BEFORE insert or update
    ON tn911.address_points FOR EACH ROW EXECUTE PROCEDURE
    tn911.address_func_location();


CREATE OR REPLACE FUNCTION tn911.update_address_city_func()
RETURNS TRIGGER AS ' 
BEGIN
CASE
WHEN new.city = ''MCKENZIE'' THEN 
     new.zip := ''38201'';
WHEN 
   new.city = ''BUCHANAN'' THEN
   new.zip := ''38222'';
WHEN 
   new.city = ''COTTAGE GROVE'' THEN
   new.zip := ''38224'';
WHEN 
   new.city = ''HENRY'' THEN
   new.zip := ''38231'';
WHEN 
   new.city = ''MANSFIELD'' THEN
   new.zip := ''38236'';
WHEN 
   new.city = ''PARIS'' THEN
   new.zip := ''38242'';
WHEN 
   new.city = ''PURYEAR'' THEN
   new.zip := ''38251'';
WHEN 
   new.city = ''SPRINGVILLE'' THEN
   new.zip := ''38256'';
ELSE
END CASE; 
RETURN NEW; 
END;
' language 'plpgsql';

DROP TRIGGER IF EXISTS update_address_city on tn911.address_points; 
CREATE TRIGGER update_address_city BEFORE insert or update
    ON tn911.address_points FOR EACH ROW EXECUTE PROCEDURE
    tn911.update_address_city_func();


CREATE OR REPLACE FUNCTION tn911.update_hwy_func()
RETURNS TRIGGER AS ' 
BEGIN
If 
  NEW.pretype = ''HWY'' THEN 
  NEW.street := concat_ws('' '', new.predir,  ''HIGHWAY'',  new.name, new.type, new.sufdir,  new.postmod); 
  NEW.cad_name := concat_ws('' '', ''HIGHWAY'',  new.name); 
ELSE  
  NEW.street := concat_ws('' '', new.predir,  new.pretype,  new.name, new.type, new.sufdir,  new.postmod); 
  NEW.cad_name := new.name; 
END IF; 
RETURN NEW; 
END;
' language 'plpgsql';

DROP TRIGGER IF EXISTS hwy_address on tn911.address_points; 
CREATE TRIGGER hwy_address BEFORE insert or update
    ON tn911.addresspoints FOR EACH ROW EXECUTE PROCEDURE
    tn911.update_hwy_func();


--=================================================================================================
--centerlines
--=================================================================================================

/* next up is Centerlines */ 

CREATE OR REPLACE FUNCTION tn911.centerlines_func_oirid()
RETURNS TRIGGER AS $$
BEGIN
   NEW.oirid = 'HENRY'||'_'||new.ogc_fid;
   NEW.editor = current_user;
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;

DROP TRIGGER IF EXISTS update_centerlines_oirid on tn911.centerlines; 
CREATE TRIGGER update_centerlines_oirid BEFORE insert
    ON tn911.centerlines FOR EACH ROW EXECUTE PROCEDURE
    tn911.centerlines_func_oirid();

DROP TRIGGER IF EXISTS hwy_centerline on tn911.centerlines; 
CREATE TRIGGER hwy_centerline BEFORE insert or update
    ON tn911.centerlines FOR EACH ROW EXECUTE PROCEDURE
    tn911.update_hwy_func();


--=================================================================================================
--ESN
--=================================================================================================
CREATE OR REPLACE FUNCTION tn911.esn_func_geodate()
RETURNS TRIGGER AS $$
BEGIN
   new.geodate = current_timestamp;
   RETURN NEW;
END;
$$
LANGUAGE PLPGSQL;


DROP TRIGGER IF EXISTS update_esn_geodate on tn911.esn; 
CREATE TRIGGER update_esn_geodate BEFORE update
    ON tn911.esn FOR EACH ROW 
    WHEN (old.wkb_geometry::text is distinct from new.wkb_geometry::text) 
    EXECUTE PROCEDURE 
    tn911.esn_func_geodate();

--=================================================================================================
--Notifications which need to be added to QGIS 
--=================================================================================================

CREATE OR REPLACE FUNCTION public.notify_qgis() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN NOTIFY qgis;
        RETURN NULL;
        END;
    $$;

DROP TRIGGER IF EXISTS notify_qgis_address_edit on tn911.address_points; 
CREATE TRIGGER notify_qgis_address_edit
  AFTER INSERT OR UPDATE OR DELETE ON tn911.address_points
    FOR EACH STATEMENT EXECUTE PROCEDURE public.notify_qgis();

DROP TRIGGER IF EXISTS notify_qgis_centerlines_edit on tn911.centerlines; 
CREATE TRIGGER notify_qgis_centerlines_edit
  AFTER INSERT OR UPDATE OR DELETE ON tn911.centerlines
    FOR EACH STATEMENT EXECUTE PROCEDURE public.notify_qgis();

DROP TRIGGER IF EXISTS notify_qgis_esn_edit on tn911.esn; 
CREATE TRIGGER notify_qgis_esn_edit
  AFTER INSERT OR UPDATE OR DELETE ON tn911.esn
    FOR EACH STATEMENT EXECUTE PROCEDURE public.notify_qgis();
