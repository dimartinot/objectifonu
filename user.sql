GRANT ALL PRIVILEGES IN *.* TO 'root'@'localhost' IDENTIFIED BY 'eisti';

DROP DATABASE IF EXISTS insarag;

CREATE DATABASE insarag;
USE insarag;

DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Work;
DROP TABLE IF EXISTS Respo;

CREATE TABLE User (
    user_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom varchar(30),
    prenom varchar(30),
    mail varchar(50),
    mdp varchar(50),
    nom_work varchar(50),
    nom_respo varchar(50),
    FOREIGN KEY (nom_work) REFERENCES Work(nom_work),
    FOREIGN KEY (nom_respo) REFERENCES Respo(nom_respo)
);

CREATE TABLE Work(
    work_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_work varchar(50)
);

CREATE TABLE Respo(
    respo_id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nom_respo varchar(50)
);

INSERT INTO Work (nom_work) VALUES ('Pompier');
INSERT INTO Work (nom_work) VALUES ('Médecin');

INSERT INTO Respo (nom_respo) VALUES ('superadmin');
INSERT INTO Respo (nom_respo) VALUES ('admin');

INSERT INTO User (nom, prenom, mail, mdp, nom_work, nom_respo) VALUES ('dupont', 'jean', 'dupontjean@eisti.fr', 'Pompier', 'superadmin');
INSERT INTO User (nom, prenom, mail, mdp, nom_work, nom_respo) VALUES ('dupont', 'jeanne', 'dupontjeanne@eisti.fr', 'Medecin', 'admin');
