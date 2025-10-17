#!/bin/bash 

psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 01_check_address_oirids.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 02_check_address_segside.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 03_check_address_predir.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 04_check_address_type.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 05_check_address_name.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 06_check_address_sufdir.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 07_check_address_postmod.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 08_check_address_zip.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 09_check_address_esn.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 10_check_address_city.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 11_check_address_city_zip.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 12_check_address_addrauth.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 13_check_address_status.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 15_check_address_within_esn.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 16_check_address_geometry.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 17_check_address_pretype.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f 18_check_address_streets.sql

