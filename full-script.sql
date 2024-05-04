-- Creating tablespaces
connect system/psw;
CREATE TABLESPACE SQL3_TBS DATAFILE 'SQL3_TBS.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M;
CREATE TEMPORARY TABLESPACE SQL3_TempTBS TEMPFILE 'SQL3_TempTBS.dbf' SIZE 50M AUTOEXTEND ON NEXT 5M;

-- Creating user and assigning tablespaces
CREATE USER SQL3 IDENTIFIED BY psw
--  DEFAULT TABLESPACE SQL3_TBS
--  TEMPORARY TABLESPACE SQL3_TempTBS
;

-- Granting privileges
GRANT CONNECT, RESOURCE, DBA TO SQL3;
--

connect SQL3/psw;
-- second script
-- Define Object Types
-- Define Object Types with Constructor Methods
CREATE OR REPLACE TYPE TClient AS OBJECT (
    NumClient INTEGER,
    Civ VARCHAR2(10),
    PrenomClient VARCHAR2(100),
    NomClient VARCHAR2(100),
    DateNaissance DATE,
    Adresse VARCHAR2(255),
    TelProf VARCHAR2(20),
    TelPriv VARCHAR2(20),
    Fax VARCHAR2(20),
    CONSTRUCTOR FUNCTION TClient RETURN SELF AS RESULT,
    MEMBER FUNCTION CheckCiv RETURN BOOLEAN,
    MEMBER FUNCTION GetVehicules RETURN VARCHAR2
);
/


CREATE OR REPLACE TYPE TEmploye AS OBJECT (
    NumEmploye INTEGER,
    NomEmp VARCHAR2(100),
    PrenomEmp VARCHAR2(100),
    Categorie VARCHAR2(20),
    Salaire REAL,
    CONSTRUCTOR FUNCTION TEmploye RETURN SELF AS RESULT,
    MEMBER FUNCTION CheckCategorie RETURN BOOLEAN,
    MEMBER FUNCTION GetNombreInterventions RETURN INTEGER
);
/


CREATE OR REPLACE TYPE TMarque AS OBJECT (
    NumMarque INTEGER,
    Marque VARCHAR2(100),
    Pays VARCHAR2(100),
    MEMBER FUNCTION GetNombreModeles RETURN INTEGER,
    MEMBER FUNCTION GetChiffreAffaire RETURN REAL
);
/
CREATE OR REPLACE TYPE TModele AS OBJECT (
    NumModele INTEGER,
    NumMarque INTEGER,
    Modele VARCHAR2(100),
    MEMBER FUNCTION GetNombreVehicules RETURN INTEGER
);
/
CREATE OR REPLACE TYPE TVehicule AS OBJECT (
    NumVehicule INTEGER,
    NumClient INTEGER,
    NumModele INTEGER,
    NumImmat VARCHAR2(20),
    Annee INTEGER
);
/
CREATE OR REPLACE TYPE TInterventions AS OBJECT (
    NumIntervention INTEGER,
    NumVehicule INTEGER,
    TypeIntervention VARCHAR2(100),
    DateDebInterv DATE,
    DateFinInterv DATE,
    CoutInterv REAL
);
/
CREATE OR REPLACE TYPE TIntervenants AS OBJECT (
    NumIntervention INTEGER,
    NumEmploye INTEGER,
    DateDebut DATE,
    DateFin DATE
);
/
-- Define Object Type Bodies

CREATE OR REPLACE TYPE BODY TClient AS
    CONSTRUCTOR FUNCTION TClient RETURN SELF AS RESULT IS
    BEGIN
        IF NOT CheckCiv() THEN
            RAISE_APPLICATION_ERROR(-20001, 'Invalid Civ value');
        END IF;
        RETURN;
    END;
    
    MEMBER FUNCTION CheckCiv RETURN BOOLEAN IS
    BEGIN
        RETURN Civ IN ('M', 'Mle', 'Mme');
    END;
        MEMBER FUNCTION GetVehicules RETURN VARCHAR2 IS
        vehicules VARCHAR2(4000);
    BEGIN
        SELECT LISTAGG(NumVehicule, ', ') WITHIN GROUP (ORDER BY NumVehicule)
        INTO vehicules
        FROM Vehicule
        WHERE NumClient = self.NumClient;
        RETURN vehicules;
    END;
END;
/
CREATE OR REPLACE TYPE BODY TEmploye AS
    CONSTRUCTOR FUNCTION TEmploye RETURN SELF AS RESULT IS
    BEGIN
        IF NOT CheckCategorie() THEN
            RAISE_APPLICATION_ERROR(-20002, 'Invalid Categorie value');
        END IF;
        RETURN;
    END;
    
    MEMBER FUNCTION CheckCategorie RETURN BOOLEAN IS
    BEGIN
        RETURN Categorie IN ('Mécanicien', 'Assistant');
    END;
        MEMBER FUNCTION GetNombreInterventions RETURN INTEGER IS
        total_interventions INTEGER := 0;
    BEGIN
        SELECT COUNT(*)
        INTO total_interventions
        FROM Intervenants
        WHERE NumEmploye = self.NumEmploye;
        RETURN total_interventions;
    END;
END;
/

CREATE OR REPLACE TYPE BODY TMarque AS
    MEMBER FUNCTION GetNombreModeles RETURN INTEGER IS
        total_modeles INTEGER := 0;
    BEGIN
        SELECT COUNT(*)
        INTO total_modeles
        FROM Modele
        WHERE NumMarque = self.NumMarque;
        RETURN total_modeles;
    END;

    MEMBER FUNCTION GetChiffreAffaire RETURN REAL IS
        chiffre_affaire REAL := 0;
    BEGIN
        SELECT SUM(CoutInterv)
        INTO chiffre_affaire
        FROM Interventions i
        JOIN Vehicule v ON i.NumVehicule = v.NumVehicule
        JOIN Modele m ON v.NumModele = m.NumModele
        JOIN Marque ma ON m.NumMarque = ma.NumMarque
        WHERE ma.NumMarque = self.NumMarque;
        RETURN chiffre_affaire;
    END;
END;
/

CREATE OR REPLACE TYPE BODY TModele AS
    MEMBER FUNCTION GetNombreVehicules RETURN INTEGER IS
        total_vehicules INTEGER := 0;
    BEGIN
        SELECT COUNT(*)
        INTO total_vehicules
        FROM Vehicule
        WHERE NumModele = self.NumModele;
        RETURN total_vehicules;
    END;
END;
/
-- Define Tables
CREATE TABLE Client OF TClient (PRIMARY KEY (NumClient));
CREATE TABLE Employe OF TEmploye (PRIMARY KEY (NumEmploye));
CREATE TABLE Marque OF TMarque (PRIMARY KEY (NumMarque));
CREATE TABLE Modele OF TModele (PRIMARY KEY (NumModele), FOREIGN KEY (NumMarque) REFERENCES Marque(NumMarque));
CREATE TABLE Vehicule OF TVehicule (PRIMARY KEY (NumVehicule), FOREIGN KEY (NumClient) REFERENCES Client(NumClient), FOREIGN KEY (NumModele) REFERENCES Modele(NumModele));
CREATE TABLE Interventions OF TInterventions (PRIMARY KEY (NumIntervention), FOREIGN KEY (NumVehicule) REFERENCES Vehicule(NumVehicule));
CREATE TABLE Intervenants OF TIntervenants (PRIMARY KEY (NumIntervention, NumEmploye), FOREIGN KEY (NumIntervention) REFERENCES Interventions(NumIntervention), FOREIGN KEY (NumEmploye) REFERENCES Employe(NumEmploye));
-- helper function to drop all tables in the db
DROP TABLE Intervenants;
DROP TABLE Interventions;
DROP TABLE Vehicule;
DROP TABLE Employe;
DROP TABLE Client;
DROP TABLE Modele;
DROP TABLE Marque;
-- third script\
---client
INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (1, 'Mme', 'Cherifa', 'MAHBOUBA', TO_DATE('08/08/1957', 'DD/MM/YYYY'), 'CITE 1013 LOGTS BT 61 Alger', '0561381813', '0562458714', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (2, 'Mme', 'Lamia', 'TAHMI', TO_DATE('31/12/1955', 'DD/MM/YYYY'), 'CITE BACHEDJARAH BATIMENT 38 -Bach Djerrah-Alger', '0562467849', '0561392487', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (3, 'Mle', 'Ghania', 'DIAF AMROUNI', TO_DATE('31/12/1955', 'DD/MM/YYYY'), '43, RUE ABDERRAHMANE SBAA BELLE VUE-EL HARRACH-ALGER', '0523894562', '0619430945', '0562784254');

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (4, 'Mle', 'Chahinaz', 'MELEK', TO_DATE('27/06/1955', 'DD/MM/YYYY'), 'HLM AISSAT IDIR CAGE 9 3EME ETAGE-EL HARRACH ALGER', '0634613493', '0562529463', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (5, 'Mme', 'Noura', 'TECHTACHE', TO_DATE('22/03/1949', 'DD/MM/YYYY'), '16, ROUTE EL DJAMILA-AIN BENIAN-ALGER', '0562757834', '0562757843', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (6, 'Mme', 'Widad', 'TOUATI', TO_DATE('14/08/1965', 'DD/MM/YYYY'), '14 RUE DES FRERES AOUDIA-EL MOURADIA-ALGER', '0561243967', '0561401836', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (7, 'Mle', 'Faiza', 'ABLOUL', TO_DATE('28/10/1967', 'DD/MM/YYYY'), 'CITE DIPLOMATIQUE BT BLEU 14B N 3 DERGANA-ALGER', '0562935427', '0561486203', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (8, 'Mme', 'Assia', 'HORRA', TO_DATE('08/12/1963', 'DD/MM/YYYY'), '32 RUE AHMED OUAKED-DELY BRAHIM-ALGER', '0561038500', '0562466733', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (9, 'Mle', 'Souad', 'MESBAH', TO_DATE('30/08/1972', 'DD/MM/YYYY'), 'RESIDENCE CHABANI-HYDRA-ALGER', '0561024358', NULL, NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (10, 'Mme', 'Houda', 'GROUDA', TO_DATE('20/02/1950', 'DD/MM/YYYY'), 'EPSP THNIET ELABED BATNA', '0562939495', '0561218456', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (11, 'Mle', 'Saida', 'FENNICHE', NULL, 'CITE DE L’INDEPENDANCE LARBAA BLIDA', '0645983165', '0562014784', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (12, 'Mme', 'Samia', 'OUALI', TO_DATE('17/11/1966', 'DD/MM/YYYY'), 'CITE 200 LOGEMENTS BT1 N1-JIJEL', '0561374812', '0561277013', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (13, 'Mme', 'Fatiha', 'HADDAD', TO_DATE('20/09/1980', 'DD/MM/YYYY'), 'RUE BOUFADA LAKHDARAT-AIN OULMANE-SETIF', '0647092453', '0562442700', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (14, NULL, 'Djamel', 'MATI', NULL, 'DRAA KEBILA HAMMAM GUERGOUR SETIF', '0561033663', '0561484259', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (15, 'M.', 'Mohamed', 'GHRAIR', TO_DATE('24/06/1950', 'DD/MM/YYYY'), 'CITE JEANNE D’ARC ECRAN B5-GAMBETTA – ORAN', '0561390288', '0562375849', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (16, 'M.', 'Ali', 'LAAOUAR', NULL, 'CITE 1ER MAI EX 137 LOGEMENTS-ADRAR', '0639939410', '0561255412', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (17, 'M.', 'Messoud', 'AOUIZ', TO_DATE('24/11/1958', 'DD/MM/YYYY'), 'RUE SAIDANI ABDESSLAM - AIN BESSEM-BOUIRA', '0561439256', '0561473625', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (18, 'M.', 'Farid', 'AKIL', TO_DATE('06/05/1961', 'DD/MM/YYYY'), '3 RUE LARBI BEN M''HIDI-DRAA EL MIZAN-TIZI OUZOU', '0562349254', '0561294268', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (19, 'Mme', 'Dalila', 'MOUHTADI', NULL, '6, BD TRIPOLI ORAN', '0506271459', '0506294186', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (20, 'M.', 'Younes', 'CHALAH', NULL, 'CITE DES 60 LOGTS BT D N 48-NACIRIA-BOUMERDES', '0561358279', NULL, NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (21, 'M.', 'Boubeker', 'BARKAT', TO_DATE('08/11/1935', 'DD/MM/YYYY'), 'CITE MENTOURI N 71 BT AB SMK Constantine', '0561824538', '0561326179', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (22, 'M.', 'Seddik', 'HMIA', NULL, '25 RUE BEN YAHIYA-JIJEL', '0562379513', '0562493627', NULL);

INSERT INTO Client (NumClient, Civ, PrenomClient, NomClient, DateNaissance, Adresse, TelProf, TelPriv, Fax)
VALUES (23, 'M.', 'Lamine', 'MERABAT', TO_DATE('09/13/1965', 'MM/DD/YYYY'), 'CITE JEANNE D’ARC ECRAN B2-GAMBETTA – ORAN', '0561724538', '0561724538', NULL);

-- employe
INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (53, 'LACHEMI', 'Bouzid', 'Mécanicien', 25000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (54, 'BOUCHEMLA', 'Elias', 'Assistant', 10000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (55, 'HADJ', 'Zouhir', 'Assistant', 12000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (56, 'OUSSEDIK', 'Hakim', 'Mécanicien', 20000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (57, 'ABAD', 'Abdelhamid', 'Assistant', 13000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (58, 'BABACI', 'Tayeb', 'Mécanicien', 21300);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (59, 'BELHAMIDI', 'Mourad', 'Mécanicien', 19500);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (60, 'IGOUDJIL', 'Redouane', 'Assistant', 15000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (61, 'KOULA', 'Bahim', 'Mécanicien', 23100);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (62, 'RAHALI', 'Ahcene', 'Mécanicien', 24000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (63, 'CHAOUI', 'Ismail', 'Assistant', 13000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (64, 'BADI', 'Hatem', 'Assistant', 14000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (65, 'MOHAMMEDI', 'Mustapha', 'Mécanicien', 24000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (66, 'FEKAR', 'Abdelaziz', 'Assistant', 13500);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (67, 'SAIDOUNI', 'Wahid', 'Mécanicien', 25000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (68, 'BOULARAS', 'Farid', 'Assistant', 14000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (69, 'CHAKER', 'Nassim', 'Mécanicien', 26000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (71, 'TERKI', 'Yacine', 'Mécanicien', 23000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Categorie, Salaire)
VALUES (72, 'TEBIBEL', 'Ahmed', 'Assistant', 17000);

INSERT INTO Employe (NumEmploye, NomEmp, PrenomEmp, Salaire)
VALUES (80, 'LARDJOUNE', 'Karim', 25000);

--- marques
INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (1, 'LAMBORGHINI', 'ITALIE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (2, 'AUDI', 'ALLEMAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (3, 'ROLLS-ROYCE', 'GRANDE-BRETAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (4, 'BMW', 'ALLEMAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (5, 'CADILLAC', 'ETATS-UNIS');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (6, 'CHRYSLER', 'ETATS-UNIS');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (7, 'FERRARI', 'ITALIE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (8, 'HONDA', 'JAPON');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (9, 'JAGUAR', 'GRANDE-BRETAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (10, 'ALFA-ROMEO', 'ITALIE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (11, 'LEXUS', 'JAPON');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (12, 'LOTUS', 'GRANDE-BRETAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (13, 'MASERATI', 'ITALIE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (14, 'MERCEDES', 'ALLEMAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (15, 'PEUGEOT', 'FRANCE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (16, 'PORSCHE', 'ALLEMAGNE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (17, 'RENAULT', 'FRANCE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (18, 'SAAB', 'SUEDE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (19, 'TOYOTA', 'JAPON');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (20, 'VENTURI', 'FRANCE');

INSERT INTO Marque (NumMarque, Marque, Pays)
VALUES (21, 'VOLVO', 'SUEDE');

--- model
INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (1, 2, 'Diablo');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (2, 3, 'Série 5');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (3, 10, 'NSX');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (4, 14, 'Classe C');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (5, 17, 'Safrane');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (6, 20, '400 GT');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (7, 12, 'Esprit');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (8, 15, '605');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (9, 19, 'Prévia');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (10, 7, '550 Maranello');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (11, 3, 'Bentley-Continental');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (12, 10, 'Spider');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (13, 13, 'Evoluzione');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (14, 16, 'Carrera');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (15, 16, 'Boxter');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (16, 21, 'S 80');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (17, 6, '300 M');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (18, 4, 'M 3');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (19, 9, 'XJ 8');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (20, 9, 'XJ 8');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (21, 15, '406 Coupé');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (22, 20, '300 Atlantic');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (23, 14, 'Classe E');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (24, 11, 'GS 300');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (25, 5, 'Séville');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (26, 18, '95 Cabriolet');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (27, 2, 'TT Coupé');

INSERT INTO Modele (NumModele, NumMarque, Modele)
VALUES (28, 7, 'F 355');

-- vw doesn't work
--INSERT INTO Modele (NumModele, NumMarque, Modele)
--VALUES (29, 45, 'POLO');
-- vehicules
INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (1, 2, 6, '0012519216', 1992);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (2, 9, 20, '0124219316', 1993);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (3, 17, 8, '1452318716', 1987);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (4, 6, 12, '3145219816', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (5, 16, 23, '1278919816', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (6, 20, 6, '3853319735', 1997);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (7, 7, 8, '1453119816', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (8, 16, 14, '8365318601', 1986);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (9, 13, 15, '3087319233', 1992);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (10, 20, 22, '9413119935', 1999);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (11, 9, 16, '1572319801', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (12, 14, 20, '6025319733', 1997);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (13, 19, 17, '5205319736', 1997);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (14, 22, 21, '7543119207', 1992);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (15, 4, 19, '6254319916', 1999);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (16, 16, 21, '9831419701', 1997);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (17, 12, 11, '4563117607', 1976);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (18, 1, 2, '7973318216', 1982);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (19, 18, 77, '3904318515', 1985);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (20, 22, 2, '1234319707', 1997);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (21, 3, 19, '8429318516', 1985);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (22, 8, 19, '1245619816', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (23, 7, 25, '1678918516', 1985);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (24, 80, 9, '1789519816', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (25, 13, 5, '1278919833', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (26, 3, 10, '1458919316', 1993);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (27, 10, 7, '1256019804', 1998);

INSERT INTO Vehicule (NumVehicule, NumClient, NumModele, NumImmat, Annee)
VALUES (28, 10, 3, '1986219904', 1999);

--- interventions
INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (1, 3, 'Réparation', TO_DATE('2006-02-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-26 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (2, 21, 'Réparation', TO_DATE('2006-02-23 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-24 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (3, 25, 'Réparation', TO_DATE('2006-04-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 42000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (4, 10, 'Entretien', TO_DATE('2006-05-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-14 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (5, 6, 'Réparation', TO_DATE('2006-02-22 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 40000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (6, 14, 'Entretien', TO_DATE('2006-03-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-04 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7500);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (7, 1, 'Entretien', TO_DATE('2006-04-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 8000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (8, 17, 'Entretien', TO_DATE('2006-05-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (9, 22, 'Entretien', TO_DATE('2006-02-22 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-22 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7960);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (10, 2, 'Entretien et Réparation', TO_DATE('2006-04-08 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 45000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (11, 28, 'Réparation', TO_DATE('2006-03-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-17 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 36000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (12, 20, 'Entretien et Réparation', TO_DATE('2006-05-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (13, 8, 'Réparation Système', TO_DATE('2006-05-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17846);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (14, 1, 'Réparation', TO_DATE('2006-05-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 39000);

INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
VALUES (15, 20, 'Réparation Système', TO_DATE('2006-06-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-06-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27000);

-- this doesn't work
--INSERT INTO Interventions (NumIntervention, NumVehicule, TypeIntervention, DateDebInterv, DateFinInterv, CoutInterv)
--VALUES (16, 77, 'Réparation', TO_DATE('2006-06-27 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-06-30 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25000);
--- intervenant
INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (1, 54, TO_DATE('2006-02-26 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-26 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (1, 59, TO_DATE('2006-02-25 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (2, 57, TO_DATE('2006-02-24 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-24 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (2, 59, TO_DATE('2006-02-23 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-24 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (3, 60, TO_DATE('2006-04-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (3, 65, TO_DATE('2006-04-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (4, 62, TO_DATE('2006-05-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-14 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (4, 66, TO_DATE('2006-02-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-14 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (5, 56, TO_DATE('2006-02-22 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (5, 60, TO_DATE('2006-02-23 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-25 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (6, 53, TO_DATE('2006-03-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (6, 57, TO_DATE('2006-03-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-04 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (7, 55, TO_DATE('2006-04-09 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (7, 65, TO_DATE('2006-04-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (8, 54, TO_DATE('2006-05-12 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (8, 62, TO_DATE('2006-05-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (9, 59, TO_DATE('2006-02-22 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (9, 60, TO_DATE('2006-02-22 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-02-22 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (10, 63, TO_DATE('2006-04-09 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (10, 67, TO_DATE('2006-04-08 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-04-09 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (11, 59, TO_DATE('2006-03-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-11 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (11, 64, TO_DATE('2006-03-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-17 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (11, 53, TO_DATE('2006-03-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-03-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (12, 55, TO_DATE('2006-05-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (12, 56, TO_DATE('2006-05-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
VALUES (13, 64, TO_DATE('2006-05-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-12 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- this doesn't work
--INSERT INTO Intervenants (NumIntervention, NumEmploye, DateDebut, DateFin)
--VALUES (14, 88, TO_DATE('2006-05-07 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2006-05-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- script 4
-- Lister les modèles et leur marque.
SELECT M.MODELE, MA.MARQUE
FROM MODELE M
JOIN MARQUE MA ON M.NUMMARQUE = MA.NUMMARQUE;

-- Quelle est la durée moyenne d’une intervention?
SELECT AVG(DATEFININTERV - DATEDEBINTERV) AS DureeMoyenneIntervention
FROM INTERVENTIONS;

-- Donner le montant global des interventions dont le coût d’intervention est supérieur à 30000 DA?
SELECT SUM(COUTINTERV) AS MontantGlobal
FROM INTERVENTIONS
WHERE COUTINTERV > 30000;

-- Donner la liste des employés ayant fait le plus grand nombre d’interventions.
SELECT E.NUMEMPLOYE, E.NOMEMP, E.PRENOMEMP, COUNT(I.NUMINTERVENTION) AS NombreInterventions
FROM EMPLOYE E
JOIN INTERVENANTS I ON E.NUMEMPLOYE = I.NUMEMPLOYE
GROUP BY E.NUMEMPLOYE, E.NOMEMP, E.PRENOMEMP
ORDER BY COUNT(I.NUMINTERVENTION) DESC
FETCH FIRST 1 ROWS ONLY;