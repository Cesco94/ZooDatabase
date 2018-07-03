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

