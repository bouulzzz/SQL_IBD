CREATE DATABASE PALEONTOLOGIA;
USE PALEONTOLOGIA;

CREATE TABLE DINOSSAURO (
    Nome VARCHAR(50) UNIQUE,
    Toneladas INT,
    id INT PRIMARY KEY auto_increment,
    FK_ERA_id INT,
    FK_PAIS_id INT,
    FK_GRUPO_id INT
);

CREATE TABLE ERA (
    Nome VARCHAR(50) UNIQUE,
    AnoFim INT,
    AnoInicio INT,
    id INT PRIMARY KEY auto_increment
);

UPDATE ERA
SET AnoInicio = 145, AnoFim = 66
WHERE Nome = 'Cretáceo';

UPDATE ERA
SET AnoInicio = 201, AnoFim = 145
WHERE Nome = 'Jurássico';

INSERT INTO ERA (Nome, AnoFim, AnoInicio)
VALUES ('Cretáceo', 145, 66),
	   ('Jurássico', 201, 145);

CREATE TABLE DESCOBRIDOR (
    Nome VARCHAR(100),
    id INT PRIMARY KEY auto_increment
);

INSERT INTO DESCOBRIDOR (Nome)
VALUES ('Maryanska'),
	   ('John Bell Hatcher'),
       ('Cientistas Alemães'),
       ('Museu Americano de História Natural'),
       ('Othniel Charles Marsh'),
       ('Barnum Brown');

CREATE TABLE GRUPO (
    Nome VARCHAR(50) UNIQUE,
    id INT PRIMARY KEY auto_increment
);

INSERT INTO GRUPO (Nome)
VALUES ('Anquilossauro'),
	   ('Ceratópsideos'),
       ('Estegossauros'),
       ('Terápodes');

CREATE TABLE PAIS (
    Nome VARCHAR(50) UNIQUE,
    id INT PRIMARY KEY auto_increment
);

INSERT INTO PAIS (Nome)
VALUES ('Mongólia'),
	   ('Canadá'),
       ('Tanzânia'),
       ('China'),
       ('América do Norte'),
       ('USA');

CREATE TABLE DINO_DESC (
    AnoDesc YEAR,
    fk_DINOSSAURO_id INT,
    fk_DESCOBRIDOR_id INT,
    PRIMARY KEY (fk_DINOSSAURO_id, fk_DESCOBRIDOR_id)
);
 
ALTER TABLE DINOSSAURO ADD CONSTRAINT FK_DINOSSAURO_2
    FOREIGN KEY (FK_ERA_id)
    REFERENCES ERA (id)
    ON DELETE CASCADE;
 
ALTER TABLE DINOSSAURO ADD CONSTRAINT FK_DINOSSAURO_3
    FOREIGN KEY (FK_PAIS_id)
    REFERENCES PAIS (id)
    ON DELETE CASCADE;
 
ALTER TABLE DINOSSAURO ADD CONSTRAINT FK_DINOSSAURO_4
    FOREIGN KEY (FK_GRUPO_id)
    REFERENCES GRUPO (id)
    ON DELETE RESTRICT;
 
ALTER TABLE DINO_DESC ADD CONSTRAINT FK_DINO_DESC_1
    FOREIGN KEY (fk_DINOSSAURO_id)
    REFERENCES DINOSSAURO (id);
 
ALTER TABLE DINO_DESC ADD CONSTRAINT FK_DINO_DESC_2
    FOREIGN KEY (fk_DESCOBRIDOR_id)
    REFERENCES DESCOBRIDOR (id);
