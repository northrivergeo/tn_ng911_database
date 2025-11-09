--=================================================================================================
--This will make ownership of tables a bit easier. BE SURE TO CHANGE THE ROLE
--=================================================================================================

CREATE OR REPLACE FUNCTION trg_create_set_owner()
 RETURNS event_trigger
 LANGUAGE plpgsql
AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_ddl_commands() WHERE command_tag='CREATE TABLE' LOOP
    EXECUTE format('ALTER TABLE %s OWNER TO nrgs', obj.object_identity);
  END LOOP;
END;
$$;

CREATE EVENT TRIGGER trg_create_set_owner
 ON ddl_command_end
 WHEN tag IN ('CREATE TABLE')
 EXECUTE PROCEDURE trg_create_set_owner();


--========================
--Setting up the Schemas
--========================

create schema tn911; 
create schema garage; 


--========================
--Setting up the predir forms
--========================

DROP TABLE IF EXISTS tn911.predir_tbl; 
create table tn911.predir_tbl (
       predir varchar(24) primary key,
        description varchar(2)
        );

insert into tn911.predir_tbl (predir, description) values ('N', 'N');
insert into tn911.predir_tbl (predir, description) values ('S', 'S');
insert into tn911.predir_tbl (predir, description) values ('E', 'E');
insert into tn911.predir_tbl (predir, description) values ('W', 'W');
insert into tn911.predir_tbl (predir, description) values ('NE', 'NE');
insert into tn911.predir_tbl (predir, description) values ('NW', 'NW');
insert into tn911.predir_tbl (predir, description) values ('SE', 'SE');
insert into tn911.predir_tbl (predir, description) values ('SW', 'SW');


/* qgis tables seg_side */ 

DROP TABLE IF EXISTS tn911.segside_tbl; 
create table tn911.segside_tbl (
        seg_side varchar(1) primary Key,
	description varchar(12)
        );

insert into tn911.segside_tbl (seg_side, description) values ('L', 'LEFT');
insert into tn911.segside_tbl (seg_side, description) values ('R', 'RIGHT');

/* qgis tables structure type */ 

DROP TABLE IF EXISTS tn911.strucdomain_tbl; 
create table tn911.strucdomain_tbl ( 
	strucdomain varchar(4) primary key, 
	description varchar(50)
); 

insert into tn911.strucdomain_tbl (strucdomain, description) values (100, '100-Familial'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (200, '200-Religious'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (300, '300-Education'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (400, '400-Medical'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (500, '500-Agricultural'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (600, '600-Government'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (700, '700-Utility'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (800, '800-Industrial'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (900, '900-Public Safety'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1000, '1000-Transportation'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1200, '1200-Assets'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1300, '1300-Commercial'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1400, '1400-Entertainment'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1500, '1500-Recreational'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (1600, '1600-Historical'); 
insert into tn911.strucdomain_tbl (strucdomain, description) values (9000, '1700-Miscellaneous'); 

DROP TABLE IF EXISTS tn911.structype_tbl; 
create table tn911.structype_tbl ( 
	structype smallint primary key, 
	strucfk smallint, 
        description varchar(50)
        ); 

insert into tn911.structype_tbl (structype, strucfk, description) values (1, 100, '1-House'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (2, 100, '2-Duplex'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (3, 100, '3-Mobile Home'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (4, 100, '4-Apartment'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (5, 100, '5-Secondary Structure'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (6, 100, '6-Underground House'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (7, 100, '7-Condominium'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (8, 100, '8-Townhome'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (9, 100, '9-Triplex'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (10, 100, '10-Trailer Park'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (11, 100, '11-RV/Camper'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (12, 100, '12-Cabin'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (13, 100, '13-Day Care (Child)'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (14, 100, '14-Day Care (Adult)'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (15, 100, '15-Senior Citizen Center'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (16, 100, '16-Bus'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (17, 100, '17-Quadplex'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (18, 100, '18-Communal Area');
insert into tn911.structype_tbl (structype, strucfk, description) values (19, 100, '19-Residential Garage');
insert into tn911.structype_tbl (structype, strucfk, description) values (200, 200, '200-Religious'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (201, 200, '201-Place of Worship'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (300, 300, '300-Education'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (301, 300, '301-School'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (302, 300, '302-University/College'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (303, 300, '303-Library'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (304, 300, '304-Dormitory'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (400, 400, '400-Medical'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (401, 400, '401-Hospital'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (402, 400, '402-Clinic'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (403, 400, '403-Pharmacy'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (404, 400, '404-Dental'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (405, 400, '405-Vision'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (406, 400, '406-Nursing Home'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (407, 400, '407-Assisted Living Facility'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (408, 400, '408-Rehabilitation Center'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (409, 400, '409-Morgue'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (500, 500, '500-Agricultural'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (501, 500, '501-Farm'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (502, 500, '502-Barn'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (503, 500, '503-Veterinary'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (504, 500, '504-Animal Shelter'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (505, 500, '505-Fish Hatchery'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (506, 500, '506-Greenhouse/Nursery'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (507, 500, '507-Chicken House'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (600, 600, '600-Government'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (601, 600, '601-Capitol'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (602, 600, '602-City Hall'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (603, 600, '603-Court House'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (604, 600, '604-Post Office'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (605, 600, '605-DoD/Military'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (700, 700, '700-Utility'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (701, 700, '701-Tower'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (702, 700, '702-Cell Tower'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (703, 700, '703-Radio Tower'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (704, 700, '704-TVA Siren'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (705, 700, '705-Water Tank'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (706, 700, '706-Oil Tank'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (707, 700, '707-Oil Well'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (708, 700, '708-Natural Gas Tank'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (709, 700, '709-Natural Gas Well'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (710, 700, '710-Natural Gas Pipeline'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (711, 700, '711-Power Substation'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (712, 700, '712-Pump Station'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (800, 800, '800-Industrial'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (801, 800, '801-Warehouse'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (802, 800, '802-Recycle Facility'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (803, 800, '803-Bottling Plant'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (804, 800, '804-Treatment Plant'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (805, 800, '805-Landfill'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (806, 800, '806-Mine'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (807, 800, '807-Rock Quarry'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (808, 800, '808-Saw Mill'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (900, 900, '900-Public Safety'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (901, 900, '901-Prison'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (902, 900, '902-Detention Center'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (903, 900, '903-Police'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (904, 900, '904-Sheriff'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (905, 900, '905-Fire'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (906, 900, '906-Rescue Squad'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (907, 900, '907-EMS'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (908, 900, '908-Shelter'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (909, 900, '909-Fire Hydrant'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (910, 900, '910-PELA/LZ/Helicopter Pad'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (911, 900, '911-PSAP'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (912, 900, '912-Guard Shack'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1000, 1000, '1000-Transportation'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1001, 1000, '1001-Airport'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1002, 1000, '1002-Airport Hanger'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1003, 1000, '1003-Airport Terminal'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1004, 1000, '1004-Bus Station'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1005, 1000, '1005-Gas Station'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1006, 1000, '1006-Bridge'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1007, 1000, '1007-Rest Area'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1008, 1000, '1008-Railroad'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1009, 1000, '1009-Roundhouse'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1010, 1000, '1010-Train Station'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1011, 1000, '1011-Railroad Crossing'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1012, 1000, '1012-Railroad Equipment'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1013, 1000, '1013-Railroad Mile Marker'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1014, 1000, '1014-River Marker'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1015, 1000, '1015-Mile Marker'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1016, 1000, '1016-Ferry Terminal'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1200, 1200, '1200-Asset'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1201, 1200, '1201-Gate'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1202, 1200, '1202-Call Box/Phone Cabinet'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1203, 1200, '1203-Billboard'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1204, 1200, '1204-Traffic Control Box'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1300, 1300, '1300-Commercial'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1301, 1300, '1301-Shopping Area'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1302, 1300, '1302-Store'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1303, 1300, '1303-Office'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1304, 1300, '1304-Parking Garage'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1305, 1300, '1305-Bank'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1306, 1300, '1306-Massage Parlor'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1307, 1300, '1307-Hotel/Motel'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1308, 1300, '1308-Laundry Mat'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1309, 1300, '1309-Storage Facility'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1400, 1400, '1400-Entertainment'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1401, 1400, '1401-Restaurant'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1402, 1400, '1402-Cafe'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1403, 1400, '1403-Bar'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1404, 1400, '1404-Club'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1405, 1400, '1405-Theater'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1406, 1400, '1406-Convention Center'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1407, 1400, '1407-Stadium'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1408, 1400, '1408-Arena'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1409, 1400, '1409-Sports Complex'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1410, 1400, '1410-Food Truck'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1411, 1400, '1411-Zoo'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1500, 1500, '1500-Recreational'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1501, 1500, '1501-Park'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1502, 1500, '1502-Campground'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1503, 1500, '1503-Lodge'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1504, 1500, '1504-Golf Course'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1505, 1500, '1505-Boat Dock'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1506, 1500, '1506-Watercraft'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1507, 1500, '1507-Swimming Pool'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1600, 1600, '1600-Historical'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1601, 1600, '1601-Museum'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (1602, 1600, '1602-Cemetery'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (9000, 9000, '9000-Temporary'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (9001, 9000, '9001-Vacant'); 
insert into tn911.structype_tbl (structype, strucfk, description) values (9002, 9000, '9002-Unknown'); 

/* C1 Street Suffix Abbreviations. Also to be used for Pre-type and PostMod */
DROP TABLE IF EXISTS tn911.type_tbl;
create table tn911.type_tbl ( 
        description varchar(24),
	type varchar(24) primary key  
        ); 

insert into tn911.type_tbl (type, description) values ('ALY', 'ALLEY'); 
insert into tn911.type_tbl (type, description) values ('ANX', 'ANEX'); 
insert into tn911.type_tbl (type, description) values ('ARC', 'ARCADE'); 
insert into tn911.type_tbl (type, description) values ('AVE', 'AVENUE'); 
insert into tn911.type_tbl (type, description) values ('BYU', 'BAYOU'); 
insert into tn911.type_tbl (type, description) values ('BCH', 'BEACH'); 
insert into tn911.type_tbl (type, description) values ('BND', 'BEND'); 
insert into tn911.type_tbl (type, description) values ('BLF', 'BLUFF'); 
insert into tn911.type_tbl (type, description) values ('BLFS', 'BLUFFS'); 
insert into tn911.type_tbl (type, description) values ('BTM', 'BOTTOM'); 
insert into tn911.type_tbl (type, description) values ('BLVD', 'BOULEVARD'); 
insert into tn911.type_tbl (type, description) values ('BR', 'BRANCH'); 
insert into tn911.type_tbl (type, description) values ('BRG', 'BRIDGE'); 
insert into tn911.type_tbl (type, description) values ('BRK', 'BROOK'); 
insert into tn911.type_tbl (type, description) values ('BRKS', 'BROOKS'); 
insert into tn911.type_tbl (type, description) values ('BG', 'BURG'); 
insert into tn911.type_tbl (type, description) values ('BGS', 'BURGS'); 
insert into tn911.type_tbl (type, description) values ('BYP', 'BYPASS'); 
insert into tn911.type_tbl (type, description) values ('CP', 'CAMP'); 
insert into tn911.type_tbl (type, description) values ('CYN', 'CANYON'); 
insert into tn911.type_tbl (type, description) values ('CPE', 'CAPE'); 
insert into tn911.type_tbl (type, description) values ('CSWY', 'CAUSEWAY'); 
insert into tn911.type_tbl (type, description) values ('CTR', 'CENTER'); 
insert into tn911.type_tbl (type, description) values ('CTRS', 'CENTERS'); 
insert into tn911.type_tbl (type, description) values ('CIR', 'CIRCLE'); 
insert into tn911.type_tbl (type, description) values ('CIRS', 'CIRCLES'); 
insert into tn911.type_tbl (type, description) values ('CLF', 'CLIFF'); 
insert into tn911.type_tbl (type, description) values ('CLFS', 'CLIFFS'); 
insert into tn911.type_tbl (type, description) values ('CLB', 'CLUB'); 
insert into tn911.type_tbl (type, description) values ('CMN', 'COMMON'); 
insert into tn911.type_tbl (type, description) values ('CMNS', 'COMMONS'); 
insert into tn911.type_tbl (type, description) values ('COR', 'CORNER'); 
insert into tn911.type_tbl (type, description) values ('CORS', 'CORNERS'); 
insert into tn911.type_tbl (type, description) values ('CRSE', 'COURSE'); 
insert into tn911.type_tbl (type, description) values ('CT', 'COURT'); 
insert into tn911.type_tbl (type, description) values ('CTS', 'COURTS'); 
insert into tn911.type_tbl (type, description) values ('CV', 'COVE'); 
insert into tn911.type_tbl (type, description) values ('CVS', 'COVES'); 
insert into tn911.type_tbl (type, description) values ('CRK', 'CREEK'); 
insert into tn911.type_tbl (type, description) values ('CRES', 'CRESCENT'); 
insert into tn911.type_tbl (type, description) values ('CRST', 'CREST'); 
insert into tn911.type_tbl (type, description) values ('XING', 'CROSSING'); 
insert into tn911.type_tbl (type, description) values ('XRD', 'CROSSROAD'); 
insert into tn911.type_tbl (type, description) values ('XRDS', 'CROSSROADS'); 
insert into tn911.type_tbl (type, description) values ('CURV', 'CURVE'); 
insert into tn911.type_tbl (type, description) values ('DL', 'DALE'); 
insert into tn911.type_tbl (type, description) values ('DM', 'DAM'); 
insert into tn911.type_tbl (type, description) values ('DV', 'DIVIDE'); 
insert into tn911.type_tbl (type, description) values ('DR', 'DRIVE'); 
insert into tn911.type_tbl (type, description) values ('DRS', 'DRIVES'); 
insert into tn911.type_tbl (type, description) values ('EST', 'ESTATE'); 
insert into tn911.type_tbl (type, description) values ('ESTS', 'ESTATES'); 
insert into tn911.type_tbl (type, description) values ('EXPY', 'EXPRESSWAY'); 
insert into tn911.type_tbl (type, description) values ('EXT', 'EXTENTION'); 
insert into tn911.type_tbl (type, description) values ('EXTS', 'EXTENTIONS'); 
insert into tn911.type_tbl (type, description) values ('FALL', 'FALL'); 
insert into tn911.type_tbl (type, description) values ('FLS', 'FALLS'); 
insert into tn911.type_tbl (type, description) values ('FRY', 'FERRY');  
insert into tn911.type_tbl (type, description) values ('FLD', 'FIELD'); 
insert into tn911.type_tbl (type, description) values ('FLDS', 'FIELDS'); 
insert into tn911.type_tbl (type, description) values ('FLT', 'FLAT');
insert into tn911.type_tbl (type, description) values ('FLTS', 'FLATS');
insert into tn911.type_tbl (type, description) values ('FRD', 'FORD');
insert into tn911.type_tbl (type, description) values ('FRDS', 'FORDS');
insert into tn911.type_tbl (type, description) values ('FRST', 'FOREST');
insert into tn911.type_tbl (type, description) values ('FRG', 'FORGE');
insert into tn911.type_tbl (type, description) values ('FRGS', 'FORGES');
insert into tn911.type_tbl (type, description) values ('FRK', 'FORK');
insert into tn911.type_tbl (type, description) values ('FRKS', 'FORKS');
insert into tn911.type_tbl (type, description) values ('FT', 'FORT');
insert into tn911.type_tbl (type, description) values ('FWY', 'FREEWAY');
insert into tn911.type_tbl (type, description) values ('GDN', 'GARDEN');
insert into tn911.type_tbl (type, description) values ('GDNS', 'GARDENS');
insert into tn911.type_tbl (type, description) values ('GTWY', 'GATEWAY');
insert into tn911.type_tbl (type, description) values ('GLN', 'GLEN');
insert into tn911.type_tbl (type, description) values ('GLNS', 'GLENS');
insert into tn911.type_tbl (type, description) values ('GRN', 'GREEN');
insert into tn911.type_tbl (type, description) values ('GRNS', 'GREENS');
insert into tn911.type_tbl (type, description) values ('GRV', 'GROVE');
insert into tn911.type_tbl (type, description) values ('GRVS', 'GROVES');
insert into tn911.type_tbl (type, description) values ('HBR', 'HARBOR');
insert into tn911.type_tbl (type, description) values ('HBRS', 'HARBORS');
insert into tn911.type_tbl (type, description) values ('HVN', 'HAVEN');
insert into tn911.type_tbl (type, description) values ('HTS', 'HEIGHTS');
insert into tn911.type_tbl (type, description) values ('HWY', 'HIGHWAY');
insert into tn911.type_tbl (type, description) values ('HL', 'HILL');
insert into tn911.type_tbl (type, description) values ('HLS', 'HILLS');
insert into tn911.type_tbl (type, description) values ('HOLW', 'HOLLOW');
insert into tn911.type_tbl (type, description) values ('INLT', 'INLET');
insert into tn911.type_tbl (type, description) values ('IS', 'ISLAND');
insert into tn911.type_tbl (type, description) values ('ISS', 'ISLANDS');
insert into tn911.type_tbl (type, description) values ('ISLE', 'ISLE');
insert into tn911.type_tbl (type, description) values ('JCT', 'JUNCTION');
insert into tn911.type_tbl (type, description) values ('JCTS', 'JUNCTIONS');
insert into tn911.type_tbl (type, description) values ('KY', 'KEY');
insert into tn911.type_tbl (type, description) values ('KYS', 'KEYS');
insert into tn911.type_tbl (type, description) values ('KNL', 'KNOLL');
insert into tn911.type_tbl (type, description) values ('KNLS', 'KNOLLS');
insert into tn911.type_tbl (type, description) values ('LK', 'LAKE');
insert into tn911.type_tbl (type, description) values ('LKS', 'LAKES');
insert into tn911.type_tbl (type, description) values ('LAND', 'LAND');
insert into tn911.type_tbl (type, description) values ('LNDG', 'LANDING');
insert into tn911.type_tbl (type, description) values ('LN', 'LANE');
insert into tn911.type_tbl (type, description) values ('LGT', 'LIGHT');
insert into tn911.type_tbl (type, description) values ('LGTS', 'LIGHTS');
insert into tn911.type_tbl (type, description) values ('LF', 'LOAF');
insert into tn911.type_tbl (type, description) values ('LCK', 'LOCK');
insert into tn911.type_tbl (type, description) values ('LCKS', 'LOCKS');
insert into tn911.type_tbl (type, description) values ('LDG', 'LODGE');
insert into tn911.type_tbl (type, description) values ('LOOP', 'LOOP');
insert into tn911.type_tbl (type, description) values ('MALL', 'MALL');
insert into tn911.type_tbl (type, description) values ('MNR', 'MANOR');
insert into tn911.type_tbl (type, description) values ('MNRS', 'MANORS');
insert into tn911.type_tbl (type, description) values ('MDW', 'MEADOW');
insert into tn911.type_tbl (type, description) values ('MDWS', 'MEADOWS');
insert into tn911.type_tbl (type, description) values ('MEWS', 'MEWS');
insert into tn911.type_tbl (type, description) values ('ML', 'MILL');
insert into tn911.type_tbl (type, description) values ('MLS', 'MILLS');
insert into tn911.type_tbl (type, description) values ('MSN', 'MISSION');
insert into tn911.type_tbl (type, description) values ('MTWY', 'MOTORWAY');
insert into tn911.type_tbl (type, description) values ('MT', 'MOUNT');
insert into tn911.type_tbl (type, description) values ('MTN', 'MOUNTAIN');
insert into tn911.type_tbl (type, description) values ('MTNS', 'MOUNTAINS');
insert into tn911.type_tbl (type, description) values ('NCK', 'NECK');
insert into tn911.type_tbl (type, description) values ('ORCH', 'ORCHARD');
insert into tn911.type_tbl (type, description) values ('OVAL', 'OVAL');
insert into tn911.type_tbl (type, description) values ('OPAS', 'OVERPASS');
insert into tn911.type_tbl (type, description) values ('PARK', 'PARK');
insert into tn911.type_tbl (type, description) values ('PKWY', 'PARKWAY');
insert into tn911.type_tbl (type, description) values ('PASS', 'PASS');
insert into tn911.type_tbl (type, description) values ('PSGE', 'PASSAGE');
insert into tn911.type_tbl (type, description) values ('PATH', 'PATH');
insert into tn911.type_tbl (type, description) values ('PIKE', 'PIKE');
insert into tn911.type_tbl (type, description) values ('PNE', 'PINE');
insert into tn911.type_tbl (type, description) values ('PNES', 'PINES');
insert into tn911.type_tbl (type, description) values ('PL', 'PLACE');
insert into tn911.type_tbl (type, description) values ('PLN', 'PLAIN');
insert into tn911.type_tbl (type, description) values ('PLNS', 'PLAINS');
insert into tn911.type_tbl (type, description) values ('PLZ', 'PLAZA');
insert into tn911.type_tbl (type, description) values ('PT', 'POINT');
insert into tn911.type_tbl (type, description) values ('PTS', 'POINTS');
insert into tn911.type_tbl (type, description) values ('PRT', 'PORT');
insert into tn911.type_tbl (type, description) values ('PRTS', 'PORTS');
insert into tn911.type_tbl (type, description) values ('PR', 'PRARIE');
insert into tn911.type_tbl (type, description) values ('RADL', 'RADIAL');
insert into tn911.type_tbl (type, description) values ('RAMP', 'RAMP');
insert into tn911.type_tbl (type, description) values ('RNCH', 'RANCH');
insert into tn911.type_tbl (type, description) values ('RPID', 'RAPID');
insert into tn911.type_tbl (type, description) values ('RPDS', 'RAPIDS');
insert into tn911.type_tbl (type, description) values ('RST', 'REST');
insert into tn911.type_tbl (type, description) values ('RDG', 'RIDGE');
insert into tn911.type_tbl (type, description) values ('RDGS', 'RIDGES');
insert into tn911.type_tbl (type, description) values ('RIV', 'RIVER');
insert into tn911.type_tbl (type, description) values ('RD', 'ROAD');
insert into tn911.type_tbl (type, description) values ('RDS', 'ROADS');
insert into tn911.type_tbl (type, description) values ('RTE', 'ROUTE');
insert into tn911.type_tbl (type, description) values ('ROW', 'ROW');
insert into tn911.type_tbl (type, description) values ('RUE', 'RUE');
insert into tn911.type_tbl (type, description) values ('RUN', 'RUN');
insert into tn911.type_tbl (type, description) values ('SHL', 'SHOAL');
insert into tn911.type_tbl (type, description) values ('SHLS', 'SHOALS');
insert into tn911.type_tbl (type, description) values ('SHR', 'SHORE');
insert into tn911.type_tbl (type, description) values ('SHRS', 'SHORES');
insert into tn911.type_tbl (type, description) values ('SKWY', 'SKYWAY');
insert into tn911.type_tbl (type, description) values ('SPG', 'SPRING');
insert into tn911.type_tbl (type, description) values ('SPGS', 'SPRINGS');
insert into tn911.type_tbl (type, description) values ('SPUR', 'SPUR');
insert into tn911.type_tbl (type, description) values ('SQ', 'SQUARE');
insert into tn911.type_tbl (type, description) values ('SQS', 'SQUARES');
insert into tn911.type_tbl (type, description) values ('STA', 'STATION');
insert into tn911.type_tbl (type, description) values ('STRA', 'STRAVENUE');
insert into tn911.type_tbl (type, description) values ('STRM', 'STREAM');
insert into tn911.type_tbl (type, description) values ('ST', 'STREET');
insert into tn911.type_tbl (type, description) values ('STS', 'STREETS');
insert into tn911.type_tbl (type, description) values ('SMT', 'SUMMIT');
insert into tn911.type_tbl (type, description) values ('TER', 'TERRACE');
insert into tn911.type_tbl (type, description) values ('TRWY', 'TRHOUGHWAY');
insert into tn911.type_tbl (type, description) values ('TRCE', 'TRACE');
insert into tn911.type_tbl (type, description) values ('TRAK', 'TRACK');
insert into tn911.type_tbl (type, description) values ('TRFY', 'TRAFFICWAY');
insert into tn911.type_tbl (type, description) values ('TRL', 'TRAIL');
insert into tn911.type_tbl (type, description) values ('TRLR', 'TRAILER');
insert into tn911.type_tbl (type, description) values ('TUNL', 'TUNNEL');
insert into tn911.type_tbl (type, description) values ('TPKE', 'TURNPIKE');
insert into tn911.type_tbl (type, description) values ('UPAS', 'UNDERPASS');
insert into tn911.type_tbl (type, description) values ('UN', 'UNION');
insert into tn911.type_tbl (type, description) values ('UNS', 'UNIONS');
insert into tn911.type_tbl (type, description) values ('VLY', 'VALLEY');
insert into tn911.type_tbl (type, description) values ('VLYS', 'VALLEYS');
insert into tn911.type_tbl (type, description) values ('VIA', 'VIADUCT');
insert into tn911.type_tbl (type, description) values ('VW', 'VIEW');
insert into tn911.type_tbl (type, description) values ('VWS', 'VIEWS');
insert into tn911.type_tbl (type, description) values ('VLG', 'VILLAGE');
insert into tn911.type_tbl (type, description) values ('VLGS', 'VILLAGES');
insert into tn911.type_tbl (type, description) values ('VL', 'VILLE');
insert into tn911.type_tbl (type, description) values ('VIS', 'VISTA');
insert into tn911.type_tbl (type, description) values ('WALK', 'WALK');
insert into tn911.type_tbl (type, description) values ('WALL', 'WALL');
insert into tn911.type_tbl (type, description) values ('WAY', 'WAY');
insert into tn911.type_tbl (type, description) values ('WAYS', 'WAYS');
insert into tn911.type_tbl (type, description) values ('WL', 'WELL');
insert into tn911.type_tbl (type, description) values ('WLS', 'WELLS');

/* qgis table unit */ 
DROP TABLE IF EXISTS tn911.unit_type_tbl; 
create table tn911.unit_type_tbl ( 
        description varchar(24),
	unit_type varchar(24) primary key 
        ); 

insert into tn911.unit_type_tbl (description, unit_type) values ('APARTMENT', 'APT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('BASEMENT', 'BSMT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('BUILDING', 'BLDG'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('DEPARTMENT', 'DEPT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('FLOOR', 'FL'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('FRONT', 'FRNT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('HANGAR', 'HNGR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('LOBBY', 'LBBY'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('LOT',	'LOT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('LOWER', 'LOWR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('OFFICE', 'OFC'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('PENTHOUSE', 'PH'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('PIER', 'PIER'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('REAR', 'REAR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('ROOM', 'RM'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('SIDE', 'SIDE'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('SLIP', 'SLIP'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('SPACE', 'SPC'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('STOP', 'STOP'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('SUITE', 'STE'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('TRAILER', 'TRLR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('UNIT', 'UNIT'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('UPPER', 'UPPR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('GARAGE', 'GAR'); 
insert into tn911.unit_type_tbl (description, unit_type) values ('OTHER', 'OTH'); 

/* Create Source  Table */
DROP TABLE IF EXISTS tn911.source_tbl; 
create table tn911.source_tbl ( 
	source integer primary key,
	description varchar(24)
        ); 

insert into tn911.source_tbl (source, description) values (1, '1-Parcel Centroid'); 
insert into tn911.source_tbl (source, description) values (2, '2-Driveway Entrance'); 
insert into tn911.source_tbl (source, description) values (3, '3-Structure Centroid'); 
insert into tn911.source_tbl (source, description) values (4, '4-Main entrace'); 
insert into tn911.source_tbl (source, description) values (5, '5-Frontage Centroid'); 
insert into tn911.source_tbl (source, description) values (0, '6-Undefined'); 

/* Create Lifecycle Status Table */
DROP TABLE IF EXISTS tn911.lifecyclestatus_tbl; 
create table tn911.lifecyclestatus_tbl ( 
	status integer primary key,
	description varchar(24)
        ); 

insert into tn911.lifecyclestatus_tbl (status, description) values (730, '730-ACTIVE'); 
insert into tn911.lifecyclestatus_tbl (status, description) values (734, '734-PROPOSED'); 
insert into tn911.lifecyclestatus_tbl (status, description) values (736, '736-POTENTIAL'); 
insert into tn911.lifecyclestatus_tbl (status, description) values (799, '799-RETIRED'); 

/* Create a addr_type */
DROP TABLE IF EXISTS tn911.addrtype_tbl; 
create table tn911.addrtype_tbl ( 
	type char(2) primary key,
	description varchar(24)
        ); 

insert into tn911.addrtype_tbl (type, description) values ('P', 'Potential'); 
insert into tn911.addrtype_tbl (type, description) values ('A', 'Actual'); 

/* Nametype */ 
DROP TABLE IF EXISTS tn911.nametype_tbl; 
create table tn911.nametype_tbl ( 
	nametype integer primary key,
	description varchar(50)
        ); 

insert into tn911.nametype_tbl (nametype, description) values (1, '1-Signed Name'); 
insert into tn911.nametype_tbl (nametype, description) values (2, '2-Long Haul Name - State Wide'); 
insert into tn911.nametype_tbl (nametype, description) values (3, '3-Long Haul Name - County Wide'); 
insert into tn911.nametype_tbl (nametype, description) values (4, '4-Long Haul Name - City Wide'); 
insert into tn911.nametype_tbl (nametype, description) values (5, '5-Postal Name'); 
insert into tn911.nametype_tbl (nametype, description) values (6, '6-MSAG Name'); 
insert into tn911.nametype_tbl (nametype, description) values (7, '7-Inventory Name'); 


/* CFCC Table */
DROP TABLE IF EXISTS tn911.cfcc_tbl; 
create table tn911.cfcc_tbl ( 
	cfcc char(3) primary key,
	description varchar(150)
        ); 

insert into tn911.cfcc_tbl (cfcc, description) values ('A10', 'A10-Road, major and minor categories unknown');
insert into tn911.cfcc_tbl (cfcc, description) values ('A11', 'A11-Primary road with limited access or interstate highway, unseparated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A12', 'A12-Primary road with limited access or interstate highway, unseparated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A13', 'A13-Primary road with limited access or interstate highway, unseparated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A14', 'A14-Primary road with limited access or interstate highway, unseparated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A15', 'A15-Primary road with limited access or interstate highway, separated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A16', 'A16-Primary road with limited access or interstate highway, separated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A17', 'A17-Primary road with limited access or interstate highway, separated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A18', 'A18-Primary road with limited access or interstate highway, separated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A19', 'A19-Primary road with limited access or interstate highway, bridge');
insert into tn911.cfcc_tbl (cfcc, description) values ('A21', 'A21-Primary road without limited access, U.S. and State highways, unseparated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A22', 'A22-Primary road without limited access, U.S. and State highways, unseparated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A23', 'A23-Primary road without limited access, U.S. and State highways, unseparated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A24', 'A24-Primary road without limited access, U.S. and State highways, unseparated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A25', 'A25-Primary road without limited access, U.S. and State highways, separated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A26', 'A26-Primary road without limited access, U.S. and State highways, separated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A27', 'A27-Primary road without limited access, U.S. and State highways, separated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A28', 'A28-Primary road without limited access, U.S. and State highways, separated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A29', 'A29-Primary road without limited access, US highways, bridge');
insert into tn911.cfcc_tbl (cfcc, description) values ('A31', 'A31-Secondary and connecting road, State and county highways, unseparated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A32', 'A32-Secondary and connecting road, State and county highways, unseparated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A33', 'A33-Secondary and connecting road, State and county highways, unseparated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A34', 'A34-Secondary and connecting road, State and county highways, unseparated, with rail lin in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A35', 'A35-Secondary and connecting road, State and county highways, separated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A36', 'A36-Secondary and connecting road, State and county highways, separated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A37', 'A37-Secondary and connecting road, State and county highways, separated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A38', 'A38-Secondary and connecting road, State and county highway, separated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A39', 'A39-Secondary and connecting road, state and county highways, bridge');
insert into tn911.cfcc_tbl (cfcc, description) values ('A41', 'A41-Local, neighborhood, and rural road, city street, unseparated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A42', 'A42-Local, neighborhood, and rural road, city street, unseparated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A43', 'A43-Local, neighborhood, and rural road, city street, unseparated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A44', 'A44-Local, neighborhood, and rural road, city street, unseparated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A45', 'A45-Local, neighborhood, and rural road, city street, separated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A46', 'A46-Local, neighborhood, and rural road, city street, separated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A47', 'A47-Local, neighborhood, and rural road, city street, separated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A48', 'A48-Local, neighborhood, and rural road, city street, separated, with rail line in center');
insert into tn911.cfcc_tbl (cfcc, description) values ('A49', 'A49-Local, neighborhood, and rural road, city street, bridge');
insert into tn911.cfcc_tbl (cfcc, description) values ('A50', 'A50-Vehicular trail, road passable only by four-wheel drive (4WD) vehicle, major category');
insert into tn911.cfcc_tbl (cfcc, description) values ('A51', 'A51-Vehicular trail, road passable only by 4WD vehicle, unseparated');
insert into tn911.cfcc_tbl (cfcc, description) values ('A52', 'A52-Vehicular trail, road passable only by 4WD vehicle, unseparated, in tunnel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A53', 'A53-Vehicular trail, road passable only by 4WD vehicle, unseparated, underpassing');
insert into tn911.cfcc_tbl (cfcc, description) values ('A60', 'A60-Special road feature, major category used when the minor category could not be determined');
insert into tn911.cfcc_tbl (cfcc, description) values ('A61', 'A61-Cul-de-sac, the closed end of a road that tn911 a loop or turn around');
insert into tn911.cfcc_tbl (cfcc, description) values ('A62', 'A62-Traffic circle, the portion of a road or intersection of roads that form a roundabout');
insert into tn911.cfcc_tbl (cfcc, description) values ('A63', 'A63-Access ramp, the portion of a road that tn911 a cloverleaf or limited access interchange');
insert into tn911.cfcc_tbl (cfcc, description) values ('A64', 'A64-Service drive, road that provides access to businesses, facilities, and rest areas along limited-access highway');
insert into tn911.cfcc_tbl (cfcc, description) values ('A65', 'A65-Ferry crossing, the representation of a route over water that connects roads on opposite shores');
insert into tn911.cfcc_tbl (cfcc, description) values ('A66', 'A66-Gated barrier to travel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A67', 'A67-Toll booth barrier to travel');
insert into tn911.cfcc_tbl (cfcc, description) values ('A70', 'A70-Other thoroughfare, major category used when the minor category could not be determined');
insert into tn911.cfcc_tbl (cfcc, description) values ('A71', 'A71-Walkway, nearly level road for pedestrians, usually unnamed');
insert into tn911.cfcc_tbl (cfcc, description) values ('A72', 'A72-Stairway, stepped road for pedestrians, usually unnamed');
insert into tn911.cfcc_tbl (cfcc, description) values ('A73', 'A73-Alley, road for service vehicles, usually unnamed, located at the rear of buildings and property');
insert into tn911.cfcc_tbl (cfcc, description) values ('A74', 'A74-Driveway or service road, usually privately owned and unnamed, used as access to residences, etc., or as access to logging areas, etc.');

/* Lanes */ 
DROP TABLE IF EXISTS tn911.lanes_tbl; 
create table tn911.lanes_tbl ( 
	lanes integer primary key
        ); 

insert into tn911.lanes_tbl (lanes) values (1); 
insert into tn911.lanes_tbl (lanes) values (2); 
insert into tn911.lanes_tbl (lanes) values (3); 
insert into tn911.lanes_tbl (lanes) values (4); 
insert into tn911.lanes_tbl (lanes) values (5); 
insert into tn911.lanes_tbl (lanes) values (6); 
insert into tn911.lanes_tbl (lanes) values (7); 
insert into tn911.lanes_tbl (lanes) values (8); 
insert into tn911.lanes_tbl (lanes) values (9); 
insert into tn911.lanes_tbl (lanes) values (10); 
insert into tn911.lanes_tbl (lanes) values (11); 
insert into tn911.lanes_tbl (lanes) values (12); 
insert into tn911.lanes_tbl (lanes) values (13); 

DROP TABLE IF EXISTS tn911.oneway_tbl; 
create table tn911.oneway_tbl ( 
	id serial primary key, 
	oneway varchar(3),
	description varchar(50)
        ); 

insert into tn911.oneway_tbl (oneway, description) values ('TF', 'One Way is To-From Node Direction'); 
insert into tn911.oneway_tbl (oneway, description) values ('FT', 'One Way is From-To Node Direction'); 
insert into tn911.oneway_tbl (oneway, description) values ('T', 'One Way is TO-From Node Direction'); 
insert into tn911.oneway_tbl (oneway, description) values ('F', 'One Way is From-To Node Direction'); 
insert into tn911.oneway_tbl (oneway, description) values ('N', 'One Way is in Neither Direction'); 

DROP TABLE IF EXISTS tn911.access_tbl; 
create table tn911.access_tbl ( 
	id serial primary key, 
	type varchar(24),
	description varchar(50)
        ); 

insert into tn911.access_tbl (type, description) values ('ACCESS', 'Access Point'); 
insert into tn911.access_tbl (type, description) values ('ROUTING', 'Routing Point'); 
insert into tn911.access_tbl (type, description) values ('ACCESS AND ROUTING', 'Structure is accessed and routed from this point'); 

DROP TABLE IF EXISTS tn911.geosrc_tbl; 
create table tn911.geosrc_tbl ( 
	geosrc varchar(50) primary key,
	description varchar(50)
        ); 

insert into tn911.geosrc_tbl (geosrc, description) values ('AERIAL IMAGERY', 'Aerial Imagery'); 
insert into tn911.geosrc_tbl (geosrc, description) values ('DRONE', 'Drone'); 
insert into tn911.geosrc_tbl (geosrc, description) values ('GPS', 'GPS'); 
insert into tn911.geosrc_tbl (geosrc, description) values ('OTHER', 'Other'); 
insert into tn911.geosrc_tbl (geosrc, description) values ('SURVEY', 'Survey'); 
insert into tn911.geosrc_tbl (geosrc, description) values ('SITE VISIT', 'Site Visit'); 

DROP TABLE IF EXISTS tn911.yesno_tbl;
create table tn911.yesno_tbl (
        type varchar(8) primary key,
        description varchar(8)
        );

insert into tn911.yesno_tbl (type, description) values ('YES', 'Yes'); 
insert into tn911.yesno_tbl (type, description) values ('NO', 'No'); 

DROP TABLE IF EXISTS tn911.geomod_tbl; 
create table tn911.geomod_tbl ( 
	geomod varchar(50) primary key,
	description varchar(50)
        ); 

insert into tn911.geomod_tbl (geomod, description) values ('ADJUSTED FOR ACCURACY', 'ADJUSTED FOR ACCURACY'); 
insert into tn911.geomod_tbl (geomod, description) values ('MOVED TO ROOFTOP', 'MOVED TO ROOFTOP'); 
insert into tn911.geomod_tbl (geomod, description) values ('MOVED TO FRONT DOOR', 'MOVED TO FRONT DOOR'); 
insert into tn911.geomod_tbl (geomod, description) values ('STRUCTURE MOVED', 'STRUCTURE MOVED'); 

DROP TABLE IF EXISTS tn911.attmod_tbl; 
create table tn911.attmod_tbl ( 
	attmod varchar(50) primary key,
	description varchar(50)
        ); 

insert into tn911.attmod_tbl (attmod, description) values ('CORRECTED ADDRESS', 'CORRECTED ADDRESS'); 
insert into tn911.attmod_tbl (attmod, description) values ('CORRECTED ESN', 'CORRECTED ESN'); 
insert into tn911.attmod_tbl (attmod, description) values ('SPELLING CORRECTION', 'SPELLING CORRECTION'); 

DROP TABLE IF EXISTS tn911.attsrc_tbl; 
create table tn911.attsrc_tbl ( 
	attsrc varchar(50) primary key,
	description varchar(50)
        ); 

insert into tn911.attsrc_tbl (attsrc, description) values ('CHECKED WITH EXISTING DATA', 'CHECKED WITH EXISTING DATA'); 
insert into tn911.attsrc_tbl (attsrc, description) values ('FIELD VERIFICATION', 'FIELD VERIFICATION'); 
insert into tn911.attsrc_tbl (attsrc, description) values ('IMAGERY VERIFICATION', 'IMAGERY VERIFICATION'); 
insert into tn911.attsrc_tbl (attsrc, description) values ('SPELLING CORRECTION', 'SPELLING CORRECTION'); 


