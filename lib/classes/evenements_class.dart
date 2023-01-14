import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';

class Evenement {
  // final DateTime date;
  late int id;
  final String nom;
  late String auteur;
  late String date_debut;
  late String date_fin;
  late String heure_debut;
  late String heure_fin;
  late String description;
  late prioriete prio;

  Evenement(
      {required this.id,
      required this.nom,
      required this.auteur,
      required this.date_debut,
      required this.date_fin,
      required this.heure_debut,
      required this.heure_fin,
      required this.description,
      required this.prio});
  Evenement.n(
      {required this.nom}); //FIXME Bricolage poiur l'affichage dans la vue

  @override
  String toString() {
    return nom;
  }
}
