/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL);

ALTER TABLE animals ADD species VARCHAR(100);

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY(id)
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

ALTER TABLE animals
ALTER COLUMN id SET NOT NULL;
ALTER TABLE animals
ALTER COLUMN id
ADD GENERATED ALWAYS AS IDENTITY;

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT animals_constraint
FOREIGN KEY (species_id)
REFERENCES species (id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owners_id INT;

ALTER TABLE animals
ADD CONSTRAINT animals_constraint_two
FOREIGN KEY (owners_id)
REFERENCES owners (id)
ON DELETE CASCADE;
