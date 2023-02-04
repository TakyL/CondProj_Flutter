
// ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';

import 'package:flutter/foundation.dart';

class User {
  int Id;
  String Nom;
  String Mel;
  String Pseudo;

  User(this.Id, this.Mel, this.Pseudo, this.Nom);


  int get getId {
    return Id;
  }

  set setId(int _Id) {
    Id = _Id;
  }

  String get getNom {
    return Nom;
  }

  set setNom(String _Nom) {
    Nom = _Nom;
  }

  String get getMel {
    return Mel;
  }

  set setMel(String _Mel) {
    Mel = _Mel;
  }

  String get getPseudo {
    return Pseudo;
  }

  set setPsedu(String _Pseudo) {
    Pseudo = _Pseudo;
  }
}
