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


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

Update animals SET species = 'pokemon' Where species IS NULL;

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

/* How many queries? */

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals Where date_of_birth BETWEEN '1990 01-01' AND '2000-12-31' GROUP BY species;


/* Join */

SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name FROM animals JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(*) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE species_id = 2 AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts > 0;

SELECT owners.full_name, COUNT(*) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT (1);


/* Who was the last animal seen by William Tatcher? */

SELECT animals.name FROM animals INNER JOIN visits ON visits.animals_id = animals.id WHERE visits.vet_id = 1 ORDER BY date_of_visit DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */

SELECT COUNT(animals.name) FROM animals INNER JOIN visits ON visits.animals_id = animals.id WHERE visits.vet_id = 3;

/* List all vets and their specialties, including vets with no specialties. */

SELECT vets.name, species.name FROM vets LEFT JOIN specialization ON specialization.vet_id = vets.id LEFT JOIN species ON specialization.species_id = species.id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vet_id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

/* What animal has the most visits to vets? */

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id GROUP BY visits.animals_id, animals.name ORDER BY COUNT(visits.animals_id) DESC LIMIT 1;


 /* Who was Maisy Smith's first visit? */
 
 SELECT name FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vet_id = 2 ORDER BY visits.date_of_visit ASC LIMIT 1;
 
 
 /* Details for most recent visit: animal information, vet information, and date of visit. */
 
 SELECT animals.name, vets.name, visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animals_id INNER JOIN vets ON vets.id = visits.vet_id ORDER BY visits.date_of_visit LIMIT 1;
 
 
/* What specialty should Maisy Smith consider getting? Look for the species she gets the most. */
 
SELECT COUNT(visits.animals_id), species.name FROM visits JOIN animals ON animals.id = visits.animals_id JOIN species ON animals.species_id = species.id WHERE visits.vet_id = 2 GROUP BY species.name ORDER BY COUNT(visits.animals_id) DESC LIMIT 1;
 
