import 'package:flutter/foundation.dart';

class UserClass {
  int Id = 0;
  var nom = "";
  var mel = "";
  var pseudo = "";

  int get User_Id {
    return this.Id;
  }

  String get User_Nom {
    return this.nom;
  }

  String get User_Mel {
    return this.mel;
  }

  String get User_Pseudo {
    return this.pseudo;
  }

  void set User_Id(var id) {
    this.Id = id;
  }

  void set User_Nom(var nom) {
    this.nom = nom;
  }

  void set User_Mel(var mel) {
    this.mel = mel;
  }

  void set User_Pseudo(var pseudo) {
    this.pseudo = pseudo;
  }
}
