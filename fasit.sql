-- Oppgave 2 --

SELECT
  m.navn,
  o.id                          AS ordreid,
  ol.id                         AS ordrelinjeid,
  ol.antall                     AS vareantall,
  ol.enhetspris                 AS enhetspris,
  SUM(ol.antall * ol.enhetspris)
  OVER (
    PARTITION BY m.id
    ORDER BY m.id, o.id, ol.id) AS kostnader
FROM medlem m
  INNER JOIN ordre o
    ON m.id = o.medlemid
  INNER JOIN ordrelinje ol
    ON o.id = ol.ordreid;

-- Oppgave 3 --

SELECT
  m.navn,
  string_agg(CAST(o.id AS VARCHAR), ',') AS ordreider
FROM medlem m
  INNER JOIN ordre o
    ON m.id = o.medlemid
GROUP BY m.id;

-- Oppgave 4 --

CREATE EXTENSION tablefunc;

SELECT *
FROM crosstab(
         'select navn as rowid, rownum as category, ordreid as values
          from (SELECT
           m.navn as navn,
           row_number()
           OVER (PARTITION BY m.navn
             ORDER BY o.id) AS rownum,
           o.id as ordreid
         FROM medlem m
           LEFT OUTER JOIN ordre o
             ON m.id = o.medlemid) as t
          where rownum = 1 or rownum = 2 or rownum = 3
          order by rowid, category')
  AS t(navn VARCHAR, ordreId1 INT, ordreId2 INT, ordreId3 INT)
ORDER BY ordreid1, ordreId2, ordreId3 NULLS LAST;