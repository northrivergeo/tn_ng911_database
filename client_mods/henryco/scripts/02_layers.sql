--========================
--Add Columns for Address Points 
--========================
alter table tn911.address_points add column comment varchar(50); 
alter table tn911.address_points add column readdress varchar(5); 
alter table tn911.address_points add column meter_num integer; 
alter table tn911.address_points add column old_address varchar(50); 
alter table tn911.address_points add column color varchar(20); 
alter table tn911.address_points add column point_type varchar(20); 
alter table tn911.address_points add column street varchar(75); 
alter table tn911.address_points add column cad_name varchar(50); 
alter table tn911.address_points add column loc_note varchar(20); 
alter table tn911.address_points add column cad_post varchar(50); 
alter table tn911.address_points add column altprefix varchar(2); 
alter table tn911.address_points add column altname varchar(50); 
alter table tn911.address_points add column alttype varchar(5); 
alter table tn911.address_points add column altsuffix varchar(2); 


--========================
--Add Columns for Centerlines
--========================
alter table tn911.centerlines add column surface varchar(50); 
alter table tn911.centerlines add column cross_street varchar(50); 
alter table tn911.centerlines add column connect varchar(50)
alter table tn911.centerlines add column street varchar(75); 
alter table tn911.centerlines add column comment1 varchar(75); 
alter table tn911.centerlines add column comment2 varchar(75); 
alter table tn911.centerlines add column fna integer; 
alter table tn911.centerlines add column tna integer;
alter table tn911.centerlines add column odd varchar(20); 
alter table tn911.centerlines add column road_type varchar(20); 
alter table tn911.centerlines add column cad_post varchar(50); 
alter table tn911.centerlines add column cad_name varchar(50); 
alter table tn911.centerlines add column altprefix varchar(20); 
alter table tn911.centerlines add column altname varchar(50); 
alter table tn911.centerlines add column alttype varchar(5); 
alter table tn911.centerlines add column altsuffix varchar(2); 


--========================
--Add Columns for esn
--========================
alter table tn911.esn add column "CAD-LAW" varchar(2); 
alter table tn911.esn add column "CAD-EMS" varchar(2); 





