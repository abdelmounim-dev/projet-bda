// Afficher tous les véhicules de la marque « PORSCHE »
var porsche = db.Marque.findOne({ "Marque": "PORSCHE" }).NumMarque
var modeles = db.Modele.find({ "NumMarque": porsche }).toArray().map(doc => doc.NumModele)
db.Vehicule.find({ "NumModele": { $in: modeles } })

// Récupérer dans une nouvelle collection Véhicules_Interventions, les matricules des véhicules et le nombre total d'interventions par véhicule, ordonnée par ordre décroissant du nombre d'interventions
db.Vehicule.aggregate([
  {
    $lookup: {
      from: "Interventions",
      localField: "NumVehicule",
      foreignField: "NumVehicule",
      as: "interventions"
    }
  },
  {
    $project: {
      NumVehicule: 1,
      nombreInterventions: { $size: "$interventions" }
    }
  },
  {
    $sort: { nombreInterventions: -1 }
  },
  {
    $out: "Vehicules_Interventions"
  }
]);

// Dans une collection véhicule_bcp_pannes, récupérer les véhicules dont le nombre des interventions dépasse 6 pannes
db.Vehicule.aggregate([
  {
    $lookup: {
      from: "Interventions",
      localField: "NumVehicule",
      foreignField: "NumVehicule",
      as: "interventions"
    }
  },
  {
    $project: {
      NumVehicule: 1,
      nombreInterventions: { $size: "$interventions" }
    }
  },
  {
    $match: { nombreInterventions: { $gt: 6 } }
  },
  {
    $out: "vehicule_bcp_pannes"
  }
]);

// Récupérer dans une collection employe-interv, toutes les interventions d’un employé
db.Intervenants.aggregate([
  {
    $lookup: {
      from: "Interventions",
      localField: "NumIntervention",
      foreignField: "NumIntervention",
      as: "interventions"
    }
  },
  {
    $out: "employe-interv"
  }
]);

// Augmenter de 8000 DA le salaire des employés de catégorie « Mécanicien »
db.Employe.updateMany(
  { "Categorie": "Mécanicien" },
  { $inc: { "Salaire": 8000 } }
);

// Reprendre la 4ème requête à l’aide du paradigme Map-Reduce
var mapFunction = function() {
  emit(this.NumIntervention, this);
};

var reduceFunction = function(key, values) {
  return values;
};

db.Intervenants.mapReduce(
  mapFunction,
  reduceFunction,
  { out: "employe-interv" }
);
