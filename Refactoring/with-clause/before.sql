SELECT DISTINCT m.navn
FROM Medlem m
  INNER JOIN Ordre o
    ON o.medlemid = m.id
WHERE m.aktiv = 1
      AND 5 <= (SELECT SUM(ol.antall)
                FROM Ordrelinje ol
                WHERE ol.ordreid = o.id);