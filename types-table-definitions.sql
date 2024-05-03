-- Define Object Types
CREATE TYPE Client_Type AS OBJECT (
    NumClient INT,
    Civ VARCHAR2(10),
    PrenomClient VARCHAR2(100),
    NomClient VARCHAR2(100),
    DateNaissance DATE,
    Adresse VARCHAR2(255),
    TelProf VARCHAR2(20),
    TelPriv VARCHAR2(20),
    Fax VARCHAR2(20),
    MEMBER FUNCTION listVehicles RETURN VARCHAR2
);

CREATE TYPE Employe_Type AS OBJECT (
    NumEmploye INT,
    NomEmp VARCHAR2(100),
    PrenomEmp VARCHAR2(100),
    Categorie VARCHAR2(50),
    Salaire NUMBER(10, 2),
    MEMBER FUNCTION countInterventions RETURN INT
);

CREATE TYPE Marque_Type AS OBJECT (
    NumMarque INT,
    Marque VARCHAR2(100),
    Pays VARCHAR2(100),
    MEMBER FUNCTION countModels RETURN INT,
    MEMBER FUNCTION calculateRevenue RETURN NUMBER
);

-- Define Tables
CREATE TABLE Client_Table OF Client_Type (PRIMARY KEY (NumClient));
CREATE TABLE Employe_Table OF Employe_Type (PRIMARY KEY (NumEmploye));
CREATE TABLE Marque_Table OF Marque_Type (PRIMARY KEY (NumMarque));