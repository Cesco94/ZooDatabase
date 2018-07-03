DROP VIEW IF EXISTS ETACarnivori;
CREATE VIEW ETACarnivori
AS
SELECT ETA(a.CodiceAnimale) as Eta, a.CodiceAnimale, c.Specie, c.Sesso, c.Dieta, a.CodiceGabbia
FROM Animale as a JOIN Cartella as c
ON a.CodiceAnimale=c.CodiceAnimale
WHERE c.Dieta='Carnivoro' AND a.CodiceAnimale<>27
ORDER BY Eta asc;
DROP VIEW IF EXISTS ETAErbivori;
CREATE VIEW ETAErbivori
AS
SELECT ETA(a.CodiceAnimale) as Eta, a.CodiceAnimale, c.Specie, c.Sesso, c.Dieta, a.CodiceGabbia
FROM Animale as a JOIN Cartella as c
ON a.CodiceAnimale=c.CodiceAnimale
WHERE c.Dieta='Erbivoro'
ORDER BY Eta asc;
Select CAST(AVG(EtaCarnivori.ETA) AS UNSIGNED) as EtaMediaCarnivori, CAST(AVG(EtaErbivori.ETA) AS UNSIGNED) as EtaMediaErbivori from EtaCarnivori JOIN EtaErbivori; 

/*SELECT CAST(AVG(ETA.ETA) AS unsigned) as EtaMediaCarnivori FROM ETA WHERE ETA.Dieta='Carnivoro' AND ETA.CodiceAnimale<>27;
