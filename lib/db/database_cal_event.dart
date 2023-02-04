import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_calendrier/classes/evenements_class.dart';


import 'database_interface.dart';

//Permet de récupérer les infos 

class db_cal_event implements database_interface
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

}