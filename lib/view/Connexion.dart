import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendrier/db/database_calendar.dart';
import 'package:flutter_calendrier/view/inter_registeruser.dart';
import 'package:flutter_calendrier/view/inter_resetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../metiers/firebase_auth_services.dart';
import '../metiers/lien_class.dart';
import 'menu_calendrier.dart';

void main(List<String> args) {
  runApp(const ConnexionApp());
}

class ConnexionApp extends StatelessWidget {
  const ConnexionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  ///Récupère la liste des calendriers en fonction d'un mail de l'user
  ///Renvoie Aucun calendrier trouvée si il ne trouve rien Sinon incrémente calendrier numéro pour chaque calendrier touvé
  Future<List<String>> temp(String mailuser) async {
    database_calendar db = database_calendar();
    List<lien> donnees = await db.getDonnees();
    List<int> a = await db.getDonnees2("John");
    List<String> result = [];
    if(a.isEmpty){
      result.add('Aucun calendrier trouvee');
    }
    else
      {
        for (int l in a) {
          result.add("Calendrier numéro "+l.toString());
        }
      }

    return result;
  }

  ///Met à jour le widget qui permet de savoir le nombre de calendrier d'un utilisateur
  List<Widget> recupDonnees(String mailUser) {
    List<Widget> widgets = [];

    temp(mailUser).then((debut) {
      if (debut != null) {
        for (String item in debut) {
          widgets.add(Text(item));
          print("Ajout du widget"+item);
        }
      }
    });

    return widgets;
  }

  ///Pré-Construit le Widget
  MyCustomWidget Lancement()
  {
   return MyCustomWidget(
        listTiles: recupDonnees(
            "john"));
  }

  @override
  Widget build(BuildContext context) {
    MyCustomWidget MyWidget = Lancement();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width, // Full Width of Screen
        height: MediaQuery.of(context).size.height, // Full Height of Screen
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: Image.asset(
                  'assets/images/planif.png',
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: "E-Mail", icon: Icon(Icons.person)),
                    controller: emailController,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: const InputDecoration(
                      hintText: "Mot de passe", icon: Icon(Icons.password)),
                  controller: passwordController,
                ),
              ),
              const SizedBox(height: 16.0),
              FloatingActionButton.extended(
                onPressed: () async {
                  final FirebaseAuthService _auth = FirebaseAuthService();
                  User? user = await _auth.signInWithEmailAndPassword(
                      emailController.text, passwordController.text);
                  if (user != null) {
                    //successfull login
                    print("User successfully logged");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyWidget));
                  } else {
                    //unsuccessfull login
                    print("User unsuccessfully logged");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Identifiant ou mot de passe incorrect'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.next_plan_rounded),
                label: const Text("Se connecter"),
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => inter_registeruser()),
                  );
                },
                child: const Text("Vous n'avez pas de compte ? S'inscrire"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => inter_resetpassword()),
                  );
                },
                child: const Text("Mot de passe oublié ? Réinitialiser"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
