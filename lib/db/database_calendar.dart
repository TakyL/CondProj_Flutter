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

  ///Recupère l'id du mail associé

  Future<int> getIdMail(String nommail) async
  {
    final snapshot = await connexion_db().child("/users").get();
    if (snapshot.exists) {
      Map m = Map.fromIterable(snapshot.value as List);
      int idUser = -1;
      m.forEach((key, value) {
        if (value['mail'] == nommail) {
          idUser = value['id_user'];
        }
      });
      if (idUser == -1) {
        throw Exception("Mail non trouvé dans la db");
      }
      return idUser;
    } else {
      throw Exception("Erreur de connexion à l'endpoint");
    }

  }

  //Récupère les id de calendriers d'un user
  Future<List<int>> getDonnees2(String nommail) async {
    final snapshot = await connexion_db().child(path).get();
    if (snapshot.exists) {
      print("Lancement");
      int iduser= await getIdMail(nommail);
      Map m = Map.fromIterable(snapshot.value as List);
      List<int> listeomega = [];
      //Récupère tous les elements de l'endpoint
      m.forEach((key, value) {
        if(value['id_user'].toString()==iduser.toString())
          {
            listeomega.add(value['id_cal']);
          }
      });

      return listeomega;
     // return liste.cast<lien>().toList();
    } else {
      throw Exception('honoliste');
    }
  }

}