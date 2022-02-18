/* Populate database with sample data. */

INSERT INTO animals VALUES (1, 'Agumon', '2020-02-03', 0, TRUE, 10.23);
INSERT INTO animals VALUES (2, 'Gabumon', '2018-11-15', 2, TRUE, 8);
INSERT INTO animals VALUES (3, 'Pikachu', '2021-01-07', 1, FALSE, 15.04);
INSERT INTO animals VALUES (4, 'Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals VALUES (5, 'Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals VALUES (6, 'Plantmon', '2022-11-15', 2, TRUE, -5.7);
INSERT INTO animals VALUES (7, 'Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals VALUES (8, 'Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals VALUES (9, 'Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals VALUES (10, 'Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon%';

UPDATE animals SET owners_id = 1 WHERE name LIKE '%Agumon%';
UPDATE animals SET owners_id = 2 WHERE name LIKE '%Gabumon%';
UPDATE animals SET owners_id = 2 WHERE name LIKE '%Pikachu%';
UPDATE animals SET owners_id = 3 WHERE name LIKE '%Devimon%';
UPDATE animals SET owners_id = 3 WHERE name LIKE '%Plantmon%';
UPDATE animals SET owners_id = 4 WHERE name LIKE '%Charmander%';
UPDATE animals SET owners_id = 4 WHERE name LIKE '%Squirtle%';
UPDATE animals SET owners_id = 4 WHERE name LIKE '%Blossom%';
UPDATE animals SET owners_id = 5 WHERE name LIKE '%Angemon%';
UPDATE animals SET owners_id = 5 WHERE name LIKE '%Boarmon%';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations VALUES ('William Tatcher', 'Pokemon');
INSERT INTO specializations VALUES ('Stephanie Mendez', 'Pokemon and Digimon');
INSERT INTO specializations VALUES ('Jack Harkness', 'Digimon');

INSERT INTO visits VALUES ('Agumon', 'William Tatcher', '2020-05-24');
INSERT INTO visits VALUES ('Agumon', 'Stephanie Mendez', '2020-07-22');
INSERT INTO visits VALUES ('Gabumon', 'Jack Harkness', '2021-02-22');
INSERT INTO visits VALUES ('Agumon', 'William Tatcher', '2020-05-24');
INSERT INTO visits VALUES ('Pikachu', 'Maisy Smith', '2020-01-05');
INSERT INTO visits VALUES ('Pikachu', 'Maisy Smith', '2020-03-08');
INSERT INTO visits VALUES ('Pikachu', 'Maisy Smith', '2020-05-14');
INSERT INTO visits VALUES ('Devimon', 'Stephanie Mendez', '2021-05-04');
INSERT INTO visits VALUES ('Charmander', 'Jack Harkness', '2021-02-24');
INSERT INTO visits VALUES ('Plantmon', 'Maisy Smith', '2019-12-21');
INSERT INTO visits VALUES ('Plantmon', 'William Tatcher', '2020-08-10');
INSERT INTO visits VALUES ('Plantmon', 'Maisy Smith', '2021-04-07');
INSERT INTO visits VALUES ('Squirtle', 'Stephanie Mendez', '2019-09-29');
INSERT INTO visits VALUES ('Angemon', 'Jack Harkness', '2020-10-03');
INSERT INTO visits VALUES ('Angemon', 'Jack Harkness', '2020-11-04');
INSERT INTO visits VALUES ('Boarmon', 'Maisy Smith', '2019-01-24');
INSERT INTO visits VALUES ('Boarmon', 'Maisy Smith', '2019-05-15');
INSERT INTO visits VALUES ('Boarmon', 'Maisy Smith', '2020-02-27');
INSERT INTO visits VALUES ('Boarmon', 'Maisy Smith', '2020-08-03');
INSERT INTO visits VALUES ('Blossom', 'Stephanie Mendez', '2020-05-24');
INSERT INTO visits VALUES ('Blossom', 'William Tatcher', '2021-01-11');
