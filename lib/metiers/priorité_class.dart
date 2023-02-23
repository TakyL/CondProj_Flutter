import 'package:flutter/material.dart';

import '../outils/CustomMaterialColor.dart';

List<prioriete> listp = <prioriete>[
  a,
  b,
  c
];

class prioriete {
  late int id;
  late String nom;
  //lis a;
  late MaterialColor couleur;

  //prioriete({required this.id, required this.nom})
  prioriete(int idp, String nomp, this.couleur) {
    id = idp;
    nom = nomp;
  }

  prioriete.Nom(String nom)
  {
    //Est censé construire une prioriété en se basant seulement via son nom, if else called db je sais pas
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

  factory prioriete.convert(value) {
    return prioriete.json(value['numero'] as String, value['libelle'] as String,
        value['couleur'] as String);
  }

  prioriete.json(String id, String nom, String couleur) {
    this.id = int.parse(id);
    this.nom = nom;
    Color c = HexColor.fromHex(couleur); //gerer si ce truc est nul
    this.couleur = CustomMaterialColor(c.red, c.green, c.blue).mdColor;
  }
}


prioriete a = prioriete(1, "Faible", CustomMaterialColor(255, 255, 64).mdColor);
prioriete b =
    prioriete(2, "Moyenne", CustomMaterialColor(255, 120, 31).mdColor);
prioriete c = prioriete(3, "Elevée", CustomMaterialColor(224, 20, 18).mdColor);
