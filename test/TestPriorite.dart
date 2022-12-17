import 'package:flutter/material.dart';
import 'package:flutter_calendrier/classes/priorit%C3%A9_class.dart';
import 'package:flutter_test/flutter_test.dart';

//class TestPriorite

void main() {
  group('Initialisation une prioriete', () {
    prioriete p = prioriete(1, "nom", Colors.blue);
    test("l'Id d'une priorite doit être un int", () {
      expect(p.id, int);
    });

    test("Nom d'une priorite doit être un string", () {
      expect(p.nom, String);
    });

    test("Couleur d'une priorite doit être un MaterialColor", () {
      expect(MaterialColor, MaterialColor);
    });


/*
      test('value should be incremented', () {
        final counter = Counter();

        counter.increment();

        expect(counter.value, 1);
      });

      test('value should be decremented', () {
        final counter = Counter();

        counter.decrement();

        expect(counter.value, -1);
      });

      test('value should be equal to zero', () {
        final counter = Counter();

        counter.decrement();
        counter.increment();

        expect(counter.value, 0);
      });*/
  });
}
