//Fait ref au endpoint
//Todo faire une seule instance de connexion à la base via le DP singleton
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';

import 'database_interface.dart';

class database_prioevent implements database_interface
{
  @override
  void getDonnees() {
    // TODO: implement getDonnees
  }

  @override
  void getDonneesByAttributs() {
    // TODO: implement getDonneesByAttributs
  }

  @override
  void getDonneesById(int id) {
    // TODO: implement getDonneesById
  }

  @override
  void postDonneees(Object o) {
    // TODO: implement postDonneees
  }

//Classe qui sera call sur database_eveneemnt pour construire un evenement qui contient la prioriete, pourra être appelé à d'autres occasions
//Cette classe fera appel database_priorite pour faire l'associtation entre l'id de la prio et la prio donc son object sera la classe prioriete
}