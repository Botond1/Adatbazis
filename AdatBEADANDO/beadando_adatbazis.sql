CREATE TABLE Specializacio (
    id INT PRIMARY KEY,
    megnevezes VARCHAR(100)
);

INSERT INTO Specializacio VALUES
(1, 'Belgyógyászat'),
(2, 'Kardiológia'),
(3, 'Gyermekgyógyászat');

CREATE TABLE Orvos (
    id INT PRIMARY KEY,
    nev VARCHAR(255),
    telefonszam VARCHAR(20),
    spec_id INT,
    FOREIGN KEY (spec_id) REFERENCES Specializacio(id)
);

INSERT INTO Orvos VALUES
(1, 'Dr. Kovács Béla', '06301234567', 1),
(2, 'Dr. Horváth Éva', '06307654321', 2),
(3, 'Dr. Szabó István', '06309876543', 3),
(4, 'Dr. Nagy Csaba', '06304567891', 1),
(5, 'Dr. Tóth Anna', '06305678912', 2),
(6, 'Dr. Varga Péter', '06306789123', 3),
(7, 'Dr. Kiss Gergely', '06307891234', 1),
(8, 'Dr. Farkas Mária', '06308912345', 2),
(9, 'Dr. Balogh Tamás', '06301234568', 3),
(10, 'Dr. Papp László', '06302345679', 1);

CREATE TABLE Gyogyszertipus (
    t_id INT PRIMARY KEY,
    tipus VARCHAR(50)
);

INSERT INTO Gyogyszertipus VALUES
(1, 'Fájdalomcsillapító'),
(2, 'Allergia elleni'),
(3, 'Nyugtató');

CREATE TABLE Gyogyszer (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    ar INT,
    leiras VARCHAR(255),
    t_id INT,
    FOREIGN KEY (t_id) REFERENCES Gyogyszertipus(t_id)
);

INSERT INTO Gyogyszer VALUES
(1, 'Paracetamol', 500, 'Láz- és fájdalomcsillapító', 1),
(2, 'Ibuprofen', 750, 'Gyulladáscsökkentő és fájdalomcsillapító', 1),
(3, 'C vitamin', 300, 'Immunerősítő', 2),
(4, 'Aspirin', 450, 'Véralvadásgátló és fájdalomcsillapító', 1),
(5, 'Zyrtec', 550, 'Allergia elleni gyógyszer', 2),
(6, 'Xanax', 1100, 'Nyugtató', 3),
(7, 'Nexium', 990, 'Gyomorsavcsökkentő', 3),
(8, 'Panadol', 530, 'Fájdalomcsillapító', 1),
(9, 'Advil', 860, 'Fájdalomcsillapító', 1),
(10, 'Benadryl', 600, 'Allergia elleni gyógyszer', 2),
(11, 'Lisinopril', 350, 'Magas vérnyomás kezelése', 1),
(12, 'Metformin', 200, '2-es típusú cukorbetegség kezelése', 2),
(13, 'Atorvastatin', 450, 'Koleszterin-szint csökkentő', 1),
(14, 'Levothyroxine', 175, 'Pajzsmirigy-alulműködés kezelése', 3),
(15, 'Amlodipine', 300, 'Magas vérnyomás és angina kezelése', 1);

CREATE TABLE Betegek (
    id INT PRIMARY KEY,
    nev VARCHAR(255),
    tajszam VARCHAR(9) MASKED WITH (FUNCTION = 'partial(1,"XXXXXX",2)') NULL,
    szuli_datum DATE MASKED WITH (FUNCTION = 'default()'),
    szuli_hely VARCHAR(100),
    lakcim VARCHAR(255) MASKED WITH (FUNCTION = 'default()') NULL
);

INSERT INTO Betegek VALUES
(1, 'Nagy Erzsébet', '123456789', '1980-01-01', 'Budapest', '1111 Budapest, Bajcsy-Zsilinszky út 50.'),
(2, 'Kovács József', '987654321', '1982-02-02', 'Debrecen', '4025 Debrecen, Kossuth utca 10.'),
(3, 'Szabó László', '111222333', '1984-03-03', 'Szeged', '6722 Szeged, Szentháromság utca 8.'),
(4, 'Horváth Péter', '444555666', '1986-04-04', 'Pécs', '7621 Pécs, Majorossy Imre utca 21.'),
(5, 'Tóth Andrea', '777888999', '1988-05-05', 'Győr', '9022 Győr, Árpád út 34.'),
(6, 'Varga Mária', '000111222', '1990-06-06', 'Miskolc', '3525 Miskolc, Hunyadi utca 56.'),
(7, 'Kiss Géza', '333444555', '1992-07-07', 'Eger', '3300 Eger, Dobó István tér 2.'),
(8, 'Farkas Béla', '666777888', '1994-08-08', 'Kecskemét', '6000 Kecskemét, Katona József tér 19.'),
(9, 'Balogh József', '999000111', '1996-09-09', 'Nyíregyháza', '4400 Nyíregyháza, Kossuth Lajos utca 62.'),
(10, 'Papp Krisztina', '222333444', '1998-10-10', 'Veszprém', '8200 Veszprém, Óváros tér 4.'),
(11, 'Fekete Anna', '121314151', '1975-04-23', 'Szolnok', '5000 Szolnok, Kossuth utca 1.'),
(12, 'Kis József', '161718192', '1968-11-15', 'Kecskemét', '6000 Kecskemét, Petőfi tér 2.'),
(13, 'Nagy Ernő', '202122232', '1956-06-30', 'Eger', '3300 Eger, Dobó tér 3.');

CREATE TABLE Vizsgalat (
    id INT PRIMARY KEY,
    o_id INT,
    b_id INT,
    datum DATE,
    gy_id INT,
    FOREIGN KEY (o_id) REFERENCES Orvos(id),
    FOREIGN KEY (b_id) REFERENCES Betegek(id),
    FOREIGN KEY (gy_id) REFERENCES Gyogyszer(id)
);

INSERT INTO Vizsgalat VALUES
(1, 1, 1, '2023-05-01', 1),
(2, 2, 2, '2023-05-02', 2),
(3, 3, 3, '2023-05-03', 3),
(4, 4, 4, '2023-05-04', 4),
(5, 5, 5, '2023-05-05', 5),
(6, 6, 6, '2023-05-06', 6),
(7, 7, 7, '2023-05-07', 7),
(8, 8, 8, '2023-05-08', 8),
(9, 9, 9, '2023-05-09', 9),
(10, 10, 10, '2023-05-10', 10),
(11, 1, 11, '2024-01-05', 11),
(12, 2, 12, '2024-01-06', 12),
(13, 3, 13, '2024-01-07', 13),
(14, 4, 11, '2024-01-08', 14),
(15, 5, 12, '2024-01-09', 15),
(16, 6, 13, '2024-01-10', 11),
(17, 7, 11, '2024-01-11', 12),
(18, 8, 12, '2024-01-12', 13),
(19, 9, 13, '2024-01-13', 14),
(20, 10, 11, '2024-01-14', 15);

CREATE TABLE Gyógyszer_felírás (
    id INT PRIMARY KEY,
    v_id INT,
    gy_id INT,
    FOREIGN KEY (v_id) REFERENCES Vizsgálat(id),
    FOREIGN KEY (gy_id) REFERENCES Gyógyszer(id)
);

INSERT INTO Gyógyszer_felírás (id, v_id, gy_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 5),
(6, 3, 6),
(7, 4, 7),
(8, 4, 8),
(9, 5, 9),
(10, 5, 10),
(11, 6, 11),
(12, 6, 12),
(13, 7, 13),
(14, 7, 14),
(15, 8, 15),
(16, 9, 1),
(17, 9, 2),
(18, 10, 3),
(19, 10, 4),
(20, 11, 5),
(21, 11, 6),
(22, 12, 7),
(23, 12, 8),
(24, 13, 9),
(25, 13, 10),
(26, 14, 11),
(27, 14, 12),
(28, 15, 13),
(29, 15, 14);
--Maszkolás

CREATE USER Masked WITHOUT LOGIN;

GRANT SELECT ON Betegek TO Masked;

EXECUTE AS User= 'Masked';

--1. lekérdezés
SELECT O.nev AS OrvosNeve, COUNT(V.id) AS VizsgalatokSzama, MAX(V.datum) AS LegutobbiVizsgalat
FROM Orvos O
JOIN Vizsgalat V ON O.id = V.o_id
GROUP BY O.nev
ORDER BY VizsgalatokSzama DESC;

--2. lekérdezés
SELECT v.id AS VizsgalatID, o.nev AS OrvosNeve, b.nev AS BetegNeve, v.datum AS VizsgalatDatum
FROM Vizsgalat v
JOIN Orvos o ON v.o_id = o.id
JOIN Betegek b ON v.b_id = b.id
ORDER BY o.nev ASC;

--3. lekérdezés
SELECT O.nev AS OrvosNeve, COUNT(DISTINCT B.id) AS BetegSzam
FROM Orvos O
JOIN Vizsgalat V ON O.id = V.o_id
JOIN Betegek B ON V.b_id = B.id
GROUP BY O.nev
ORDER BY BetegSzam DESC;

--4. lekérdezés
SELECT 
  B.nev AS BetegNeve,
  MIN(V.datum) AS ElsoVizsgalatDatum,
  MAX(V.datum) AS UtolsoVizsgalatDatum,
  SUM(G.ar) AS OsszGyogyszerKoltseg
FROM Betegek B
JOIN Vizsgalat V ON B.id = V.b_id
JOIN Gyogyszer_feliras GF ON V.id = GF.v_id
JOIN Gyogyszer G ON GF.gy_id = G.id
GROUP BY B.id, B.nev
ORDER BY B.nev;

--5. lekérdezés
SELECT 
    CASE 
        WHEN GROUPING(gt.tipus) = 1 THEN 'Összesítve'
        ELSE gt.tipus 
    END AS GyogyszerTipus,
    CASE 
        WHEN GROUPING(g.nev) = 1 THEN 'Összesítve'
        ELSE g.nev 
    END AS GyogyszerNeve,
    COUNT(gf.gy_id) AS FelirtGyogyszerekSzama,
    SUM(g.ar) AS OsszesKoltseg
FROM 
    Gyogyszer_feliras gf
JOIN 
    Gyogyszer g ON gf.gy_id = g.id
JOIN 
    Gyogyszertipus gt ON g.t_id = gt.t_id
GROUP BY 
    ROLLUP(gt.tipus, g.nev);

--6. lekérdezés
WITH RankedData AS (
    SELECT b.nev AS BetegNeve, 
           g.nev AS GyogyszerNeve, 
           g.ar AS Ar,
           ROW_NUMBER() OVER (PARTITION BY b.nev ORDER BY g.nev) AS RowNum
    FROM Gyogyszer_feliras gf
    JOIN Vizsgalat v ON gf.v_id = v.id
    JOIN Betegek b ON v.b_id = b.id
    JOIN Gyogyszer g ON gf.gy_id = g.id
    WHERE b.nev LIKE '%Nagy Erzsébet%' -- keresett beteg neve
)
SELECT CASE WHEN RowNum = 1 THEN BetegNeve ELSE '' END AS BetegNeve,
       GyogyszerNeve,
       Ar
FROM RankedData;
