# ch_fr_aquafri
[qwat-data-model](https://github.com/qwat/qwat-data-model) extension for exporting to [AquaFri](http://www.fr.ch/saav/fr/pub/securite_alimentaire/eau_potable/aquafri_print.cfm)'s data model

## What does it do

The extension creates the schema "qwat_ch_fr_aquafri" with views corresponding to AquaFri's data model. 
You can connect to these views with Arcgis desktop (>= 10.6) and [load data](http://desktop.arcgis.com/fr/arcmap/10.3/manage-data/geodatabases/loading-data-in-arccatalog.htm) into [official .gdb](http://www.fr.ch/saav/files/zip1/modo_g_t_95.gdb.zip) 

## Principle

It replaces qwat_vl tables in views with a lookup table containing the original id and the AquaFri's code.

Sample for status table

| id        | code          | 
| ------------- |:-------------:|
| 101      | ES |
| 1302     | HS     |
| 1307 | PL     |

All relations are registered in openOffice sheets under the folder "relations", to be customized for your need. 
You can apply your adjustments in the "csv" tab, save it under .csv format (utf-8) and reinstall the extension to apply. 

## Install

### Check your postgresql service definition

nano /root/.pg_service.conf

[qwat]  
host=127.0.0.1  
dbname=qwat  
port=5432  
user=postgres  
password=yours;)  

### launch install

chmod 775 -R ./*

./init_aquafri.sh -p qwat

#### Parameters
short | long | action
--- | --- | ---
-p|--pgservice | PG service to connect to the database. 
-s|--srid |PostGIS SRID. !! AquaFri MUST use MN95 (EPSG:2056) since 2017-01-01 !! custom srid is autorized for testing purpose 
-c|--check	|Checks relations between original qwat_vl and custom aquaFri values 
-d|--disable |Disable extension without deleting anything (safe) 
-e|--enable |Enable disabled extension 
-r|--drop-schema |Drop schema (cascaded). Carefull, it clears all custom tables and values inserted in qwat_vl. 

