import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_calendrier/classes/evenements_class.dart';

import 'database_interface.dart';

class db_event implements database_interface {
  DatabaseReference db;
  String path = "events/";

  db_event({required this.db});

  @override
  void getDonnees() {
    // TODO: implement getDonnees
  }

  @override
  void getDonneesByAttributs() {
    // TODO: implement getDonneesByAttributs
  }

  @override
  void getDonneesById(int id) {
    // TODO: implement getDonneesById
  }

  @override
  void postDonneees(Object o) async {
    // TODO: implement postDonneees
    if (o is Evenement) {
      db = FirebaseDatabase.instance.ref(path+'${o.id}');

      await db.set({
        "name":o.nom,
        "start_date":o.date_debut,
        "start_hour":o.heure_debut,
        "end_date":o.date_fin,
        "end_hour":o.heure_fin,
        "author":o.auteur,
        "description":o.description,
        //priorite non traitée pour le moment 
      });
    } else {
      throw const FormatException(
          "Objet saisie à la base de données n'est pas un objet de type Evenement");
    }
  }
}
