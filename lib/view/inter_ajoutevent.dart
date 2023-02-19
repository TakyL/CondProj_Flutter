import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../classes/evenements_class.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import '../db/database_evenement.dart';
import '../viewmodel/Widget_interface_ajoutevent/viewmodel_interfaceajoutevent.dart';
import '../validators/validator.ajoutevent.dart';
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
  final _CtrlDsc = TextEditingController();

  prioriete dropdownValue = listp.first;//TODO COnfig les validator

  Color? DetermineCouleur(prioriete value) {
    // debugPrint(value.toString());
    return value.couleur;
    //debugPrint(listp.toString());
  }

  //Permet de corirger le format de la date
  String formatTimeString(String timeString) {
  List<String> parts = timeString.split(":");
  if (int.parse(parts[1]) < 10) {
    return "${parts[0]}h0${parts[1]}";
  } else {
    return timeString;
  }
}


  @override
  void dispose() {
    _CtrlNom.dispose();
    _tePrenom.dispose();
    super.dispose();
  }

  void loginbutton() async{
    if (_formKey.currentState!.validate()) {

      widget.callback(
          widget.time,
          Evenement(
              id: await db_event().CountElement(),//TODO: Next Time:   modifier le get db_event, faire db_prioriete(au moins le get) /!\ Casts à faire, gérer l'affichage couleur sur la vue evenement,  à la fin instancier selectedevents via la db et uniquement la db
              nom: _CtrlNom.text,
              auteur: "TEST",
              date_debut: _CtrlDateD.text,
              date_fin: _CtrlDateF.text,
              heure_debut:
                  _CtrlHeureD.text,
              heure_fin:
                 _CtrlHeureF.text,
              description: _CtrlDsc.text,
              prio: dropdownValue));
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Evenement ajoute au calendrier"))); //Possibilité de subdiviser en fonction ou en classe
    }
  }


  ///Widgets
  ///
  /// Renvoie le dropdown menu qui permet de choisir la priorite
  ///
  DropdownButtonFormField<prioriete>
      WidgetDropDownButton() //Gère le dropdownButtonFiled, c'est la cause des lignes d'erreurs car en fait j'ai mis expanded sauf que ça ignore les règles expanded et du coup faut tout mettre en expanded et que c'est un peu le bordel actuellement
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
              value: value, child: Text(value.nom));
        }).toList());
  }

  ///Crée une ligne avec un widget date et hour picker
  Row LigneDate(
      String nom, TextEditingController Ctrl1, TextEditingController Ctrl2) {
    return Row(children: [
      Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width:
               MediaQuery.of(context).size.width / 2-20, 
          child: TextFormField(
              controller: Ctrl1,
              decoration: InputDecoration(
                icon: const Icon(Icons.calendar_today), //icon of text field
                labelText: "Date de $nom",
              ),
              readOnly: true, // when true user cannot edit text
              validator: (value) {

                if(value == null || value.trim().isEmpty)
                  {
                    if(nom=="debut") {
                      return "Saisir une date de début";
                    } else
                      {
                        return "Saisir une date de fin";
                      }
                  }
              //  else if(! Validator_ajoutevent.validateDateFormat(value))
                  {
                  //  return "Format date ne correspond à dd/mm/yyyy";
                  }
               // else if(! Validator_ajoutevent.validateDatesFinAvantDebut(_CtrlDateD.text, _CtrlDateF.text))//
                  {
                   // return "Date de fin ne doit pas être avant la date de debut";
                  }
                return null;
              }
              ,
              onTap: () async {
                DateTime? choix = await datePicker();
                setState(() {
                  if (choix != null) {
                    Ctrl1.text = DateFormat('dd/MM/yyyy').format(choix);
                    //print(Ctrl1);
                  }
                });
              }),
        ),
      ),
      Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            width:  MediaQuery.of(context).size.width / 2-20,
            child: TextFormField(
                controller: Ctrl2, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: const Icon(
                        Icons.watch_later_outlined), //icon of text field
                    labelText: "Heure de $nom" //label text of field
                    ),
                readOnly: true, // when true user cannot edit text
                validator: (value) {

                if(value == null || value.trim().isEmpty)
                {
                if(nom=="debut") {
                return "Saisir une heure de début";
                } else
                {
                return "Saisir une heure de fin";
                }
                }
                //else if(! Validator_ajoutevent.validateDateFormat(value))
                {
                //return "Format date ne correspond à dd/mm/yyyy";
                }
                //else if(! Validator_ajoutevent.validateHoursFinAvantDebut(_CtrlHeureD.text, _CtrlHeureF.text, _CtrlDateD.text, _CtrlDateF.text))
                {
                //return "Heure de fin ne doit pas être avant ou égales à  l'heure de debut";
                }
                return null;
                },
                onTap: () async {
                  TimeOfDay? choix = await hourPicker();
                  setState(() {
                    if (choix != null) {
                      Ctrl2.text = formatTimeString("${choix.hour}:${choix.minute}");
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
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text("Ajouter un évenement",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
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
                  WidgetDropDownButton(),
                  TextFormField(
                      controller: _CtrlDsc,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description de l'évenement"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Une description doit être renseignée';
                        }
                        return null;
                      }),
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
