-- Création de la base de données
CREATE DATABASE onlinehospital;
USE onlinehospital;

-- Table des spécialistes
CREATE TABLE specialist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    spec_name VARCHAR(100) UNIQUE NOT NULL
);

-- Table des médecins
CREATE TABLE doctor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    qualification VARCHAR(255) NOT NULL,
    specialist VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    mobno VARCHAR(20) UNIQUE NOT NULL
);

-- Table des rendez-vous
CREATE TABLE appointment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL,
    appointment_date DATE NOT NULL,
    email VARCHAR(255) NOT NULL,
    phno VARCHAR(20) NOT NULL,
    diseases TEXT NOT NULL,
    specialist VARCHAR(255) NOT NULL,
    address TEXT NOT NULL
);

-- Table des rôles
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Table des utilisateurs avec rôle
CREATE TABLE user_dtls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE
);

-- Table des sessions utilisateur
CREATE TABLE session (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    session_token VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user_dtls(id) ON DELETE CASCADE
);

-- Insérer les rôles (Patient, Médecin, Administrateur)
INSERT INTO role (role_name) VALUES 
('Patient'),
('Médecin'),
('Administrateur');

-- Insérer les spécialités médicales
INSERT INTO specialist (spec_name) VALUES
('Cardiologie'),
('Dermatologie'),
('Neurologie'),
('Pédiatrie'),
('Orthopédie'),
('Ophtalmologie'),
('Gynécologie'),
('Radiologie'),
('Psychiatrie'),
('Médecine générale');
