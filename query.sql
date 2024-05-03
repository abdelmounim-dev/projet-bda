-- Querying the database
-- 9. Lister les modèles et leur marque
SELECT m.Modele, ma.Marque
FROM Modele_Table m
JOIN Marque_Table ma ON m.NumMarque = ma.NumMarque;

-- 10. Lister les véhicules sur lesquels, il y a au moins une intervention
SELECT DISTINCT v.NumVehicule
FROM Vehicule_Table v
JOIN Interventions_Table i ON v.NumVehicule = i.NumVehicule;

-- 11. Quelle est la durée moyenne d’une intervention?
SELECT AVG(DATEFININTERV - DATEDEBINTERV) AS DureeMoyenneIntervention
FROM Interventions_Table;

-- 12. Donner le montant global des interventions dont le coût d’intervention est supérieur à 30000 DA?
SELECT SUM(COUTINTERV) AS MontantGlobal
FROM Interventions_Table
WHERE COUTINTERV > 30000;

-- 13. Donner la liste des employés ayant fait le plus grand nombre d’interventions
SELECT e.NumEmploye, e.NomEmp, e.PrenomEmp, COUNT(*) AS NombreInterventions
FROM Employe_Table e
JOIN Intervenants_Table iv ON e.NumEmploye = iv.NumEmploye
GROUP BY e.NumEmploye, e.NomEmp, e.PrenomEmp
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROWS ONLY;