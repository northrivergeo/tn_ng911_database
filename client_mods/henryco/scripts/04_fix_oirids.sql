/* cleanup - I need to sync the oirid with the id */
/*for address points*/
alter table tn911.address_points add column tempid integer;
update tn911.address_points set tempid  = split_part(oirid, '_', 2)::int;
alter table tn911.address_points drop column ogc_fid;
alter table tn911.address_points rename tempid to ogc_fid;
alter table tn911.address_points add primary key (ogc_fid);
create sequence tn911.address_points_idpk_seq;
alter sequence tn911.address_points_idpk_seq owner to hc911;
alter sequence tn911.address_points_idpk_seq owned by tn911.address_points.ogc_fid;
SELECT setval(pg_get_serial_sequence('tn911.address_points', 'ogc_fid'), coalesce(max(ogc_fid),0) + 1, false) FROM tn911.address_points;
alter table tn911.address_points alter column ogc_fid set default nextval('tn911.address_points_idpk_seq');

/*for centerlines*/
alter table tn911.centerlines add column tempid integer;
update tn911.centerlines set tempid  = split_part(oirid, '_', 2)::int;
alter table tn911.centerlines drop column ogc_fid;
alter table tn911.centerlines rename tempid to ogc_fid;
alter table tn911.centerlines add primary key (ogc_fid);
create sequence tn911.centerlines_idpk_seq;
alter sequence tn911.centerlines_idpk_seq owner to hc911;
alter sequence tn911.centerlines_idpk_seq owned by tn911.centerlines.ogc_fid;
SELECT setval(pg_get_serial_sequence('tn911.centerlines', 'ogc_fid'), coalesce(max(ogc_fid),0) + 1, false) FROM tn911.centerlines;
alter table tn911.centerlines alter column ogc_fid set default nextval('tn911.centerlines_idpk_seq');

