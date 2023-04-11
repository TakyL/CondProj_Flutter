import 'package:flutter/material.dart';

import '../outils/custom_material_color.dart';

List<prioriete> listp = <prioriete>[
  a,
  b,
  c
];

class prioriete {
  late int id;
  late String nom;
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
    return prioriete.json(value['niveau'].toString(), value['libelle'].toString(),
        value['couleur'].toString());
  }

  prioriete.json(String id, String nom, String couleur) {
    this.id = int.parse(id);
    this.nom = nom;
    Color c = HexColor.fromHex(couleur); //TODO gerer si ce truc est null
    this.couleur = CustomMaterialColor(c.red, c.green, c.blue).mdColor;
  }
}


prioriete a = prioriete(1, "Faible", CustomMaterialColor(255, 255, 64).mdColor);
prioriete b =
    prioriete(2, "Moyenne", CustomMaterialColor(255, 120, 31).mdColor);
prioriete c = prioriete(3, "Elevée", CustomMaterialColor(224, 20, 18).mdColor);
