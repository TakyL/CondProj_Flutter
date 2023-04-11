import 'package:flutter/material.dart';
import 'package:flutter_calendrier/metiers/evenements_class.dart';
import 'package:flutter_calendrier/metiers/priorité_class.dart';
import 'package:flutter_calendrier/widgets/widget_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calendrier/view/calendrier_evenements.dart';

void main() {
  testWidgets('MyContainer displays child when colorFuture completes with data',
      (WidgetTester tester) async {
    // Create a MaterialColor instance for testing
    final materialColor = Future.value(Colors.blue);

    // Create a MyListTile instance for testing
    final evenement = Evenement(
      id: 1,
      nom: "test nom",
      auteur: "test auteur",
      date_debut: "test date_debut",
      date_fin: "test date_fin",
      heure_debut: "test heure_debut",
      heure_fin: "test heure_fin",
      description: "test description",
      prio: prioriete(1, 'test prio', const MaterialColor(1, <int, Color>{})),
    );
    final myTile = MyListTile(
        event: evenement, title: 'My Title', subtitle: 'My Subtitle');

    // Assign myTile to myChild
    final myChild = myTile;

    // Build the MyContainer widget
    await tester.pumpWidget(
      MaterialApp(
        home: MyContainer(colorFuture: materialColor, child: myChild),
      ),
    );

    // Verify that the Container widget displays the child widget
    expect(find.text('My Title'), findsOneWidget);
    expect(find.text('My Subtitle'), findsOneWidget);
  });

  testWidgets(
      'MyContainer displays error message when colorFuture completes with error',
      (WidgetTester tester) async {
    // Create a failing Future for testing
    final materialColor = Future.error('Test error');

    // Create a MyListTile instance for testing
    final evenement = Evenement(
      id: 1,
      nom: "test nom",
      auteur: "test auteur",
      date_debut: "test date_debut",
      date_fin: "test date_fin",
      heure_debut: "test heure_debut",
      heure_fin: "test heure_fin",
      description: "test description",
      prio: prioriete(1, 'test prio', const MaterialColor(1, <int, Color>{})),
    );
    final myChild = MyListTile(
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      event: evenement,
    );

    // Build the MyContainer widget
    await tester.pumpWidget(
      // fully transparent white (invisible)

      MaterialApp(
        home: MyContainer(
            colorFuture: Future<MaterialColor>.value(Colors.blue),
            child: myChild),
      ),
    );

    // Verify that the error message is displayed
    expect(find.text('Error loading color'), findsOneWidget);
  });

  testWidgets(
      'MyContainer displays default color when colorFuture is not completed',
      (WidgetTester tester) async {
    // Create a MyListTile instance for testing
    final evenement = Evenement(
      id: 1,
      nom: "test nom",
      auteur: "test auteur",
      date_debut: "test date_debut",
      date_fin: "test date_fin",
      heure_debut: "test heure_debut",
      heure_fin: "test heure_fin",
      description: "test description",
      prio: prioriete(1, 'test prio', const MaterialColor(1, <int, Color>{})),
    );
    final myChild = MyListTile(
      title: 'Test Title',
      subtitle: 'Test Subtitle',
      event: evenement,
    );

    // Build the MyContainer widget
    await tester.pumpWidget(
      MaterialApp(
        home: MyContainer(
            colorFuture: Future.value(const MaterialColor(1, <int, Color>{})),
            child: myChild),
      ),
    );

    // Verify that the Container widget displays the default color and the child widget
    expect(
        find.byWidgetPredicate(
            (widget) => widget is Container && widget.color == Colors.amber),
        findsOneWidget);
    expect(find.text('Test Title'), findsOneWidget);
    expect(find.text('Test Subtitle'), findsOneWidget);
  });
}
