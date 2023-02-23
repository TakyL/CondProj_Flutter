import 'package:flutter/material.dart';
import 'package:flutter_calendrier/metiers/priorit%C3%A9_class.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('prioriete', () {
    late prioriete instance;

    setUp(() {
      instance = prioriete(1, 'Test', Colors.red);
    });

    test('constructor sets properties correctly', () {
      expect(instance.getId(), equals(1));
      expect(instance.getNom(), equals('Test'));
      expect(instance.couleur, equals(Colors.red));
    });

    test('toString method returns expected string', () {
      expect(instance.toString(), equals('1/Test/Colors.red'));
    });

    test('json constructor sets properties correctly', () {
      final json = {'numero': '1', 'libelle': 'Test', 'couleur': '#FF0000'};
      final expected = prioriete(1, 'Test', Colors.red);
      final actual = prioriete.json(json['numero']!, json['libelle']!, json['couleur']!);
      expect(actual.getId(), equals(expected.getId()));
      expect(actual.getNom(), equals(expected.getNom()));
      expect(actual.couleur, equals(expected.couleur));
    });

    test('two instances with same properties are equal', () {
      final instance2 = prioriete(1, 'Test', Colors.red);
      expect(instance, equals(instance2));
      expect(instance.hashCode, equals(instance2.hashCode));
    });

    test('two instances with different properties are not equal', () {
      final instance2 = prioriete(2, 'Test2', Colors.blue);
      expect(instance, isNot(equals(instance2)));
    });

    test('getNom method returns expected string', () {
      expect(instance.getNom(), equals('Test'));
    });

    test('getId method returns expected integer', () {
      expect(instance.getId(), equals(1));
    });

    test('json constructor throws FormatException when given invalid input', () {
      expect(() => prioriete.json('not a number', 'Test', '#FF0000'), throwsFormatException);
    });

    test('json constructor handles null couleur parameter', () {
      final json = {'numero': '1', 'libelle': 'Test', 'couleur': null};
      final expected = prioriete(1, 'Test', Colors.grey);
      final actual = prioriete.json(json['numero']!, json['libelle']!, json['couleur']!);
      expect(actual.couleur, equals(expected.couleur));
    });

    test('json constructor handles missing couleur parameter', () {
      final json = {'numero': '1', 'libelle': 'Test'};
      final expected = prioriete(1, 'Test', Colors.grey);
      final actual = prioriete.json(json['numero']!, json['libelle']!, json['couleur']!);
      expect(actual.couleur, equals(expected.couleur));
    });
  });
}
