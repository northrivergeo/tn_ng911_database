--drop triggers on tn911.address_points
drop trigger IF EXISTS update_address_esn on tn911.address_points; 
drop trigger IF EXISTS notify_qgis_address_edit on tn911.address_points; 
drop trigger IF EXISTS update_address_attdate on tn911.address_points; 
drop trigger IF EXISTS update_address_label on tn911.address_points; 
drop trigger IF EXISTS update_address_location on tn911.address_points; 
drop trigger IF EXISTS update_address_oirid on tn911.address_points; 
drop trigger IF EXISTS update_address_geodate on tn911.address_points; 
drop trigger IF EXISTS notify_qgis_address_edit on tn911.address_points; 
drop trigger IF EXISTS update_address_gpsdate on tn911.address_points; 

--drop triggers on tn911.centerlines
drop trigger IF EXISTS update_centerlines_attdate on tn911.centerlines; 
drop trigger IF EXISTS notify_qgis_centerlines_edit on tn911.centerlines; 
drop trigger IF EXISTS update_centerlines_oirid on tn911.centerlines; 
drop trigger IF EXISTS update_centerlines_segid on tn911.centerlines; 
drop trigger IF EXISTS update_centerlines_street on tn911.centerlines; 
drop trigger IF EXISTS notify_qgis_centerlines_edit on tn911.centerlines;
drop trigger IF EXISTS update_centerline_geodate on tn911.centerlines; 

--drop trigger on esn
drop trigger IF EXISTS notify_qgis_esn_edit on tn911.esn; 
drop trigger IF EXISTS update_esn_geodate on tn911.esn; 

--drop fundtions on tn911.address_points
drop function tn911.address_func_oirid();
drop function tn911.address_func_esn();  
drop function tn911.address_func_geodate();
drop function tn911.address_func_label(); 
drop function tn911.address_func_location(); 
drop function tn911.address_attdate();
drop function tn011.address_func_gpsdate(); 

--drop functions on tn911.centerlines 
drop function tn911.tn911.centerlines_func_oirid();
drop function tn911.centerlines_func_attdate();
drop function tn911.centerlines_func_segid();
drop function tn911.centerlines_func_street();
drop function tn911.centerline_func_geodate()();

--drop functions on tn911.esn 
drop function tn911.esn_func_geodate(); 

--QGIS Notify 
drop function public.notify_qgis();
drop trigger IF EXISTS notify_qgis_address_edit on tn911.centerlines; 
drop trigger IF EXISTS notify_qgis_centerlines_edit on tn911.address_points; 
drop trigger IF EXISTS notify_qgis_esn_edit on tn911.esn; 
