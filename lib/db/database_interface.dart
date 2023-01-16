import 'package:firebase_database/firebase_database.dart';

class database_interface {
  void getDonnees() async {} //Fait un get all

   void getDonneesById(int id) async {} //Fait ucn get en fonction d'un id ex: id user/id cal/id_event

  void getDonneesByAttributs() async { }  //Fait un get en fonction d'un attribut ex:nom d'un user

  void postDonneees(Object o) async {} // Fait un post de l'objet (Utilisateurs/Evenements/Calendriers)
}

//∕ Test Employees db

class Emp implements database_interface {
   DatabaseReference r;

  Emp( {required this.r});

  void getDonnees() async {
    final snapshot = await r.child('employees/').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

   void getDonneesById(int id ) async 
   {
        final snapshot = await r.child('employees/$id').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
   } 

    void getDonneesByAttributs() async { }

    void postDonneees(Object o) async {}
}
