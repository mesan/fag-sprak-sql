DROP TABLE Person;
DROP TABLE Medlem;

CREATE TABLE Person (
  id INTEGER PRIMARY KEY,
  navn VARCHAR
);

CREATE TABLE Medlem (
  id INTEGER REFERENCES Person(ID) ON DELETE CASCADE,
  aktiv INTEGER DEFAULT 1
);

INSERT INTO Person(id, navn) VALUES (1, 'Martin'), (2, 'Nanna'), (3, 'Marius');
INSERT INTO MEDLEM(id, aktiv) VALUES (1, 0), (2, 1);