import 'package:firebase_database/firebase_database.dart';

import '../metiers/lien_class.dart';

///
/// Classe qui consistera à charger les calendriers d'un user
///
class database_calendar {
  String path = "cal_users/";

  DatabaseReference connexion_db() {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    return ref;
  }

  Future<List<lien>> getDonnees() async {
    final snapshot = await connexion_db().child(path).get();
    if (snapshot.exists) {
      Map m = Map.fromIterable(snapshot.value as List);
      List<lien> liste = [];
      m.forEach((key, value) {
        liste.add(lien.convert(value));
      });
      print(liste[0].toString());
      return liste.cast<lien>().toList();
    } else {
  throw Exception('honoliste');
  }



  }
}