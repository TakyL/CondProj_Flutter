import 'package:firebase_database/firebase_database.dart';

class database_interface {
  void getDonnees() async {} //Fait un get all

  void getDonneesById(
      int id) async {} //Fait ucn get en fonction d'un id ex: id user/id cal/id_event

  void
      getDonneesByAttributs(String data) async {} //Fait un get en fonction d'un attribut ex:nom d'un user

  void postDonneees(
      Object
          o) async {} // Fait un post de l'objet (Utilisateurs/Evenements/Calendriers)
}

