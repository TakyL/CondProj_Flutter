import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
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
      Map m = Map.fromIterable(snapshot.value as List);
      List<Evenement> liste = [];
      m.forEach((key, value) {
        liste.add(Evenement.convert(value));
      });

      print(liste.toString());//TODO utiliser un iterator pour l'affichage des evenements => utilisation du DP iterator

      //  print(m.entries.iterator.current.value);
      //var Map1 = Map<String,dynamic>.from(Map.fromIterable(snapshot.value as List).values.toList()[0]);

      //   print((jsonDecode(jsonEncode(snapshot.value))));

      //  print(Map<String, dynamic>.from(
      //    Map.fromIterable(snapshot.value as List).keys.toList()[0]));
      //Map<String, dynamic> a = jsonDecode(jsonEncode(snapshot.value));
      //print(a.entries.first.value);//key contient 2 , value contient le json
      // print(a.entries.iterator.current.value);
      //var u = Evenement.fromJson(a.entries.iterator.current.value);
      //print(u);
    } else {
      print('No data available.');
    }
  }

  @override
  void getDonneesByAttributs() {
    // TODO: implement getDonneesByAttributs
  }

  @override
  void getDonneesById(int id) async {
    final snapshot = await db.child('events/$id').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
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
  
  @override
  Future<List<Object>> test() {
    // TODO: implement test
    throw UnimplementedError();
  }
}
