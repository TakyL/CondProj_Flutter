import 'dart:isolate';
import 'package:flutter/material.dart';

List<prioriete> listp = <prioriete>[
  a,
  b,
  c
]; //Decider de quoi en faire peut-être dans une classe à part où on a toutes les listes?

class prioriete {
  late int id;
  late String nom;
  //lis a;
  final MaterialColor couleur;

  //prioriete({required this.id, required this.nom})
  prioriete(int idp, String nomp, this.couleur) {
    id = idp;
    nom = nomp;
    // listp.add(this);
  }
  //listp.add(this);

  void fetchdata() //Récuère les données from the database
  {
    //On va créer un objet prio, sauf qu'on va l'ajouter à notre class lis.lisp.add(prio)
  }

  String getNom() {
    return nom;
  }

  int getId() {
    return id;
  }

  @override
  String toString() {
    return "${id}/${nom}/${couleur}";
  }
}

class lis {
  static List<prioriete> listp = <prioriete>[];

  // List<String> returnString()
  // {
  //  listp.map((e) => null)
  // }
}

prioriete a = prioriete(1, "UN", Colors.amber);
prioriete b = prioriete(2, "DEUX", Colors.red);
prioriete c = prioriete(3, "TROIS", Colors.green);
