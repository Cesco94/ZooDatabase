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
DELIMITER;

