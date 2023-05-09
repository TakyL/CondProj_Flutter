import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/metiers/priorit%C3%A9_class.dart';

///Classe métier événement
class Evenement {
  // final DateTime date;
  late int id;
  final String nom;
  late String auteur;
  late String date_debut;//format dd/mm/yyy
  late String date_fin;
  late String heure_debut;//format hh:mm
  late String heure_fin;
  late String description;
  late prioriete prio;
  late String prioName;

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

  Evenement.json(
      {required this.nom,
      required this.auteur,
      required this.date_debut,
      required this.date_fin,
      required this.heure_debut,
      required this.heure_fin,
      required this.description,
        required this.prioName
       } ); //Constructeur pour json

  @override
  String toString() {
    return nom+" "+date_debut+" "+heure_debut+"/"+date_fin+" "+heure_fin+"/"+description+"|"+prioName+" "+prio.toString();
  }

  factory Evenement.fromJson(Map<String, dynamic> json) {
    return Evenement.json(
        nom: json['name'] as String,
        auteur: json['author'] as String,
        date_debut: json['start_date'] as String,
        date_fin: json['end_date'] as String,
        heure_debut: json['start_hour'] as String,
        heure_fin: json['end_hour'] as String,
        description: json['description'] as String,
        prioName: json["priorite"] as String );
  }

  factory Evenement.convert(dynamic value) {
    return Evenement.json(
        nom: value['name'] as String,
        auteur: value['author'] as String,
        date_debut: value['start_date'] as String,
        date_fin: value['end_date'] as String,
        heure_debut: value['start_hour'] as String,
        heure_fin: value['end_hour'] as String,
        description: value['description'] as String,
        prioName: value["priorite"] as String );
  }
}
