CREATE DATABASE PROGETTO;

USE PROGETTO;

/*TABELLA Gabbia, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Gabbia;
CREATE TABLE Gabbia (CodiceGabbia int(10) AUTO_INCREMENT, NomeGabbia varchar(50), Habitat varchar(50), PRIMARY KEY(CodiceGabbia));
INSERT INTO Gabbia (NomeGabbia, Habitat) VALUES ('Procioni','Bosco');

/*TABELLA Addetto, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Addetto;
CREATE TABLE Addetto(Matricola int(10) AUTO_INCREMENT, Nome varchar(50), Cognome varchar(50), CodiceFiscale varchar(50), Mansione varchar(50), CodiceGabbia int(10), 
					 PRIMARY KEY (Matricola), FOREIGN KEY Addetto(CodiceGabbia) REFERENCES Gabbia(CodiceGabbia));
INSERT INTO Addetto(Nome,Cognome,CodiceFiscale,Mansione,CodiceGabbia) VALUES ('Francesco','Sacchetto','SCCFNC94T19G224Z','Pulizia',1);

/*TABELLA Zoo, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Zoo;
CREATE TABLE Zoo (CodiceZoo int(10) AUTO_INCREMENT, Nome varchar(50), Via varchar(50), NCivico int(5), Città varchar(50), Cap int(10), PRIMARY KEY (CodiceZoo));
INSERT INTO Zoo (Nome, Via, NCivico, Città, Cap) VALUES ('Fecchetto', 'Via Le Man Dal Cul',69, 'MilANO', 42100);

/*TABELLA Animale, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Animale;
CREATE TABLE Animale (CodiceAnimale int(10) AUTO_INCREMENT,CodiceZoo int(10),CodiceGabbia int(10),PRIMARY KEY (CodiceAnimale,CodiceZoo,CodiceGabbia),
					  FOREIGN KEY Animale1(CodiceZoo) REFERENCES Zoo(CodiceZoo),FOREIGN KEY Animale2(CodiceGabbia) REFERENCES Gabbia(CodiceGabbia));
INSERT INTO Animale (CodiceZoo, CodiceGabbia) VALUES (1,1);

/*TABELLA Cartella Informativa e Clinica, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Cartella ;
CREATE TABLE Cartella (CodiceAnimale int(10),Dieta varchar(100), SegniParticolari varchar(1000), Nome varchar(50), 
											 DataNascita date, Sesso char, Habitat varchar(50), NazioneProvenienza varchar(50), Famiglia varchar(50), 
											 Specie varchar(50), PRIMARY KEY (CodiceAnimale));
INSERT INTO Cartella (CodiceAnimale,Dieta,SegniParticolari,Nome,DataNascita,Sesso,Habitat,NazioneProvenienza,Famiglia,Specie) 
											VALUES (1,'Onnivoro','Carino e coccoloso.','Patatino','2010-06-30','M','Bosco','Ohio','Procionidi','Procione');

/*TABELLA Veterinario, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Veterinario;
CREATE TABLE Veterinario(CodiceVeterinario int(10) AUTO_INCREMENT, Nome varchar(50), Cognome varchar(50), CodiceFiscale varchar(50), Specializzazione varchar(50), PRIMARY KEY (CodiceVeterinario));
INSERT INTO Veterinario(Nome, Cognome,CodiceFiscale,Specializzazione) VALUES ('Beatrice','Poncina','PNCBRC94BOH','Piccoli animali.');

/*TABELLA Visita, CREAZIONE E  POPOLAMENTO*/
DROP TABLE IF EXISTS Visita;
CREATE TABLE Visita (CodiceVisita int(10) AUTO_INCREMENT, CodiceVeterinario int(10), CodiceAnimale int(10), DataVisita date, Motivazione varchar(100), PRIMARY KEY(CodiceVisita,CodiceVeterinario), 
					 FOREIGN KEY Visita1(CodiceVeterinario) REFERENCES Veterinario(CodiceVeterinario), FOREIGN KEY Visita2(CodiceAnimale) REFERENCES Animale(CodiceAnimale));
INSERT INTO Visita (CodiceVeterinario, CodiceAnimale, DataVisita, Motivazione) VALUES (1,1,'2017-03-27','Ha mangiato troppo'),
																					  (1,1,'2017-03-25','Vaccino');
																								   

/*TABELLA Farmaco, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Farmaco;
CREATE TABLE Farmaco (CodiceFarmaco int(10) AUTO_INCREMENT, NomeFarmaco varchar(50), PrincipioAttivo varchar(50), PRIMARY KEY (CodiceFarmaco,NomeFarmaco,PrincipioAttivo));
INSERT INTO Farmaco(NomeFarmaco,PrincipioAttivo) VALUES ('Dissenten','Loperamide'),('AntiTetanica','TetanoBOH');

/*TABELLA Diagnosi, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Diagnosi;
CREATE TABLE Diagnosi (CodiceVisita int(10) AUTO_INCREMENT, Sintomi varchar(500), Diagnosi varchar(500), Terapia varchar(500), CodiceFarmaco int(10), PRIMARY KEY (CodiceVisita), 
					   FOREIGN KEY Visita(CodiceVisita) REFERENCES Visita(CodiceVisita)); 
INSERT INTO Diagnosi (Sintomi, Diagnosi, Terapia, CodiceFarmaco) VALUES ('Gonfiore dell addome','Eccesso di cibo.','Prescrizione farmaco: Dissenten.',1);

/*TABELLA Vaccino, CREAZIONE E POPOLAMENTO*/
DROP TABLE IF EXISTS Vaccino;
CREATE TABLE Vaccino (CodiceFarmaco int(10), NomeFarmaco varchar(50), PrincipioAttivo varchar(50), CodiceVisita int(10) REFERENCES Visita(CodiceVisita), PRIMARY KEY (CodiceFarmaco,NomeFarmaco, CodiceVisita), 
					  FOREIGN KEY Vaccino1(CodiceFarmaco,NomeFarmaco,PrincipioAttivo) REFERENCES Farmaco(CodiceFarmaco,NomeFarmaco,PrincipioAttivo));
/*
ALTER TABLE Vaccino ADD FOREIGN KEY Vaccino2(PrincipioAttivo) REFERENCES Farmaco(PrincipioAttivo);
*/

INSERT INTO Vaccino (CodiceFarmaco,NomeFarmaco,PrincipioAttivo,CodiceVisita) VALUES (2,'AntiTetanica','TetanoBOH',2);

















					
						