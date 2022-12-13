import 'package:flutter/foundation.dart';

class Evenement {
  // final DateTime date;
  //final int id;
  final String nom;
  //final String auteur;
  
  Evenement({required this.nom});
  //Evenement({required this.id, required this.nom});

  @override
  String toString() {
    return nom;
  }
}
