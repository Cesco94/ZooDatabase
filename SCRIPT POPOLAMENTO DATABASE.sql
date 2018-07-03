/*TABELLA Gabbia, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Gabbia` 
(
	`CodiceGabbia` int(10) AUTO_INCREMENT NOT NULL,
	`NomeGabbia` varchar(250) NOT NULL, 
	`Habitat` varchar(250) NOT NULL, 
	PRIMARY KEY(`CodiceGabbia`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Gabbia` (`NomeGabbia`, `Habitat`) 
VALUES	('Animali del sottobosco e delle foreste Americane/Europee','Foreste decidue e temperate'), /*1*/
	('Animali dei Circoli Polari','Ghiacciai e rocce'),/*2*/
	('Animali esotici ZONA1','Arido con arbusti'),/*3*/
	('Animeli esotici ZONA2','Giungla'),/*4*/
	('Animali esotici ZONA3','Foresta pluviale/tropicale'), /*5*/
	('Animali dei fiumi/acquitrini', 'Fiume e lago'); /*6*/

/*TABELLA Addetto, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Addetto`
(
	`Matricola` int(10) AUTO_INCREMENT NOT NULL, 
	`Nome` varchar(150) NOT NULL, 
	`Cognome` varchar(150) NOT NULL, 
	`CodiceFiscale` varchar(50) NOT NULL, 
	`Mansione` varchar(250) NOT NULL, 
	`CodiceGabbia` int(10) NOT NULL, 
	PRIMARY KEY (`Matricola`), 
	FOREIGN KEY `Addetto`(`CodiceGabbia`) REFERENCES `Gabbia`(`CodiceGabbia`)
) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Addetto`(`Nome`,`Cognome`,`CodiceFiscale`,`Mansione`,`CodiceGabbia`) 
VALUES	('Francesco','Sacchetto','SCCFNC94T19G224Z','Pulizia e manutenzione. Alimentazione animali.',1),
	('Nicola','Cisternino','CSTNCL95A12I452W','Pulizia e manutenzione. Alimentazione animali.',2),
	('Gianmarco','Pettenuzzo','PTTGMR95M20C743Z','Alimentazione animali.',3),
	('Francesco','Battistella','BTTFNC94R01C743Q','Alimentazione animali.',4),
	('Stefano','Nordio','NRDSFN96L17G693Z','Alimentazione animali.',5),
	('Marco','Masiero','MSRMRC92R06B563K','Pulizia e manutenzione. Alimentazione animali.',6);

/*TABELLA Zoo, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Zoo` 
(
	`CodiceZoo` int(10) AUTO_INCREMENT NOT NULL, 
	`Nome` varchar(150) NOT NULL, 
	`Via` varchar(150) NOT NULL, 
	`NCivico` int(5) NOT NULL, 
	`Città` varchar(150) NOT NULL, 
	`Cap` int(10) NOT NULL, 
	PRIMARY KEY (`CodiceZoo`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Zoo` (`Nome`, `Via`, `NCivico`, `Città`, `Cap`) 
VALUES 	('Parco Fecchetto', 'Via Roma',10, 'Cavarzere', 30014),
	('Jurassic Park','Via Island',1,'CostaRica',10102);

/*TABELLA Animale, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Animale` 
(
	`CodiceAnimale` int(10) AUTO_INCREMENT NOT NULL,
	`CodiceZoo` int(10) NOT NULL,
	`CodiceGabbia` int(10) NOT NULL,
	PRIMARY KEY (`CodiceAnimale`,`CodiceZoo`,`CodiceGabbia`),
	FOREIGN KEY `Animale1`(`CodiceZoo`) REFERENCES `Zoo`(`CodiceZoo`),FOREIGN KEY `Animale2`(`CodiceGabbia`) REFERENCES `Gabbia`(`CodiceGabbia`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Animale` (`CodiceZoo`, `CodiceGabbia`) 
VALUES 	(1,1),(1,1),(1,1),(1,1),(1,1),(1,1),(1,2),(1,2),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,4),(1,4),(1,4),(1,4),(1,5),(1,5),(1,5),(1,5),(1,6),(1,6),(1,6),(2,6);

/*TABELLA Cartella Informativa e Clinica, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Cartella` 
(
	`CodiceAnimale` int(10) NOT NULL,
	`Famiglia` varchar(150) NOT NULL, 
	`Specie` varchar(150) NOT NULL,
	`Nome` varchar(150) NOT NULL, 
	`DataNascita` date NOT NULL, 
	`Sesso` char NOT NULL, 
	`Habitat` varchar(250) NOT NULL,
	`NazioneProvenienza` varchar(150) NOT NULL,
	`Dieta` varchar(150) NOT NULL, 
	`SegniParticolari` varchar(1000) default NULL,
	PRIMARY KEY (`CodiceAnimale`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Cartella` (`CodiceAnimale`,`Famiglia`,`Specie`,`Nome`,`DataNascita`,`Sesso`,`Habitat`,`NazioneProvenienza`,`Dieta`,`SegniParticolari`) 
VALUES	(1,'Procionidi','Procione','Patatino','2010-06-30','M','Foreste decidue e temperate','Ohio','Onnivoro','Sovrappeso.'),
	(2,'Mustelidae','Tasso','Tasso Zero','2012-06-12','M','Foreste decidue e temperate','Germania','Onnivoro','NN.'),
	(3,'Canidae','Volpe','RobinHood','2008-03-21','M','Foreste decidue e temperate','Oregon','Carnivoro','NN.'),
	(4,'Felidae','Lince','Miciona','2010-04-28','F','Foreste decidue e temperate','Norvegia','Carnivoro','NN.'),
	(5,'Felidae','Puma','Nike','2001-12-19','F','Foreste decidue e temperate','Perù','Carnviro','NN.'),
	(6,'Ciconidae','Cicogna','Postino','2012-11-11','M','Foreste decidue e temperate','Venezuela','Onnivoro','Si ruppe ala da pulla.'),
	(7,'Spheniscidae','Pinguino Imperatore','Mussolini','2005-4-25','M','Ghiacciai e rocce','Antartide','Onnivoro','NN.'),
	(8,'Phocidae','Foca mangiagranchi','Larry','2013-05-03','M','Ghiacciai e rocce','Antartide','Carnivoro','Allergia ai granchi rossi: può mangiare solo due tipi di granchi di mare.'),
	(9,'Felidae','Leone','Scar','1998-06-30','M','Arido con arbusti','Zimbabwe','Carnivoro','Cicatrice su un occhio.'),
	(10,'Felidae','Ghepardo','Macchia','2001-12-25','F','Arido con arbusti','Malawi','Carniviro','Molto vivace.'),
	(11,'Giraffidae','Giraffa','Piedino','2002-04-13','M','Arido con arbusti','Sudafrica','Erbivoro','NN.'),
	(12,'Equidae','Zebra','Giovanni','2010-03-20','M','Arido con arbusti','Sudafrica','Erbivoro','NN.'),
	(13,'Canidae','Fennec','Sventola','2011-05-20','F','Arido con arbusti','Egitto','Carnivoro','NN.'),
	(14,'Rhinocerotidae','Rinoceronte','Alfredo','1990-04-30','M','Arido con arbusti','Botswana','Erbivoro','Corno rimosso dai bracconieri.'),
	(15,'Macropodidae','Kangaroo','MikeTyson','2010-07-12','M','Arido con arbusti','Australia','Erbivoro','Molto aggressivo.'),
	(16,'Cercopithecidae','Mandrillo','Nicola','1995-01-12','M','Giungla','Guinea','Onnivoro','Troppo territoriale.'),
	(17,'Hominidae','Gorilla','Marco','1992-06-30','M','Giungla','Nigeria','Onnivoro','Muscolarmente molto sviluppato.'),
	(18,'Elephantidae','Elefante','CocaCola','1981-06-02','F','Giungla','Nigeria','Erbivoro','Zanna SX rimossa dai bracconieri.'),
	(19,'Felidae','Tigre','Ornella','2005-12-11','F','Giungla','Malesia','Carnivoro','Aggressiva.'),
	(20,'Lemuridae','Lemure','Mourice','2014-06-21','M','Foresta pluviale/tropicale','Madagascar','Onnivoro','NN.'),
	(21,'Phascolarctidae','Koala','Vigorosol','2015-05-12','M','Foresta pluviale/tropicale','Adelaide','Erbivoro','NN.'),
	(22,'Ursidae','Panda','Bandita','2000-12-01','F','Foresta pluviale/tropicale','Shanxi','Erbivoro','Sovrappeso.'),
	(23,'Ailuridae','Panda Rosso','Cesco','2004-12-19','M','Foresta pluviale/tropicale','Nepal','Carnivoro','Mangia troppo, va tenuto a dieta.'),
	(24,'Alligatoridae','Alligatore','Isabella','2000-03-21','F','Fiume e lago','SudCarolina','Carnivoro','Senza coda.'),
	(25,'Hippopotamidae','Ippopotamo','Giovanni','1999-12-31','M','Fiume e lago','Sudan','Erbivoro','Metereopatico.'),
	(26,'Phoenicopteridae','Fenicottero rosa','Fenucottera','2005-06-30','F','Fiume e lago','Tanzania','Onnivoro','Non sa volare, causa rottura ali da pullo.'),
	(27,'Mosasauride','Mosasauro','Cioppy','1000-01-01','M','Fiume e lago','Cretaceo','Carnivoro','Assomiglia a un dinosauro.');

/*TABELLA Veterinario, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Veterinario`
(
	`CodiceVeterinario` int(10) AUTO_INCREMENT NOT NULL, 
	`Nome` varchar(150) NOT NULL, 
	`Cognome` varchar(150) NOT NULL, 
	`CodiceFiscale` varchar(50) NOT NULL, 
	`Specializzazione` varchar(150) default NULL,
	PRIMARY KEY (`CodiceVeterinario`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Veterinario`(`Nome`,`Cognome`,`CodiceFiscale`,`Specializzazione`) 
VALUES  ('Beatrice','Poncina','PNCBRC94BOH','Piccoli animali.'),
	('Cristina','Ferrati','FRRMCR54D383C','Grandi animali');

/*TABELLA Visita, CREAZIONE E  POPOLAMENTO*/
CREATE TABLE `Visita` 
(
	`CodiceVisita` int(10) AUTO_INCREMENT NOT NULL, 
	`CodiceVeterinario` int(10) NOT NULL, 
	`CodiceAnimale` int(10) NOT NULL, 
	`DataVisita` date NOT NULL, 
	`Motivazione` varchar(300) NOT NULL, 
	PRIMARY KEY(`CodiceVisita`,`CodiceVeterinario`),
	FOREIGN KEY `Visita1`(`CodiceVeterinario`) REFERENCES `Veterinario`(`CodiceVeterinario`), 
	FOREIGN KEY `Visita2`(`CodiceAnimale`) REFERENCES `Animale`(`CodiceAnimale`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Visita`(`CodiceVeterinario`, `CodiceAnimale`, `DataVisita`, `Motivazione`) 
VALUES	(1,1,'2017-03-25','Vaccino'),
	(2,2,'2015-03-25','Vaccino'),
	(1,3,'2016-03-25','Vaccino'),
	(2,4,'2015-03-25','Vaccino'),
	(1,5,'2015-03-25','Vaccino'),
	(1,6,'2015-03-25','Vaccino'),
	(2,7,'2016-03-25','Vaccino'),
	(1,8,'2015-03-25','Vaccino'),
	(1,9,'2016-03-25','Vaccino'),
	(2,10,'2016-03-25','Vaccino'),
	(2,11,'2016-03-25','Vaccino'),
	(1,12,'2015-03-25','Vaccino'),
	(2,13,'2016-03-25','Vaccino'),
	(1,14,'2015-03-25','Vaccino'),
	(1,15,'2015-03-25','Vaccino'),
	(2,16,'2015-03-25','Vaccino'),
	(1,17,'2016-03-25','Vaccino'),
	(1,18,'2016-03-25','Vaccino'),
	(1,19,'2017-03-25','Vaccino'),
	(2,20,'2016-03-25','Vaccino'),
	(1,21,'2015-03-25','Vaccino'),
	(1,22,'2016-03-25','Vaccino'),
	(1,23,'2017-03-25','Vaccino'),
	(2,24,'2015-03-25','Vaccino'),
	(1,25,'2015-03-25','Vaccino'),
	(2,26,'2016-03-25','Vaccino'),
	(2,27,'2016-03-25','Vaccino'), /*CodiceVisita numero 27 - Vaccino 1 e 2 per tutti*/
	(1,1,'2017-03-26','Vaccino'),
	(1,2,'2015-03-26','Vaccino'),
	(1,3,'2016-03-26','Vaccino'),
	(1,4,'2015-03-26','Vaccino'),
	(1,5,'2016-03-26','Vaccino'),
	(1,13,'2016-03-26','Vaccino'),
	(1,20,'2014-03-26','Vaccino'),
	(1,23,'2017-03-26','Vaccino'), /*CodiceVisita numero 35 - Vaccino 3 per procione, tasso, volpe, lince, puma, fennec, lemure, pandarosso*/
	(1,1,'2017-03-27','Dolori intestinali.'), /*36*/
	(1,5,'2017-03-27','Vomito incoercibile.'),/*37*/
	(1,20,'2017-03-27','Esagitato'),/*38*/
	(2,25,'2017-03-28','Diarrea incoercibile'),/*39*/
	(2,22,'2017-03-28','Rifiuta il cibo'),/*40*/
	(2,18,'2017-03-28','Infezione zampa  posteriore DX'),/*41*/
	(1,3,'2017-03-30','Accusa dolori zampa anteriore SX'),/*42*/
	(1,7,'2017-03-30','Dolori intestinali'),/*43*/
	(1,26,'2017-03-30','Tiene un ala bassa e tesa'),/*44*/
	(2,14,'2017-04-02','Rifiuta il cibo');/*45*/

/*TABELLA Farmaco, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Farmaco` 
(
	`CodiceFarmaco` int(10) AUTO_INCREMENT NOT NULL, 
	`NomeFarmaco` varchar(150) NOT NULL, 
	`PrincipioAttivo` varchar(150) NOT NULL, 
	PRIMARY KEY (`CodiceFarmaco`,`NomeFarmaco`,`PrincipioAttivo`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
INSERT INTO `Farmaco`(`NomeFarmaco`,`PrincipioAttivo`) 
VALUES 	('Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.'),/*1*/
	('Vaccino per Gastroenterite','Rotavirus inattivo'),/*2*/
	('Vaccino AntiRabbico','Rna Virus Rabbia inattivo'),/*3*/
	('Antidiarroico','Loperamide'),/*4*/
	('Antidolorifico semisintetico','Ossimorfone'),/*5*/
	('Antidolorifico generico','Codeina'),/*6*/
	('Antiemetico','Betanecolo'),/*7*/
	('Antiacido stomaco','Ranitidina'),/*8*/
	('Antibiotico per infezioni podali','Sulfamidico'),/*9*/
	('Antibiotico per infezioni generiche','Amoxicillina'),/*10*/
	('Calmante','Benzodiazepina');/*11*/

/*TABELLA Diagnosi, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Diagnosi` 
(
	`CodiceVisita` int(10) NOT NULL, 
	`Sintomi` varchar(500) NOT NULL, 
	`Diagnosi` varchar(500) NOT NULL, 
	`Terapia` varchar(500) NOT NULL, 
	`CodiceFarmaco` int(10) default NULL, 
	PRIMARY KEY (`CodiceVisita`), 
	FOREIGN KEY `Visita`(`CodiceVisita`) REFERENCES `Visita`(`CodiceVisita`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1; 
	
INSERT INTO `Diagnosi` (`CodiceVisita`,`Sintomi`, `Diagnosi`, `Terapia`, `CodiceFarmaco`) 
VALUES 	(36,'Dolori intestinali.','Eccesso di cibo.','Prescrizione farmaco: Antidiarroico.',4),
	(37,'Vomito incoercibile.','Probabilmente ha mangiato una pianta che sporgeva da un altro recinto.','Prescrizione farmaco: Antiemetico.',7),
	(38,'Esagitato.','Eccesso di zuccheri (probabile lancio caramelle nel recinto).','Prescrizione farmaco: Calmante.',11),
	(39,'Diarrea incoercibile.','Influenza intestinale.','Prescrizione farmaco: Antidiarroico.',4),
	(40,'Rifiuta il cibo.','Acidità di stomaco.','Prescrizione farmaco: Antiacido stomaco.',8),
	(41,'Infezione zampa posteriore DX.','Infezione causata da un taglio non curato a dovere.','Prescrizione farmaco: Antibiotico per infezioni podali.',9),
	(42,'Accusa dolori zampa anteriore SX.','Probabile contusione.','Prescrizione farmaco: Antidolorifico generico.',4),
	(43,'Dolori intestinali.','Permanente: Allergia molluschi.','NN',NULL),
	(44,'Tiene un ala bassa e tesa.','Crampo da contusione.','Prescrizione farmaco: Dissenten.',6),
	(45,'Rifiuta il cibo.','Troppo gas nello stomaco. Probabilmente causato da fieno troppo fermentato.','NN',NULL);

/*TABELLA Vaccino, CREAZIONE E POPOLAMENTO*/
CREATE TABLE `Vaccino`
(	
	`CodiceFarmaco` int(10) NOT NULL, 
	`NomeFarmaco` varchar(150) NOT NULL, 
	`PrincipioAttivo` varchar(150) NOT NULL, 
	`CodiceVisita` int(10) NOT NULL REFERENCES `Visita`(`CodiceVisita`), 
	PRIMARY KEY (`CodiceFarmaco`,`NomeFarmaco`, `CodiceVisita`), 
	FOREIGN KEY `Vaccino1`(`CodiceFarmaco`,`NomeFarmaco`,`PrincipioAttivo`) REFERENCES `Farmaco`(`CodiceFarmaco`,`NomeFarmaco`,`PrincipioAttivo`)
)
	ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO `Vaccino` (`CodiceFarmaco`,`NomeFarmaco`,`PrincipioAttivo`,`CodiceVisita`) 
VALUES 	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',1),			/*Vaccini 1 e 2 per tutti*/
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',1),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',2),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',2),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',3),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',3),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',4),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',4),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',5),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',5),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',6),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',6),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',7),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',7),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',8),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',8),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',9),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',9),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',10),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',10),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',11),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',11),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',12),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',12),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',13),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',13),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',14),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',14),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',15),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',15),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',16),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',16),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',17),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',17),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',18),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',18),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',19),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',19),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',20),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',20),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',21),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',21),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',22),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',22),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',23),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',23),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',24),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',24),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',25),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',25),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',26),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',26),
	(1,'Vaccino AntiTetano.','Tossina tetanica inattiva a tossoide.',27),
	(2,'Vaccino per Gastroenterite','Rotavirus inattivo',27), 
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',28),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',29),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',30),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',31),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',32),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',33),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',34),
	(3,'Vaccino AntiRabbico','Rna Virus Rabbia inattivo',35); /*Vaccino 3 solo per procione, tasso, volpe, lince, puma, fennec, lemure, pandarosso*/
	
DELIMITER $$ 
CREATE FUNCTION `Eta`(codAnim INTEGER(10)) 
RETURNS int(11)
BEGIN 
DECLARE nascita DATE;
DECLARE dataCor DATE;
DECLARE anni INTEGER;
DECLARE giorni INTEGER;
SELECT 
    DataNascita
INTO nascita FROM
    Cartella AS c
WHERE
    codAnim = c.CodiceAnimale;
SELECT CURDATE() INTO dataCor;
SELECT DATEDIFF(dataCor, nascita) INTO giorni;
SET anni = giorni/365; 
RETURN anni; 
END$$

DELIMITER $$ 
CREATE FUNCTION `Usi`(codFarm INTEGER(10), codAnim INTEGER(10)) 
RETURNS int(11)
BEGIN 
DECLARE nVac INTEGER;
DECLARE nDia INTEGER;
DECLARE nUsi INTEGER;

SELECT 
    COUNT(*)
INTO nVac FROM
    Visita AS vi,
    Vaccino AS va
WHERE
    codAnim = vi.CodiceAnimale
        AND vi.CodiceVisita = va.CodiceVisita
        AND codFarm = va.CodiceFarmaco
;
SELECT 
    COUNT(*)
INTO nDia FROM
    Visita AS vi,
    Diagnosi AS d
WHERE
    codAnim = vi.CodiceAnimale
        AND vi.CodiceVisita = d.CodiceVisita
        AND codFarm = d.CodiceFarmaco
;
SET nUsi = nVac+nDia;
RETURN nUsi; 
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS UpdatePermanenti; 
DELIMITER $$ 
CREATE TRIGGER UpdatePermanenti AFTER INSERT ON `Diagnosi` FOR EACH ROW
BEGIN
DECLARE dia VARCHAR(250);
DECLARE segn VARCHAR(300);
DECLARE codAn INTEGER;

IF (new.Diagnosi LIKE 'Permanente%')
THEN
SELECT Visita.CodiceAnimale 
INTO codAn FROM 
	Visita 
WHERE 
    new.CodiceVisita = Visita.CodiceVisita;
SELECT 
    Cartella.SegniParticolari
INTO segn FROM
    Cartella
WHERE
    codAn = Cartella.CodiceAnimale;
UPDATE Cartella 
SET 
    SegniParticolari = CONCAT(segn, new.Diagnosi)
WHERE
    Cartella.CodiceAnimale = codAn
;
END IF;
END$$ 
DELIMITER;

DROP TRIGGER IF EXISTS UsiFarmaco; 
DELIMITER $$ 
CREATE TRIGGER UsiFarmaco BEFORE INSERT ON `Diagnosi` FOR EACH ROW
BEGIN
DECLARE codAnim INTEGER;
DECLARE usi INTEGER;
DECLARE testo VARCHAR(150);
SET testo = 'Uso numero: ';
SELECT 
    Cartella.CodiceAnimale
INTO codAnim FROM
    Cartella,
    Visita
WHERE
    Cartella.CodiceAnimale = Visita.CodiceAnimale
        AND Visita.CodiceVisita = new.CodiceVisita;
SET usi = USI(new.CodiceFarmaco,codAnim) +1;
SET new.Terapia = CONCAT(new.Terapia,testo,usi,'.');
END$$ 

