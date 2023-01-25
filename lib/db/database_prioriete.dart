import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';

import 'database_interface.dart';

class db_prio implements database_interface {
  String path = "prio/";

  DatabaseReference connexion_db() {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    return ref;
  }

  @override
  void getDonnees() async {
    DatabaseReference db = connexion_db();
    final snapshot = await db.child(path).get();
    if (snapshot.exists) {
      Map m = Map.fromIterable(snapshot.value as List);
      List<prioriete> liste = [];
      m.forEach((key, value) {
        liste.add(prioriete.convert(value));
      });

      print(liste.toString());
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
  void postDonneees(Object o) {
    // TODO: implement postDonneees
  }

  Future<List<prioriete>>
      FetchFromDb() async //Fonction temporaire qui pourrait être getDonnées sauf que problème d'implementations donc on passe par une fonction qui fait appel la même chose sauf que ça retourne bien list, je ferai le fix plus tard
  {
    DatabaseReference db = connexion_db();
    final snapshot = await db.child(path).get();
    List<prioriete> liste = [];
    if (snapshot.exists) {
      Map m = Map.fromIterable(snapshot.value as List);

      m.forEach((key, value) {
        liste.add(prioriete.convert(value));
      });
    }

    return liste;
  }
}
