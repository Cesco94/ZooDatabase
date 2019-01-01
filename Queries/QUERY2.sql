SELECT COUNT(v.CodiceVisita)as Numerovisite,a.CodiceAnimale,c.Specie as Animale from cartella as c, Animale as a, Visita as v WHERE (CURDATE()-v.DataVisita)<365 AND c.CodiceAnimale=a.CodiceAnimale AND a.CodiceAnimale=v.CodiceAnimale GROUP BY a.CodiceAnimale;