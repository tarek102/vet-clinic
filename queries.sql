/*Queries that provide answers to the questions from all projects.*/

SELECT name from animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-12-31';

SELECT name FROM animals WHERE escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals Where neutered;

SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;


/* update data in animals table and save to savepoint */

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;


BEGIN
vet_clinic=*# UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

vet_clinic=*# Update animals SET species = 'pokemon' Where species IS NULL;

COMMIT;


BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SELECT * from animals;

BEGIN;
SAVEPOINT pointOne;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK to pointOne;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
