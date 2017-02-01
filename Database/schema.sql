DROP TABLE IF EXISTS OrdreLinje;
DROP TABLE IF EXISTS Ordre;
DROP TABLE IF EXISTS Medlem;

CREATE TABLE Medlem (
  id INTEGER PRIMARY KEY,
  navn VARCHAR,
  aktiv INTEGER DEFAULT 1
);

CREATE TABLE Ordre (
  id INTEGER PRIMARY KEY,
  medlemId INTEGER REFERENCES Medlem(id) ON DELETE CASCADE
);

CREATE TABLE OrdreLinje (
  id INTEGER PRIMARY KEY,
  ordreId INTEGER REFERENCES Ordre(id) ON DELETE CASCADE,
  antall INTEGER DEFAULT 1,
  enhetsPris INTEGER
);

INSERT INTO Medlem(id, navn, aktiv) VALUES (1, 'Martin', 0), (2, 'Nanna', 1), (3, 'Marius', 1);

INSERT INTO Ordre(id, medlemId) VALUES (1, 1), (2, 1), (3, 2);

INSERT INTO OrdreLinje(id, ordreId, antall, enhetsPris) VALUES
  (1, 1, 2, 50), (2, 1, 3, 20), (3, 2, 1, 1000), (4, 3, 5, 150), (5, 3, 6, 200), (6, 3, 1, 500);