SELECT *
FROM Person p,
( SELECT *
  FROM Medlem
  WHERE aktiv = 1) m
WHERE p.id = m.id;