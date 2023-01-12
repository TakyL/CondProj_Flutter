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
/**
 * Classe qui convertit du rgb vers du Material color
 */
class CustomMaterialColor {
  final int r;
  final int g;
  final int b;

  CustomMaterialColor(this.r, this.g, this.b);

  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return MaterialColor(Color.fromRGBO(r, g, b, 1).value, color);
  }
}

prioriete a = prioriete(1, "Faible", CustomMaterialColor(255,255,64).mdColor);
prioriete b = prioriete(2, "Moyenne", CustomMaterialColor(255,120,31).mdColor);
prioriete c = prioriete(3, "Elevée", CustomMaterialColor(224,20,18).mdColor);
