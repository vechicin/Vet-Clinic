/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered IS TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name in ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered IS TRUE;
SELECT * FROM animals WHERE not name = 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) from animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

SELECT * FROM animals INNER JOIN owners ON owners_id = owners.id WHERE full_name = 'Melody Pond';
SELECT * FROM animals INNER JOIN species ON species_id = species.id WHERE species.id = 1;
SELECT * FROM animals RIGHT JOIN owners ON owners_id = owners.id;
SELECT species.name, COUNT(*) FROM species LEFT JOIN animals ON species.id = species_id GROUP BY species.id;
SELECT * FROM animals INNER JOIN owners ON owners_id = owners.id WHERE full_name = 'Jennifer Orwell' AND species_id = 2;
SELECT * FROM animals INNER JOIN owners ON owners_id = owners.id WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;
SELECT full_name, COUNT(full_name) FROM (
SELECT full_name FROM animals LEFT JOIN owners ON owners_id = owners.id) AS count GROUP BY full_name HAVING COUNT (full_name) = 
(SELECT MAX(count) FROM 
(SELECT full_name, COUNT(full_name) FROM animals LEFT JOIN owners ON owners_id = owners.id GROUP BY full_name) AS count);

SELECT * FROM animals INNER JOIN visits ON animals.name = animal_name WHERE vet_name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(animals.name) FROM animals INNER JOIN visits ON animals.name = animal_name WHERE vet_name = 'Stephanie Mendez';
SELECT * FROM vets LEFT JOIN specializations ON vets.name = specializations.name;
SELECT * FROM animals INNER JOIN visits ON animals.name = animal_name WHERE date_of_visit BETWEEN '2020-04-01' AND '2020-08-30' AND vet_name = 'Stephanie Mendez';
SELECT * FROM
(SELECT animals.name, COUNT(date_of_visit) FROM animals INNER JOIN visits ON animals.name = animal_name GROUP BY animals.name)
AS most_visits GROUP BY most_visits.name, most_visits.count HAVING MAX(count) > 1
ORDER BY count DESC LIMIT 1;
SELECT * FROM animals INNER JOIN visits ON animals.name = animal_name WHERE vet_name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
SELECT * FROM animals INNER JOIN visits ON animals.name = animal_name INNER JOIN vets ON vet_name = vets.name ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(date_of_visit) FROM
(SELECT * FROM visits INNER JOIN vets ON vet_name = vets.name
LEFT JOIN specializations ON vets.name = specializations.name WHERE specialties IS NULL)
AS no_specialty_visit;
SELECT specialty.name, COUNT(specialty.name) FROM
(SELECT species.name, species.id, date_of_visit FROM vets
INNER JOIN visits ON vets.name = vet_name
LEFT JOIN specializations ON specializations.name = vets.name
INNER JOIN animals ON animal_name = animals.name
INNER JOIN species ON species.id = species_id WHERE vet_name = 'Maisy Smith') AS specialty GROUP BY specialty.name ORDER BY specialty.name LIMIT 1;
