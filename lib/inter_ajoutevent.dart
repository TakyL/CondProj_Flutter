import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'classes/evenements_class.dart';

class Inter_Event extends StatefulWidget {
  final DateTime time;
  final void Function(DateTime d, Evenement e) callback; //Ajout la liste

  const Inter_Event({Key? key, required this.time, required this.callback})
      : super(key: key);

  @override
  _Inter_EventState createState() => _Inter_EventState();
}

class _Inter_EventState extends State<Inter_Event> {
  final _formKey = GlobalKey<FormState>();
  final _CtrlNom = TextEditingController();
  final _tePrenom = TextEditingController();
  final _teDate = TextEditingController();

//Expended puis flex
  void loginbutton() {
    if (_CtrlNom.text.isNotEmpty) {
      widget.callback(widget.time, new Evenement(nom: _CtrlNom.text));
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Evenement ajoute au calendrier")));
    }
  }

  @override
  void dispose() {
    _CtrlNom.dispose();
    _tePrenom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
          child: Column(
        children: [
          const Text("Ajouter un évenement",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextFormField(
            controller: _CtrlNom,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Nom de l'évenement"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Un nom doit renseigné';
              }
              return null;
            },
          ),
          TextButton(onPressed: loginbutton, child: const Text("Valider")),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retour")),
        ],
      )),
    ));
  }
}
