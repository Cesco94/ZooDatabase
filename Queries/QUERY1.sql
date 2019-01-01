SELECT 
    a.CodiceAnimale,
    vi.DataVisita AS Data,
    va.NomeFarmaco,
    va.CodiceFarmaco,
    ve.Nome AS NomeVeterinario,
    ve.Cognome AS CognomeVeterinario
FROM
    ((Visita AS vi
    JOIN Animale AS a ON vi.CodiceAnimale = a.CodiceAnimale)
    JOIN Veterinario AS ve ON vi.CodiceVeterinario = ve.CodiceVeterinario)
        JOIN
    Vaccino AS va ON vi.CodiceVisita = va.CodiceVisita
WHERE
    DATEDIFF(CURDATE(), vi.DataVisita) < 365
ORDER BY a.CodiceAnimale ASC

