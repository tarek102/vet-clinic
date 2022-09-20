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
