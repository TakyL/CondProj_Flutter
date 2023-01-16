import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_calendrier/classes/evenements_class.dart';

import 'database_interface.dart';

class db_event implements database_interface {
  DatabaseReference db;
  String path = "events/";

  db_event({required this.db});

  @override
  void getDonnees() async {
    final snapshot = await db.child(path).get();
    if (snapshot.exists) {
      // print(snapshot.value);

      Map<String, dynamic> a = (jsonDecode(jsonEncode((snapshot.value))));
      //print(a.entries.first.value);//key contient 2 , value contient le json
      var u = Evenement.fromJson(a.entries.first.value);
      print(u);
    } else {
      print('No data available.');
    }
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
    if (o is Evenement) {
      db = FirebaseDatabase.instance.ref(path + '${o.id}');

      await db.set({
        "name": o.nom,
        "start_date": o.date_debut,
        "start_hour": o.heure_debut,
        "end_date": o.date_fin,
        "end_hour": o.heure_fin,
        "author": o.auteur,
        "description": o.description,
        //priorite non traitée pour le moment
      });
    } else {
      throw const FormatException(
          "Objet saisie à la base de données n'est pas un objet de type Evenement");
    }
  }
      //Retourne le nb d'element dans la database
  Future<int> CountElement() async {
    final snapshot = await db.child(path).get();
    int nb = 0;
    if (snapshot.exists) {
      nb = snapshot.children.length;
    }
    return nb;
  }
}
