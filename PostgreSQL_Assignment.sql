-- Active: 1747416175240@@127.0.0.1@4900@conservation_db

CREATE DATABASE conservation_db;

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL,
    region VARCHAR(50)
);


CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(20) ,
    discovery_date TIMESTAMP without time zone,
    conservation_status VARCHAR(20)
);

--update scientific_name type
ALTER Table species
 alter COLUMN scientific_name type TEXT;

-- update discovery_date type
 ALTER Table species
 alter COLUMN discovery_date type DATE;
 ALTER Table species
 alter COLUMN species_id type INTEGER ;

 

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INTEGER REFERENCES rangers(ranger_id) on delete CASCADE,
    species_id INTEGER REFERENCES species(species_id) on delete CASCADE,
    "location" VARCHAR(30) NOT NULL,
    sighting_time TIMESTAMP with TIME zone,
    notes text


);

 ALTER Table sightings
 alter COLUMN sighting_id type INTEGER ;

INSERT into rangers("name",region) values 
       ('Alice Green','Northern Hills'),
       ('Bob White','River Delta'),
       ('Carol King','Mountain Range');


INSERT INTO species(species_id,common_name,scientific_name,discovery_date,conservation_status) VALUES 
             (1,'Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
             (2,'Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
             (3,'Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
             (4,'Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');


INSERT INTO sightings (sighting_id,ranger_id,species_id,"location",sighting_time,notes) VALUES
                (1,1,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'),
                (2,2,2,'Bankwood Area','2024-05-12 16:20:00','Juvenile seen '),
                (3,3,3,'Bamboo Grove East','2024-05-15 09:10:00','Feeding observed '),
                (4,1,2,'Snowfall Pass','2024-05-18 18:30:00',NULL);


SELECT * from rangers;

SELECT * FROM species;

SELECT * from sightings;


