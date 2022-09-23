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


/* Insert into vets */

INSERT INTO vets (name, age, date_of_graduation) VALUES ( 'William Tatcher', 45, '2000-04-23'), ('Maisy Smith', 26, '2019-01-17'), ('Stephanie Mendez', 64, '1981-05-04'), ('Jack Harkness', 38, '2008-06-08');


/* Insert into specialization */

INSERT INTO specialization (vet_id, species_id) VALUES ( 1, 1), (3, 1), (3, 2), (4, 2);


/* Insert into visits */

INSERT INTO visits (animals_id, vet_id, date_of_visit) VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'), (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'), (4, 3, '2021-05-04'), (5, 4, '2021-02-24'), (6, 2, '2019-12-21'), (6, 4, '2020-08-10'), (6, 2, '2021-04-07'), (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), (8, 4, '2020-11-04'), (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), (10, 4, '2021-01-11');



