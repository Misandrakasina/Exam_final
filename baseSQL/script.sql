CREATE DATABASE IF NOT EXISTS `BNGRC`;
USE `BNGRC`;

CREATE TABLE IF NOT EXISTS `BNGRC_ville` (
    `id_ville` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    'id_sinistre' INT NOT NULL,
    FOREIGN KEY (`id_sinistre`) REFERENCES `BNGRC_sinistre`(`id_sinistre`),
    PRIMARY KEY (`id_ville`)
    );

CREATE TABLE IF NOT EXISTS `BNGRC_region` (
    `id_region` INT NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id_region`),
    `id_ville` INT NOT NULL,
    FOREIGN KEY (`id_ville`) REFERENCES `BNGRC_ville`(`id_ville`)
    );

CREATE TABLE IF NOT EXISTS `BNGRC_sinistre` (
    'id_sinistre' INT NOT NULL AUTO_INCREMENT,
    'nom' VARCHAR (50) NOT NULL,
    'description' TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS `BNGRC_besoin` (
    'id_besoin' INT NOT NULL AUTO_INCREMENT,
    'id_ville' INT NOT NULL,
    FOREIGN KEY ('id_ville') REFERENCES `BNGRC_ville`('id_ville'),
    'id_type_besoin' INT NOT NULL,
    FOREIGN KEY ('id_type_besoin') REFERENCES `BNGRC_type_besoin`('id_type_besoin'),
    PRIMARY KEY ('id_besoin')
);

CREATE TABLE IF NOT EXISTS `BNGRC_dons` (
    'id_dons' INT NOT NULL AUTO_INCREMENT,  
    'date_dons' DATE NOT NULL DEFAULT (CURRENT_DATE),
    'id_type_besoin' INT NOT NULL,
    FOREIGN KEY ('id_type_besoin') REFERENCES `BNGRC_type_besoin`('id_type_besoin'),
    PRIMARY KEY ('id_dons')
);

CREATE TABLE IF NOT EXISTS `BNGRC_categorie` (
    `id_categorie` INT NOT NULL AUTO_INCREMENT,
    `nom_categorie` VARCHAR (50),
    PRIMARY KEY (`id_categorie`)
);

CREATE TABLE IF NOT EXISTS `BNGRC_type_besoin` (
    `id_type_besoin` INT NOT NULL AUTO_INCREMENT,
    `libelle` VARCHAR(100),
    `id_categorie` INT NOT NULL,
    FOREIGN KEY (`id_categorie`) REFERENCES `BNGRC_categorie`(`id_categorie`),
    PRIMARY KEY (`id_type_besoin`)
);

CREATE TABLE IF NOT EXISTS `BNGRC_attribution` (
    `id_attribution` INT NOT NULL AUTO_INCREMENT,
    `id_besoin` INT NOT NULL,
    FOREIGN KEY (`id_besoin`) REFERENCES `BNGRC_besoin`(`id_besoin`),
    `id_dons` INT NOT NULL,
    FOREIGN KEY (`id_dons`) REFERENCES `BNGRC_dons`(`id_dons`),
    PRIMARY KEY (`id_attribution`)
);