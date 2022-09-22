/* Database schema to keep the struct.ure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals ( 
    id INT PRIMARY KEY NOT NULL, 
    name TEXT NOT NULL, 
    date_of_birth DATE NOT NULL, 
    escape_attempts INT NOT NULL, 
    neutered BOOLEAN NOT NULL, 
    weight_kg DECIMAL NOT NULL
);

/* Add species column */

ALTER TABLE animals ADD species VARCHAR(255);


CREATE TABLE owners ( id INT GENERATED ALWAYS AS IDENTITY, full_name VARCHAR(255) NOT NULL, AGE INT NOT NULL, PRIMARY KEY (id));

CREATE TABLE species ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255) NOT NULL, PRIMARY KEY(id));


CREATE SEQUENCE animals_id_seq;

ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

/* Create vets and joining tables */

CREATE TABLE vets ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(255) NOT NULL, age INT NOT NULL, date_of_graduation DATE NOT NULL, PRIMARY KEY(id));

CREATE TABLE specialization ( id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, species_id INT REFERENCES species(id), vet_id INT REFERENCES vets(id) );

CREATE TABLE visits ( id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, animals_id INT REFERENCES animals(id), vet_id INT REFERENCES vets(id), date_of_visit DATE NOT NULL);
