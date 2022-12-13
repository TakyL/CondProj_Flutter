import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'classes/evenements_class.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class Inter_Event extends StatefulWidget {
  final DateTime time; //Permettra d'init le date picker
  final void Function(DateTime d, Evenement e) callback; //Ajout la liste

  const Inter_Event({Key? key, required this.time, required this.callback})
      : super(key: key);

  @override
  _Inter_EventState createState() => _Inter_EventState();
}

class _Inter_EventState extends State<Inter_Event>{
  final _formKey = GlobalKey<FormState>();
  final _CtrlNom = TextEditingController();
  final _tePrenom = TextEditingController();
  final _CtrlDate = TextEditingController();

  void loginbutton() {
    if (_formKey.currentState!.validate()) {
      widget.callback(widget.time, Evenement(nom: _CtrlNom.text));
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Evenement ajoute au calendrier"))); //Possibilité de subdiviser en fonction ou en classe
    }
  }
  
 

  Future<DateTime?> datePicker() {
    return showDatePicker(
        context: context,
        initialDate: widget.time, //get today's date
        firstDate: DateTime(2010),
        lastDate: DateTime(2101),
         helpText:"SAISIR DATE" ,
        // locale: Locale('fr'), cfhttps://github.com/flutter/website/tree/archived-master/examples/internationalization/add_language/lib
      cancelText: "ANNULER",);
  }

  Future<TimeOfDay?> hourPicker() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText:"SAISIR HEURE" ,
      cancelText: "ANNULER",
      hourLabelText: "Heure",
      minuteLabelText: "Minutes",

      builder: (context, child) {
        {
          Locale locale = Localizations.localeOf(context);
          debugPrint(locale.toString());
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
                  Row(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 200,
                        child: TextFormField(
                            controller:
                                _CtrlDate, //editing controller of this TextField
                            decoration: const InputDecoration(
                                icon: Icon(
                                    Icons.calendar_today), //icon of text field
                                labelText: "Date de début" //label text of field
                                ),
                            readOnly: true, // when true user cannot edit text
                            onTap: () async {
                              DateTime? choix = await datePicker();
                              setState(() {
                                if (choix != null) {
                                  _CtrlDate.text =
                                      DateFormat('yyyy-MM-dd').format(choix);
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
                              controller:
                                  _CtrlDate, //editing controller of this TextField
                              decoration: const InputDecoration(
                                  icon: Icon(Icons
                                      .calendar_today), //icon of text field
                                  labelText:
                                      "Heure de début" //label text of field
                                  ),
                              readOnly: true, // when true user cannot edit text
                              onTap: () async {
                                TimeOfDay? choix = await hourPicker();
                                setState(() {
                                  if (choix != null) {
                                    _CtrlDate.text =
                                        "${choix.hour}:${choix.minute}";
                                  }
                                });
                              }),
                        )),
                  ])
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
