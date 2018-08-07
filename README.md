## postgres with postgis docker image documentation

https://github.com/appropriate/docker-postgis/tree/master/10-2.4

## run docker image

docker run --name postgresql-postgis -e POSTGRES_PASSWORD=password1234 -p 5432:5432 -d mdillon/postgis

## setup database

connect using your favorite sql editor then run the following scripts in order:
* schema.sql
* tables.sql
* insert.sql
* indexes.sql

## sample queries

### find stores within 1000 meters of -84.5086 39.1003 

SELECT name FROM stores WHERE ST_DWithin(location, ST_GeogFromText('SRID=4326;POINT(-84.5086 39.1003)'), 1000);

### find stores within 1000000 meters of -84.5086 39.1003, show distance from origin, order by distance from origin

SELECT id, name, ST_Distance(location, ref_geog) AS distance  
FROM stores  
CROSS JOIN (SELECT ST_GeogFromText('SRID=4326;POINT(-84.5086 39.1003)') AS ref_geog) AS r  
WHERE ST_DWithin(location, ref_geog, 1000000)  
ORDER BY ST_Distance(location, ref_geog); 
