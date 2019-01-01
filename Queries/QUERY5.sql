SELECT  f.CodiceFarmaco, f.NomeFarmaco, COUNT(f.CodiceFarmaco) as nUSI
FROM Farmaco as f JOIN Diagnosi as d ON (f.CodiceFarmaco=d.CodiceFarmaco)
GROUP BY f.CodiceFarmaco

UNION
SELECT  f.CodiceFarmaco, f.NomeFarmaco, COUNT(f.CodiceFarmaco) as nUSI
FROM Farmaco as f JOIN Vaccino as v ON (f.CodiceFarmaco=v.CodiceFarmaco)
GROUP BY f.CodiceFarmaco
ORDER BY CodiceFarmaco;