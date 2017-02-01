WITH AntallOrdrePerMedlem AS (
  SELECT o.medlemid, SUM(ol.antall) AS antall
  FROM Ordrelinje ol
  INNER JOIN Ordre o
    ON o.id = ol.ordreid
  GROUP BY o.medlemid
)

SELECT m.navn
FROM Medlem m
INNER JOIN AntallOrdrePerMedlem ant
ON m.id = ant.medlemid
WHERE m.aktiv = 1
AND ant.antall >= 5;
