import 'package:flutter/foundation.dart';

@immutable
class User {
  final int id;
  final String nom;
  final String mel;
  final String pseudo;

  User({
    required this.id,
    required this.nom,
    required this.mel,
    required this.pseudo,
  });

  ///
  /// Permet de mettre à jour les infos d'un user
  User copyWith({
    int? id,
    String? nom,
    String? mel,
    String? pseudo,
  }) {
    return User(
      id: id ?? this.id,
      nom: nom ?? this.nom,
      mel: mel ?? this.mel,
      pseudo: pseudo ?? this.pseudo,
    );
  }
}

