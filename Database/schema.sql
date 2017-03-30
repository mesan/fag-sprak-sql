DROP TABLE IF EXISTS OrdreLinje;
DROP TABLE IF EXISTS Ordre;
DROP TABLE IF EXISTS Medlem;

CREATE TABLE Medlem (
  id    INTEGER PRIMARY KEY,
  navn  VARCHAR,
  aktiv INTEGER DEFAULT 1
);

CREATE TABLE Ordre (
  id        INTEGER PRIMARY KEY,
  medlemId  INTEGER REFERENCES Medlem (id) ON DELETE CASCADE,
  ordreDato TIMESTAMP NOT NULL
);

CREATE TABLE Vare (
  varenummer INTEGER,
  versjon    INTEGER,
  varenavn   VARCHAR NOT NULL,
  pris       INTEGER NOT NULL,
  PRIMARY KEY (varenummer, versjon)
);

CREATE TABLE OrdreLinje (
  id          INTEGER PRIMARY KEY,
  ordreId     INTEGER REFERENCES Ordre (id) ON DELETE CASCADE,
  varenummer  INTEGER,
  vareversjon INTEGER,
  antall      INTEGER DEFAULT 1,
  FOREIGN KEY (varenummer, vareversjon) REFERENCES Vare (varenummer, versjon)
);

INSERT INTO Medlem (id, navn, aktiv) VALUES
  (1, 'Martin', 0),
  (2, 'Nanna', 1),
  (3, 'Marius', 1);

INSERT INTO Ordre (id, medlemId, ordreDato) VALUES
  (1, 1, TIMESTAMP '25-03-2017 17:00:00'),
  (2, 1, TIMESTAMP '25-03-2017 18:00:00'),
  (3, 2, TIMESTAMP '25-03-2017 19:00:00'),
  (4, 3, TIMESTAMP '25-03-2017 17:30:00');

INSERT INTO Vare (varenummer, versjon, varenavn, pris) VALUES
  (1, 1, 'Genser', 299),
  (1, 2, 'Genser', 249),
  (2, 1, 'Bukse', 699),
  (3, 1, 'Sokker', 49),
  (3, 2, 'Sokker', 69),
  (3, 3, 'Sokker', 39),
  (4, 1, 'Lue', 39);

INSERT INTO OrdreLinje (id, ordreId, varenummer, vareversjon, antall) VALUES
  (1, 1, 3, 1, 2),
  (2, 2, 3, 3, 1),
  (3, 2, 1, 2, 1),
  (4, 3, 2, 1, 5),
  (5, 3, 3, 2, 6),
  (6, 3, 4, 1, 1),
  (7, 4, 1, 1, 5),
  (8, 4, 3, 1, 2);
