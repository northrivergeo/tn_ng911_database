#/bin/bash 

psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_segside.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_predir.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_type.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_name.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_sufdir.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_postmod.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_zip.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_esn.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_city.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_city_zip.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_addrauth.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_status.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_geometry.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_pretype.sql
psql postgresql://rjhale:9wikufi6@192.168.2.34:5432/henryco?sslmode=require -f ./address/check_address_streets.sql

