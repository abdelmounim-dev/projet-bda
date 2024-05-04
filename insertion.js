// Inserting values into the Client collection
var clients = [
  {
    NumClient: 1,
    Civ: "Mme",
    PrenomClient: "Cherifa",
    NomClient: "MAHBOUBA",
    DateNaissance: ISODate("1957-08-08"),
    Adresse: "CITE 1013 LOGTS BT 61 Alger",
    TelProf: "0561381813",
    TelPriv: "0562458714",
    Fax: null
  },
  {
    NumClient: 2,
    Civ: "Mme",
    PrenomClient: "Lamia",
    NomClient: "TAHMI",
    DateNaissance: ISODate("1955-12-31"),
    Adresse: "CITE BACHEDJARAH BATIMENT 38 -Bach Djerrah-Alger",
    TelProf: "0562467849",
    TelPriv: "0561392487",
    Fax: null
  },
  {
    NumClient: 3,
    Civ: "Mle",
    PrenomClient: "Ghania",
    NomClient: "DIAF AMROUNI",
    DateNaissance: ISODate("1955-12-31"),
    Adresse: "43, RUE ABDERRAHMANE SBAA BELLE VUE-EL HARRACH-ALGER",
    TelProf: "0523894562",
    TelPriv: "0619430945",
    Fax: "0562784254"
  },
  {
    NumClient: 4,
    Civ: "Mle",
    PrenomClient: "Chahinaz",
    NomClient: "MELEK",
    DateNaissance: ISODate("1955-06-27"),
    Adresse: "HLM AISSAT IDIR CAGE 9 3EME ETAGE-EL HARRACH ALGER",
    TelProf: "0634613493",
    TelPriv: "0562529463",
    Fax: null
  },
  {
    NumClient: 5,
    Civ: "Mme",
    PrenomClient: "Noura",
    NomClient: "TECHTACHE",
    DateNaissance: ISODate("1949-03-22"),
    Adresse: "16, ROUTE EL DJAMILA-AIN BENIAN-ALGER",
    TelProf: "0562757834",
    TelPriv: "0562757843",
    Fax: null
  },
  {
    NumClient: 6,
    Civ: "Mme",
    PrenomClient: "Widad",
    NomClient: "TOUATI",
    DateNaissance: ISODate("1965-08-14"),
    Adresse: "14 RUE DES FRERES AOUDIA-EL MOURADIA-ALGER",
    TelProf: "0561243967",
    TelPriv: "0561401836",
    Fax: null
  },
  {
    NumClient: 7,
    Civ: "Mle",
    PrenomClient: "Faiza",
    NomClient: "ABLOUL",
    DateNaissance: ISODate("1967-10-28"),
    Adresse: "CITE DIPLOMATIQUE BT BLEU 14B N 3 DERGANA-ALGER",
    TelProf: "0562935427",
    TelPriv: "0561486203",
    Fax: null
  },
  {
    NumClient: 8,
    Civ: "Mme",
    PrenomClient: "Assia",
    NomClient: "HORRA",
    DateNaissance: ISODate("1963-12-08"),
    Adresse: "32 RUE AHMED OUAKED-DELY BRAHIM-ALGER",
    TelProf: "0561038500",
    TelPriv: "0562466733",
    Fax: null
  },
  {
    NumClient: 9,
    Civ: "Mle",
    PrenomClient: "Souad",
    NomClient: "MESBAH",
    DateNaissance: ISODate("1972-08-30"),
    Adresse: "RESIDENCE CHABANI-HYDRA-ALGER",
    TelProf: "0561024358",
    TelPriv: null,
    Fax: null
  },
  {
    NumClient: 10,
    Civ: "Mme",
    PrenomClient: "Houda",
    NomClient: "GROUDA",
    DateNaissance: ISODate("1950-02-20"),
    Adresse: "EPSP THNIET ELABED BATNA",
    TelProf: "0562939495",
    TelPriv: "0561218456",
    Fax: null
  },
  {
    NumClient: 11,
    Civ: "Mle",
    PrenomClient: "Saida",
    NomClient: "FENNICHE",
    DateNaissance: null,
    Adresse: "CITE DE L’INDEPENDANCE LARBAA BLIDA",
    TelProf: "0645983165",
    TelPriv: "0562014784",
    Fax: null
  },
  {
    NumClient: 12,
    Civ: "Mme",
    PrenomClient: "Samia",
    NomClient: "OUALI",
    DateNaissance: ISODate("1966-11-17"),
    Adresse: "CITE 200 LOGEMENTS BT1 N1-JIJEL",
    TelProf: "0561374812",
    TelPriv: "0561277013",
    Fax: null
  },
  {
    NumClient: 13,
    Civ: "Mme",
    PrenomClient: "Fatiha",
    NomClient: "HADDAD",
    DateNaissance: ISODate("1980-09-20"),
    Adresse: "RUE BOUFADA LAKHDARAT-AIN OULMANE-SETIF",
    TelProf: "0647092453",
    TelPriv: "0562442700",
    Fax: null
  },
  {
    NumClient: 14,
    Civ: null,
    PrenomClient: "Djamel",
    NomClient: "MATI",
    DateNaissance: null,
    Adresse: "DRAA KEBILA HAMMAM GUERGOUR SETIF",
    TelProf: "0561033663",
    TelPriv: "0561484259",
    Fax: null
  },
  {
    NumClient: 15,
    Civ: "M.",
    PrenomClient: "Mohamed",
    NomClient: "GHRAIR",
    DateNaissance: ISODate("1950-06-24"),
    Adresse: "CITE JEANNE D’ARC ECRAN B5-GAMBETTA – ORAN",
    TelProf: "0561390288",
    TelPriv: "0562375849",
    Fax: null
  },
  {
    NumClient: 16,
    Civ: "M.",
    PrenomClient: "Ali",
    NomClient: "LAAOUAR",
    DateNaissance: null,
    Adresse: "CITE 1ER MAI EX 137 LOGEMENTS-ADRAR",
    TelProf: "0639939410",
    TelPriv: "0561255412",
    Fax: null
  },
  {
    NumClient: 17,
    Civ: "M.",
    PrenomClient: "Messoud",
    NomClient: "AOUIZ",
    DateNaissance: ISODate("1958-11-24"),
    Adresse: "RUE SAIDANI ABDESSLAM - AIN BESSEM-BOUIRA",
    TelProf: "0561439256",
    TelPriv: "0561473625",
    Fax: null
  },
  {
    NumClient: 18,
    Civ: "M.",
    PrenomClient: "Farid",
    NomClient: "AKIL",
    DateNaissance: ISODate("1961-05-06"),
    Adresse: "3 RUE LARBI BEN M'HIDI-DRAA EL MIZAN-TIZI OUZOU",
    TelProf: "0562349254",
    TelPriv: "0561294268",
    Fax: null
  },
  {
    NumClient: 19,
    Civ: "Mme",
    PrenomClient: "Dalila",
    NomClient: "MOUHTADI",
    DateNaissance: null,
    Adresse: "6, BD TRIPOLI ORAN",
    TelProf: "0506271459",
    TelPriv: "0506294186",
    Fax: null
  },
  {
    NumClient: 20,
    Civ: "M.",
    PrenomClient: "Younes",
    NomClient: "CHALAH",
    DateNaissance: null,
    Adresse: "CITE DES 60 LOGTS BT D N 48-NACIRIA-BOUMERDES",
    TelProf: "0561358279",
    TelPriv: null,
    Fax: null
  },
  {
    NumClient: 21,
    Civ: "M.",
    PrenomClient: "Boubeker",
    NomClient: "BARKAT",
    DateNaissance: ISODate("1935-11-08"),
    Adresse: "CITE MENTOURI N 71 BT AB SMK Constantine",
    TelProf: "0561824538",
    TelPriv: "0561326179",
    Fax: null
  },
  {
    NumClient: 22,
    Civ: "M.",
    PrenomClient: "Seddik",
    NomClient: "HMIA",
    DateNaissance: null,
    Adresse: "25 RUE BEN YAHIYA-JIJEL",
    TelProf: "0562379513",
    TelPriv: "0562493627",
    Fax: null
  },
  {
    NumClient: 23,
    Civ: "M.",
    PrenomClient: "Lamine",
    NomClient: "MERABAT",
    DateNaissance: ISODate("1965-09-13"),
    Adresse: "CITE JEANNE D’ARC ECRAN B2-GAMBETTA – ORAN",
    TelProf: "0561724538",
    TelPriv: "0561724538",
    Fax: null
  }
]
db.Client.insertMany(clients);

var employes = [
  {
    NumEmploye: 53,
    NomEmp: "LACHEMI",
    PrenomEmp: "Bouzid",
    Categorie: "Mécanicien",
    Salaire: 25000
  },
  {
    NumEmploye: 54,
    NomEmp: "BOUCHEMLA",
    PrenomEmp: "Elias",
    Categorie: "Assistant",
    Salaire: 10000
  },
  {
    NumEmploye: 55,
    NomEmp: "HADJ",
    PrenomEmp: "Zouhir",
    Categorie: "Assistant",
    Salaire: 12000
  },
  {
    NumEmploye: 56,
    NomEmp: "OUSSEDIK",
    PrenomEmp: "Hakim",
    Categorie: "Mécanicien",
    Salaire: 20000
  },
  {
    NumEmploye: 57,
    NomEmp: "ABAD",
    PrenomEmp: "Abdelhamid",
    Categorie: "Assistant",
    Salaire: 13000
  },
  {
    NumEmploye: 58,
    NomEmp: "BABACI",
    PrenomEmp: "Tayeb",
    Categorie: "Mécanicien",
    Salaire: 21300
  },
  {
    NumEmploye: 59,
    NomEmp: "BELHAMIDI",
    PrenomEmp: "Mourad",
    Categorie: "Mécanicien",
    Salaire: 19500
  },
  {
    NumEmploye: 60,
    NomEmp: "IGOUDJIL",
    PrenomEmp: "Redouane",
    Categorie: "Assistant",
    Salaire: 15000
  },
  {
    NumEmploye: 61,
    NomEmp: "KOULA",
    PrenomEmp: "Bahim",
    Categorie: "Mécanicien",
    Salaire: 23100
  },
  {
    NumEmploye: 62,
    NomEmp: "RAHALI",
    PrenomEmp: "Ahcene",
    Categorie: "Mécanicien",
    Salaire: 24000
  },
  {
    NumEmploye: 63,
    NomEmp: "CHAOUI",
    PrenomEmp: "Ismail",
    Categorie: "Assistant",
    Salaire: 13000
  },
  {
    NumEmploye: 64,
    NomEmp: "BADI",
    PrenomEmp: "Hatem",
    Categorie: "Assistant",
    Salaire: 14000
  },
  {
    NumEmploye: 65,
    NomEmp: "MOHAMMEDI",
    PrenomEmp: "Mustapha",
    Categorie: "Mécanicien",
    Salaire: 24000
  },
  {
    NumEmploye: 66,
    NomEmp: "FEKAR",
    PrenomEmp: "Abdelaziz",
    Categorie: "Assistant",
    Salaire: 13500
  },
  {
    NumEmploye: 67,
    NomEmp: "SAIDOUNI",
    PrenomEmp: "Wahid",
    Categorie: "Mécanicien",
    Salaire: 25000
  },
  {
    NumEmploye: 68,
    NomEmp: "BOULARAS",
    PrenomEmp: "Farid",
    Categorie: "Assistant",
    Salaire: 14000
  },
  {
    NumEmploye: 69,
    NomEmp: "CHAKER",
    PrenomEmp: "Nassim",
    Categorie: "Mécanicien",
    Salaire: 26000
  },
  {
    NumEmploye: 71,
    NomEmp: "TERKI",
    PrenomEmp: "Yacine",
    Categorie: "Mécanicien",
    Salaire: 23000
  },
  {
    NumEmploye: 72,
    NomEmp: "TEBIBEL",
    PrenomEmp: "Ahmed",
    Categorie: "Assistant",
    Salaire: 17000
  },
  {
    NumEmploye: 80,
    NomEmp: "LARDJOUNE",
    PrenomEmp: "Karim",
    Salaire: 25000
  }
]
db.Employe.insertMany(employes);

// Inserting values into the Marque collection

var marques = [
  { NumMarque: 1, Marque: "LAMBORGHINI", Pays: "ITALIE" },
  { NumMarque: 2, Marque: "AUDI", Pays: "ALLEMAGNE" },
  { NumMarque: 3, Marque: "ROLLS-ROYCE", Pays: "GRANDE-BRETAGNE" },
  { NumMarque: 4, Marque: "BMW", Pays: "ALLEMAGNE" },
  { NumMarque: 5, Marque: "CADILLAC", Pays: "ETATS-UNIS" },
  { NumMarque: 6, Marque: "CHRYSLER", Pays: "ETATS-UNIS" },
  { NumMarque: 7, Marque: "FERRARI", Pays: "ITALIE" },
  { NumMarque: 8, Marque: "HONDA", Pays: "JAPON" },
  { NumMarque: 9, Marque: "JAGUAR", Pays: "GRANDE-BRETAGNE" },
  { NumMarque: 10, Marque: "ALFA-ROMEO", Pays: "ITALIE" },
  { NumMarque: 11, Marque: "LEXUS", Pays: "JAPON" },
  { NumMarque: 12, Marque: "LOTUS", Pays: "GRANDE-BRETAGNE" },
  { NumMarque: 13, Marque: "MASERATI", Pays: "ITALIE" },
  { NumMarque: 14, Marque: "MERCEDES", Pays: "ALLEMAGNE" },
  { NumMarque: 15, Marque: "PEUGEOT", Pays: "FRANCE" },
  { NumMarque: 16, Marque: "PORSCHE", Pays: "ALLEMAGNE" },
  { NumMarque: 17, Marque: "RENAULT", Pays: "FRANCE" },
  { NumMarque: 18, Marque: "SAAB", Pays: "SUEDE" },
  { NumMarque: 19, Marque: "TOYOTA", Pays: "JAPON" },
  { NumMarque: 20, Marque: "VENTURI", Pays: "FRANCE" },
  { NumMarque: 21, Marque: "VOLVO", Pays: "SUEDE" }
]
db.Marque.insertMany(marques);

// Inserting values into the Modele collection
var modeles = [
  { NumModele: 1, NumMarque: 2, Modele: "Diablo" },
  { NumModele: 2, NumMarque: 3, Modele: "Série 5" },
  { NumModele: 3, NumMarque: 10, Modele: "NSX" },
  { NumModele: 4, NumMarque: 14, Modele: "Classe C" },
  { NumModele: 5, NumMarque: 17, Modele: "Safrane" },
  { NumModele: 6, NumMarque: 20, Modele: "400 GT" },
  { NumModele: 7, NumMarque: 12, Modele: "Esprit" },
  { NumModele: 8, NumMarque: 15, Modele: "605" },
  { NumModele: 9, NumMarque: 19, Modele: "Prévia" },
  { NumModele: 10, NumMarque: 7, Modele: "550 Maranello" },
  { NumModele: 11, NumMarque: 3, Modele: "Bentley-Continental" },
  { NumModele: 12, NumMarque: 10, Modele: "Spider" },
  { NumModele: 13, NumMarque: 13, Modele: "Evoluzione" },
  { NumModele: 14, NumMarque: 16, Modele: "Carrera" },
  { NumModele: 15, NumMarque: 16, Modele: "Boxter" },
  { NumModele: 16, NumMarque: 21, Modele: "S 80" },
  { NumModele: 17, NumMarque: 6, Modele: "300 M" },
  { NumModele: 18, NumMarque: 4, Modele: "M 3" },
  { NumModele: 19, NumMarque: 9, Modele: "XJ 8" },
  { NumModele: 20, NumMarque: 9, Modele: "XJ 8" },
  { NumModele: 21, NumMarque: 15, Modele: "406 Coupé" },
  { NumModele: 22, NumMarque: 20, Modele: "300 Atlantic" },
  { NumModele: 23, NumMarque: 14, Modele: "Classe E" },
  { NumModele: 24, NumMarque: 11, Modele: "GS 300" },
  { NumModele: 25, NumMarque: 5, Modele: "Séville" },
  { NumModele: 26, NumMarque: 18, Modele: "95 Cabriolet" },
  { NumModele: 27, NumMarque: 2, Modele: "TT Coupé" },
  { NumModele: 28, NumMarque: 7, Modele: "F 355" }
]
db.Modele.insertMany(modeles);

// Inserting values into the Vehicule collection
var vehicules = [
  { NumVehicule: 1, NumClient: 2, NumModele: 6, NumImmat: "0012519216", Annee: 1992 },
  { NumVehicule: 2, NumClient: 9, NumModele: 20, NumImmat: "0124219316", Annee: 1993 },
  { NumVehicule: 3, NumClient: 17, NumModele: 8, NumImmat: "1452318716", Annee: 1987 },
  { NumVehicule: 4, NumClient: 6, NumModele: 12, NumImmat: "3145219816", Annee: 1998 },
  { NumVehicule: 5, NumClient: 16, NumModele: 23, NumImmat: "1278919816", Annee: 1998 },
  { NumVehicule: 6, NumClient: 20, NumModele: 6, NumImmat: "3853319735", Annee: 1997 },
  { NumVehicule: 7, NumClient: 7, NumModele: 8, NumImmat: "1453119816", Annee: 1998 },
  { NumVehicule: 8, NumClient: 16, NumModele: 14, NumImmat: "8365318601", Annee: 1986 },
  { NumVehicule: 9, NumClient: 13, NumModele: 15, NumImmat: "3087319233", Annee: 1992 },
  { NumVehicule: 10, NumClient: 20, NumModele: 22, NumImmat: "9413119935", Annee: 1999 },
  { NumVehicule: 11, NumClient: 9, NumModele: 16, NumImmat: "1572319801", Annee: 1998 },
  { NumVehicule: 12, NumClient: 14, NumModele: 20, NumImmat: "6025319733", Annee: 1997 },
  { NumVehicule: 13, NumClient: 19, NumModele: 17, NumImmat: "5205319736", Annee: 1997 },
  { NumVehicule: 14, NumClient: 22, NumModele: 21, NumImmat: "7543119207", Annee: 1992 },
  { NumVehicule: 15, NumClient: 4, NumModele: 19, NumImmat: "6254319916", Annee: 1999 },
  { NumVehicule: 16, NumClient: 16, NumModele: 21, NumImmat: "9831419701", Annee: 1997 },
  { NumVehicule: 17, NumClient: 12, NumModele: 11, NumImmat: "4563117607", Annee: 1976 },
  { NumVehicule: 18, NumClient: 1, NumModele: 2, NumImmat: "7973318216", Annee: 1982 },
  { NumVehicule: 19, NumClient: 18, NumModele: 77, NumImmat: "3904318515", Annee: 1985 },
  { NumVehicule: 20, NumClient: 22, NumModele: 2, NumImmat: "1234319707", Annee: 1997 },
  { NumVehicule: 21, NumClient: 3, NumModele: 19, NumImmat: "8429318516", Annee: 1985 },
  { NumVehicule: 22, NumClient: 8, NumModele: 19, NumImmat: "1245619816", Annee: 1998 },
  { NumVehicule: 23, NumClient: 7, NumModele: 25, NumImmat: "1678918516", Annee: 1985 },
  { NumVehicule: 24, NumClient: 80, NumModele: 9, NumImmat: "1789519816", Annee: 1998 },
  { NumVehicule: 25, NumClient: 13, NumModele: 5, NumImmat: "1278919833", Annee: 1998 },
  { NumVehicule: 26, NumClient: 3, NumModele: 10, NumImmat: "1458919316", Annee: 1993 },
  { NumVehicule: 27, NumClient: 10, NumModele: 7, NumImmat: "1256019804", Annee: 1998 },
  { NumVehicule: 28, NumClient: 10, NumModele: 3, NumImmat: "1986219904", Annee: 1999 }
]
db.Vehicule.insertMany(vehicules);

// Inserting values into the Interventions collection
var inteventions = [
  { NumIntervention: 1, NumVehicule: 3, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-02-25T09:00:00"), DateFinInterv: new Date("2006-02-26T12:00:00"), CoutInterv: 30000 },
  { NumIntervention: 2, NumVehicule: 21, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-02-23T09:00:00"), DateFinInterv: new Date("2006-02-24T18:00:00"), CoutInterv: 10000 },
  { NumIntervention: 3, NumVehicule: 25, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-04-06T14:00:00"), DateFinInterv: new Date("2006-04-09T12:00:00"), CoutInterv: 42000 },
  { NumIntervention: 4, NumVehicule: 10, TypeIntervention: "Entretien", DateDebInterv: new Date("2006-05-14T09:00:00"), DateFinInterv: new Date("2006-05-14T18:00:00"), CoutInterv: 10000 },
  { NumIntervention: 5, NumVehicule: 6, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-02-22T09:00:00"), DateFinInterv: new Date("2006-02-25T18:00:00"), CoutInterv: 40000 },
  { NumIntervention: 6, NumVehicule: 14, TypeIntervention: "Entretien", DateDebInterv: new Date("2006-03-03T14:00:00"), DateFinInterv: new Date("2006-03-04T18:00:00"), CoutInterv: 7500 },
  { NumIntervention: 7, NumVehicule: 1, TypeIntervention: "Entretien", DateDebInterv: new Date("2006-04-09T09:00:00"), DateFinInterv: new Date("2006-04-09T18:00:00"), CoutInterv: 8000 },
  { NumIntervention: 8, NumVehicule: 17, TypeIntervention: "Entretien", DateDebInterv: new Date("2006-05-11T14:00:00"), DateFinInterv: new Date("2006-05-12T18:00:00"), CoutInterv: 9000 },
  { NumIntervention: 9, NumVehicule: 22, TypeIntervention: "Entretien", DateDebInterv: new Date("2006-02-22T09:00:00"), DateFinInterv: new Date("2006-02-22T18:00:00"), CoutInterv: 7960 },
  { NumIntervention: 10, NumVehicule: 2, TypeIntervention: "Entretien et Réparation", DateDebInterv: new Date("2006-04-08T09:00:00"), DateFinInterv: new Date("2006-04-09T18:00:00"), CoutInterv: 45000 },
  { NumIntervention: 11, NumVehicule: 28, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-03-08T14:00:00"), DateFinInterv: new Date("2006-03-17T12:00:00"), CoutInterv: 36000 },
  { NumIntervention: 12, NumVehicule: 20, TypeIntervention: "Entretien et Réparation", DateDebInterv: new Date("2006-05-03T09:00:00"), DateFinInterv: new Date("2006-05-05T18:00:00"), CoutInterv: 27000 },
  { NumIntervention: 13, NumVehicule: 8, TypeIntervention: "Réparation Système", DateDebInterv: new Date("2006-05-12T14:00:00"), DateFinInterv: new Date("2006-05-12T18:00:00"), CoutInterv: 17846 },
  { NumIntervention: 14, NumVehicule: 1, TypeIntervention: "Réparation", DateDebInterv: new Date("2006-05-10T14:00:00"), DateFinInterv: new Date("2006-05-12T12:00:00"), CoutInterv: 39000 },
  { NumIntervention: 15, NumVehicule: 20, TypeIntervention: "Réparation Système", DateDebInterv: new Date("2006-06-25T09:00:00"), DateFinInterv: new Date("2006-06-25T12:00:00"), CoutInterv: 27000 }
]
db.Interventions.insertMany(inteventions);

// Inserting values into the Intervenants collection
var intervenants = [
  { NumIntervention: 1, NumEmploye: 54, DateDebut: new Date("2006-02-26T09:00:00"), DateFin: new Date("2006-02-26T12:00:00") },
  { NumIntervention: 1, NumEmploye: 59, DateDebut: new Date("2006-02-25T09:00:00"), DateFin: new Date("2006-02-25T18:00:00") },
  { NumIntervention: 2, NumEmploye: 57, DateDebut: new Date("2006-02-24T14:00:00"), DateFin: new Date("2006-02-24T18:00:00") },
  { NumIntervention: 2, NumEmploye: 59, DateDebut: new Date("2006-02-23T09:00:00"), DateFin: new Date("2006-02-24T12:00:00") },
  { NumIntervention: 3, NumEmploye: 60, DateDebut: new Date("2006-04-09T09:00:00"), DateFin: new Date("2006-04-09T12:00:00") },
  { NumIntervention: 3, NumEmploye: 65, DateDebut: new Date("2006-04-06T14:00:00"), DateFin: new Date("2006-04-08T18:00:00") },
  { NumIntervention: 4, NumEmploye: 62, DateDebut: new Date("2006-05-14T09:00:00"), DateFin: new Date("2006-05-14T12:00:00") },
  { NumIntervention: 4, NumEmploye: 66, DateDebut: new Date("2006-02-14T14:00:00"), DateFin: new Date("2006-05-14T18:00:00") },
  { NumIntervention: 5, NumEmploye: 56, DateDebut: new Date("2006-02-22T09:00:00"), DateFin: new Date("2006-02-25T12:00:00") },
  { NumIntervention: 5, NumEmploye: 60, DateDebut: new Date("2006-02-23T09:00:00"), DateFin: new Date("2006-02-25T18:00:00") },
  { NumIntervention: 6, NumEmploye: 53, DateDebut: new Date("2006-03-03T14:00:00"), DateFin: new Date("2006-03-04T12:00:00") },
  { NumIntervention: 6, NumEmploye: 57, DateDebut: new Date("2006-03-04T14:00:00"), DateFin: new Date("2006-03-04T18:00:00") },
  { NumIntervention: 7, NumEmploye: 55, DateDebut: new Date("2006-04-09T14:00:00"), DateFin: new Date("2006-04-09T18:00:00") },
  { NumIntervention: 7, NumEmploye: 65, DateDebut: new Date("2006-04-09T09:00:00"), DateFin: new Date("2006-04-09T12:00:00") },
  { NumIntervention: 8, NumEmploye: 54, DateDebut: new Date("2006-05-12T09:00:00"), DateFin: new Date("2006-05-12T18:00:00") },
  { NumIntervention: 8, NumEmploye: 62, DateDebut: new Date("2006-05-11T14:00:00"), DateFin: new Date("2006-05-12T12:00:00") },
  { NumIntervention: 9, NumEmploye: 59, DateDebut: new Date("2006-02-22T09:00:00"), DateFin: new Date("2006-02-22T12:00:00") },
  { NumIntervention: 9, NumEmploye: 60, DateDebut: new Date("2006-02-22T14:00:00"), DateFin: new Date("2006-02-22T18:00:00") },
  { NumIntervention: 10, NumEmploye: 63, DateDebut: new Date("2006-04-09T14:00:00"), DateFin: new Date("2006-04-09T18:00:00") },
  { NumIntervention: 10, NumEmploye: 67, DateDebut: new Date("2006-04-08T09:00:00"), DateFin: new Date("2006-04-09T12:00:00") },
  { NumIntervention: 11, NumEmploye: 59, DateDebut: new Date("2006-03-09T09:00:00"), DateFin: new Date("2006-03-11T18:00:00") },
  { NumIntervention: 11, NumEmploye: 64, DateDebut: new Date("2006-03-09T09:00:00"), DateFin: new Date("2006-03-17T12:00:00") },
  { NumIntervention: 11, NumEmploye: 53, DateDebut: new Date("2006-03-08T14:00:00"), DateFin: new Date("2006-03-16T18:00:00") },
  { NumIntervention: 12, NumEmploye: 55, DateDebut: new Date("2006-05-05T09:00:00"), DateFin: new Date("2006-05-05T18:00:00") },
  { NumIntervention: 12, NumEmploye: 56, DateDebut: new Date("2006-05-03T09:00:00"), DateFin: new Date("2006-05-05T12:00:00") },
  { NumIntervention: 13, NumEmploye: 64, DateDebut: new Date("2006-05-12T14:00:00"), DateFin: new Date("2006-05-12T18:00:00") }
]
db.Intervenants.insertMany(intervenants);
