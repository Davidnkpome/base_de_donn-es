-- Création de la base de données CinemaReservation
CREATE DATABASE IF NOT EXISTS CinemaReservation;
USE CinemaReservation;

-- Création de la table Cinema
CREATE TABLE Cinema (
    id_cinema INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL
);

-- Création de la table Film
CREATE TABLE Film (
    id_film INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    duree INT NOT NULL
);

-- Création de la table Utilisateur
CREATE TABLE Utilisateur (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL
);

-- Création de la table Tarif
CREATE TABLE Tarif (
    id_tarif INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    prix DECIMAL(5,2) NOT NULL
);

-- Création de la table Seance
CREATE TABLE Seance (
    id_seance INT AUTO_INCREMENT PRIMARY KEY,
    id_film INT,
    id_cinema INT,
    date_heure DATETIME NOT NULL,
    FOREIGN KEY (id_film) REFERENCES Film(id_film),
    FOREIGN KEY (id_cinema) REFERENCES Cinema(id_cinema)
);

-- Création de la table Ticket
CREATE TABLE Ticket (
    id_ticket INT AUTO_INCREMENT PRIMARY KEY,
    id_seance INT,
    id_tarif INT,
    id_utilisateur INT,
    FOREIGN KEY (id_seance) REFERENCES Seance(id_seance),
    FOREIGN KEY (id_tarif) REFERENCES Tarif(id_tarif),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);

-- Insertion des données dans la table Cinema
INSERT INTO Cinema (nom, adresse) VALUES ('Cinema Paradiso', '123 Rue Imaginaire');

-- Insertion des données dans la table Film
INSERT INTO Film (titre, duree) VALUES ('Le Fabuleux Destin', 120);

-- Insertion des données dans la table Utilisateur
-- Exemple : INSERT INTO Utilisateur (nom, type) VALUES ('Alice Dupont', 'client');

-- Insertion des données dans la table Tarif
INSERT INTO Tarif (description, prix) VALUES 
('Plein tarif', 9.20), 
('Étudiant', 7.60), 
('Moins de 14 ans', 5.90);

-- Insertion des données dans la table Seance
-- Exemple : INSERT INTO Seance (id_film, id_cinema, date_heure) VALUES (1, 1, '2023-01-01 14:00:00');

-- Insertion des données dans la table Ticket
-- Exemple : INSERT INTO Ticket (id_seance, id_tarif, id_utilisateur) VALUES (1, 1, 1);

-- Requêtes pour vérifier les données insérées dans chaque table
SELECT * FROM Cinema;
SELECT * FROM Film;
SELECT * FROM Utilisateur;
SELECT * FROM Tarif;
SELECT * FROM Seance;
SELECT * FROM Ticket;
