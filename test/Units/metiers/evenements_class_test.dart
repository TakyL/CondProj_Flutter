import 'package:flutter_calendrier/metiers/evenements_class.dart';
import 'package:flutter_calendrier/metiers/priorité_class.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Evenement Tests', () {
    // Test data
    final int id = 1;
    final String nom = 'Event Name';
    final String auteur = 'Author';
    final String dateDebut = '2023-02-17';
    final String dateFin = '2023-02-18';
    final String heureDebut = '10:00';
    final String heureFin = '12:00';
    final String description = 'Event Description';
    final String prioName = 'Low';

    // Test cases for constructor
    test('Constructor creates an Evenement object', () {
      final event = Evenement(
        id: id,
        nom: nom,
        auteur: auteur,
        date_debut: dateDebut,
        date_fin: dateFin,
        heure_debut: heureDebut,
        heure_fin: heureFin,
        description: description,
        prio: listp.first,
      );

      expect(event.id, equals(id));
      expect(event.nom, equals(nom));
      expect(event.auteur, equals(auteur));
      expect(event.date_debut, equals(dateDebut));
      expect(event.date_fin, equals(dateFin));
      expect(event.heure_debut, equals(heureDebut));
      expect(event.heure_fin, equals(heureFin));
      expect(event.description, equals(description));
      expect(event.prio, equals(listp.first));
    });

    // Test case for fromJson factory method
    test('fromJson creates an Evenement object from JSON', () {
      final json = {
        'name': nom,
        'author': auteur,
        'start_date': dateDebut,
        'end_date': dateFin,
        'start_hour': heureDebut,
        'end_hour': heureFin,
        'description': description,
        'priorite': prioName,
      };

      final event = Evenement.fromJson(json);

      expect(event.nom, equals(nom));
      expect(event.auteur, equals(auteur));
      expect(event.date_debut, equals(dateDebut));
      expect(event.date_fin, equals(dateFin));
      expect(event.heure_debut, equals(heureDebut));
      expect(event.heure_fin, equals(heureFin));
      expect(event.description, equals(description));
      expect(event.prioName, equals(prioName));
    });

    // Test case for convert factory method
    test('convert creates an Evenement object from dynamic value', () {
      final value = {
        'name': nom,
        'author': auteur,
        'start_date': dateDebut,
        'end_date': dateFin,
        'start_hour': heureDebut,
        'end_hour': heureFin,
        'description': description,
        'priorite': prioName,
      };

      final event = Evenement.convert(value);

      expect(event.nom, equals(nom));
      expect(event.auteur, equals(auteur));
      expect(event.date_debut, equals(dateDebut));
      expect(event.date_fin, equals(dateFin));
      expect(event.heure_debut, equals(heureDebut));
      expect(event.heure_fin, equals(heureFin));
      expect(event.description, equals(description));
      expect(event.prioName, equals(prioName));
    });
  });

  test('Test attributs correct', () {
    final event = Evenement(
      id: 1,
      nom: 'Event 1',
      auteur: 'Author 1',
      date_debut: '2023-02-18',
      date_fin: '2023-02-19',
      heure_debut: '10:00',
      heure_fin: '12:00',
      description: 'Event description',
      prio: listp.first,
    );

    expect(event.id, isA<int>());
    expect(event.nom, isA<String>());
    expect(event.auteur, isA<String>());
    expect(event.date_debut, isA<String>());
    expect(event.date_fin, isA<String>());
    expect(event.heure_debut, isA<String>());
    expect(event.heure_fin, isA<String>());
    expect(event.description, isA<String>());
  });

  test('test attributs are not null ', () {

        final event = Evenement(
      id: 1,
      nom: 'Event 1',
      auteur: 'Author 1',
      date_debut: '2023-02-18',
      date_fin: '2023-02-19',
      heure_debut: '10:00',
      heure_fin: '12:00',
      description: 'Event description',
      prio: listp.first,
    );

     expect(event.id, isNotNull);
    expect(event.nom, isNotNull);
    expect(event.auteur, isNotNull);
    expect(event.date_debut, isNotNull);
    expect(event.date_fin, isNotNull);
    expect(event.heure_debut, isNotNull);
    expect(event.heure_fin, isNotNull);
    expect(event.description, isNotNull);
    expect(event.prio, isNotNull);
  });

  
}
