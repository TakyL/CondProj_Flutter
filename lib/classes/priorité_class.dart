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

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

prioriete a = prioriete(1, "Faible", CustomMaterialColor(255, 255, 64).mdColor);
prioriete b =
    prioriete(2, "Moyenne", CustomMaterialColor(255, 120, 31).mdColor);
prioriete c = prioriete(3, "Elevée", CustomMaterialColor(224, 20, 18).mdColor);
