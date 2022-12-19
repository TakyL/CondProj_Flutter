import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'classes/evenements_class.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'interfaces/Widget_interface_ajoutevent/Widgets.dart';

List<String> l = listp.map((e) => e.nom).toList();

class Inter_Event extends StatefulWidget {
  final DateTime time; //Permettra d'init le date picker
  final void Function(DateTime d, Evenement e) callback; //Ajout la liste

  const Inter_Event({Key? key, required this.time, required this.callback})
      : super(key: key);

  @override
  _Inter_EventState createState() => _Inter_EventState();
}

class _Inter_EventState extends State<Inter_Event> {
  final _formKey = GlobalKey<FormState>();
  final _tePrenom = TextEditingController();
  final _CtrlNom = TextEditingController(); //Champ Nom event
  final _CtrlDateD = TextEditingController();
  final _CtrlDateF = TextEditingController();
  final _CtrlHeureD = TextEditingController();
  final _CtrlHeureF = TextEditingController();

  prioriete dropdownValue = listp.first;

  Color? DetermineCouleur(prioriete value) {
    // debugPrint(value.toString());
    return value.couleur;
    //debugPrint(listp.toString());
  }

  @override
  void dispose() {
    _CtrlNom.dispose();
    _tePrenom.dispose();
    super.dispose();
  }

  void loginbutton() {
    if (_formKey.currentState!.validate()) {
      widget.callback(widget.time, Evenement(nom: _CtrlNom.text));
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Evenement ajoute au calendrier"))); //Possibilité de subdiviser en fonction ou en classe
    }
  }

  ///Widgets [ à déplacer plus tard dans un fichier à part où on retrouve tous les widgets mais y'a des problèmes genre pour le context, le dropdownbutton notament, à voir si on peut pas créer une classe qui derriere va recup les fonctions comme ça si on en constructeur, on met le context, seul problème sera le widget.time donc tout les callback]
   DropdownButtonFormField<prioriete>   EnferEtDamanation() //Gère le dropdownButtonFiled, c'est la cause des lignes d'erreurs car en fait j'ai mis expanded sauf que ça ignore les règles expanded et du coup faut tout mettre en expanded et que c'est un peu le bordel actuellement
  {
    return DropdownButtonFormField<prioriete>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        //dropdownColor: DetermineCouleur(dropdownValue),
        onChanged: (prioriete? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: listp.map<DropdownMenuItem<prioriete>>((prioriete value) {
          return DropdownMenuItem<prioriete>(
              value: value,
              child: Expanded(
                  child: Container(
                decoration: BoxDecoration(color: value.couleur),
                alignment: Alignment.center,
                child: Text(value.nom),
              )));
        }).toList());
  }

  Row LigneDate(
      String nom, TextEditingController Ctrl1, TextEditingController Ctrl2) {
    return Row(children: [
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width:
              200, //A adapater en fonction de la taille de l'écran / 200px pour les mobiles
          child: TextFormField(
              controller: Ctrl1,
              decoration: InputDecoration(
                icon: const Icon(Icons.calendar_today), //icon of text field
                labelText: "Date de $nom",
              ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                DateTime? choix = await datePicker();
                setState(() {
                  if (choix != null) {
                    Ctrl1.text = DateFormat('yyyy-MM-dd').format(choix);
                  }
                });
              }),
        ),
      ),
      Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width: 200,
            child: TextFormField(
                controller: Ctrl2, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: const Icon(
                        Icons.watch_later_outlined), //icon of text field
                    labelText: "Heure de $nom" //label text of field
                    ),
                readOnly: true, // when true user cannot edit text
                onTap: () async {
                  TimeOfDay? choix = await hourPicker();
                  setState(() {
                    if (choix != null) {
                      Ctrl2.text = "${choix.hour}:${choix.minute}";
                    }
                  });
                }),
          ))
    ]);
  }


  Future<DateTime?> datePicker() {
    return showDatePicker(
      context: context,
      initialDate: widget.time, //get today's date
      firstDate: DateTime(2010),
      lastDate: DateTime(2101),
      helpText: "SAISIR DATE",
      // locale: Locale('fr'), cfhttps://github.com/flutter/website/tree/archived-master/examples/internationalization/add_language/lib
      cancelText: "ANNULER",
    );
  }

  Future<TimeOfDay?> hourPicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "SAISIR HEURE",
      cancelText: "ANNULER",
      hourLabelText: "Heure",
      minuteLabelText: "Minutes",
      builder: (context, child) {
        {
          //Locale locale = Localizations.localeOf(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const Text("Ajouter un évenement",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _CtrlNom,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nom de l'évenement"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Un nom doit renseigné';
                      }
                      return null;
                    },
                  ),
                  LigneDate("début", _CtrlDateD, _CtrlHeureD),
                  LigneDate("fin", _CtrlDateF, _CtrlHeureF),
                  EnferEtDamanation(),
                ],
              )),
          TextButton(onPressed: loginbutton, child: const Text("Valider")),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Retour")),
        ],
      )),
    ));
  }
}
