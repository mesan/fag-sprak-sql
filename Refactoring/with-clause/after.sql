SELECT *
FROM Person p,
INNER JOIN Medlem m
ON p.id = m.id
WHERE aktiv = 1;


-- Også mulig ved mer avanserte sub-queries:

WITH Medlemmer AS (
  SELECT *
  FROM Medlem
  WHERE aktiv = 1
)

SELECT *
FROM Person p,
INNER JOIN Medlemmer m
ON p.id = m.id;
