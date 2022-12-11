import 'package:flutter/foundation.dart';

class Evenement {
  // final DateTime date;
  final String nom;

  Evenement({required this.nom});

  @override
  String toString() {
    return nom;
  }
}
