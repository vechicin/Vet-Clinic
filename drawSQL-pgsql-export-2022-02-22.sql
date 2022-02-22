CREATE TABLE "animals"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owners_id" INTEGER NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
CREATE TABLE "owners"(
    "id" INTEGER NOT NULL,
    "full_name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
CREATE INDEX "owners_email_index" ON
    "owners"("email");
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "species"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" INTEGER NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "specializations"(
    "vet_id" INTEGER NULL,
    "specialties_id" INTEGER NULL
);
ALTER TABLE
    "specializations" ADD PRIMARY KEY("vet_id");
CREATE TABLE "visits"(
    "animal_id" INTEGER NULL,
    "vet_id" INTEGER NULL,
    "date_of_visit" DATE NULL
);
CREATE INDEX "visits_animal_id_index" ON
    "visits"("animal_id");
CREATE INDEX "visits_vet_id_index" ON
    "visits"("vet_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("animal_id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_owners_id_foreign" FOREIGN KEY("owners_id") REFERENCES "owners"("id");
ALTER TABLE
    "animals" ADD CONSTRAINT "animals_species_id_foreign" FOREIGN KEY("species_id") REFERENCES "species"("id");
ALTER TABLE
    "specializations" ADD CONSTRAINT "specializations_specialties_id_foreign" FOREIGN KEY("specialties_id") REFERENCES "species"("id");
ALTER TABLE
    "visits" ADD CONSTRAINT "visits_vet_id_foreign" FOREIGN KEY("vet_id") REFERENCES "vets"("id");