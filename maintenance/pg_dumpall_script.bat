:: assuming you are running this on windows and don't have a backup system in place
:: THIS DOES NOT REPLACE HAVING A FUNCTIONAL BACKUP - FOR THE LOVE OF ALL THAT IS HOLY TALK TO YOUR IT STAFF

@echo off
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
  set dow=%%i
  set month=%%j
  set day=%%k
  set year=%%l
)
set datestr=%month%_%day%_%year%
echo datestr is %datestr%
  
set BACKUP_FILE=henderson_%datestr%.backup
echo backup file name is %BACKUP_FILE%
SET PGPASSWORD=Angelfury0!
echo on
C:\"Program Files"\PostgreSQL\ver\bin\pg_dumpall.exe -h localhost -p 5432 -U USER -f D:\PGDB_BACKUP\%BACKUP_FILE% henderson911
